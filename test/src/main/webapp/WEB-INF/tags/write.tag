<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="type" %>
<%@ attribute name="bid" %>

<c:if test="${member != null}">

	<c:choose>
		<c:when test="${type=='msg'}">
			<form action="insertB.do" method="post">
				<input type="hidden" name="mid" value="${member.mid}">
				<input type="hidden" name="action" value="insertB">
				<input type="text" name="msg">
				<input type="submit" value="글 등록">
			</form>
		</c:when>
		
		<c:when test="${type=='rmsg'}">
			<form action="insertR.do" method="post">
				<input type="hidden" name="mid" value="${member.mid}">
				<input type="hidden" name="cnt" value="${cnt}">
				<input type="hidden" name="action" value="insertR">
				<input type="hidden" name="bid" value="${bid}">
				댓글: <input type="text" name="rmsg">
				<input type="submit" value="댓글 등록">
			</form>	
		</c:when>
	</c:choose>

</c:if>



<c:if test="${member == null}">
<c:choose>
	<c:when test="${type=='msg'}">
		<input type="text" disabled value="등록하려면 로그인하세요!">
	</c:when>
	
	<c:when test="${type=='rmsg'}">
		댓글: <input type="text" disabled value="등록하려면 로그인하세요!">
	</c:when>
</c:choose>
</c:if>