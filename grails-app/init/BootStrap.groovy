import bucketquestions.Bucket
import bucketquestions.Question

class BootStrap {

    def init = { servletContext ->
       /*Bucket b = new Bucket(codeword: "test")
        b.save(failOnError:true)
        Question q = new Question(questionText: "dyea")
        b.addToQuestions(q)
        b.save(failOnError:true)*/
    }
    def destroy = {
    }
}
