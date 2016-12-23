package bucketquestions

class BucketController {
    static allowedMethods = [addQuestion: "POST", getQuestion: "GET"]

    def index(String codeword) {
        if(codeword == null) {
            //if no codeword is given redirect to main index
            redirect(uri:"/")
        }
        Bucket b = Bucket.findByCodeword(codeword)
        if (b == null) {
            //if a codeword is given that doesn't match an existing bucket, make a new one
            b = new Bucket(codeword: codeword)
            b.save()
        }

        render(view:"index", model:[Bucket:b])
    }

    def addQuestion(String codeword){

    }

    def getQuestion(String codeword){

    }
}
