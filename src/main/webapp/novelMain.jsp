<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb" %>    
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
   <!-- Basic need -->
   <title>소설메인페이지</title>
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
   
    
<div class="buster-light">
<div class="page-single">
   <div class="container">
      <div class="row ipad-width">
         <div class="col-md-81 col-sm-12 col-xs-12">
            <div class="topbar-filter">
               <p>소설&nbsp;<span>${fn:length(datas)}</span>&nbsp;in total</p>
               <label name="searchCondition">장르:</label>
               <select name="searchContent">
                  <option selected value="판타지">판타지</option>
                  <option value="로맨스">로맨스</option>
                  <option value="무협">무협</option>
                  <option value="로판">로판</option>
                  <option value="현판">현판</option>
               </select>
               <a href="movielist.html" class="list"><i class="ion-ios-list-outline "></i></a>
               <a  href="moviegrid.html" class="grid"><i class="ion-grid active"></i></a>
            </div>
            <div class="flex-wrap-movielist">
            <c:forEach var="n" items="${datas}" begin="0" end="20" step="1">
                  <div class="movie-item-style-2 movie-item-style-1">
                     <img class="image" src="${n.nimg}" alt="" width="140" height="200">
                     <div class="hvr-inner">
                           <a  href="novelBoard.do?nid=${n.nid}">상세페이지<i class="ion-android-arrow-dropright"></i> </a>
                        </div>
                     <div class="mv-item-infor">
                        <h6>${n.ntitle}</h6>
                        
                        <p class="rate"><i class="ion-android-star"></i><span>${n.nwriter}</span></p>
                     </div>
                  </div>
               </c:forEach>               
                  
            </div>      
            <div class="topbar-filter">
               <label>Movies per page:</label>
               <select>
                  <option value="range">20 Movies</option>
                  <option value="saab">10 Movies</option>
               </select>
               
               <div class="pagination2">
                  <span>Page ${data[1].ncnt} of 5:</span>

                  <a href="novelMain.do?cnt=${1+20*(a-1)} " >ㅁ</a>
                  
                  <a href="novelMain.do?cnt=21">2</a>
                  <a href="novelMain.do?cnt=41">3</a>
                  <a href="novelMain.do?cnt=61">4</a>
                  <a href="novelMain.do?cnt=81">5</a>
                  <a href="#"><i class="ion-arrow-right-b"></i></a>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
      </div>
<!-- footer section-->
<bb:footer/>
<!-- end of footer section-->

<script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/plugins2.js"></script>
<script src="js/custom.js"></script>
</body>
</html>