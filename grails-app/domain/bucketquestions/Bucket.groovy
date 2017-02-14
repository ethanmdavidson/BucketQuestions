package bucketquestions

class Bucket {
    String codeword
    Collection questions
    static hasMany = [questions: Question]
    int userId

    static constraints = {
    }
}
