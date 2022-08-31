<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>

<form name="mForm" action="insertM.do" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="mid" id="mid" onchange="checkId()"required>		
			<div id="result"></div>		
			</td>					
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="mpw" id="mpw" required></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="mname" id="mname" required></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="button" value="회원가입" onclick="checkForm()"></td>
		</tr>
	</table>
</form>


<script type="text/javascript">
	function checkId(){
		var mid = $("#mid").val();
		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath}/check?mid='+mid,
			data: {mid:mid},
			success: function(result){
				console.log("로그1 ["+result+"]");
				if(result==1){
					$("#result").text("사용 가능한 아이디입니다!");
					$("#result").css("color","blue");
				}
				else{
					$("#result").text("이미 사용중인 아이디입니다...");
					$("#result").css("color","red");
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

<script type="text/javascript">
	function checkForm(){
		var mid = $("#mid");
		var mpw = $("#mpw");
		var mname = $("#mname");
		var result = $("#result").css("color");

		if(result=='rgb(255, 0, 0)'){
			alert('다른 아이디를 입력해주세요..');
	        mid.focus();
	        return false;
		}
		
		if(mid.val()==""){
			alert('아이디를 입력해주세요..');
	        mid.focus();
	        return false;
		}
		
		if(mpw.val()==""){
			alert('비밀번호를 입력해주세요..');
	        mpw.focus();
	        return false;
		}
		
		if(mname.val()==""){
			alert('이름을 입력해주세요..');
	        mname.focus();
	        return false;
		}
		
		document.mForm.submit();

	}
</script>

</body>
</html>