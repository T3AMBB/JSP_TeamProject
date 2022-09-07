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
   <link rel="shorycut icon" href="images/favicon.png" type="images/png">
   <link rel="apple-touch-icon" href="images/favicon.png">
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
        <h1>회원탈퇴</h1>
        
        <form action="deleteM.do" method="post" onsubmit="return false;"> 
           <div class="row">
               <label>
                    아이디
                    <input type="text" name="mid"  id="mid" value="${member.mid}" readonly />
                </label>
               <label>
                    비밀번호 입력
                    <input type="password" name="mpw" id="mpw" onchange="DeletePw()" placeholder="비밀번호 입력해주세요." style="font: icon;"required="required" />
                    <span class="result3"></span>
                </label>
           </div>
           <div class="row">
           	 	<input type="submit" value="회원탈퇴" class="submit" onclick="deleteM();">
           </div>
        </form>
        
    </div>
</div>
<!--end of delete form popup-->
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
                  <h1>내 프로필</h1>
                  <br>
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
               <form action="updateM.do" class="password" onsubmit="return false;">
                  <h1>비밀번호 변경</h1>
                  <br>                  
                  <div class="row">
                     <div class="col-md-6 form-it">
                        <label>현재 비밀번호</label>
                        <input type="text" id="mpw0" placeholder="**********" onchange="checkPw1()">
                        <span class="result1"></span>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6 form-it">
                        <label>새 비밀번호</label>
                        <input type="text" id="mpw1" placeholder="***************" onchange="checkPw()">
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6 form-it">
                        <label>새 비밀번호 확인</label>
                        <input type="text" id="mpw2" name="mpw" placeholder="*************** " onchange="checkPw2()">
                     <span class="result2"></span>
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
<script type="text/javascript">
function DeletePw(){
	var mpw = '<%=(String)session.getAttribute("mpw")%>';
	console.log("mpw 값 " + mpw);
	var mpw2 = $("#mpw").val();
	console.log("mpw2 값 " + mpw2);
    if(mpw != mpw2){
		$(".result3").text("비밀번호가 불일치합니다.");
		$(".result3").css("color","red");
	}
    else{
		$(".result3").text("비밀번호가 일치합니다.");
		$(".result3").css("color","blue");
    }
}
function deleteM(){
	   var mid=$("#mid").val();  // id=mid의 value값
	   $.ajax({
	      type: 'GET', 
	      url: 'Email?mid='+mid, 
	      data: {"mid":mid},
	      success: function(result){ // 성공했을 때
	         alert("이용해 주셔서 감사합니다.");
	         console.log("로그1 ["+result+"] succes");
	      },
	      error: function(request, status, error){
	         console.log("code: "+request.status);
	         console.log("message: "+request.responseText);
	         console.log("error: "+error);
	      }
	   });
	}

function checkPw1(){
	var mpw = '<%=(String)session.getAttribute("mpw")%>';
	console.log(mpw);
	var mpw2 = $("#mpw0").val();
    if(mpw != mpw2){
		$(".result1").text("비밀번호가 불일치합니다.");
		$(".result1").css("color","red");
	}
    else{
		$(".result1").text("비밀번호가 일치합니다.");
		$(".result1").css("color","blue");
    }
}
function checkPw2(){
	var mpw1 = $("#mpw1").val();
	var mpw2 = $("#mpw2").val();
	console.log("mpw1" + mpw1);
	console.log("mpw2" + mpw2);

	if(mpw1 != mpw2){
		$(".result2").text("비밀번호가 불일치합니다.");
		$(".result2").css("color","blue");
	}
	else {
		$(".result2").text("비밀번호가 일치합니다.");
		$(".result2").css("color","blue");
	}
}
function checkPw(){
	var mpw = $("#mpw1").val();
	var mpw2 = $("#mpw2").val();
	console.log(mpw1);
	console.log(mpw2);
    var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{5,25}$/;
    if(!pwdCheck.test(mpw1)){
		$(".result2").text("비밀번호는 영문자 + 숫자+ 특수문자 조합으로 5~25자리 사용해야 합니다.");
		$(".result2").css("color","blue");
    }
}
</script>        
</body>
</html>