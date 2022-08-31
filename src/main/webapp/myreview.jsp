<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb" %>
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
                     <li><a href="mypage.jsp">내 정보</a></li>
                     <li><a href="myboard.jsp">내가 쓴 게시글</a></li>
                     <li class="active"><a href="myreview.jsp">내가 쓴 리뷰</a></li>
                  </ul>
					</div>
					

				</div>
			</div>
			<div class="col-md-9 col-sm-12 col-xs-12">
				<div class="topbar-filter">
					<p>Found <span>3 rates</span> in total</p>
					<label>Sort by:</label>
					<select>
						<option value="range">-- Choose option --</option>
						<option value="saab">-- Choose option 2--</option>
					</select>
				</div>
				<div class="movie-item-style-2 userrate">
					<img src="images/uploads/mv1.jpg" alt="">
					<div class="mv-item-infor">
						<h6><a href="#">oblivion <span>(2012)</span></a></h6>
						<p class="time sm-text">your rate:</p>
						<p class="rate"><i class="ion-android-star"></i><span>9.0</span> /10</p>
						<p class="time sm-text">your reviews:</p>
						<h6>Best Marvel movie in my opinion</h6>
						<p class="time sm">02 April 2017</p>
						<p>“This is by far one of my favorite movies from the MCU. The introduction of new Characters both good and bad also makes the movie more exciting. giving the characters more of a back story can also help audiences relate more to different characters better, and it connects a bond between the audience and actors or characters. Having seen the movie three times does not bother me here as it is as thrilling and exciting every time I am watching it. In other words, the movie is by far better than previous movies (and I do love everything Marvel), the plotting is splendid (they really do out do themselves in each film, there are no problems watching it more than once.”</p>		
					</div>
				</div>
				
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