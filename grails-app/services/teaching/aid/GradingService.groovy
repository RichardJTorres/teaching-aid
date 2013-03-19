package teaching.aid

class GradingService {

    def getCourseGrades(Long id){
        def studentInstance = Student.get(id)
        def scoreTotal = 0
        studentInstance.studentAssignments.asList().each {
            scoreTotal = scoreTotal + it.assignmentGrade
        }

        def ct = studentInstance.studentAssignments.asList().size()

        if (ct == 0){
            studentInstance.grade = 3
        } else {
            studentInstance.grade = scoreTotal / ct
        }
        studentInstance.save(failOnError: true)
        }
    def getAllCourseGrades() {
        Student.list().each{
            getCourseGrades(it.id)
        }
    }
}




