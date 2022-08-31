<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="main.do">
		<input type="button" value="완료" onclick="complete()">
	</form>

<script type="text/javascript">

	function complete(){
		opener.parent.location.reload();
		window.close();
	}

</script>
	
</body>
</html>