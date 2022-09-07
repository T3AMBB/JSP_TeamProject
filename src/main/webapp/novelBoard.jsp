<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<!-- Basic need -->
<title>소설상세페이지</title>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<link rel="shorycut icon" href="images/favicon.png" type="images/png">
<link rel="apple-touch-icon" href="images/favicon.png">
<link rel="profile" href="#">

<!--Google Font-->
<link rel="stylesheet"
	href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
<!-- Mobile specific meta -->
<meta name=viewport content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone-no">

<!-- CSS files -->
<link rel="stylesheet" href="css/plugins.css">
<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<!-- header section-->
	<bb:header />
	<!-- end of header section-->


	<div class="buster-light">
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
					<div class="movie-img ">
						<img src="${data.nimg}" alt="소설이미지">
						<div class="movie-btn">
							<div class="btn-transform transform-vertical red">
								<div>
									<h2 class="item item-1 redbtn">작가 : ${data.nwriter}</h2>
								</div>

							</div>
							<div class="btn-transform transform-vertical">
								<div>
									<h2 class="item item-1 redbtn">장르 : ${data.ngenre}</h2>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8 col-sm-12 col-xs-12">
					<div class="movie-single-ct main-content">
						<h1 class="bd-hd" style="color: black;">${data.ntitle}</h1>
						<div class="movie-rate">
							<div class="rate">
								<i class="ion-android-star"></i>
								<p>
									<span style="color: black;">${data.avg}</span> <span
										style="color: black;">/ 5</span><br>
								</p>
							</div>
						</div>
						<div class="movie-tabs">
							<div class="tabs">
								<div class="tab-content">
									<div id="overview" class="tab active">
										<div class="row">
											<div class="col-md-8 col-sm-12 col-xs-12">
												<h3 style="width: 750px; line-height: 150%;">${data.ncontent}</h3>
											</div>
										</div>
									</div>
									<br>
									<hr>
									<br>
									<h3 style="margin-left: -2%;">
										리뷰 &nbsp; ${datas_size}개
										<c:if test="${!flag}">
											<span style="float: right">리뷰를 작성을 완료한 작품입니다.</span>
										</c:if>
									</h3>
									<div class="row">
										<c:if test="${member != null}">
											<c:if test="${flag}">
												<div class="rv-hd">
													<div class="div"></div>
													<br> <br>
													<div>
														<form action="insertO.do" class="mb-3" name="myform"
															id="myform" method="post"
															style="text-align: end; width: 95%;">
															<input type="hidden" name="nid" value="${data.nid}">
															<fieldset>
																<input type="radio" name="ostar" value="5" id="rate1"><label
																	for="rate1">★</label> <input type="radio" name="ostar"
																	value="4" id="rate2"><label for="rate2">★</label>
																<input type="radio" name="ostar" value="3" id="rate3"><label
																	for="rate3">★</label> <input type="radio" name="ostar"
																	value="2" id="rate4"><label for="rate4">★</label>
																<input type="radio" name="ostar" value="1" id="rate5"><label
																	for="rate5">★</label>
															</fieldset>

															<span class="text-bold">별점을 선택해주세요</span>
															<textarea rows="40" cols="100"
																placeholder="리뷰를 작성해주세요 최대 500자" name="ocontent"
																style="height: 100px;"></textarea>

															<input type="submit" value="리뷰등록" class="redbtn"
																style="margin-top: 1%;">
														</form>
													</div>
												</div>
											</c:if>
										</c:if>
										<c:if test="${member == null}">
											<div class="rv-hd">
												<div
													style="width: 90%; margin-bottom: 3%; margin-top: 5%; border: 1px solid grey; border-radius: 0.5rem; text-align: center; background-color: whitesmoke; padding: 25px;">
													<span style="font-size: 33px;">리뷰를 작성하려면 로그인 해주세요.</span>
												</div>
												<br>
												</form>
											</div>
									</div>
									</c:if>
									<!-- ${datas} -->
									<hr style="height: 5px; background-color: grey; border-radius: 3rem; width: 97%;">
									<c:forEach var="o" items="${datas}">
										<div class="mv-user-review-item">
											<div style="width: 95%;">
												<div class="user-infor">
													<div class="userid-timestmap"
														style="display: inline-block; width: 100%; margin-bottom: 4%;">
														<span style="font-size: 28px;">${o.mid}</span>
														<div class="no-star" style="display: inline-block; margin-left:2%;">
															<i class="ion-android-star"></i> <span
																style="color: black;">${o.ostar} / 5</span>
														</div>
														<span style="float: right" class="time">${o.odate}</span>
													</div>
													<span class="ocontent">${o.ocontent} </span>
												</div>
											</div>



											<%-- <span id="content">${o.ocontent}</span> --%>

											<bb:oboard midCheck="${o.mid}" oid="${o.oid}" nid="${o.nid}" />

											<hr
												style="height: 5px; background-color: grey; border-radius: 3rem; width: 97%;">

											<!-- <a href="updateO.do?oid=${oid}">수정</a>&nbsp;<a href="deleteO.do?oid=${oid}">삭제</a> -->
										</div>
									</c:forEach>


									<c:if test="${datas_size>cnt}">
										<div class="topbar-filter" style="border: none;">
											<div class="pagination2" style="padding-left: 0px;">
												<a href="novelBoard.do?cnt=${cnt+5}&nid=${data.nid}">더보기<i
													class="ion-arrow-down-b"></i></a>
											</div>
										</div>
									</c:if>
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
	<bb:footer />
	<!-- end of footer section-->

	<script src="js/jquery.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/plugins2.js"></script>
	<script src="js/custom.js"></script>
</body>

<c:if test="${opinion}">

	<script type="text/javascript">
window.addEventListener("scroll", (event) => {
    let scrollY = this.scrollY;
    let scrollX = this.scrollX;
    console.log(scrollY);
    console.log(scrollX);
});
</script>
	<script type="text/javascript">
window.addEventListener("scroll", (event) => {
    let scrollY = this.scrollY;
    let scrollX = this.scrollX;
    console.log(scrollY);
    console.log(scrollX);
});
   window.scrollTo({top:470, left:0, behavior:'smooth'});
</script>
</c:if>
<c:if test="${cnt > 5 }">
	<script type="text/javascript">
   var cnt = ${cnt*180};
   console.log(cnt);
   window.scrollTo({top:cnt, left:0, behavior:'smooth'});
</script>
</c:if>

<script type="text/javascript">
	$(".que2").click(function() {
		$(this).next(".anw2").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".anw2").siblings(".anw2").slideUp(300); // 1개씩 펼치기 (다른거 펼치면 기존 접히는 로직)
	});
</script>
</html>