<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<!-- Basic need -->
	<title>마이페이지- 내가 쓴 리뷰보기</title>
	<meta charset="UTF-8">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="">
	<link rel="profile" href="#">

    <!--Google Font-->
    <link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
	<!-- Mobile specific meta -->
	<meta name=viewport content="width=device-width, initial-scale=1">
	<meta name="format-detection" content="telephone-no">

	<!-- CSS files -->
	<link rel="stylesheet" href="css/plugins.css">
	<link rel="stylesheet" href="css/style.css">

</head>
<body>
<!-- header section-->
<bb:header/>
<!-- end of header section-->
	    
<div class="buster-light">
<div class="page-single">
	<div class="container">
		<div class="row ipad-width2">
			<div class="col-md-3 col-sm-12 col-xs-12">
				<div class="user-information">
					<div class="user-fav">
						<ul>
                  <!-- mypage.do -->
                  <!-- myboard.do -->
                  <!-- myreview.do -->
                     <li><a href="mypage.do">내 정보</a></li>
                     <li class="active"><a href="myboard.do">내가 쓴 게시글</a></li>
                     <li><a href="myreview.do">내가 쓴 리뷰</a></li>
                  </ul>
					</div>
					
				</div>
			</div>
			<div class="col-md-9 col-sm-12 col-xs-12">
				<div class="topbar-filter">
					<p><span>${fn:length(datas)}</span>개의 게시글을 작성하셨습니다.</p>
				</div>
			<c:forEach var="b" items="${datas}">
				<div class="movie-item-style-2 userrate">
					<div class="mv-item-infor">
						<h6><a href="communityBoard.do?bid=${b.bid}">${b.btitle} </a></h6>
						<p class="time sm">${b.bdate}</p>
						<p>${b.bcontent}</p>		
					</div>
				</div>
				</c:forEach>
				
				<div class="topbar-filter">
					<label>Movies per page:</label>
					<select>
						<option value="range">20 Movies</option>
						<option value="saab">10 Movies</option>
					</select>
					<div class="pagination2">
						<span>Page 1 of 1:</span>
						<a class="active" href="#">1</a>
						<a href="#"><i class="ion-arrow-right-b"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		</div>
<!-- footer section-->
<bb:footer/>
<!-- end of footer section-->

<script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/plugins2.js"></script>
<script src="js/custom.js"></script>
</body>
</html>