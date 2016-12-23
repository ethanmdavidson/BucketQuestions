<%--
  Created by IntelliJ IDEA.
  User: Ethan
  Date: 12/22/2016
  Time: 12:11 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Bucket</title>
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
</body>
</html>