<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="kim" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />

	<script type="text/javascript">
		function signup(){
			window.open("signup.jsp","회원가입 페이지","width=500,height=200");
		}
		
		function check(){
			ans=prompt('비밀번호를 입력하세요.');
				document.mypage.mpw.value = ans;
				document.mypage.submit();
		}
	</script>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

</head>
<body>
	
	<div id="header">
		<h1>작은 티모</h1>

		<div class="gnb">
			<!-- mypage로 제출 되는 id, pw -->
			<form name="mypage" action=mypage.do method="post">
				<input type="hidden" name="mid" value="${member.mid}">
				<input type="hidden" name="mpw" value="">
			</form>
				
			<ul>
				<li><a href="main.do">메인으로</a></li>
				<c:if test="${member==null}">
				<li><a href="javascript:signup()">회원가입</a></li>
				</c:if>
				<li><kim:login /></li>
			</ul>
			<!-- 검색 기능 -->
			<form action="main.do">
				<input type="text" name="searchContent">
				<select name="searchCondition">
					<option value="mname">작성자</option>
				</select>
				<input type="submit" value="검색">
			</form>
		</div>
	</div>
	
	<div id="wrapper">
	
		<div id="content">
			<h2>글 등록하기</h2>
			<kim:write type="msg" />
		</div>
		
		<div id="main">
			<h2>글 목록보기</h2>
			<c:forEach var="v" items="${datas}">
				<c:set var="b" value="${v.boardVO}" />
				<h3>[${b.mname}] <a href="detail.jsp?bid=${b.bid}">${b.msg}</a> [ 좋아요 ${b.favcnt} | 댓글 ${b.rcnt} ] 
					<kim:board midCheck="${b.mid}" bid="${b.bid}" />
				</h3>
								
				<div class="reply">
					<ul>
						<c:forEach var="r" items="${v.rList}">
							<li>[${r.mname}] ${r.rmsg} <kim:reply midCheck="${r.mid}" rid="${r.rid}" /></li>
						</c:forEach>
					</ul>
				</div>
			
			<div class="reply">
				<kim:write type="rmsg" bid="${b.bid}" />
			</div>
			</c:forEach>
		</div>
		${datasSize}
		<c:if test="${cnt < datasSize}">
			<a href="main.do?cnt=${cnt+2}&searchContent=${searchContent}">더보기&gt;&gt;</a>
		</c:if>
		<h3>최근 가입한 친구</h3>
		<c:forEach var="m" items="${datas2}">
			<a href="main.do?searchContent=${m.mname}">[${m.mname}]</a>
		</c:forEach>
	</div>
		
	<div id="footer">
		회사소개 | 이용약관 | <strong>개인정보처리방침</strong> | 보호정책 | 고객센터 <strong>ⓒ Corp.</strong>
	</div>

</body>
</html>