<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>

<!-- Basic need -->
<title>커뮤니티 상세페이지</title>
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
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- CSS files -->
<link rel="stylesheet" href="css/plugins.css">
<link rel="stylesheet" href="css/style.css">

</head>


<body>
	<bb:header />
	<!-- end of header section-->

	<div class="buster-light">
		<!-- blog detail section-->
		<div class="page-single">
			<div class="container">
				<div class="row">
					<div class="col-md-9 col-sm-12 col-xs-12">
						<div class="blog-detail-ct">
							<div class="btitle" style="margin-bottom: 1%;">
								<h2 style="display: inline-block; float: left;">

									<c:set var="n" value="${data}" />
									<c:set var="b" value="${n.boardVO}" />


									<b>${b.btitle} (댓글수 출력)</b>
								</h2>
								<c:if test="${member==null}">
								<p style="float: right;">추천, 비추천, 신고 기능은 로그인 후 이용해주세요</p>
								</c:if>
								<div>
									<br> <br>
									<hr style="border: 1px solid black;">
									<a>작성자 : ${b.mid} |</a> <span class="rcd">추천수
										:${b.cnt_l}</span> <span class="Nrcd">비추천수 : ${b.cnt_n}</span> <span
										class="time" style="float: right;">작성시간:${b.bdate}</span>
								</div>
							</div>
							<img src="images/${b.bimg}" alt="${b.bimg}">

							<p>
								${b.bcontent}
								<!--게시글 작성에서 받아온 게시글 (리뷰)-->
							</p>
							<hr style="border: 1px solid black;">


							<!-- 추천 비추천 신고 부분 시작 -->
							<c:if test="${member != null}">
							<div class="recmd-alert" style="margin-left:38%;">
								<div class="recmd-N">
									<input id="result1" type="text" value="${b.cnt_l}"
										style="display: inline-block; width: 40px; height: 40px;"
										disabled>
									<div style="display: inline-block;">
										<c:choose>
											<c:when test="${lvo.lstatus=='1'}">
												<img id="photo1" onclick="lstatus();" alt="추천 활성화"
													src="images/thumbsUp1.png"
													style="width: 70px; height: 70px; margin: 0px; cursor:pointer;">
											</c:when>
											<c:otherwise>
												<img id="photo1" onclick="lstatus();" alt="추천 비활성화"
													src="images/thumbsUp2.png"
													style="width: 70px; height: 70px; margin: 0px; cursor:pointer;">
											</c:otherwise>
										</c:choose>
									</div>
									&nbsp; &nbsp;
									<div style="display: inline-block;">
										<c:choose>
											<c:when test="${lvo.nlstatus=='1'}">
												<img id="photo2" onclick="nlstatus();" alt="비추천 활성화"
													src="images/thumbsDown1.png"
													style="width: 70px; height: 70px; margin: 0px; cursor:pointer;">
											</c:when>
											<c:otherwise>
												<img id="photo2" onclick="nlstatus();" alt="비추천 비활성화"
													src="images/thumbsDown2.png"
													style="width: 70px; height: 70px; margin: 0px; cursor:pointer;">
											</c:otherwise>
										</c:choose>

									</div>
									<input id="result2" type="text" value="${b.cnt_n}"
										style="display: inline-block; width: 40px; height: 40px;"
										disabled>
								</div>
								<div style="margin-left:18%;">
									<c:choose>
										<c:when test="${lvo.report=='1'}">
											<img id="photo3" onclick="report();" alt="신고 활성화"
												src="images/alert1.png"
												style="width: 70px; height: 70px; margin: 0px; cursor:pointer;">
										</c:when>
										<c:otherwise>
											<img id="photo3" onclick="report();" alt="신고 비활성화"
												src="images/alert2.png"
												style="width: 70px; height: 70px; margin: 0px; cursor:pointer;">
										</c:otherwise>
									</c:choose>
									<input id="result3" type="text" value="${b.cnt_r}"
										style="width: 40px; height: 40px; margin-left: 3.5%;" disabled>
								</div>
							</div>
							</c:if>
							<c:if test="${member == null}">
							<div class="recmd-alert" style="margin-left:38%;">
								<div class="recmd-N">
									<input id="result1" type="text" value="${b.cnt_l}"
										style="display: inline-block; width: 40px; height: 40px;"
										disabled>
									<div style="display: inline-block;">
										<c:choose>
											<c:when test="${lvo.lstatus=='1'}">
												<img id="photo1" onclick="lstatus();" alt="추천 활성화"
													src="images/thumbsUp1.png"
													style="width: 70px; height: 70px; margin: 0px;">
											</c:when>
											<c:otherwise>
												<img id="photo1" onclick="lstatus();" alt="추천 비활성화"
													src="images/thumbsUp2.png"
													style="width: 70px; height: 70px; margin: 0px;">
											</c:otherwise>
										</c:choose>
									</div>
									&nbsp; &nbsp;
									<div style="display: inline-block;">
										<c:choose>
											<c:when test="${lvo.nlstatus=='1'}">
												<img id="photo2" onclick="nlstatus();" alt="비추천 활성화"
													src="images/thumbsDown1.png"
													style="width: 70px; height: 70px; margin: 0px;">
											</c:when>
											<c:otherwise>
												<img id="photo2" onclick="nlstatus();" alt="비추천 비활성화"
													src="images/thumbsDown2.png"
													style="width: 70px; height: 70px; margin: 0px;">
											</c:otherwise>
										</c:choose>

									</div>
									<input id="result2" type="text" value="${b.cnt_n}"
										style="display: inline-block; width: 40px; height: 40px;"
										disabled>
								</div>
								<div style="margin-left:18%;">
									<c:choose>
										<c:when test="${lvo.report=='1'}">
											<img id="photo3" onclick="report();" alt="신고 활성화"
												src="images/alert1.png"
												style="width: 70px; height: 70px; margin: 0px;">
										</c:when>
										<c:otherwise>
											<img id="photo3" onclick="report();" alt="신고 비활성화"
												src="images/alert2.png"
												style="width: 70px; height: 70px; margin: 0px;">
										</c:otherwise>
									</c:choose>
									<input id="result3" type="text" value="${b.cnt_r}"
										style="width: 40px; height: 40px; margin-left: 3.5%;" disabled>
								</div>
							</div>
							</c:if>
							<!-- 추천 비추천 신고 부분 끝 -->

							<!-- comment items -->
							<div class="comments">
								<h4>(댓글개수)</h4>
								<hr>
								
								<!-- comment form -->
								<div class="comment-form">
									<h4>댓글을 남겨주세요</h4>
									<bb:cwrite type="rmsg" bid="${b.bid}" />
								</div>
								<!-- comment form finish-->

								<!-- 댓글창 시작 -->
								<c:forEach var="rs" items="${n.replySet}" begin="0" end="4"
									step="1">

									<c:set var="r" value="${rs.replyVO}" />
									<div id="Accordion_wrap" style="width: 100%;">
										<div class="que1" >

											<div style="padding:20px; margin-bottom: -4%;">

												<div style="display: inline-block; float: left; margin-right: 5%; font-weight: 600;">${r.mid}</div>
												|
												<div  style="display: inline-block; border: 1px black;">${r.rcontent} </div>
												<div class="time" style="float: right;">${r.rdate}</div>
												<br>
												<hr>
											</div>
											<bb:cboard midCheck="${r.mid}" type="rmsg" rid="${r.rid}"
												bid="${b.bid}" />

										</div>
										<div class="que">
											<button>대댓글보기</button>
										</div>
										<!-- 댓글창 종료 -->

										<div class="anw">

											<!-- 대댓글창 시작  -->
											<c:forEach var="rr" items="${rs.rrList}" begin="${rcnt-1}"
												end="${rcnt+3}" step="1">
												<hr>
												<div class="rrep">
													<div style="margin-left: 5%;">
														<div style="margin: 2%;">
															<div style="display: inline-block; float: left; margin-right: 5%; font-weight: 600;">ㄴ &nbsp;  ${rr.mid}</div>

															<div style="display: inline-block;">| &nbsp; ${rr.rrcontent}
															</div>
															<div class="time" style="float: right;">${rr.rrdate}</div>
															<br>

														</div>
													</div>
												<hr>
													<bb:cboard midCheck="${rr.mid}" type="rrmsg"
														rrid="${rr.rrid}" />
												</div>
											</c:forEach>
											<!-- 대댓글창 종료  -->
											<bb:cwrite type="rrmsg" bid="${b.bid}" rid="${r.rid}" />

											<!-- 대댓글 페이징 -->
											<ul class="pagination">
												<c:if test="${25<=rbegin}">
													<li class="icon-prev"><a
														href="community.do?cnt=${rbegin-24}"> <i
															class="ion-ios-arrow-left"></i></a></li>
												</c:if>
												<c:forEach var="c" items="${rs.rrList}" varStatus="status"
													begin="${rbegin}" end="${rend}" step="5">
													<a
														href="communityBoard.do?rid=${r.rid}&rcnt=${status.count+rpcnt+(4*(status.count+rpcnt-1))}&bid=${b.bid}">${status.count+rpcnt}&nbsp;</a>
                                 &nbsp;&nbsp;
                             		 </c:forEach>

												<c:if test="${datas_size2.size()>rend}">
													<li class="icon-next"><a
														href="community.do?cnt=${rend+2}"><i
															class="ion-ios-arrow-right"></i></a></li>
												</c:if>
											</ul>
											<!-- 대댓글 페이징 -->

										</div>
										<br> <br>
									</div>

								</c:forEach>

								<!-- 댓글 페이징 -->
								<ul class="pagination">

									<c:if test="${25<=begin}">
										<li class="icon-prev"><a
											href="community.do?cnt=${begin-24}"> <i
												class="ion-ios-arrow-left"></i></a></li>
									</c:if>
									<c:forEach var="c" items="${datas_size}" varStatus="status"
										begin="${begin}" end="${end}" step="5">
										<a
											href="communityBoard.do?cnt=${status.count+pcnt+(4*(status.count+pcnt-1))}&bid=${b.bid}">${status.count+pcnt}&nbsp;</a>
                                 &nbsp;&nbsp;
                             		 </c:forEach>

									<c:if test="${datas_size.size()>end}">
										<li class="icon-next"><a href="community.do?cnt=${end+2}"><i
												class="ion-ios-arrow-right"></i></a></li>
									</c:if>
								</ul>
								<!-- 댓글 페이징 -->

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end of  blog detail section-->
	</div>


	<!-- header section-->
	<bb:footer />
	<!-- end of header section-->

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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(".que").click(function() {
			$(this).next(".anw").stop().slideToggle(300);
			$(this).toggleClass('on').siblings().removeClass('on');
			$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기 (다른거 펼치면 기존 접히는 로직)
		});
	</script>

	<script type="text/javascript">
		function lstatus() {
			var mid = '${member.mid}';
			var bid = '${b.bid}';
			var cnt = $('#result1').val();
			console.log('로그: Lstatus');
			$.ajax({
				type : 'POST',
				url : 'Lstatus',
				data : {
					mid : mid,
					bid : bid
				},
				success : function(result) {
					console.log("로그1 [" + result + "]");
					if (result > cnt) {
						console.log("로그2 [추천+1]");
						$("#photo1").prop("src", "images/thumbsUp1.png");
						$("#result1").prop("value", result);
						///$("#result1").html(result);
					} else {
						console.log("로그2 [추천-1]");
						$("#photo1").prop("src", "images/thumbsUp2.png");
						$("#result1").prop("value", result);
						///$("#result1").html(result);
					}
				},
				error : function(request, status, error) { // 순서 체크해보기!
					console.log("상태코드: " + request.status);
					console.log("메세지: " + request.responseText);
					console.log("에러설명: " + error);
				}
			});
		}
	</script>

	<script type="text/javascript">
		function nlstatus() {
			var mid = '${member.mid}';
			var bid = '${b.bid}';
			var cnt = $('#result2').val();
			console.log('로그: NLstatus');
			$.ajax({
				type : 'POST',
				url : 'NLstatus',
				data : {
					mid : mid,
					bid : bid
				},
				success : function(result) {
					console.log("로그1 [" + result + "]");
					if (result > cnt) {
						console.log("로그2 [비추천+1]");
						//$("#result2").html(result);
						$("#photo2").prop("src", "images/thumbsDown1.png");
						$("#result2").prop("value", result);
					} else {
						console.log("로그2 [비추천-1]");
						//$("#result2").html(result);
						$("#photo2").prop("src", "images/thumbsDown2.png");
						$("#result2").prop("value", result);
					}
				},
				error : function(request, status, error) { // 순서 체크해보기!
					console.log("상태코드: " + request.status);
					console.log("메세지: " + request.responseText);
					console.log("에러설명: " + error);
				}
			});
		}
	</script>

	<script type="text/javascript">
		function report() {
			var mid = '${member.mid}';
			var bid = '${b.bid}';
			var cnt = $('#result3').val();
			console.log('로그: NLstatus');
			$.ajax({
				type : 'POST',
				url : 'Report',
				data : {
					mid : mid,
					bid : bid
				},
				success : function(result) {
					console.log("로그1 [" + result + "]");
					if (result > cnt) {
						console.log("로그2 [신고+1]");
						//$("#result3").html(result);
						$("#photo3").prop("src", "./images/alert1.png");
						$("#result3").prop("value", result);
					} else {
						console.log("로그2 [신고-1]");
						//$("#result3").html(result);
						$("#photo3").prop("src", "images/alert2.png");
						$("#result3").prop("value", result);
					}
				},
				error : function(request, status, error) { // 순서 체크해보기!
					console.log("상태코드: " + request.status);
					console.log("메세지: " + request.responseText);
					console.log("에러설명: " + error);
				}
			});
		}
	</script>
</body>

<c:if test="${reply}">

<script type="text/javascript">
window.addEventListener("scroll", (event) => {
    let scrollY = this.scrollY;
    let scrollX = this.scrollX;
    console.log(scrollY);
    console.log(scrollX);
});
   window.scrollTo({top:550, left:0, behavior:'smooth'});
</script>
</c:if>

<c:if test="${reply_re}">

<script type="text/javascript">
window.addEventListener("scroll", (event) => {
    let scrollY = this.scrollY;
    let scrollX = this.scrollX;
    console.log(scrollY);
    console.log(scrollX);
});
   window.scrollTo({top:1000, left:0, behavior:'smooth'});
</script>
</c:if>

<script type="text/javascript">
	$(".que2").click(function() {
		$(this).next(".anw2").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".anw2").siblings(".anw2").slideUp(300); // 1개씩 펼치기 (다른거 펼치면 기존 접히는 로직)
	});
</script>
<script type="text/javascript">
	$(".que3").click(function() {
		$(this).next(".anw3").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".anw3").siblings(".anw3").slideUp(300); // 1개씩 펼치기 (다른거 펼치면 기존 접히는 로직)
	});
</script>
<script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/plugins2.js"></script>
<script src="js/custom.js"></script>

</html>