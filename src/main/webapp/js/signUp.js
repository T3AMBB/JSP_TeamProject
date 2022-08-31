/**
 *  sign-up java script
 */
 
   
   function joinFormCheck(){
      var id = document.getElementById("signup_form_id");
      var pw = document.getElementById("signup_form_password");
      var pw_re = document.getElementById("signup_form_password_re");
      var name = document.getElementById("signup_form_Name");
      var Nickname = document.getElementById("signup_form_Nickname");
      var phone = document.getElementById("signup_form_phoneNumber");
      var email = document.getElementById("signup-form-email");
      

      if(id.value == ""){
         alert("아이디를 입력하세요.");
         id.focus();
         return false;
      }
      if(id.value.indexOf(" ") >= 0){
         alert("아이디에 공백을 사용할 수 없습니다.");
         id.focus();
         return false;
      }
      if(id.value.length < 5){
         alert("아이디를 다섯자 이상 입력해주세요.");
         id.focus();
         return false;
      }
      
      if(pw.value==""){
         alert("비밀번호를 입력하세요.");
         pw.focus();
         return false;
      }
      if(pw.value.indexOf(" ") >= 0){
         alert("비밀번호에 공백을 사용할 수 없습니다.");
         pw.focus();
         return false;
      }
      if(pw_re.value==""){
         alert("비밀번호 재입력을 입력하세요.");
         pw_re.focus();
         return false;
      }
      if(pw_re.value.indexOf(" ") >= 0){
         alert("비밀번호에 공백을 사용할 수 없습니다.");
         pw_re.focus();
         return false;
      }
      // 비밀번호 영문자+숫자+특수조합(5~25자리 입력) 정규식
      var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{5,25}$/;
      
      if(!pwdCheck.test(pw.value)){
         alert("비밀번호는 영문자 + 숫자+ 특수문자 조합으로 5~25자리 사용해야 합니다.");
         pw.focus();
         return false;
      }
      if(pw.value!=pw_re.value){
         alert("비밀번호가 불일치합니다.");
         pw_re.focus();
         return false;
      }
      if(name.value==""){
         alert("이름을 입력하세요.");
         name.focus();
         return false;
      }
      if(name.value.indexOf(" ") >= 0){
         alert("이름에 공백을 사용할 수 없습니다.");
         name.focus();
         return false;
      }
      if(name.value==""){
         alert("별명을 입력하세요.");
         name.focus();
         return false;
      }
      if(name.value.indexOf(" ") >= 0){
         alert("별명에 공백을 사용할 수 없습니다.");
         name.focus();
         return false;
      }
      
      if(phone.value==""){
         alert("휴대전화 번호를 입력하세요.");
         phone.focus();
         return false;
      }
      
       var regPhone = /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/;
       if (regPhone.test(phone.value) === false) {
         alert("휴대폰 번호 형식이 올바르지 않습니다.");
         phone.focus();
         return false;
        }

      // 이메일 정규식
      if(email.value==""){
         alert("이메일 주소를 입력하세요.");
         email.focus();
         return false;
      }

      
      var regExp = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
      if(regExp.test(email.value)===false){
         alert("이메일 형식이 올바르지 않습니다.");
         email.focus();
         return false;
      }

      alert("회원가입이 완료되었습니다.");

      document.regForm.submit();
      
   }

   
   // 이메일 api
   $("document").ready(function() {
        emailjs.init('ZG_RClGCYX4SAIQrc');
       
        // 괄호 부분이 공개키 ... 이 부분은 사용자마다 다르니 확인 필요
        $('button[name=sub]').click(function(){           
          var templateParams = {   
          //각 요소는 emailJS에서 설정한 템플릿과 동일한 명으로 작성!
                name : $('input[name=Name]').val(),
                email : $('input[name=email]').val(),
                       };
         emailjs.send('arimjeong', 'template_k5uiutb', templateParams)
         //emailjs.send('service ID', 'template ID', 보낼 내용이 담긴 객체)
                .then(function(response) {
                   console.log('SUCCESS!', response.status, response.text);
                }, function(error) {
                   console.log('FAILED...', error);
                });
        });
     });
