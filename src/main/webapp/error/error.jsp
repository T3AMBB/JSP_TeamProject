<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500</title>
</head>
<body>

<h1>요청하신 서비스를 처리하던중에 문제가 발생했습니다...</h1>
<a href="main.do">메인으로 돌아가기</a>
<hr>
발생한 예외: ${pageContext.errorData.throwable}

</body>
</html>