<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 모드</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="admin.do">관리자 모드</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<a class="nav-link" href="admin.do">
							 📈대시보드
						</a>
						 <a class="nav-link" href="adminForm.jsp">
							 📣공지사항 등록하기
						</a>
						 <a class="nav-link" href="adminBoard.do">
							 📂회원관리
						</a>
					<a class="nav-link" href="main.do">🏠메인으로</a>
					</div>
				</div>
			</nav>
		</div>


		<div id="layoutSidenav_content">
			<main>
					
				<div class="container-fluid px-4">
					<h1 class="mt-4">회원상세페이지</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active"> </li>
					</ol>
					<div class="row">
			 			<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body">회원이름 </div>
								<%-- <c:forEach var="n" items="${datas}" begin="0" end="0"> --%>
								<div class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link">${Mvo.mname}</a>

								</div>
								<%-- </c:forEach> --%>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-warning text-white mb-4">
								<div class="card-body">회원등급
								
								
								</div>
								<%-- <c:forEach var="n" items="${datas}" begin="0" end="0"> --%>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link">${Mvo.role}</a>
									

								</div>
								<%-- </c:forEach> --%>
								
							</div>
						</div>
						
					</div>
					<div style="float:left;">
					<form action="adminMemberD.do">
					<input type="hidden" value="${Mvo.mid}" name="mid">
					<input type="hidden" value="${Mvo.mpw}" name="mpw">
					<input type="submit" value="회원삭제">
					</form>
					</div>
					
					<div >
					<form action="adminMemberU.do" method="post" style="width:74%; float:right;">
										<select name="role">
											<option value="member">member</option>
											<option value="admin">admin</option>
											<option value="MVP">MVP</option>
											
										</select>
										<input type="hidden" value="${Mvo.mid}" name="mid">
										<input type="submit" value="등급수정">
								</form>
								</div>
					<br>
					<br>
					<br>
					
			
					<hr>
					
				<div class="col-md-9 col-sm-12 col-xs-12">
				<div class="topbar-filter">
					<p><span>${fn:length(datas)}</span>개의 게시글을 작성하셨습니다.</p>
				</div>
				
			<c:forEach var="b" items="${datas}">
			
				<div class="movie-item-style-2 userrate">
					<div class="mv-item-infor">
						<h6><a href="communityBoard.do?bid=${b.bid}">${b.btitle} </a></h6>&nbsp;&nbsp;&nbsp;&nbsp;<p class="time sm">${b.bdate}</p>
						
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
			<hr>
			<div class="col-md-9 col-sm-12 col-xs-12">
				<div class="topbar-filter">
					<p><span>${fn:length(datas)}</span>개의 리뷰를 작성하셨습니다.</p>
					
				</div> 
				<c:forEach var="o" items="${datas1}">
				<div class="movie-item-style-2 userrate">
					<div class="mv-item-infor">
						<h6><a href="novelBoard.do?nid=${o.nid}">${o.title}</a></h6>
						<p class="time sm">${o.odate}</p>
						<p class="time sm-text">나의 평점</p>
						<p class="rate"><i class="ion-android-star"></i><span>${o.ostar}</span> /5</p>
						<p class="time sm-text">나의 리뷰</p>
						<p>${o.ocontent}</p>		
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
			</main>
		</div>
		<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid px-4">
				<div class="d-flex align-items-center justify-content-between small">
					<div class="text-muted">Copyright &copy; Your Website 2022</div>
					<div>
						<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
							&amp; Conditions</a>
					</div>
				</div>
			</div>
		</footer>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
