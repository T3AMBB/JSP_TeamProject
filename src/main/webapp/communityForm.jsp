<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="bb" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
   <!-- Basic need -->
   <title>커뮤니티 작성페이지</title>
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
<script src="https://cdn.ckeditor.com/ckeditor5/35.0.1/super-build/ckeditor.js"></script>
<style>
  .ck-editor__editable { height: 500px; }
</style>
</head>
<body>
<!-- header section-->
<bb:header/>
<!-- end of header section-->

<div class="buster-light">
  
   <div class="page-single">
      <div class="container">
      <div style="margin:2%; margin-left:0%;">
      <h2>커뮤니티 글 작성하기</h2>
      <div style="margin-top:1%;">음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민, 형사상의 책임을 질 수 있습니다. </div>
      </div>
                <form method="post" enctype="multipart/form-data" name="boardForm">
            <input type="text" name="btitle" placeholder="제목을 입력해주세요" style="margin-bottom:1%;">
              <textarea name="bcontent" id="editor" placeholder="내용을 입력해주세요" style="height: 500px; margin-bottom:1%;"></textarea>
             <input type="file" name="bimg" placeholder="이미지파일 업로드" onchange="loadFile(this)" >
             <img alt="미리보기" id="preview" style="margint-top:1%;"/>
              
              <input type="submit" value="작성 완료" onclick="Chk();"style="float:right; margin-top:0.5%; color:black; background-color:gold; border:none; border-radius:1rem; width:94px; padding:3px;">
         </form>
              </div>
            </div>
         </div>
      <script type="text/javascript">
   function loadFile(input){
      // 여러개의 이미지를 읽을수도 있기 때문에 
      if(input.files && input.files[0]){
         var fr = new FileReader();
         //파일리더로 일고 읽는게 완료되면  만들어준 아이디에 속성값을 지정하여 사용하겠다.
         fr.onload=function(event){
            document.getElementById('preview').src=event.target.result;
         };
         fr.readAsDataURL(input.files[0]);
         // 이미지파일을 읽어 온다.
      }
      else{
         document.getElementById('preview').src="";
      }
   }
</script>
<script type="text/javascript">
   function Chk() {
      var form = document.boardForm;
      if (!form.btitle.value) {
         alert("제목을 입력해주세요.");
         form.btitle.focus();
         return;
      }
      if (!form.editor.value) {
         alert("내용을 입력해주세요.");
         form.editor.focus();
         return;
      }
      form.action = "InsertB";
      form.submit();
   }
</script>
<!-- footer section-->
<bb:footer/>
<!-- end of footer section-->
<script src="js/jquery.js"></script>
<script src="js/plugins.js"></script>
<script src="js/plugins2.js"></script>
<script src="js/custom.js"></script>
</body>
</html>