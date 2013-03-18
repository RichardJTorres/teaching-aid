package teaching.aid



import org.junit.*
import grails.test.mixin.*

@TestFor(StudentAssignmentController)
@Mock(StudentAssignment)
class StudentAssignmentControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/studentAssignment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.studentAssignmentInstanceList.size() == 0
        assert model.studentAssignmentInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.studentAssignmentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.studentAssignmentInstance != null
        assert view == '/studentAssignment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/studentAssignment/show/1'
        assert controller.flash.message != null
        assert StudentAssignment.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/studentAssignment/list'

        populateValidParams(params)
        def studentAssignment = new StudentAssignment(params)

        assert studentAssignment.save() != null

        params.id = studentAssignment.id

        def model = controller.show()

        assert model.studentAssignmentInstance == studentAssignment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/studentAssignment/list'

        populateValidParams(params)
        def studentAssignment = new StudentAssignment(params)

        assert studentAssignment.save() != null

        params.id = studentAssignment.id

        def model = controller.edit()

        assert model.studentAssignmentInstance == studentAssignment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/studentAssignment/list'

        response.reset()

        populateValidParams(params)
        def studentAssignment = new StudentAssignment(params)

        assert studentAssignment.save() != null

        // test invalid parameters in update
        params.id = studentAssignment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/studentAssignment/edit"
        assert model.studentAssignmentInstance != null

        studentAssignment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/studentAssignment/show/$studentAssignment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        studentAssignment.clearErrors()

        populateValidParams(params)
        params.id = studentAssignment.id
        params.version = -1
        controller.update()

        assert view == "/studentAssignment/edit"
        assert model.studentAssignmentInstance != null
        assert model.studentAssignmentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/studentAssignment/list'

        response.reset()

        populateValidParams(params)
        def studentAssignment = new StudentAssignment(params)

        assert studentAssignment.save() != null
        assert StudentAssignment.count() == 1

        params.id = studentAssignment.id

        controller.delete()

        assert StudentAssignment.count() == 0
        assert StudentAssignment.get(studentAssignment.id) == null
        assert response.redirectedUrl == '/studentAssignment/list'
    }
}
