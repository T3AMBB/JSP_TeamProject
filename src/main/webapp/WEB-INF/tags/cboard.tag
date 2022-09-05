<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="midCheck" %>
<%@ attribute name="type" %>
<%@ attribute name="rid" %>
<%@ attribute name="rrid" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
   crossorigin="anonymous"></script>
   
<c:if test="${member.nickname==midCheck}">
	<br>
	<c:choose>
		<c:when test="${type=='rmsg'}">
			<a href="deleteR.do?rid=${rid}">[삭제]</a> &nbsp;
	<button id="edit-btn"> 수정하기 </button>
	<div id="comment-text" style="display: none; ">
	<form action="updateR.do?" name="updateRform">
			<textarea name="content" placeholder="댓글입력">
			</textarea>
		<input type="hidden" value="${rid}" name="rid">
		<input type="hidden" value="${content}" name="content">
		<input type="submit" value="수정완료" />
	</form>
	</div>
		</c:when>
	
		<c:when test="${type=='rrmsg'}">
			<a href="deleteRR.do?rrid=${rrid}">[삭제]</a> &nbsp;
	<button id="edit-btn"> 수정하기 </button>
	<div id="comment-text" style="display: none; ">
	<form action="updateRR.do?" name="updateRRform">
			<textarea name="content" placeholder="댓글입력">
			</textarea>
		<input type="hidden" value="${rrid}" name="rrid">
		<input type="hidden" value="${content}" name="content">
		<input type="submit" value="수정완료" />
	</form>
	</div>
		</c:when>
	</c:choose>
	
	
	
	
</c:if>


<script type="text/javascript">

	$(document).ready(function() {
   		$("#edit-btn").click(function() {
     		 $("#comment-text").toggle();	
  		 });
	});

</script>