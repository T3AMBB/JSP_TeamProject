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
	<a href="deleteO.do?oid=${oid}&nid=${nid}"><button style="color:grey; background-color:gold; border:3px solid gold; border-radius:1rem;">삭제</button></a> &nbsp;
	<div class="que2"  style="display:inline-block;">
	<button id="edit-btn" style="color:white; background-color:gold; border:1px solid gold; border-radius:1rem; width:47px; padding:3px;">수정</button>
	</div>
	<div class="anw2" style="display: none; ">
	<form action="updateO.do?" name="updateOform">
			<textarea name="ocontent" placeholder="수정할 내용 입력" style="width: 97%; margin-top: 1%;"></textarea>
		<input type="hidden" value="${oid}" name="oid">
		<input type="hidden" value="${nid}" name="nid">
		<input type="hidden" value="${ocontent}" name="ocontent">
		<input type="submit" value="수정완료" style="float:right; margin-right:3%; margin-top: 1%; margin-bottom:1%;color:white; background-color:gold; border:1px solid gold; border-radius:1rem;"/>
	</form>
	</div>
</c:if>


