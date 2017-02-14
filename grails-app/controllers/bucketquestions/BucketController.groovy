package bucketquestions

import grails.converters.JSON

class BucketController {
    Random rand = new Random()

    def index(String codeword) {
        int userId
        if(codeword == null || codeword.isEmpty()) {
            //if no codeword is given redirect to main index
            redirect(uri:"/")
        }
        Bucket b = Bucket.findByCodeword(codeword)
        if (b == null) {
            //if a codeword is given that doesn't match an existing bucket, make a new one
            b = new Bucket(codeword: codeword, userId: 1)
            b.save()
            userId = 0
        } else {
            userId = b.userId   //todo: save userId in a cookie and check that cookie before giving them a new one
            b.setUserId(b.userId+1)
            b.save()
        }

        render(view:"index", model:[bucket:b, codeword:codeword, userId: userId])
    }

    def addQuestion(){
        int numQuestions = 0
        boolean success = false
        String codeword = request.JSON["codeword"]
        String questionText = request.JSON["questionText"]
        String userId = request.JSON["userId"]
        if(codeword != null && !codeword.isEmpty()
                && Bucket.countByCodeword(codeword) > 0){
            Bucket b = Bucket.findByCodeword(codeword)
            if(questionText != null && !questionText.isEmpty()) {
                Question q = new Question(questionText: questionText, createdBy: userId)
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
        String userId = request.JSON["userId"]
        String question
        int numQuestions = 0
        if(codeword == null || codeword.isEmpty()){
            question = "Error: no codeword given."
        } else {
            Bucket b = Bucket.findByCodeword(codeword)
            if (b != null) {
                b.lock()
                if (b.questions.size() > 0) {
                    def validQuestions = b.questions.findAll {it.createdBy != userId}
                    if(validQuestions.size() > 0) {
                        Question q = validQuestions[rand.nextInt(b.questions.size())] as Question
                        question = "Current Question: " + q.questionText
                        b.removeFromQuestions(q)
                        q.delete()
                    } else {
                        question = "Sorry, but you can't answer a question you wrote and you wrote all the remaining questions!"
                    }
                    numQuestions = b.questions.size()
                } else {
                    question = "There aren't any questions in this bucket. Use the form below to create more!"
                }
                b.save()
            } else {
                question = "Error: no bucket found for this codeword."
            }
        }

        def responseData = ['question': question, 'questionCount': numQuestions]

        render responseData as JSON
    }
}
