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
        <form action="loginM.do" method="post">
           <div class="row">
               <label>아이디
                    <input type="text" name="mid" placeholder="아이디" required />
               </label>
           </div>
           
            <div class="row">
               <label>
                    비밀번호
                    <input type="password" name="mpw" placeholder="******" required />
                </label>
            </div>
            <div class="row">
               <div class="remember">
               <div>
                  <input type="checkbox" name="remember" value="Remember me"><span>로그인 상태 유지</span>
               </div>
                 <a class="nav-link" href="#" data-toggle="modal" data-target="#login">비밀번호찾기</a>
               </div>
            </div>
           <div class="row">
               <!-- <button class="submit">로그인</button> -->
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
                    <input type="text" name="mid" id="mid" placeholder="회원아이디 입력" required="required" />
                    <input type="button" value="아이디 체크" onclick="check();">
                    <div class="result1"></div>
                <br>
              
                    휴대폰번호
                    <input type="tel" name="phoneNumber" id="phoneNumber" placeholder="01012345678" required="required" />
                    <input type="button" value="임시 비밀번호 발급" onclick="sms();"id="btu">
              	</form>
                    <div id="result"></div>
<script type="text/javascript">
document.getElementById("btu").disabled=true;
function check(){
	   var mid=$("#mid").val(); // id=mid의 value값
	   $.ajax({
	      type: 'GET', //어떤 방식으로 보낼지 "get, post"
	      url: 'check?mid='+mid, //어떤 요청을 하는지 -> mid라는 변수만들어서 사용자가 입력한 값을 확보한 상태 > DB한테 물어볼 예정 "mid라는 값이 DB에 이미 있어?" => DAO(M)로 가야함 > 이제 C가(서블릿) 작업을 할 차례구나! 
	      data: {mid:mid},
	      success: function(result){ // 성공했을 때
	         // result 는 String
	         // JS-1 : 모든데이터가 객체
	         // JS-2 : 동적타이핑 지원
	         console.log("로그1 ["+result+"] succes");
	         if(result==1){ // 중복이 아님, 사용가능
	            $(".result1").text("가입된 회원이 아닙니다.");
	            $(".result1").css("color","red");
	            document.getElementById("btu").disabled=true;
	            console.log("로그2 ["+result+"] succes");
	         }else{ // 중복, 사용불가
	            $(".result1").text("가입시 휴대전화번호 입력해주세요.");
	            $(".result1").css("color","blue");
	            console.log("로그3 ["+result+"] succes");
	            document.getElementById("btu").disabled=false;
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
                     <a href="communityMain.do">
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
         callbackUrl: "http://localhost:8088/teamproject/main.jsp", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
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
                scope: 'account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account)
                        }
                    });
                    window.location.href='main.jsp' //리다이렉트 되는 코드
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
        
        window.Kakao.init('6e89f814e92b8d171dd5a1fa9be630e9');
        
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
<!-- 문자 api -->
<script type="text/javascript">

	function sms(){
		var phoneNumber = $("#phoneNumber").val();
		
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/Sms',
			data:{phoneNumber:phoneNumber},
			success: function(result){
				console.log("글을써");
				$("#result").text("임시 비밀번호 발급이 완료되었습니다.");
				$("#result").css("color","blue");
			},
			error: function(request, status, error){ // 요청 보낸 곳(서블릿)에서 에러가 발생할 시 실행
				console.log("code: "+request.status);
				console.log("message: "+request.responseText);
				console.log("error: "+error);
			}
			
		});
	}
</script>