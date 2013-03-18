package teaching.aid

class Student {
    String name
    double grade
    static hasMany = [studentAssignment:StudentAssignment]

    static constraints = {
    }

}
