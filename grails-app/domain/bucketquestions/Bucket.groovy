package bucketquestions

class Bucket {
    String codeword
    static hasMany = [questions: Question]


    static constraints = {
    }
}
