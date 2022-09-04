<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
   <!-- Basic need -->
   <title>마이페이지- 내정보보기</title>
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
<!--delete form popup-->
<div class="login-wrapper" id="login-content1">
    <div class="login-content">
        <a href="#" class="close">x</a>
        <h3>회원탈퇴</h3>
        <form action="deleteM.do" method="post"> 
           <div class="row">
               <label>
                    비밀번호 입력
                    <input type="password" name="mpw" id="password" placeholder="비밀번호 입력해주세요." required="required" />
                </label>
           </div>
           
            <div class="row">
               <label>
                    비밀번호 확인
                    <input type="password" id="passwordcheck" placeholder="비밀번호 입력해주세요." required="required" />
                </label>
            </div>
            
           <div class="row">
           	 	<input type="submit" value="회원탈퇴" class="submit">
              <!--  <button type="submit">회원탈퇴</button>  -->
           </div>
        </form>
        
    </div>
</div>
<!--end of login form popup-->
<!-- header section-->
<bb:header/>
<!-- end of header section-->

<div class="buster-light">
<div class="page-single">
   <div class="container">
      <div class="row ipad-width">
         <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="user-information">
               <div class="user-fav">
                  <ul>
                  <!-- mypage.do -->
                  <!-- myboard.do -->
                  <!-- myreview.do -->
                     <li  class="active"><a href="mypage.do">내 정보</a></li>
                     <li><a href="myboard.do">내가 쓴 게시글</a></li>
                     <li><a href="myreview.do">내가 쓴 리뷰</a></li>
                     <li class="loginLink1"><a href="#">회원탈퇴</a></li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="col-md-9 col-sm-12 col-xs-12">
            <div class="form-style-1 user-pro" >
               <form action="updateM.do" class="user">
                <input type="hidden" name="mpw" value="${data.mpw}">
                  <h4>내 프로필</h4>
                  <div class="row">
                     <div class="col-md-6 form-it">
                        <label>이름</label>
                        <input type="text" name="mname" value="${data.mname}" readonly>
                     </div>
                     <div class="col-md-6 form-it">
                        <label>별명</label>
                        <input type="text" name="nickname" value="${data.nickname}" >
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6 form-it">
                        <label>휴대폰번호</label>
                        <input type="text" name="mphone" value="${data.mphone}" readonly>
                     </div>
                     <div class="col-md-6 form-it">
                        <label>이메일</label>
                        <input type="text" name="memail" value="${data.memail}" readonly >
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-2">
                        <input type="submit" value="저장" class="submit" >
                     </div>
                  </div>   
               </form>
               <form action="updateM.do" class="password">
                  <h4>비밀번호 변경</h4>
                  <div class="row">
                     <div class="col-md-6 form-it">
                        <label>현재 비밀번호</label>
                        <input type="text" placeholder="**********">
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6 form-it">
                        <label>새 비밀번호</label>
                        <input type="text" placeholder="***************">
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6 form-it">
                        <label>새 비밀번호 확인</label>
                        <input type="text" placeholder="*************** ">
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-2">
                        <input type="submit" value="변경" class="submit" >
                     </div>
                  </div>   
               </form>
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