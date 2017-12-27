<%--
  Created by IntelliJ IDEA.
  User: Ethan
  Date: 12/22/2016
  Time: 12:11 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Bucket ${codeword}</title>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
</head>

<body>
<div id="content" role="main" class="text-center">
    <br>
    <div id="currentQuestion">Click the button below to get your next question.</div><br>
    <button id="getNextQuestion">Next Question</button>
    <button id="putQuestionBack" hidden>Mulligan</button>
    <br>
    There are <b id="questionCount">${bucket.questions?.size() ?: 0}</b> questions left in this bucket.
    <br>
    <h1>Submit a new question</h1>
    <textarea id="newQuestionText" autofocus></textarea> <br>
    <button id="submitQuestion">Submit</button>
    <br><br>
    The codeword for this bucket is <b>${codeword}</b>.<br>
    <a href="${createLink(uri:"/")}">Click Here</a> to return to the homepage.
</div>

<script>
    var currentQuestion = $("#currentQuestion");
    var putQuestionBack = $("#putQuestionBack");

    function updateQuestionCount(data){
        $("#questionCount").text(data.questionCount)
    }

    function getQuestion(){
        $.ajax({
            url:"/getQuestion",
            method:"POST",
            data: JSON.stringify({codeword: "${codeword}", userId: "${userId}"}),
            contentType: "application/json",
            error: function (xhr, status, errorText) {
                currentQuestion.text("Error retrieving question (" + status + ": " + errorText + ")");
                putQuestionBack.hide();
            },
            success: function (data) {
                currentQuestion.text(data.question);
                updateQuestionCount(data.questionCount);
                if (data.success) {
                    putQuestionBack.show();
                } else {
                    putQuestionBack.hide();
                }
            }
        });
    }

    function submitQuestion(questionText){
        $.ajax({
            url:"/addQuestion",
            method:"POST",
            data: JSON.stringify({codeword: "${codeword}", userId: "${userId}", questionText: questionText}),
            contentType: "application/json",
            error: function () {
                //todo: provide feedback to user
            },
            success: function (data) {
                updateQuestionCount(data)
            }
        });
    }

    $("#getNextQuestion").click(function(){
        getQuestion();
    });

    $("#submitQuestion").click(function(){
        var newQuestionText = $("#newQuestionText").val();
        $("#newQuestionText").val("");
        submitQuestion(newQuestionText);
    });

    putQuestionBack.click(function(){
       submitQuestion(currentQuestion.val());
       getQuestion();
    });
</script>
</body>
</html>