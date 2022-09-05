<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="crossorigin="anonymous">
</script> <!-- jQuery 안에 ajax가 있으므로 CDN방식으로 jQuery 사용 -->

<!--preloading-->
<div id="preloader">
    <img class="logo" src="images/logo1.png" alt="" width="119" height="58">
    <div id="status">
        <span></span>
        <span></span>
    </div>
</div>
<!--end of preloading-->
<!--login form popup-->
<div class="login-wrapper" id="login-content">
    <div class="login-content">
        <a href="#" class="close">x</a>
        <h3>로그인</h3>
        <form action="loginM.do" method="post" id="login">
           <div class="row">
               <label>아이디
                    <input type="text" name="mid" placeholder="아이디" id="mid" required />
               </label>
           </div>
           
            <div class="row">
               <label>
                    비밀번호
                    <input type="password" name="mpw" placeholder="******" id="mpw" required />
                </label>
            </div>
            <div class="row">
               <div class="remember">
               <div>
               </div>
                 <a class="nav-link" href="#" data-toggle="modal" data-target="#login">비밀번호찾기</a>
               </div>
            </div>
           <div class="row">
				<input type="submit" value="로그인">
           </div>
        </form>
        <div class="row">
           <p>간편하게 SNS 로그인</p>
            <div class="social-btn-2">
               <a href="javascript:kakaoLogin();"><img src="images/kakao.png" alt="카카오 로그인"/></a>
            <a id="naverIdLogin_loginButton" href="javascript:void(0)"><img src="images/naver.png" alt="네이버 로그인"/></a>
            </div>
        </div>
    </div>
</div>
<!-- 비밀번호 찾기 -->
<div class="modal" id="login">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">비밀번호 찾기</h4>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
           		<div class="row">
               <form>
                    아이디
                    <input type="text" name="mid" id="mid" placeholder="아이디 입력" required="required" />
                    <input type="button" value="아이디 체크" onclick="sms();">
                    <div class="result1"></div>
                    </form>





                    
               
         	 	 </div>
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
		      </div>
		
		    </div>
		  </div>
		</div>

<!--end of login form popup-->
<!-- BEGIN | Header -->
<header class="ht-header">
   <div class="container">
      <nav class="navbar navbar-default navbar-custom">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header logo">
                <div class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                   <span class="sr-only">Toggle navigation</span>
                   <div id="nav-icon1">
                     <span></span>
                     <span></span>
                     <span></span>
                  </div>
                </div>
                <a href="main.do"><img class="logo" src="images/logo1.png" alt="" width="119" height="58"></a>
             </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse flex-parent" id="bs-example-navbar-collapse-1">
               <ul class="nav navbar-nav flex-child-menu menu-left">
                  <li class="hidden">
                     <a href="#page-top"></a>
                  </li>
                  
                  <li class="dropdown first">
                     <a href="novelMain.do">
                     소설
                     </a>
                  </li>
                  <li class="dropdown first">
                     <a href="community.do">
                     커뮤니티
                     </a>
                  </li>
               </ul>
               <ul class="nav navbar-nav flex-child-menu menu-right">
               <c:choose>
                  <c:when test="${member.role eq 'admin'}">
                     <li><a href="admin.do">관리자모드</a></li>
                     <li><a href="logoutM.do">로그아웃</a></li>
                  </c:when>
                  <c:when test="${member.mid!=null}">
                     <li><a href="mypage.do">마이페이지</a></li>
                     <li><a href="logoutM.do">로그아웃</a></li>
                  </c:when>
                  <c:otherwise>
                     <li class="loginLink"><a href="#">로그인</a></li>
                     <li class="btn"><a href="signUp.jsp">회원가입</a></li>
                  </c:otherwise>
               </c:choose>
                  
               </ul>
            </div>
         <!-- /.navbar-collapse -->
       </nav>
   </div>
</header>
<br>
<br>
<br>
<br>
<br>
<br>
<!-- END | Header -->

<!-- 네이버 스크립트 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<script>

var naverLogin = new naver.LoginWithNaverId(
      {
         clientId: "hLQzHJecbMviikbiJiSo", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
         callbackUrl: "http://localhost:8088/bbday/main.jsp", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
         isPopup: false,
         callbackHandle: true
      }
   );   

naverLogin.init();

window.addEventListener('load', function () {
   naverLogin.getLoginStatus(function (status) {
      if (status) {
         var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
          
         console.log(naverLogin.user); 
          
         if(email != null){
             var form=document.forms['login'];
             $('#mid').val(email);
             form.action = "naverlogin.do";
             form.submit();
             
          }
            if( email == undefined || email == null) {
            alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
            naverLogin.reprompt();
            return;
         }
      } else {
         console.log("callback 처리에 실패하였습니다.");
      }
   });
});


var testPopUp;
function openPopUp() { // 팝업이 나옴
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){ // 그 후 팝업 종료
    testPopUp.close();
}

function naverLogout() { // 로그아웃시 팝업 등장했다 사라짐
   openPopUp();
   setTimeout(function() {
      closePopUp();
      }, 1000);
}
</script>
<!-- 네이버 스크립트 종료-->
<!-- 카카오 스크립트 시작 -->
   <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        window.Kakao.init('6e89f814e92b8d171dd5a1fa9be630e9');

        function kakaoLogin() {
            window.Kakao.Auth.login({
//                 scope: 'account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                      Kakao.API.request({
                           url : '/v2/user/me',
                           success : function(response) {
                        	   
                               var email=response.kakao_account.email;
                               var name=response.kakao_account.profile.nickname;
                               console.log(response)
                               console.log('이메일:'+response.kakao_account.email);
                               console.log('닉네임:'+response.kakao_account.profile.nickname);
//                                location.href="login.do?amid="+email;

                               if(email!=null){
                                   var form=document.forms['login'];
                                   $('#mid').val(email);
                                   $('#mpw').val(name);
                                   form.action="kakaologin.do";
                                   form.submit();
                                }
                               
                           },
                           fail : function(error) {
                               console.log(error)
                           },
                       })
                   },

                fail: function(error) {
                    console.log(error);
                }
            });
        }
        
   //     window.Kakao.init('6e89f814e92b8d171dd5a1fa9be630e9');
        
       function kakaoLogout() {
           if (!Kakao.Auth.getAccessToken()) {
              console.log('Not logged in.');
              return;
           }
           Kakao.Auth.logout(function(response) {
              alert(response +' logout');
              window.location.href='main.jsp'
           });
    };
    
    function secession() {
       Kakao.API.request({
           url: '/v1/user/unlink',
           success: function(response) {
              console.log(response);
              //callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
              window.location.href='main.jsp'
           },
           fail: function(error) {
              console.log('탈퇴 미완료')
              console.log(error);
           },
       });
    };
    </script>
<!-- 카카오 스크립트 종료 -->
<!-- 문자 API -->
<script type="text/javascript">
function sms(){
	   var mid=$("#mid").val(); // id=mid의 value값
	   $.ajax({
	      type: 'GET', 
	      url: 'Sms?mid='+mid, //사용자가 입력한 값을 확보한 상태 > DB한테 물어볼 예정 "mid라는 값이 DB에 이미 있어?" => DAO(M)로 가야함 > 이제 C가(서블릿) 작업을 할 차례구나! 
	      data: {"mid":mid},
	      success: function(result){ // 성공했을 때
	         
	         console.log("로그1 ["+result+"] succes");
	         if(result==0){ // 가입된회원
	        
		         $(".result1").text("가입된 휴대전화로 임시비밀번호 전송되었습니다.");
		            $(".result1").css("color","blue");
		            
		            document.getElementById("btu").disabled=true;
		            console.log("로그2 ["+result+"] succes");
	         }else{ // 중복, 사용불가
	        	 $(".result1").text("가입된 회원이 아닙니다.");
		         $(".result1").css("color","red");
		       //  $(".result2").val(result);
		         
		         console.log("로그3 ["+result+"] succes");
		            //document.getElementById("btu").disabled=false;            
	         }
	      },
	      error: function(request, status, error){
	         console.log("code: "+request.status);
	         console.log("message: "+request.responseText);
	         console.log("error: "+error);
	      }
	   });
	}

</script> 

<script type="text/javascript">
if(${logoutValue}==100){

    // deleteCookie(변수이름)
//        deleteCookie('nid_inf');
//        deleteCookie('NID_AUT');
//        deleteCookie('NID_SES');
//        deleteCookie('NID_JKL');
       
//         deleteCookie('nx_ssl');
//         deleteCookie('NNB');
//         deleteCookie('nid_slevel');
//         deleteCookie('ASID');
//         deleteCookie('nid_buk');
//        deleteCookie('JSESSIONID');
       
//     기타 사이트 데이터 제거
//     쿠키라는 쿠키는 다 삭제했지만 삭제가 안됐음
      window.localStorage.clear();
       ${logoutValue=99};
 }
</script>              