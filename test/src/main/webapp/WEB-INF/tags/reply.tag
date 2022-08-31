<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="midCheck" %>
<%@ attribute name="rid" %>

<c:if test="${member.mid==midCheck}">
<a href="deleteR.do?rid=${rid}&cnt=${cnt}">[삭제]</a>
</c:if>