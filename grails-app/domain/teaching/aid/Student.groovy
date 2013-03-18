package teaching.aid

class Student {
    String name
    double grade
    static hasMany = [assignment:Assignment]

    static constraints = {
    }

}
