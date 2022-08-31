function check(){
   var mid=$("#signup_form_id").val(); // id=mid의 value값
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
            $(".result").text("사용 가능한 아이디입니다!");
            $(".result").css("color","blue");
            console.log("로그2 ["+result+"] succes");
         }else{ // 중복, 사용불가
            $(".result").text("이미 존재하는 아이디입니다!");
            $(".result").css("color","red");
            console.log("로그3 ["+result+"] succes");
         }
      },
      error: function(request, status, error){
         console.log("code: "+request.status);
         console.log("message: "+request.responseText);
         console.log("error: "+error);
      }
   });
}