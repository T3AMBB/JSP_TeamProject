<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb" %>
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
    <link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
   <!-- Mobile specific meta -->
   <meta name=viewport content="width=device-width, initial-scale=1">
   <meta name="format-detection" content="telephone-no">

   <!-- CSS files -->
   <link rel="stylesheet" href="css/plugins.css">
   <link rel="stylesheet" href="css/style.css">
</head>
<body>
<!-- header section-->
<bb:header/>
<!-- end of header section-->
<div class="searchform">
   <form action="novelMain.do">
      <table class="search-table"style="border:none;">
      <tr>
          <td  style="border:none;" ><select class="search-td1" name="searchCondition">
            <option value="ntitle">소설명</option>
            <option value="nwriter">작가</option>
            <option value="ngenre">장르</option>
         </select></td>
         <td style="border:none;"><input type="text" placeholder="작품명, 작가, 장르를 검색해 보세요." name="searchContent"></td>
         <td style="border:none;"><input type="submit"class="search-td2" value="검색"></td>
       <tr>
       </table>
   </form>      
</div>


<div class="slider movie-items">
   <div class="container">
      <div class="title-hd">
               <h1><strong>&lt이달의 소설&gt</strong></h1>
               
            </div>
      <div class="row">
         
          <div  class="slick-multiItemSlider">
          <c:forEach var="n" items="${datas}" begin="1" end="12" step="1">
          
             <div class="movie-item">
               <!--   <div class="mv-img"> -->
                            <a href="novelBoard.do?nid=${n.nid}"><img src="${n.nimg}" alt="" width="280" height="400"></a>
                     <div class="hvr-inner">
                            <a  href="novelBoard.do?nid=${n.nid}"> 상세페이지 <i class="ion-android-arrow-dropright"></i> </a>
                     </div>
               <!-- </div>-->
                <br>
                <br>
                <br>
                <br>
                <br>
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
               <a href="novelMain.do?searchContent=판타지&searchCondition=ngenre" class="viewall">전체보기<i class="ion-ios-arrow-right"></i></a>
            </div>
            <div class="tabs">
               
                <div class="tab-content">
                    <div id="tab1" class="tab active">
                        <div class="row">
                           <div class="slick-multiItem">
                           <c:forEach var="n" items="${datas}" begin="1" end="100" step="1">
                           
                                    <c:if test="${n.ngenre eq '판타지'}">
                              <div class="slide-it">
                                 <div class="movie-item">
                                    <div class="mv-img">
                                    <a href="novelBoard.do?nid=${n.nid}"><img src="${n.nimg}" alt="" width="185" height="284"></a>
                                    </div> 
                                    <div class="hvr-inner">
                                       <a  href="novelBoard.do?nid=${n.nid}"> 상세페이지 <i class="ion-android-arrow-dropright"></i> </a>
                                    </div>
                                    <div class="title-in">
                                       <h6><a href="#">${n.ntitle}</a></h6>
                                       <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                    </div>
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
               <a href="novelMain.do?searchContent=로맨스&searchCondition=ngenre" class="viewall">전체보기 <i class="ion-ios-arrow-right"></i></a>
            </div>
            <div class="tabs">
               
                <div class="tab-content">
                    <div id="tab1" class="tab active">
                        <div class="row">
                           <div class="slick-multiItem">
                           <c:forEach var="n" items="${datas}" begin="1" end="100" step="1">
                           
                                    <c:if test="${n.ngenre eq '로맨스'}">
                              <div class="slide-it">
                                 <div class="movie-item">
                                    <div class="mv-img">
                                       <a href="novelBoard.do?nid=${n.nid}"><img src="${n.nimg}" alt="" width="185" height="284"></a>
                                    </div> 
                                    <div class="hvr-inner">
                                       <a  href="novelBoard.do?nid=${n.nid}"> 상세페이지 <i class="ion-android-arrow-dropright"></i> </a>
                                    </div>
                                    <div class="title-in">
                                       <h6><a href="#">${n.ntitle}</a></h6>
                                       <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                    </div>
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
               <a href="novelMain.do?searchContent=무협&searchCondition=ngenre" class="viewall">전체보기 <i class="ion-ios-arrow-right"></i></a>
            </div>
            <div class="tabs">
               
                <div class="tab-content">
                    <div id="tab1" class="tab active">
                        <div class="row">
                           <div class="slick-multiItem">
                           <c:forEach var="n" items="${datas}" begin="1" end="100" step="1">
                           
                                    <c:if test="${n.ngenre eq '무협'}">
                              <div class="slide-it">
                                 <div class="movie-item">
                                    <div class="mv-img">
                                       <a href="novelBoard.do?nid=${n.nid}"><img src="${n.nimg}" alt="" width="185" height="284"></a>
                                    </div> 
                                    <div class="hvr-inner">
                                       <a  href="novelBoard.do?nid=${n.nid}"> 상세페이지 <i class="ion-android-arrow-dropright"></i> </a>
                                    </div>
                                    <div class="title-in">
                                       <h6><a href="#">${n.ntitle}</a></h6>
                                       <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                    </div>
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
               <a href="novelMain.do?searchContent=로판&searchCondition=ngenre" class="viewall">전체보기 <i class="ion-ios-arrow-right"></i></a>
            </div>
            <div class="tabs">
               
                <div class="tab-content">
                    <div id="tab1" class="tab active">
                        <div class="row">
                           <div class="slick-multiItem">
                           <c:forEach var="n" items="${datas}" begin="1" end="100" step="1">
                           
                                    <c:if test="${n.ngenre eq '로판'}">
                              <div class="slide-it">
                                 <div class="movie-item">
                                    <div class="mv-img">
                                       <a href="novelBoard.do?nid=${n.nid}"><img src="${n.nimg}" alt="" width="185" height="284"></a>
                                    </div> 
                                    <div class="hvr-inner">
                                       <a  href="novelBoard.do?nid=${n.nid}"> 상세페이지 <i class="ion-android-arrow-dropright"></i> </a>
                                    </div>
                                    <div class="title-in">
                                       <h6><a href="#">${n.ntitle}</a></h6>
                                       <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                    </div>
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
<div>
${bdatas}
<h1><strong>&lt이달의 추천왕&gt</strong></h1>
<div class="flex-wrap-movielist12 user-fav-list12">
               <c:forEach var="b" items="${bdatas}" begin="0" end="3" step="1"> 
               <div class="movie-item-style-2">
                  <div class="mv-item-infor">
                     <h6><a href="communityBoard.do?bid=${b.bid}">작성자 : ${b.mid} </a></h6>
                     <p class="rate"><span>추천수 : ${b.cnt_l}</span></p>
                     <p class="describe"></p>
                     <p class="run-time">제목 : ${b.btitle}  <span></span></p>
                     <p>날짜 : ${b.bdate}</p>
                     <p>내용 : ${b.bcontent}</p>
                  </div>
               </div>
               </c:forEach>
            </div>      
<!--end of latest new v1 section-->
      </div>
<!-- footer section-->
<bb:footer/>
<!-- end of footer section-->

</body>
<script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/plugins2.js"></script>
<script src="js/custom.js"></script>
</html>