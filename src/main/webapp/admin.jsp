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
<link rel="shorycut icon" href="images/favicon.png" type="images/png">
   <link rel="apple-touch-icon" href="images/favicon.png">
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
					<h1 class="mt-4">Dashboard</h1>
					<ol class="breadcrumb mb-4">
					</ol>
					<div class="row">
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body">전체 회원 수</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link">${mVO.cnt}</a>

								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-warning text-white mb-4">
								<div class="card-body">자유게시판 게시글 수</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link">${bVO.bcnt}</a>

								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-success text-white mb-4">
								<div class="card-body">현재 등록된 소설 수</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link">${nVO.ncnt}</a>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-danger text-white mb-4">
								<div class="card-body">이달의 리뷰왕</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link">
										<c:forEach var="n" items="${odatas}">
										${n.mid}<br>
										</c:forEach>
									</a>
								</div>
							</div>
						</div>
					</div>
					<hr>

					<div class="card mb-4">
						<!-- mb=마진바텀 -->
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 추천받은 게시글 리스트 
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>글제목</th>
										<th>아이디</th>
										<th>누적 추천수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="n" items="${datasL}" begin="0" end="20" step="1">
									
										<tr>
											<td>${n.btitle}</td>
											<!-- 글제목 mid를 받아와서 href로 글로이동 가능하게 할것인지?-->
											<td>${n.mid}</td>
											<!-- 작성자 mid를 받아와서 상세정보보기가 가능하게 할것인지.-->
											<td>${n.bcnt}</td>
											<!-- 좋아요 -->
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card mb-3">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 신고받은 게시글 리스트
						</div>
						<div class="card-body">
							<table id="datatablesSimple2">
								<thead>
									<tr>
										<th>글제목</th>
										<th>아이디</th>
										<th>신고수</th>
										
									</tr>
								</thead>
								<tbody>
									<c:forEach var="nl" items="${datasR}" begin="0" end="20"
										step="1">
										<tr>
											<td>${nl.btitle}</td>
											<!-- 글제목 -->
											<td>${nl.mid}</td>
											<td>${nl.bcnt}</td>
											<!-- 작성자 -->
											<!-- 신고수 cnt가 1인 이상의 title or mid만 출력 -->
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br> <br> <br> <br>
				<!-- 공지사항작성 CKE editor 추가 -->
				<div class="editor"></div>
				
			</main>
		</div>
		
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
