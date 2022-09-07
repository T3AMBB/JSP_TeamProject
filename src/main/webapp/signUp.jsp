<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb" %>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
   <title>회원가입</title>
   <!-- Basic need -->
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
   <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="crossorigin="anonymous">
</script> 
</head>
<body>
<!-- header section-->
<bb:header/>
<!-- end of header section-->

<div class="buster-light">
   <div class="page-single">
      <div class="container">
            <form action="insertM.do" id="form-style-123" name="regForm" style="display:inline-block; text-align:center;">
                     <div class="row">
                  <h2>&nbsp;&nbsp;&nbsp;&nbsp;회원 정보 입력</h2>
                  <hr>
                  <table id="signup-form" style="background-color:#f5f5dc; padding:1%; margin-left:28%; border:1px solid grey; border-radius:0.25rem; width:45%;">
                  <colgroup>
                  <col style="width:25%;">
                  <col style="width:75%;">
                  </colgroup>
               
                  <tbody style="border:0px solid black;">
                     <tr>
                        <th style="border-right: none;">아이디</th>
                        <td style="border-right: none; ">
                           <input type="text" name="mid" id="signup_form_id" maxlength="15" onchange="check();" placeholder="아이디를 입력해주세요."required="required" />               
                  		<span class="result"></span>
                  </td>
                     </tr>
                     <tr>
                        <th style="border-right: none;">비밀번호</th>
                        <td style="border-right: none; ">
                          <input type="password" name="mpw" id="signup_form_password" onchange="checkPw()" maxlength="25" placeholder="영문, 숫자, 특수문자 5~25자리" style="font: icon;"  required="required" />
                          <span class="result1"></span>
                  </td>
                     </tr>
                    <tr>
                        <th style="border-right: none;">비밀번호확인</th>
                    <td style="border-right: none; ">
                        <input type="password" id="signup_form_password_re" onchange="checkPw2()" maxlength="25" placeholder="비밀번호 재입력" required="required" style="font: icon;"/>
	                    <span class="result2"></span>
				</td>
                     </tr>
                     <tr>
                        <th style="border-right: none;">이름</th>
                     <td style="border-right: none; ">                            
                        <input type="text" name="mname" id="signup_form_Name" maxlength="15" placeholder="이름을 입력해주세요." required="required" />
               </td>
                     </tr>
                     <tr>
                        <th style="border-right: none;">별명</th>
                     <td style="border-right: none; ">
                   <input type="text" name="nickname" id="signup_form_Nickname" maxlength="15" placeholder="사용하실 별명을 입력해주세요." required="required" />
                </td>
                     </tr>                 
                     <tr>
                        <th style="border-right: none;">휴대폰 번호</th>
                        <td style="border-right: none; ">                           
                           <input type="text" name="mphone" id="signup_form_phoneNumber" placeholder="010XXXXXXX"  required="required" />
                  </td>
                     </tr>
                     <tr>
                        <th style="border-right: none; border-bottom: none;">이메일</th>
                       <td style="border-right: none; border-bottom: none;">                           
                       <input type="email" name="memail" id="signup-form-email" placeholder="아이디@메일주소" required="required" />
                  </td>
                     </tr>                  
                  </tbody>
                  </table>
                  <div style="margin-right:45%; float:right;">
                           <input type="button" class="submit" value="가입 완료하기"  onclick="joinFormCheck()">
                        </div>
                        </div>
                        
                        </form>
                
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
<script src="js/signUp.js"></script>
<script type="text/javascript" src="./js/check.js" ></script> 
<script type="text/javascript">
function checkPw(){
	var mpw = $("#signup_form_password").val();
	var mpw2 = $("#signup_form_password_re").val();
	console.log(mpw);
	console.log(mpw2);
    var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{5,25}$/;
    if(!pwdCheck.test(mpw)){
		$(".result1").text("비밀번호는 영문자 + 숫자+ 특수문자 조합으로 5~25자리 사용해야 합니다.");
		$(".result1").css("color","red");
    }
    else {
		$(".result1").text("비밀번호 형식이 올바릅니다.");
		$(".result1").css("color","blue");
    }
}
function checkPw2(){
	var mpw = $("#signup_form_password").val();
	var mpw2 = $("#signup_form_password_re").val();
    if(mpw != mpw2){
		$(".result2").text("비밀번호가 불일치합니다.");
		$(".result2").css("color","red");
	}
	else{
		$(".result2").text("비밀번호가 일치합니다.");
		$(".result2").css("color","blue");
	}
}
</script>
</body>
</html>