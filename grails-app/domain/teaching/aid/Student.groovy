package teaching.aid

class Student {
    String name
    double grade
    static hasMany = [studentAssignments:StudentAssignment]

    static constraints = {
    }

    String toString(){
        return name
    }

}
