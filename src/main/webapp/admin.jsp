<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	//추천글 , 신고글 완료
%>
<%
	//자유게시판 글 등록(공지) 필요
%>
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
		<a class="navbar-brand ps-3" href="admin.do">관리자 페이지</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"> 
				<i class="fas fa-user fa-fw"></i>
			</a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="mypage.jsp">마이페이지</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#!">로그아웃</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">주요 기능</div>
						<a class="nav-link" href="admin.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 대시보드
						</a> <a class="nav-link" href="adminForm.jsp">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-unicorn"></i>
							</div> 공지사항 등록하기
						</a>
						</a> <a class="nav-link" href="adminBoard.do">
							<div class="sb-nav-link-icon">
								<i class="fa-solid fa-unicorn"></i>
							</div> 회원관리
						</a>
						<div class="sb-sidenav-menu-heading">부가기능</div>
						
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 바로가기
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> 페이지
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="login.html">Login 수정필요 부분</a> <a
											class="nav-link" href="signUp.jsp">회원가입</a> <a
											class="nav-link" href="password.html">비밀번호 변경</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="./error/401.html">401 Page</a> <a
											class="nav-link" href="./error/404.html">404 Page</a> <a
											class="nav-link" href="./error/500.html">500 Page</a>
									</nav>
								</div>
							</nav>
						</div>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					!!로그인 세션정보 받아와야함.
				</div>
			</nav>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Dashboard</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">Dashboard</li>
					</ol>
					<div class="row">
						<div class="col-xl-3 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body">!!전체 회원수!!</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link">${mVO.cnt}</a>

								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-warning text-white mb-4">
								<div class="card-body">!! 자유게시판 게시글수!!</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link">${bVO.bcnt}</a>

								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-success text-white mb-4">
								<div class="card-body">!! 현재 등록된 소설 수!!</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link">${nVO.ncnt}</a>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-md-6">
							<div class="card bg-danger text-white mb-4">
								<div class="card-body">!!이달의 리뷰왕!!</div>
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
							<i class="fas fa-table me-1"></i> !!추천
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
									<c:forEach var="l" items="${like}" begin="1" end="20" step="1">
										<tr>
											<td><c:out value="${b.title}" /></td>
											<!-- 글제목 mid를 받아와서 href로 글로이동 가능하게 할것인지?-->
											<td><c:out value="${m.name}" /></td>
											<!-- 작성자 mid를 받아와서 상세정보보기가 가능하게 할것인지.-->
											<td><c:out value="${l.like}" /></td>
											<!-- 좋아요 -->
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card mb-3">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> !!신고
						</div>
						<div class="card-body">
							<table id="datatablesSimple2">
								<thead>
									<tr>
										<th>글제목</th>
										<th>아이디</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="nl" items="${Nlike}" begin="1" end="20"
										step="1">
										<tr>
											<td><c:out value="${b.title}" /></td>
											<!-- 글제목 -->
											<td><c:out value="${m.name}" /></td>
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
				<!-- 전체회원보기 (숨기기or 버튼 누르면 나오게) -->
				<!-- <div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> !!전체 회원 정보
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>ID</th>
									<th>이름</th>
									<th>연락처</th>
									<th>이메일</th>
									<th>역할</th>
									<th>누적 추천수</th>
									<th>누적 신고수</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>ID</th>
									<th>이름</th>
									<th>연락처</th>
									<th>이메일</th>
									<th>역할</th>
									<th>누적 추천수</th>
									<th>누적 신고수</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="n" items="${datas}" begin="1" end="20" step="1">
									<tr>
										<td>${m.mid}</td>
										<td>${m.name}</td>
										<td>${m.nickname}</td>
										<td>${m.mphone}</td>
										<td>${m.memail}</td>
										<td>${m.role}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div> -->

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
