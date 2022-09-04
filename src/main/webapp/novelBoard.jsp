<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<!-- Basic need -->
	<title>소설상세페이지</title>
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
<div class="hero mv-single-hero">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- <h1> movie listing - list</h1>
				<ul class="breadcumb">
					<li class="active"><a href="#">Home</a></li>
					<li> <span class="ion-ios-arrow-right"></span> movie listing</li>
				</ul> -->
			</div>
		</div>
	</div>
</div>
<div class="page-single movie-single movie_single">
	<div class="container">
		<div class="row ipad-width2">
			<div class="col-md-4 col-sm-12 col-xs-12">
				<div class="movie-img sticky-sb">
					<img src="${data.nimg}" alt="">
					<div class="movie-btn">	
						<div class="btn-transform transform-vertical red">
							<div><a class="item item-1 redbtn">작가 : ${data.nwriter}</a></div>
							
						</div>
						<div class="btn-transform transform-vertical">
							<div><a class="item item-1 redbtn">장르 : ${data.ngenre}</a></div>
							
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8 col-sm-12 col-xs-12">
				<div class="movie-single-ct main-content">
					<h1 class="bd-hd" style="color:black;">${data.ntitle}</h1>
					<div class="social-btn">
						
						
					</div>
					<div class="movie-rate">
						<div class="rate">
							<i class="ion-android-star"></i>
							<p><span style="color:black;">별점평균</span> <span style="color:black;">/ 5</span><br>
								
							</p>
						</div>
						<div class="rate-star">
							<p>Rate This Movie:  </p>
							<i class="ion-ios-star"></i>
							<i class="ion-ios-star"></i>
							<i class="ion-ios-star"></i>
							<i class="ion-ios-star"></i>
							<i class="ion-ios-star"></i>
							<i class="ion-ios-star"></i>
							<i class="ion-ios-star"></i>
							<i class="ion-ios-star"></i>
							<i class="ion-ios-star-outline"></i>
						</div>
					</div>
					<div class="movie-tabs">
						<div class="tabs">
							<ul class="tab-links tabs-mv">
								<li><h3><a href="#overview">소설내용</a></h3></li>
								<li><h3><a href="#reviews"> 리뷰</a></h3></li>
								                       
							</ul>
						    <div class="tab-content">
						        <div id="overview" class="tab active">
						            <div class="row">
						            	<div class="col-md-8 col-sm-12 col-xs-12">
						            		<h4 style="width:750px;">${data.ncontent}</h4>
						            	</div>
						            </div>
						        </div>
						        
						        <div id="reviews" class="tab review">
						           <div class="row">
						       	 		<c:if test="${member != null}">	
						            	<div class="rv-hd">
						            		<div class="div">
							            	</div>
							            	<br>
							            	<br>
							            	<div>
							            		<form action="insertO.do" class="mb-3" name="myform" id="myform" method="post" style=" text-align: end; width: 95%;">
							            			<input type="hidden" name="nid" value="${data.nid}">
													<fieldset>
														<span class="text-bold">별점을 선택해주세요</span>
																<input type="radio" name="ostar" value="5" id="rate1"><label for="rate1">★</label>
																<input type="radio" name="ostar" value="4" id="rate2"><label for="rate2">★</label>
																<input type="radio" name="ostar" value="3" id="rate3"><label for="rate3">★</label>
																<input type="radio" name="ostar" value="2" id="rate4"><label for="rate4">★</label>
																<input type="radio" name="ostar" value="1" id="rate5"><label for="rate5">★</label>
													</fieldset>
							            			<textarea rows="40" cols="100" placeholder="리뷰를 작성해주세요 최대 500자" name="ocontent" style="height:100px;left:50px;top:51px;">
							            			</textarea>
							            			<input type="submit" value="리뷰등록" class="redbtn">
							            		</form>
							            	</div>
						            	</div>
						            	</c:if>
						            	<c:if test="${member == null}">	
						            			<div class="rv-hd">
						            		<div class="div">
							            		<h3>리뷰를 작성하려면 로그인 해주세요 :D</h3>
						            			<form action="insertO.do" class="mb-3" name="myform" id="myform" method="post" style=" text-align: end; width: 95%;">
							            			<textarea rows="40" cols="100" placeholder="로그인 후 리뷰를 작성해보세요 :D" name="ocontent" style="height:100px;left:50px;top:51px;" readonly>
							            			</textarea>
							            			<input type="submit" value="리뷰등록" class="redbtn">
							            		</form>
						            	</div>
							            	</div>
						            	</c:if>
						          ${datas}  	
								  <c:forEach var="o"  items="${datas}">
								  <form>
										<div class="mv-user-review-item">
											<div>
											<div class="user-infor">
													<h3>${o.mid}</h3> &nbsp;
													<p class="time">
														${o.odate}
													</p>
												</div>
											</div>
											<bb:oboard midCheck="${o.mid}" oid="${o.oid}" nid="${o.nid}"/>
											<input type="text" value="${o.ocontent}"  readonly>		
											<p>${o.ocontent}</p>
											<div class="no-star">
													<i class="ion-android-star"></i><h3>${o.ostar}</h3>
													</div>
													
													<!-- <a href="updateO.do?oid=${oid}">수정</a>&nbsp;<a href="deleteO.do?oid=${oid}">삭제</a> -->
										</div>
										</form>
										</c:forEach>
									
									 
									<%--	<c:if test="${cnt < datasSize}">
									<a href="novelBoard.do?cnt=${cnt+2}">더보기&gt;&gt;</a>
										</c:if>
										  --%>
										 
										<div class="topbar-filter">
											<div class="pagination2">
												<a href="novelBoard.do?cnt=${cnt+2}">더보기<i class="ion-arrow-right-b"></i></a>
											</div>
										</div>
						            </div>
						        </div>
						        
					       	 	
					       	 	
						    </div>
						</div>
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