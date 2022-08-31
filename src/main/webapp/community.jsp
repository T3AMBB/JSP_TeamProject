<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
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
											<br>
											<br>
											<br>
											<br>
											<a href="communityForm.jsp"><button>글 작성하기</button></a>
											<div class="TabsConts on">
												<table class="board-list-1s">
													<caption></caption>
													<colgroup>
														<col style="width: 9%;">
														<col style="width: 9%;">
														<col style="width: 67%;">
														<col style="width: 15%;">
														<!-- 2017-03-10 수정 : colgroup 영역 전체 복사+붙여넣기해주세요(각 항목 간격 수정) -->
													</colgroup>
													<thead>
														<tr>
															<th scope="col">번호</th>
															<th scope="col">작성자</th>
															<th scope="col">제목</th>
															<th scope="col">등록일</th>
														</tr>
													</thead>
													<tbody>
														<ul class="noticeList" id="notice-list">
															<c:forEach var="n" items="${datas}" begin="0" end="18" step="1">
															<tr class="notice_fix">

																<td>${n.nid}</td>
																<td>${n.nwriter}</td>

																<td class="subject"><strong class="FG01">일반
																</strong><a
																	href="javascript:counsel.noticeList.goDetail('35940')">
																	${n.ntitle}	</a></td>
																<td>${n.ngenre}</td>
															</tr>
															</c:forEach>
															

														</ul>
														</div>
													</tbody>
												</table>
											</div>

										</div>

									</div>

									<ul class="pagination">
										<li class="icon-prev"><a href="#"><i
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