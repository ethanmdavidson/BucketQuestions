<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Bucket ${codeword}</title>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <asset:javascript src="jquery.ba-throttle-debounce.min.js"/>
</head>
<body>
    <table>
        <tr><th>id</th><th>question</th></tr>
        <g:each in="${(bucket.questions.toList())}" var="q">
        <tr><td style="padding: 5px;">${q.createdBy}</td><td>${q.questionText}</td></tr>
        </g:each>
    </table>

</body>
</html>