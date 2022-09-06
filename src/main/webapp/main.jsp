<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb"%>
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
	<div class="searchform" style="margin-top: 3%;">
		<form action="novelMain.do">
			<div id=search-bar-main>
				<table class="search-table" style="border: none;">
					<tr>
						<td style="border: none;"><select class="search-td1"
							name="searchCondition" style="width: 40%; background-color:#EFF2FB;">
								<option value="ntitle" style="">소설명</option>
								<option value="nwriter">작가</option>
								<option value="ngenre">장르</option>
						</select></td>
						<td style="border: none; "><input type="text"
							placeholder="작품명, 작가, 장르를 검색해 보세요." name="searchContent"
							style="width: 130%;background-color:#EFF2FB;"></td>
						<td style="border: none;"><input type="submit"
							class="search-td2" value="검색" style="margin-left: 30%; border:1.5px solid #aaa; background-color:#EFF2FB;"></td>
					<tr>
				</table>
			</div>
		</form>
	</div>

	<hr>

	<div class="slider movie-items">
		<div class="container">

			<div class=title-header style="font-size: 33px; text-align: center;">&lt&nbsp;이달의
				소설&nbsp;&gt</div>

			<div class="row">
				<div class="slick-multiItemSlider">
					<c:forEach var="n" items="${datas}" begin="${rs}" end="${re}" step="1">

						<div class="movie-item">
							<!--   <div class="mv-img"> -->
							<a href="novelBoard.do?nid=${n.nid}"><img src="${n.nimg}"
								alt="" width="280" height="400"></a>
							<div class="hvr-inner">
								<a href="novelBoard.do?nid=${n.nid}"> 상세페이지 <i
									class="ion-android-arrow-dropright"></i>
								</a>
							</div>
							<!-- </div>-->
							<br> <br> <br> <br> <br>
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
						<a href="novelMain.do?searchContent=판타지&searchCondition=ngenre"
							class="viewall">전체보기<i class="ion-ios-arrow-right"></i></a>
					</div>
					<div class="tabs">
						<div class="tab-content">
							<div id="tab1" class="tab active">
								<div class="row">
									<div class="slick-multiItem">
										<c:forEach var="n" items="${datas}" begin="1" end="100"
											step="1">

											<c:if test="${n.ngenre eq '판타지'}">
												<div class="slide-it">
													<div class="movie-item">
														<div class="mv-img">
															<a href="novelBoard.do?nid=${n.nid}"><img
																src="${n.nimg}" alt="" width="280" height="400"></a>
														</div>
														<div class="hvr-inner">
															<a href="novelBoard.do?nid=${n.nid}"> 상세페이지 <i
																class="ion-android-arrow-dropright"></i>
															</a>
														</div>
													</div>
														<div class="title-in">
															<h6>
																<a href="#">${n.ntitle}</a>
															</h6>															
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
						<a href="novelMain.do?searchContent=로맨스&searchCondition=ngenre"
							class="viewall">전체보기 <i class="ion-ios-arrow-right"></i></a>
					</div>
					<div class="tabs">
						<div class="tab-content">
							<div id="tab1" class="tab active">
								<div class="row">
									<div class="slick-multiItem">
										<c:forEach var="n" items="${datas}" begin="1" end="100"
											step="1">
											<c:if test="${n.ngenre eq '로맨스'}">
												<div class="slide-it">
													<div class="movie-item">
														<div class="mv-img">
															<a href="novelBoard.do?nid=${n.nid}"><img
																src="${n.nimg}" alt="" width="280" height="400"></a>
														</div>
														<div class="hvr-inner">
															<a href="novelBoard.do?nid=${n.nid}"> 상세페이지 <i
																class="ion-android-arrow-dropright"></i>
															</a>
														</div>
													</div>
														<div class="title-in">
															<h6>
																<a href="#">${n.ntitle}</a>
															</h6>															
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
						<a href="novelMain.do?searchContent=무협&searchCondition=ngenre"
							class="viewall">전체보기 <i class="ion-ios-arrow-right"></i></a>
					</div>
					<div class="tabs">
						<div class="tab-content">
							<div id="tab1" class="tab active">
								<div class="row">
									<div class="slick-multiItem">
										<c:forEach var="n" items="${datas}" begin="1" end="100"
											step="1">
											<c:if test="${n.ngenre eq '무협'}">
												<div class="slide-it">
													<div class="movie-item">
														<div class="mv-img">
															<a href="novelBoard.do?nid=${n.nid}"><img
																src="${n.nimg}" alt="" width="280" height="400"></a>
														</div>
														<div class="hvr-inner">
															<a href="novelBoard.do?nid=${n.nid}"> 상세페이지 <i
																class="ion-android-arrow-dropright"></i>
															</a>
														</div>
													</div>
														<div class="title-in">
															<h6>
																<a href="#">${n.ntitle}</a>
															</h6>													
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
						<a href="novelMain.do?searchContent=로판&searchCondition=ngenre"
							class="viewall">전체보기 <i class="ion-ios-arrow-right"></i></a>
					</div>
					<div class="tabs">

						<div class="tab-content">
							<div id="tab1" class="tab active">
								<div class="row">
									<div class="slick-multiItem">
										<c:forEach var="n" items="${datas}" begin="1" end="100"
											step="1">

											<c:if test="${n.ngenre eq '로판'}">
												<div class="slide-it">
													<div class="movie-item">
														<div class="mv-img">
															<a href="novelBoard.do?nid=${n.nid}"><img
																src="${n.nimg}" alt="" width="280" height="400"></a>
														</div>
														<div class="hvr-inner">
															<a href="novelBoard.do?nid=${n.nid}"> 상세페이지 <i
																class="ion-android-arrow-dropright"></i>
															</a>
														</div>
													</div>
														<div class="title-in">
															<h6>
																<a href="#">${n.ntitle}</a>
															</h6>
															
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
		</div>
		<div>
			<div class="container">
			<div class=title-header style="font-size: 33px; text-align: center; margin-bottom:2%;"><span>&lt&nbsp;이달의
				추천왕&nbsp;&gt</span>
			</div>
			<div class="flex-wrap-movielist12 user-fav-list12">
				<c:forEach var="b" items="${bdatas}" begin="0" end="3" step="1">
					<div class="movie-item-style-2" style="padding:40px;">
						<div class="mv-item-infor">
							<div OnClick="communityBoard.do?bid=${b.bid}" style="cursor:pointer;" >
							<h2>작성자 : ${b.mid}</h2>
							</div>
							<h3>추천수 : ${b.cnt_l}</h3>
							<hr>
							<div class="inneritem">
							<h5>제목 : ${b.btitle}</h5> 
							<h5>날짜 : ${b.bdate}</h5> 
							<h5>내용 : ${b.bcontent}</h5> 
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!--end of latest new v1 section-->
		</div>
		</div>
		
		<!-- footer section-->
		<bb:footer />
		<!-- end of footer section-->
</body>
<script type="text/javascript">
function sms(){
	   var mid=$("#mid").val(); // id=mid의 value값
	   $.ajax({
	      type: 'GET', 
	      url: 'Sms?mid='+mid, //사용자가 입력한 값을 확보한 상태 > DB한테 물어볼 예정 "mid라는 값이 DB에 이미 있어?" => DAO(M)로 가야함 > 이제 C가(서블릿) 작업을 할 차례구나! 
	      data: {mid:mid},
	      success: function(result){ // 성공했을 때
	         
	         console.log("로그1 ["+result+"] succes");
	         if(result==0){ // 가입된회원
	        
		         $(".result1").text("가입된 휴대전화로 임시비밀번호 전송되었습니다.");
		            $(".result1").css("color","blue");
		            
		            document.getElementById("btu").disabled=true;
		            console.log("로그2 ["+result+"] succes");
	         }else{ // 중복, 사용불가
	        	 $(".result1").text("가입된 회원이 아닙니다.");
		         $(".result1").css("color","red");
		       //  $(".result2").val(result);
		         
		         console.log("로그3 ["+result+"] succes");
		            //document.getElementById("btu").disabled=false;            
	         }
	      },
	      error: function(request, status, error){
	         console.log("code: "+request.status);
	         console.log("message: "+request.responseText);
	         console.log("error: "+error);
	      }
	   });
	}

</script> 

<script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/plugins2.js"></script>
<script src="js/custom.js"></script>
</html>
