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
<div id="currentQuestion">Click the button below to get your next question.</div><br>
<button id="getNextQuestion">Next Question</button><br>
<br>
<h1>Submit a new question</h1>
<textarea id="newQuestionText">
</textarea> <br>
<button id="submitQuestion">Submit This question</button>
<script>
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
            success: function () {
                //todo: provide feedback to user
            }
        });
    });
</script>
</body>
</html>