package teaching.aid

class StudentAssignment {
    double assignmentGrade
    static belongsTo = [student:Student, assignment:Assignment]
    static constraints = {

    }
    String toString(){
        return assignment.toString() + " " + student.name
    }
}
