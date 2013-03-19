package teaching.aid

class Assignment {
    String assignmentName
    Date assignmentDate

    static hasMany = [studentAssignment:StudentAssignment]

    static constraints = {
    }

    String toString(){
        return assignmentName
    }
}
