<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<%
   /*
1.댓글 대댓글 적용 완료
1-1. 대댓글은 드랍다운으로 댓글에 종속되고 클릭하면 메뉴출력 완료
1-2. 댓글입력창은 상단위치 / 드랍다운 메뉴(대댓글)의 경우엔 아래쪽에 출력 (for each문 말미에 붙이면 될듯함 완료)

2.UI 구조 잡아야함. 80%
*/
%>
<!-- Basic need -->
   <title>커뮤니티 상세페이지</title>
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
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
   crossorigin="anonymous"></script>
   <!-- CSS files -->
   <link rel="stylesheet" href="css/plugins.css">
   <link rel="stylesheet" href="css/style.css">

</head>


<body>
<bb:header/>
   <!-- end of header section-->

   <div class="buster-light">
      <!-- blog detail section-->
      <div class="page-single">
         <div class="container">
            <div class="row">
               <div class="col-md-9 col-sm-12 col-xs-12">
                  <div class="blog-detail-ct">
                     <div class="btitle" style="margin-bottom:1%;">
                        <h2 style="display: inline-block; float: left;">
                        
                        <c:set var="n" value="${data}"/>
                        <c:set var="b" value="${n.boardVO}"/>

                        
                           <b>제목입니다${b.btitle} (댓글수 출력)</b>
                        </h2>
                        <div class="cncjs" style="display: inline-block; float: right;">
                        <i class="fa-solid fa-thumbs-up"></i>
                        
<i class="fa-regular fa-thumbs-up"></i>
                           <a>추천<i class="fa-solid fa-thumbs-up" style="font-size: 22px;"> </i></a>
                           <i class="fa-regular fa-thumbs-up" style="font-size: 22px;"></i>
                        </div>
                     
                     <div>
                     <br><br>
                     <hr style="border: 1px solid black;">
                     <a>작성자 : 김 아무개${b.mid} |</a> 
                     <span class="rcd">추천수 :${b.cnt_l}</span> <span class="Nrcd">비추천수 : ${b.cnt_n}</span>
                     <span class="time" style="float: right;">작성시간:${b.bdate}</span> 
                        </div>
                     </div>
                        <img src="images/${b.bimg}" alt="${b.bimg}">
                        
                     <p>
                        ${b.bcontent}
                        <!--게시글 작성에서 받아온 게시글 (리뷰)-->
                        <a> 제목부분 div 묶을건지? 고민중 리뷰하는 소설의 이미지가 들어갈것인지? 가나다라 이것이 소설의
                           후기입니다 </a>
                           </p>
                     <hr style="border: 1px solid black;">
                     
                     
                     
                     <div>
                        <!--
                        <c:if test="${member==null}">
                           <img id="photo1" onclick="lstatus();" alt="추천 비활성화" src="images/thumbsUp2.png" width="70px" height="70px">
                        </c:if>
                        <c:if test="${lvo.lstatus=='0'}">
                        <img id="photo1" onclick="lstatus();" alt="추천 비활성화" src="images/thumbsUp2.png" width="70px" height="70px">
                        </c:if>
                        <c:if test="${lvo.lstatus=='1'}">
                        <img id="photo1" onclick="lstatus();" alt="추천 활성화" src="images/thumbsUp1.png" width="70px" height="70px">
                        </c:if>
                        -->
                        <c:choose>
                           <c:when test="${lvo.lstatus=='1'}">
                              <img id="photo1" onclick="lstatus();" alt="추천 활성화" src="images/thumbsUp1.png" width="70px" height="70px">
                           </c:when>
                           <c:otherwise>
                              <img id="photo1" onclick="lstatus();" alt="추천 비활성화" src="images/thumbsUp2.png" width="70px" height="70px">
                           </c:otherwise>
                        </c:choose>
                        <input id="result1" type="text" value="${b.cnt_l}" width="70px" height="70px">
                     </div>
                     
                     <div >
                        <c:choose>
                           <c:when test="${lvo.nlstatus=='1'}">
                              <img id="photo2" onclick="nlstatus();" alt="비추천 활성화" src="images/thumbsDown1.png" width="70px" height="70px">
                           </c:when>
                           <c:otherwise>
                              <img id="photo2" onclick="nlstatus();" alt="비추천 비활성화" src="images/thumbsDown2.png" width="70px" height="70px">
                           </c:otherwise>
                        </c:choose>
                        <input id="result2" type="text" value="${b.cnt_n}" width="70px" height="70px">
                     </div>
                     
                     <div>
                        <c:choose>
                           <c:when test="${lvo.report=='1'}">
                        <img id="photo3" onclick="report();" alt="신고 활성화" src="images/alert1.png" width="70px" height="70px">
                           </c:when>
                           <c:otherwise>
                        <img id="photo3" onclick="report();" alt="신고 비활성화" src="images/alert2.png" width="70px" height="70px">
                           </c:otherwise>
                        </c:choose>
                        <input id="result3" type="text" value="${b.cnt_r}" width="70px" height="70px">
                     </div>

                     <!-- comment form -->
                     <div class="comment-form">
                        <h4>댓글을 남겨주세요 입력사이즈/VARCHAR</h4>
                        <form action="insertR.do" method="post">
                           <%
                              //댓글 정보 입력란 삭제 로그인된 session정보를 불러와 데이터 넘기기
                           %>
                           <input type="hidden" name="bid" value="${b.bid}">
                           <div class="row">
                              <div class="col-md-12">
                                 <textarea style="height:100px;" name="content" id=""
                                    placeholder="댓글을 작성해주세요 최대 500자"></textarea>
                              </div>
                           </div>
                           <input class="submit" type="submit" placeholder="submit">
                        </form>
                     </div>
                     <!-- comment form finish-->


                     <!-- comment items -->
                     <div class="comments">
                        <h4>04 Comments rcnt.size() 코멘트 갯수 (댓글개수)</h4>
                        
                        ++++++++======== <br>
                        [${n.replySet}]<br>
                        ===============
                        <br><hr><br>
                        <!-- 2번 댓글창 -->
                        <c:forEach var="rs" items="${n.replySet}">
                        
                           <c:set var="r" value="${rs.replyVO}"/>
                           ${r.mid} | ${r.rcontent}
                           
                           <c:forEach var="rr" items="${rs.rrList}">
                              ${rr.mid} | ${rr.rrcontent}
                           </c:forEach>
                           
                        </c:forEach>
                        <c:forEach var="rs" items="${n.replySet}">
                        
                        <c:set var="r" value="${rs.replyVO}"/>
                        <div id="Accordion_wrap" style="width:100%;">                                 
                                 <div class="que" style="border:1px solid black;">
                                    <div>
               
                                       <div href="#" style="display:inline-block; float:left; margin-right:5%; font-weight: 600; ">${r.mid}</div>| <div style="display:inline-block; border:1px red black;">${r.rcontent} !댓글 내용! 예제 2번입니다.
                                       
                                    </div><div class="time" style="float:right;">${r.rdate}</div><br>
                                       <hr>
                                    </div>
                                    
                                    
                                 </div>
                                 <!-- 댓글창 종료 -->
                                 <c:forEach var="rr" items="${rs.rrList}">
                                 <!-- 대댓글창 시작 foreach문 시작 -->
                                 <div class="anw">
                                    <div class="rrep" style="border: 1px solid black; margin-left:5%;">
                                       <div style="margin:2%;">
                                       <div href="#" style="display:inline-block; float:left; margin-right:5%; font-weight: 600; "></div>| <div style="display:inline-block; border:1px red black;">4545${rr.rrcontent}!대댓글 내용!   
                                    </div><div class="time" style="float:right;">${rr.rrdate}</div><br>
                                       
                                    </div>
                                    </div>                                    
                                 </div>
                                 <!-- 대댓글창 종료 foreach 종료 -->
                                 </c:forEach>
                                 </div>   
                                 </c:forEach>
                                 
                                                
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

      <script src="js/jquery.js"></script>
      <script src="js/plugins.js"></script>
      <script src="js/plugins2.js"></script>
      <script src="js/custom.js"></script>
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
   function lstatus(){
      var mid = '${member.mid}';
      var bid = '${b.bid}';
      var cnt = $('#result1').val();
      console.log('로그: Lstatus');
      $.ajax({
         type: 'POST',
         url: 'Lstatus',
         data: {mid:mid,bid:bid},
         success: function(result){
            console.log("로그1 ["+result+"]");
            if(result>cnt){
               console.log("로그2 [추천+1]");
               $("#photo1").prop("src","images/thumbsUp1.png");
               $("#result1").prop("value",result);
               ///$("#result1").html(result);
            }
            else{
               console.log("로그2 [추천-1]");
               $("#photo1").prop("src","images/thumbsUp2.png");
               $("#result1").prop("value",result);
               ///$("#result1").html(result);
            }
         },
         error: function(request, status, error){ // 순서 체크해보기!
            console.log("상태코드: "+request.status);
            console.log("메세지: "+request.responseText);
            console.log("에러설명: "+error);
         }
      });
   }
</script>

<script type="text/javascript">
   function nlstatus(){
      var mid = '${member.mid}';
      var bid = '${b.bid}';
      var cnt = $('#result2').val();
      console.log('로그: NLstatus');
      $.ajax({
         type: 'POST',
         url: 'NLstatus',
         data: {mid:mid,bid:bid},
         success: function(result){
            console.log("로그1 ["+result+"]");
            if(result>cnt){
               console.log("로그2 [비추천+1]");
               //$("#result2").html(result);
               $("#photo2").prop("src","images/thumbsDown1.png");
               $("#result2").prop("value",result);
            }
            else{
               console.log("로그2 [비추천-1]");
               //$("#result2").html(result);
               $("#photo2").prop("src","images/thumbsDown2.png");
               $("#result2").prop("value",result);
            }
         },
         error: function(request, status, error){ // 순서 체크해보기!
            console.log("상태코드: "+request.status);
            console.log("메세지: "+request.responseText);
            console.log("에러설명: "+error);
         }
      });
   }
</script>

<script type="text/javascript">
   function report(){
      var mid = '${member.mid}';
      var bid = '${b.bid}';
      var cnt = $('#result3').val();
      console.log('로그: NLstatus');
      $.ajax({
         type: 'POST',
         url: 'Report',
         data: {mid:mid,bid:bid},
         success: function(result){
            console.log("로그1 ["+result+"]");
            if(result>cnt){
               console.log("로그2 [신고+1]");
               //$("#result3").html(result);
               $("#photo3").prop("src","./images/alert1.png");
               $("#result3").prop("value",result);
            }
            else{
               console.log("로그2 [신고-1]");
               //$("#result3").html(result);
               $("#photo3").prop("src","images/alert2.png");
               $("#result3").prop("value",result);
            }
         },
         error: function(request, status, error){ // 순서 체크해보기!
            console.log("상태코드: "+request.status);
            console.log("메세지: "+request.responseText);
            console.log("에러설명: "+error);
         }
      });
   }
</script>
      </body>
</html>
