package bucketquestions

class Question {
    static belongsTo = [bucket: Bucket]
    String questionText
    //String createdBy

    static constraints = {
    }
}
