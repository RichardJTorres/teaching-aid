package teaching.aid

import org.springframework.dao.DataIntegrityViolationException

class StudentAssignmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [studentAssignmentInstanceList: StudentAssignment.list(params), studentAssignmentInstanceTotal: StudentAssignment.count()]
    }

    def create() {
        [studentAssignmentInstance: new StudentAssignment(params)]
    }

    def save() {
        def studentAssignmentInstance = new StudentAssignment(params)
        if (!studentAssignmentInstance.save(flush: true)) {
            render(view: "create", model: [studentAssignmentInstance: studentAssignmentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'studentAssignment.label', default: 'StudentAssignment'), studentAssignmentInstance.id])
        redirect(action: "show", id: studentAssignmentInstance.id)
    }

    def show(Long id) {
        def studentAssignmentInstance = StudentAssignment.get(id)
        if (!studentAssignmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentAssignment.label', default: 'StudentAssignment'), id])
            redirect(action: "list")
            return
        }

        [studentAssignmentInstance: studentAssignmentInstance]
    }

    def edit(Long id) {
        def studentAssignmentInstance = StudentAssignment.get(id)
        if (!studentAssignmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentAssignment.label', default: 'StudentAssignment'), id])
            redirect(action: "list")
            return
        }

        [studentAssignmentInstance: studentAssignmentInstance]
    }

    def update(Long id, Long version) {
        def studentAssignmentInstance = StudentAssignment.get(id)
        if (!studentAssignmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentAssignment.label', default: 'StudentAssignment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (studentAssignmentInstance.version > version) {
                studentAssignmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'studentAssignment.label', default: 'StudentAssignment')] as Object[],
                        "Another user has updated this StudentAssignment while you were editing")
                render(view: "edit", model: [studentAssignmentInstance: studentAssignmentInstance])
                return
            }
        }

        studentAssignmentInstance.properties = params

        if (!studentAssignmentInstance.save(flush: true)) {
            render(view: "edit", model: [studentAssignmentInstance: studentAssignmentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'studentAssignment.label', default: 'StudentAssignment'), studentAssignmentInstance.id])
        redirect(action: "show", id: studentAssignmentInstance.id)
    }

    def delete(Long id) {
        def studentAssignmentInstance = StudentAssignment.get(id)
        if (!studentAssignmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentAssignment.label', default: 'StudentAssignment'), id])
            redirect(action: "list")
            return
        }

        try {
            studentAssignmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'studentAssignment.label', default: 'StudentAssignment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'studentAssignment.label', default: 'StudentAssignment'), id])
            redirect(action: "show", id: id)
        }
    }
}
