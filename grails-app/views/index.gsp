<!doctype html>
<html>
<head>
    <title>Bucket Questions</title>

    <asset:stylesheet src="application.css"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
</head>
<body>

    <div id="content" role="main" class="text-center">
        <label for="codeword">Code word: </label>
        <input id="codeword" type="text"/><br><br>
        <button id="goToBucket">Join Bucket</button>
    </div>
    <script>
        $("#goToBucket").click(function(){
            window.location.href = "/bucket/" + $("#codeword").val();
        });
    </script>
</body>
</html>
