package bucketquestions

class BucketController {
    static allowedMethods = [addQuestion: "POST", getQuestion: "GET"]

    def index() {
        if(params.containsKey("code") && Bucket.countByCodeword(params.code) > 0){
            render(view:"index", model:[Bucket:Bucket.findByCodeword(params.code)])
        } else {
            //if no codeword is given, or the given codeword doesn't match an
            // existing bucket, redirect to main index
            redirect(uri:"/")
        }
    }

    def createBucket(){

    }

    def addQuestion(){

    }

    def getQuestion(){

    }
}
