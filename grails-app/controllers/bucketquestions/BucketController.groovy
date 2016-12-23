package bucketquestions

import grails.converters.JSON

class BucketController {
    Random rand = new Random()

    def index(String codeword) {
        if(codeword == null || codeword.isEmpty()) {
            //if no codeword is given redirect to main index
            redirect(uri:"/")
        }
        Bucket b = Bucket.findByCodeword(codeword)
        if (b == null) {
            //if a codeword is given that doesn't match an existing bucket, make a new one
            b = new Bucket(codeword: codeword)
            b.save()
        }

        render(view:"index", model:[bucket:b, codeword:codeword])
    }

    def addQuestion(){
        int numQuestions = 0
        boolean success = false
        String codeword = request.JSON["codeword"]
        String questionText = request.JSON["questionText"]
        if(codeword != null && !codeword.isEmpty()
                && Bucket.countByCodeword(codeword) > 0){
            Bucket b = Bucket.findByCodeword(codeword)
            if(questionText != null && !questionText.isEmpty()) {
                Question q = new Question(questionText: questionText)
                b.addToQuestions(q)
                b.save()
            }
            numQuestions = b.questions.size()
            success = true
        }

        def responseData = ['success': success, 'questionCount': numQuestions]

        render responseData as JSON
    }

    def getQuestion(){
        String codeword = request.JSON["codeword"]
        String question
        int numQuestions = 0
        if(codeword == null || codeword.isEmpty()){
            question = "Error: no codeword given."
        } else {
            Bucket b = Bucket.findByCodeword(codeword)
            if (b != null) {
                if (b.questions.size() > 0) {
                    Question q = b.questions[rand.nextInt(b.questions.size())] as Question
                    question = q.questionText
                    b.removeFromQuestions(q)
                    q.delete()
                    numQuestions = b.questions.size()
                } else {
                    question = "There aren't any questions in this bucket. Use the form below to create more!"
                }
            } else {
                question = "Error: no bucket found for this codeword."
            }
        }

        def responseData = ['question': question, 'questionCount': numQuestions]

        render responseData as JSON
    }
}
