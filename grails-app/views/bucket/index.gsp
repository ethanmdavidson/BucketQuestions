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
    <div id="currentQuestion">Click the button below to get your next question.</div><br>
    <button id="getNextQuestion">Next Question</button><br>
    There are <b id="questionCount">${bucket.questions.size()}</b> questions left in this bucket.
    <br>
    <h1>Submit a new question</h1>
    <textarea id="newQuestionText">
    </textarea> <br>
    <button id="submitQuestion">Submit</button>
    <br><br>
    The codeword for this bucket is <b>${codeword}</b>.<br>
    <a href="${createLink(uri:"/")}">Click Here</a> to return to the homepage.
</div>

<script>
    function updateQuestionCount(data){
        $("#questionCount").text(data.questionCount)
    }

    var currentQuestion = $("#currentQuestion");
    $("#getNextQuestion").click(function(){
        $.ajax({
            url:"/getQuestion",
            method:"POST",
            data: JSON.stringify({codeword: "${codeword}"}),
            contentType: "application/json",
            error: function () {
                currentQuestion.text("Error retrieving question :(");
            },
            success: function (data) {
                currentQuestion.text(data.question);
                updateQuestionCount(data)
            }
        });
    });

    $("#submitQuestion").click(function(){
        var questionText = $("#newQuestionText").val();
        $("#newQuestionText").val("");
        $.ajax({
            url:"/addQuestion",
            method:"POST",
            data: JSON.stringify({codeword: "${codeword}", questionText: questionText}),
            contentType: "application/json",
            error: function () {
                //todo: provide feedback to user
            },
            success: function (data) {
                updateQuestionCount(data)
            }
        });
    });
</script>
</body>
</html>