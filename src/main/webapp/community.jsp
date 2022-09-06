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
/*    border : 1px solid black; */   

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
                                     <c:if test="${member != null}">
    <div class=list_bottom_btnbox>
                              <div style="float: right;">
                                 <a href="communityForm.jsp"><button>글 작성하기</button></a>
                              </div>
                           </div>
</c:if>

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
                                          
                                             <c:forEach var="n" items="${datas}" begin="0" end="4"
                                                step="1">
                                                <c:set var="b" value="${n.boardVO}"/>
                                                <c:if test="${b.role eq 'admin'}">
                                                <tr class="notice_fix">
                                                
                                                   <td><a href="communityBoard.do?bid=${b.bid}">${b.bid}</a></td>
                                                   <td>${b.mid}</td>
                                                   <c:choose>
                                                   <c:when test="${b.role eq 'admin'}">
                                                   <td class="subject"><strong class="FG01">
                                                   </strong><a
                                                      href="javascript:counsel.noticeList.goDetail('35940')">
                                                         <b>&lt공지&gt</b>${b.btitle} </a></td>
                                                         </c:when>
                                                   <c:otherwise>
                                                   <td class="subject"><strong class="FG01">
                                                   </strong><a
                                                      href="javascript:counsel.noticeList.goDetail('35940')">
                                                         ${b.btitle} </a></td>
                                                         </c:otherwise> 
                                                         </c:choose>
                                                   <td>${b.cnt_l}</td>
                                                   <td>${b.bdate}</td>
                                                </tr>
                                                </c:if>
                                             </c:forEach>
                                          </ul>
                                       </tbody>
                                       
                                       <tbody>
                                          <ul class="noticeList" id="notice-list">
                                          
                                             <c:forEach var="n" items="${datas}" begin="0" end="4"
                                                step="1">
                                               
                                                <c:set var="b" value="${n.boardVO}"/>
                                                <c:if test="${b.role != 'admin'}">
                                                <tr class="notice_fix">
                                                
                                                   <td><a href="communityBoard.do?bid=${b.bid}">${b.bid}</a></td>
                                                   <td>${b.mid}</td>
                                                   <c:choose>
                                                   <c:when test="${b.role eq 'admin'}">
                                                   <td class="subject"><strong class="FG01">
                                                   </strong><a
                                                      href="javascript:counsel.noticeList.goDetail('35940')">
                                                         <b>&lt공지&gt</b>${b.btitle} </a></td>
                                                         </c:when>
                                                   <c:otherwise>
                                                   <td class="subject"><strong class="FG01">
                                                   </strong><a
                                                      href="javascript:counsel.noticeList.goDetail('35940')">
                                                         ${b.btitle} </a></td>
                                                         </c:otherwise> 
                                                         </c:choose>
                                                   <td>${b.cnt_l}</td>
                                                   <td>${b.bdate}</td>
                                                </tr>
                                                </c:if>
                                             </c:forEach>
                                          </ul>
                                       </tbody>
  
                                    </table>
                                 </div>
                              </div>
                           </div>
                           <!-- 게시글 콘텐츠 끝 -->
                         <!-- 하단 버튼바 시작 -->
                         	<c:if test="${member == null}">
                         		<p style="float: right;">글 작성은 로그인 후 이용해 주세요</p>
                         	</c:if>
							<c:if test="${member != null}">
    <div class=list_bottom_btnbox>
                              <div style="float: right;">
                                 <a href="communityForm.jsp"><button>글 작성하기</button></a>
                              </div>
                           </div>
							</c:if>

                           <!-- 페이지 갯수 로직 필요 -->
                           <ul class="pagination">
                              
                              <c:if test="${25<=begin}">
                              <li class="icon-prev"><a href="community.do?cnt=${begin-24}"> <i
                                    class="ion-ios-arrow-left"></i></a></li>
                              </c:if>      
                              <c:forEach var="c" items="${datas_size}" varStatus="status" begin="${begin}" end="${end}" step="5">
                                 <a href="community.do?cnt=${status.count+pcnt+(4*(status.count+pcnt-1))}">${status.count+pcnt}&nbsp;</a>
                                 &nbsp;&nbsp;
                              </c:forEach>

                              <c:if test="${datas_size.size()>end}">
                              <li class="icon-next"><a href="community.do?cnt=${end+2}"><i
                                    class="ion-ios-arrow-right"></i></a></li>
                              </c:if>
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