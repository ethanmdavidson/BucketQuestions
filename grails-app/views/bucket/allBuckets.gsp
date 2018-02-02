<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>All Buckets</title>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <asset:javascript src="jquery.ba-throttle-debounce.min.js"/>
</head>
<body>
    <ul>
        <g:each in="${(buckets)}" var="bucket">
            <li><span class="Collapsable">${bucket.codeword} (${bucket.questions.size()}:${bucket.userId})</span>
                <ul>
                <g:each in="${(bucket.questions.toList())}" var="q">
                    <li><span class="Collapsable">${q.createdBy}: ${q.questionText}</span></li>
                </g:each>
                </ul>
            </li>
        </g:each>
    </ul>
<script>
    $(".Collapsable").click(function () {
        $(this).parent().children().toggle();
        $(this).toggle();
    });

    $(".Collapsable").each(function(){
        $(this).parent().children().toggle();
        $(this).toggle();
    });
</script>
</body>
</html>