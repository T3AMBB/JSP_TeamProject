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
            				${begin} ${end}
                           <ul class="pagination">
                              
                              <c:if test="${100<=begin}">
                              <li class="icon-prev"><a href="novelMain.do?cnt=${begin-99}"> <i
                                    class="ion-ios-arrow-left"></i></a></li>
                              </c:if>
                                    
                              <c:forEach var="c" items="${datas_size}" varStatus="status" begin="${begin}" end="${end}" step="20">
                                 <a href="novelMain.do?searchCondition=${searchCondition}&searchContent=${searchContent}&cnt=${status.count+pcnt+(19*(status.count+pcnt-1))}">${status.count+pcnt}&nbsp;</a>
                                 &nbsp;&nbsp;
                              </c:forEach>

                              <c:if test="${datas_size.size()>end}">
                              <li class="icon-next"><a href="novelMain.do?cnt=${end+2}"><i
                                    class="ion-ios-arrow-right"></i></a></li>
                              </c:if>
                           </ul>
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