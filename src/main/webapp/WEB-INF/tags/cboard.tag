<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="midCheck" %>
<%@ attribute name="type" %>
<%@ attribute name="rid" %>
<%@ attribute name="rrid" %>
<%@ attribute name="bid" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
   crossorigin="anonymous"></script>
   
<c:if test="${member.nickname==midCheck}">
	<br>
	<c:choose>
		<c:when test="${type=='bmsg'}">
			<a href="deleteB.do?bid=${bid}"><button>삭제</button></a> &nbsp;
		<div class="que1">
	<button>수정</button>
	</div>
	<div class="anw1" style="display: none; ">
	<form action="updateB.do" name="updateBform">
			<textarea name="bcontent" placeholder="수정할 내용 입력"></textarea>
		<input type="hidden" value="${bid}" name="bid">
		<input type="submit" value="수정완료" />
	</form>
	</div>
		</c:when>
		
		<c:when test="${type=='rmsg'}">
			<a href="deleteR.do?rid=${rid}&bid=${bid}"><button>삭제</button></a> &nbsp;
		<div class="que2">
	<button> 수정 </button>
	</div>
	<div class="anw2" style="display: none; ">
	<form action="updateR.do" name="updateRform">
			<textarea name="content" placeholder="수정할 내용 입력"></textarea>
		<input type="hidden" value="${rid}" name="rid">
		<input type="hidden" value="${content}" name="content">
		<input type="hidden" value="${bid}" name="bid">
		<input type="submit" value="수정완료" />
	</form>
	</div>
		</c:when>
	
		<c:when test="${type=='rrmsg'}">
			<a href="deleteRR.do?rrid=${rrid}&bid=${bid}"><button>삭제</button></a> &nbsp;
			<div class="que3">
	<button> 수정 </button>
	</div>
	 <div class="anw3" style="display: none; "> 
	<form action="updateRR.do" name="updateRRform">
			<textarea name="content" placeholder="수정할 내용 입력"></textarea>
		<input type="hidden" value="${rrid}" name="rrid">
		<input type="hidden" value="${content}" name="content">
		<input type="hidden" value="${bid}" name="bid">
		<input type="submit" value="수정완료" />
	</form>
	 </div> 
		</c:when>
	</c:choose>	
</c:if>

