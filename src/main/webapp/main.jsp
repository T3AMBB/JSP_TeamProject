<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<!-- Basic need -->
	<title>메인 페이지</title>
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
<div class="searchform">
	<form>
		<table class="search-table"style="border:none;">
		<tr>
	    	<td  style="border:none;" ><select class="search-td1">
				<option>소설명</option>
				<option>작가</option>
				<option>장르</option>
			</select></td>
			<td style="border:none;"><input type="text" placeholder="작품명, 작가, 장르를 검색해 보세요."></td>
			<td style="border:none;"><input type="button"class="search-td2" value="검색" onclick="location.href='signUp.jsp'"></td>
	    <tr>
	    </table>
	</form>		
</div>


<div class="slider movie-items">
	<div class="container">
		<div class="title-hd">
					<h1><strong>&lt이달의 소설&gt</strong></h1>
					
				</div>
		<div class="row">
			
	    	<div  class="slick-multiItemSlider">
	    	<c:forEach var="n" items="${datas}" begin="1" end="12" step="1">
	    	
	    		<div class="movie-item">
	    			<div class="mv-img">
	    				<a href="#"><img  src="${n.nimg}" alt="" width="280" height="400"></a>
	    			</div>
	    			<br>
	    			<br>
	    			<br>
	    			<br>
	    			<br>
	    			<div class="title-in">
	    				<div class="cate">
	    					<span class="blue"><a href="#">${n.ngenre}</a></span>
	    				</div>
	    				<h6>${n.ntitle}</h6>
	    				<h6>${n.nwriter}</h6>
	    			</div>
	    		</div>
	    		</c:forEach>
	    	</div>
	    </div>
	</div>
</div>

		<div class="buster-light">
<div class="movie-items">
	<div class="container">
		
			<div class="col-md-81">
				<div class="title-hd">
					<h1>판타지</h1>
					<a href="#" class="viewall">전체보기<i class="ion-ios-arrow-right"></i></a>
				</div>
				<div class="tabs">
					
				    <div class="tab-content">
				        <div id="tab1" class="tab active">
				            <div class="row">
				            	<div class="slick-multiItem">
				            	<c:forEach var="n" items="${datas}" begin="1" end="100" step="1">
				            	
					            			<c:if test="${n.ngenre eq '판타지'}">
				            		<div class="slide-it">
				            			<div class="movie-item">
					            			<div class="mv-img">
					            				<img src="${n.nimg}" alt="" width="185" height="284">
					            			</div> 
					            			<div class="hvr-inner">
					            				<a  href="moviesingle.html"> Read more <i class="ion-android-arrow-dropright"></i> </a>
					            			</div>
					            			<div class="title-in">
					            				<h6><a href="#">${n.ntitle}</a></h6>
					            				<p><i class="ion-android-star"></i><span>7.4</span> /10</p>
					            			</div>
					            		</div>
				            		</div>
				            		
					            				</c:if>
									</c:forEach>
				            	</div>
				            </div>
			       	 	</div>
				    </div>
				</div>
				
		
			
		</div>
	</div>
</div>
<div class="movie-items">
	<div class="container">
		
			<div class="col-md-81">
				<div class="title-hd">
					<h1>로맨스</h1>
					<a href="#" class="viewall">전체보기 <i class="ion-ios-arrow-right"></i></a>
				</div>
				<div class="tabs">
					
				    <div class="tab-content">
				        <div id="tab1" class="tab active">
				            <div class="row">
				            	<div class="slick-multiItem">
				            	<c:forEach var="n" items="${datas}" begin="1" end="100" step="1">
				            	
					            			<c:if test="${n.ngenre eq '로맨스'}">
				            		<div class="slide-it">
				            			<div class="movie-item">
					            			<div class="mv-img">
					            				<img src="${n.nimg}" alt="" width="185" height="284">
					            			</div> 
					            			<div class="hvr-inner">
					            				<a  href="moviesingle.html"> Read more <i class="ion-android-arrow-dropright"></i> </a>
					            			</div>
					            			<div class="title-in">
					            				<h6><a href="#">${n.ntitle}</a></h6>
					            				<p><i class="ion-android-star"></i><span>7.4</span> /10</p>
					            			</div>
					            		</div>
				            		</div>
				            		
					            				</c:if>
									</c:forEach>
				            	</div>
				            </div>
			       	 	</div>
				    </div>
				</div>
				
		
			
		</div>
	</div>
</div>
<div class="movie-items">
	<div class="container">
		
			<div class="col-md-81">
				<div class="title-hd">
					<h1>무협</h1>
					<a href="#" class="viewall">전체보기 <i class="ion-ios-arrow-right"></i></a>
				</div>
				<div class="tabs">
					
				    <div class="tab-content">
				        <div id="tab1" class="tab active">
				            <div class="row">
				            	<div class="slick-multiItem">
				            	<c:forEach var="n" items="${datas}" begin="1" end="100" step="1">
				            	
					            			<c:if test="${n.ngenre eq '무협'}">
				            		<div class="slide-it">
				            			<div class="movie-item">
					            			<div class="mv-img">
					            				<img src="${n.nimg}" alt="" width="185" height="284">
					            			</div> 
					            			<div class="hvr-inner">
					            				<a  href="moviesingle.html"> Read more <i class="ion-android-arrow-dropright"></i> </a>
					            			</div>
					            			<div class="title-in">
					            				<h6><a href="#">${n.ntitle}</a></h6>
					            				<p><i class="ion-android-star"></i><span>7.4</span> /10</p>
					            			</div>
					            		</div>
				            		</div>
				            		
					            				</c:if>
									</c:forEach>
				            	</div>
				            </div>
			       	 	</div>
				    </div>
				</div>
				
			
			
		</div>
	</div>
</div>
<div class="movie-items">
	<div class="container">
		
			<div class="col-md-81">
				<div class="title-hd">
					<h1>로판</h1>
					<a href="novelMain.do?searchContent=로판&searchCondition=Ngenre&cnt=20" class="viewall">전체보기 <i class="ion-ios-arrow-right"></i></a>
				</div>
				<div class="tabs">
					
				    <div class="tab-content">
				        <div id="tab1" class="tab active">
				            <div class="row">
				            	<div class="slick-multiItem">
				            	<c:forEach var="n" items="${datas}" begin="1" end="100" step="1">
				            	
					            			<c:if test="${n.ngenre eq '로판'}">
				            		<div class="slide-it">
				            			<div class="movie-item">
					            			<div class="mv-img">
					            				<img src="${n.nimg}" alt="" width="185" height="284">
					            			</div> 
					            			<div class="hvr-inner">
					            				<a  href="moviesingle.html"> Read more <i class="ion-android-arrow-dropright"></i> </a>
					            			</div>
					            			<div class="title-in">
					            				<h6><a href="#">${n.ntitle}</a></h6>
					            				<p><i class="ion-android-star"></i><span>7.4</span> /10</p>
					            			</div>
					            		</div>
				            		</div>
				            		
					            				</c:if>
									</c:forEach>
				            	</div>
				            </div>
			       	 	</div>
				    </div>
				</div>
				
			</div>
			
		
	</div>
</div>
<div class="flex-wrap-movielist12 user-fav-list12">
					
					<div class="movie-item-style-2">
						<img src="images/uploads/mv2.jpg" alt="">
						<div class="mv-item-infor">
							<h6><a href="#">into the wild <span>(2014)</span></a></h6>
							<p class="rate"><i class="ion-android-star"></i><span>7.8</span> /10</p>
							<p class="describe"></p>
							<p class="run-time"> Run Time: 2h21’    .     <span>MMPA: PG-13 </span>    .     <span>Release: 1 May 2015</span></p>
							<p>Director: <a href="#">Anthony Russo,</a><a href="#">Joe Russo</a></p>
							<p>Stars: <a href="#">Chris Evans,</a> <a href="#">Samuel L. Jackson,</a> <a href="#">  Scarlett Johansson</a></p>
						</div>
					</div>
					<div class="movie-item-style-2">
						<img src="images/uploads/mv3.jpg" alt="">
						<div class="mv-item-infor">
							<h6><a href="#">blade runner  <span>(2015)</span></a></h6>
							<p class="rate"><i class="ion-android-star"></i><span>7.3</span> /10</p>
							<p class="describe"></p>
							<p class="run-time"> Run Time: 2h21’    .     <span>MMPA: PG-13 </span>    .     <span>Release: 1 May 2015</span></p>
							<p>Director: <a href="#">Peyton Reed</a></p>
							<p>Stars: <a href="#">Paul Rudd,</a> <a href="#"> Michael Douglas</a></p>
						</div>
					</div>
					<div class="movie-item-style-2">
						<img src="images/uploads/mv4.jpg" alt="">
						<div class="mv-item-infor">
							<h6><a href="#">Mulholland pride<span> (2013)  </span></a></h6>
							<p class="rate"><i class="ion-android-star"></i><span>7.2</span> /10</p>
							<p class="describe"></p>
							<p class="run-time"> Run Time: 2h21’    .     <span>MMPA: PG-13 </span>    .     <span>Release: 1 May 2015</span></p>
							<p>Director: <a href="#">Shane Black</a></p>
							<p>Stars: <a href="#">Robert Downey Jr., </a> <a href="#">  Guy Pearce,</a><a href="#">Don Cheadle</a></p>
						</div>
					</div>
					
				</div>		



<!--end of latest new v1 section-->
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