<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb"%>
<!-- 회원 정보 불러오기 가능 //수정기능 
모든 글 수정 및 삭제 <- 일단보류  -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자 상세페이지</title>
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
					<div class="card-body">
							<table id="datatablesSimple">
							  
								<thead>
									<tr>
										<th>ID</th>
										<th>이름</th>
										<th>닉네임</th>
										<th>연락처</th>
										<th>이메일</th>
										<th>역할</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="m" items="${datas}" begin="0" end="20" step="1">
										<tr>
											<td><a href="adminMember.do?mid=${m.mid}"><c:out value="${m.mid}" /></a></td>
											<td><c:out value="${m.mname}" /></td>
											<td><c:out value="${m.nickname}" /></td>
											<td><c:out value="${m.mphone}" /></td>
											<td><c:out value="${m.memail}" /></td>
											<td><c:out value="${m.role}" /></td>
										</tr>
									</c:forEach>
								</tbody>
							
							</table>
						</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2022</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>