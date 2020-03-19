<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>로그인 화면</title>
   
  </head>
  <style>
  
  
  .container{
  
     width:500px;
     height:400px;
     text-align:center;
     margin:0 auto;
     margin-top:130px;
  
  }
  input[type="text"],input[type="pwd"]{
  
     height:25px;
     width:250px;
     font-size:18px;
     margin-bottom:20px;
     background-color:#ffffff;
     padding-left:20px;
  }
  
  
  .logbutton{
     
     
     border-radius:20px
     border:none;
     border-bottom:4px solid #23ae60;
     margin-top:30px;
  }
  
  
  </style>
  <script>
     $( function() {
       $( "#birthday" ).datepicker( {
         changeMonth: true,
         changeYear: true
       } );
     } );
 
  function fn_memberSubmit() {
     /* 데이터 유효성 체크    */
     var f = document.frm;
     if(f.userid.value == "") {
        alert("아이디를 입력해주세요.");
        return false;
     }
     if(f.pass.value == "") {
        alert("패스워드를 입력해주세요.");
        return false;
     }
     f.submit();
  }
  </script>
  
  <body>
     <div class="container">
  
        
   <form name="frm" method="post" action="loginSub.jsp">
   <div class="inputForm">
   <input type="text" name="userid" placeholder="아이디를 입력하세요.">
   
      </div>
   <div class="inpuutForm">
   <input type="pwd" name="pwd" placeholder="비밀번호를 입력하세요.">
   
      </div>
   <tr>
      <th class="logbutton">
         <input type="submit"  value="로그인" 
               onclick="fn_memberSubmit(); return false;">
         <input type="reset"value="취소" onclick="home.jsp">
      </th>
   </tr>
</form>
      </div>
     
  </body>
</html>