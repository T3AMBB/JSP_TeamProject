<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>

<style type=text/css>
.list_top_btnbox {
	display: inline-block;
	width : 100%;
/* 	border : 1px solid black; */	

}

.btn_view {
	display: inline-block;
	border-color: #29367c;
	flaot: left;
	margin-right: 5px;
	border-radius: 0.5rem;
}

.btn_write {
	display: inline-block;
	border-color: red;
	float: right;
	
	border-radius: 0.5rem;
}
.fl{
float :left;}
.fr{
float : right;}

</style>
<!-- Basic need -->
<title>커뮤니티</title>
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

	<div class="buster-light">
		<!-- blog list section-->
		<div class="page-single">
			<div class="container">
				<div class="row">
					<div class="col-md-9 col-sm-12 col-xs-12">
						<div class="container">
							<div class="row">
								<div class="col-md-9 col-sm-12 col-xs-12">
									<div id="Container">

										<div id="Contents">
											<div class="sub_title_area customer">
												<h1>커뮤니티</h1>
											</div>
											<br> <br> <br> <br>
											<!-- 상단 버튼바 시작 -->
											<div class=list_top_btnbox>
												<div class=fl>
												<a href="communityForm.jsp">
													<button class=btn_view>전체글보기</button>
												</a> 
												<a href="communityForm.jsp">
													<button class=btn_view>공지글보기</button>
												</a>
												</div>
												<div class=fr>
													<div class=btn_write>
														<a href="communityForm.jsp"><button class=btn_write>글작성하기</button>
														</a>
												</div>
												</div>
											</div>
											<!-- 상단 버튼바 끝 -->

											<!-- 게시글 콘텐츠 시작 -->
											<div class="TabsConts on">
												<table class="board-list-1s">
													<caption></caption>
													<colgroup>
														<col style="width: 9%;">
														<col style="width: 9%;">
														<col style="width: 58%;">
														<col style="width: 9%;">
														<col style="width: 15%;">
														<!-- 2017-03-10 수정 : colgroup 영역 전체 복사+붙여넣기해주세요(각 항목 간격 수정) -->
													</colgroup>
													<thead>
														<tr>
															<th scope="col">번호</th>
															<th scope="col">작성자</th>
															<th scope="col">제목</th>
															<th scope="col">추천수</th>
															<th scope="col">등록일</th>
														</tr>
													</thead>
													<tbody>
														<ul class="noticeList" id="notice-list">
															<c:forEach var="n" items="${datas}" begin="0" end="18"
																step="1">
																<c:set var="b" value="${n.boardVO}"/>
																<tr class="notice_fix">
																	<td><a href="communityBoard.do?bid=${b.bid}">${b.bid}</a></td>
																	<td>${b.mid}</td>
																	<td class="subject"><strong class="FG01">
																	</strong><a
																		href="javascript:counsel.noticeList.goDetail('35940')">
																			${b.btitle} </a></td>
																	<td>${b.cnt_l}</td>
																	<td>${b.bdate}</td>
																</tr>
															</c:forEach>
														</ul>
														</div>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<!-- 게시글 콘텐츠 끝 -->
									<!-- 아래쪽 버튼 바 -->
									<div class=list_bottom_btnbox>
										<div style="float: left;">
											<a href="communityForm.jsp"><button>전체글 보기</button></a>
										</div>
										<div>
											<a href="communityForm.jsp"><button>공지글 보기</button></a>
										</div>
										<div style="float: right;">
											<a href="communityForm.jsp"><button>글 작성하기</button></a>
										</div>
									</div>
									<!-- 아래쪽 버튼 바 끝 -->

									<!-- 페이지 갯수 로직 필요 -->
									<ul class="pagination">
										<a>for each문으로 <br>게시글 페이지 갯수 출력
										</a>
										<li class="icon-prev"><a href="#"> <i
												class="ion-ios-arrow-left"></i></a></li>
										<li class="active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">...</a></li>
										<li><a href="#">21</a></li>
										<li><a href="#">22</a></li>
										<li class="icon-next"><a href="#"><i
												class="ion-ios-arrow-right"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--end of blog list section-->
	</div>
	<!-- footer section-->
	<bb:footer />
	<!-- end of footer section-->

	<script src="js/jquery.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/plugins2.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>