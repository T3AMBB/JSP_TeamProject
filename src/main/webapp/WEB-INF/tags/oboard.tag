<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="midCheck" %>
<%@ attribute name="oid" %>
<%@ attribute name="nid" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
   crossorigin="anonymous"></script>


<c:if test="${member.nickname==midCheck}">
	
	
	<br>
	
	<a href="deleteO.do?oid=${oid}&nid=${nid}"><button>삭제</button></a> &nbsp;
	<div class="que2">
	<button id="edit-btn"> 수정하기 </button>
	</div>
	<div class="anw2" style="display: none; ">
	<form action="updateO.do?" name="updateOform">
			<textarea name="ocontent" placeholder="댓글입력"></textarea>
		<input type="hidden" value="${oid}" name="oid">
		<input type="hidden" value="${nid}" name="nid">
		<input type="hidden" value="${ocontent}" name="ocontent">
		<input type="submit" value="수정완료" />
	</form>
	</div>
	
	
	<!--  <input type="submit" value="수정" /> -->
</c:if>


