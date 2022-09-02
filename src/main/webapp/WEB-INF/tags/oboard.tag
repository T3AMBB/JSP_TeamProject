<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="midCheck" %>
<%@ attribute name="oid" %>
<%@ attribute name="nid" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
</script>
<c:if test="${member.nickname==midCheck}">
	<a href="deleteO.do?oid=${oid}&nid=${nid}">[삭제]</a> &nbsp;
	<a href="javascript:update();">[수정]</a>
	<a href="updateO.do?oid=${oid}&nid=${nid}">[수정]</a>
</c:if>
