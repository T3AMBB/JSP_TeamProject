<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
</script>
</head>
<body>

<div id="result" onclick="fav();">♡</div>
<hr>
${member.mid}
${param.bid}
<hr>

<a href="main.do">메인으로</a>

<script type="text/javascript">
	function fav(){
		var mid = '${member.mid}';
		var bid = '${param.bid}';
		console.log('로그: fav');
		$.ajax({
			type: 'POST',
			url: 'fav',
			data: {mid:mid,bid:bid},
			success: function(result){
				console.log("로그1 ["+result+"]");
				if(result==1){
					$("#result").html("♥");
				}
				else{
					$("#result").html("♡");
				}
			},
			error: function(request, status, error){ // 순서 체크해보기!
				console.log("상태코드: "+request.status);
				console.log("메세지: "+request.responseText);
				console.log("에러설명: "+error);
			}
		});
	}
</script>	

</body>
</html>