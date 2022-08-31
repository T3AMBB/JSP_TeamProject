<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="midCheck" %>
<%@ attribute name="bid" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
</script>
<c:if test="${member.mid==midCheck}">
	<a href="deleteB.do?bid=${bid}">[삭제]</a>
</c:if>
<c:if test="${member!=null}">
	<a href="fav.do?mid=${member.mid}&bid=${bid}&cnt=${cnt}">&nbsp;♥</a>
<!-- <div id="result" onclick="fav();">♡</div>  -->
</c:if>



<!-- 
<script type="text/javascript">
	function fav(){
		var mid = '${member.mid}';
		var bid = '${bid}';
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
 -->

