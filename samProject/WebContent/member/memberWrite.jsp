<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
    <%@ include file="../include/dbcon2.jsp" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<style>
/* #5483b1 */
#hbutton {
   border-top-right-radius:5px; 
   border-bottom-right-radius:5px; 
   margin-left:-3px;

}

#hdiv button {
   border:1px solid #5483b1;
   background-color: rgba(0,0,0,0);
   color:#5483b1;
   padding:5px;
   border-radius: 7px; //
   width:70px;  //
   height:50px;
   float:left;
   margin-left:10px;
   
}

#hdiv button:hover{
   color:white; 
   background-color:#5483b1; 
}

.hdiv1 {
   
}

.context-dark, .bg-gray-dark, .bg-primary {
    color: rgba(255, 255, 255, 0.8);
}

.footer-classic a, .footer-classic a:focus, .footer-classic a:active {
    color: #ffffff;
}
.nav-list li {
    padding-top: 5px;
    padding-bottom: 5px;
}

.nav-list li a:hover:before {
    margin-left: 0;
    opacity: 1;
    visibility: visible;
}

ul, ol {
    list-style: none;
    padding: 0;
    margin: 0;
}

.social-inner {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    padding: 23px;
    font: 900 13px/1 "Lato", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    text-transform: uppercase;
    color: rgba(255, 255, 255, 0.5);
}
.social-container .col {
    border: 1px solid rgba(255, 255, 255, 0.1);
}
.nav-list li a:before {
    content: "\f14f";
    font: 400 21px/1 "Material Design Icons";
    color: #4d6de6;
    display: inline-block;
    vertical-align: baseline;
    margin-left: -28px;
    margin-right: 7px;
    opacity: 0;
    visibility: hidden;
    transition: .22s ease;
}

.mtd {
height:30px;
}

.textBox1 {
height:40px;
width:100%;
}


</style>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>

	function fn_memberSubmit(){
		//(notnull)데이터유효성체크
		var f = document.frm;
 		if( f.userid.value=="" ){
 			alert("아이디를 입력해주세요.");
 			f.userid.focus();
 			return false;
 		}
 		if( f.pwd.value==""){
 			alert("비밀번호를 입력해주세요.");
 			f.pwd.focus(); //커서자동클릭
 			return false;
 		}
 		if( f.username.value==""){
 			alert("이름을 입력해주세요."); 
 			f.username.focus(); //커서자동클릭
 			return false;
 		}
 		if(f.birthday.value=="" ){
 			alert("생일을 선택해주세요.");
 			f.birthday.focus();s
 			return false;
 		}
		f.submit();
	}
	
	function fn_popup(){
		var id=document.frm.userid.value;
		if( id == "" ){
 			alert("아이디를 입력해주세요.");
 			document.frm.userid.focus();
 			return false;
 		}
		var url="idcheck.jsp?userid="+id;
		//window.open('웹주소','별칭','옵션');
		window.open(url,'popup','width=400,height=200');
	}


	
</script>
<body> 
<%@ include file = "../include/header.jsp" %>

<section>



   <form name="frm" method="post" action="memberSave.jsp">
   
      <!--  표 위치를 가운데로 오도록 만듬 / 테이블 범위확인 -->
      <table style="width:450px;" align="center" border="0" bgcolor="#ffffff" > 
         
               <tr>
                <td class="mtd"><input class="textBox1" type="text" name="userid"  placeholder="  아이디를 입력해주세요" >     </td>
               
               </tr>
               <br>
               <tr>
               
                     <th class="mtd" > <input  class="button1" type="button" value="중복확인"  onclick ="fn_popup();" > </th>
              
               </tr>
          
               <tr>
                  <td class="mtd"><input class="textBox1" type="password" name="pwd" placeholder="  비밀번호를 입력해주세요"> </td>
               </tr>
                 <br>
               <tr>
                  <td class="mtd"><input class="textBox1" type="password" name="pwd2" placeholder="  비밀번호를 입력해주세요"> </td>
               </tr>
         
               <tr>
                  <td class="mtd"><input class="textBox1" type="text" name="username" placeholder="  이름을 입력해주세요"></td>
               </tr>
           
               <tr>
                  <td class="mtd">
                  <input style="width:200px;height:40px;" type="text" name="bir_year" placeholder="  생년">
                  <input style="width:80px;height:40px;" type="text" name="bir_month" placeholder="  월">
                  <input style="width:80px;height:40px;" type="text" name="bir_day" placeholder="  일">
                  </td>
               </tr>

               <tr>
                  <td class="mtd">
                  <select style="width:200px;height:40px;"  name="gender" > 
                  <option value="0">&nbsp; 성별 선택  <!-- 참고기능  checked -->
                  <option value="M">&nbsp; 남자 <!-- 참고기능  checked -->
                  <option value="F">&nbsp; 여자 <!-- 참고기능  checked -->
                  </select>
                  </td>
               </tr>
          
               <tr><td class="mtd"><input class="textBox1"  type="email" name="mail" id="mailcheck" placeholder="  이메일을 입력해주세요"> </td>
               </tr>

               <tr>
           
                  </tr><tr><td class="mtd"><input class="textBox1" type="text" name="tel" placeholder="  전화번호를 입력해주세요"></td>
               </tr>
               
                 <tr>
        
                  </tr><tr><td class="mtd"><input style="width:200px;height:40px;" class="textBox1" type="text" name="post" placeholder="  우편번호 "></td>
               </tr>
               
                 <tr>
  
                  </tr><tr><td class="mtd"><input class="textBox1" type="text" name="addr" placeholder="  주소 입력"></td>
               </tr>
               <tr>
                
               </tr>                           
                    <tr>
                  <td class="mtd">
                  <select style="width:200px;height:40px;" name="inter" > 
                  <option value="0">&nbsp; -- 선 택 --   <!-- 이상태로 넘어가면, 미선택 0 으로 세팅-->
                  <option value="1">&nbsp; 자전거 <!-- 참고기능  selected -->
                  <option value="2">&nbsp; 킥보드 <!-- 참고기능  selected -->
                  </select>
                  </td>
               </tr>

     
                  <th class="mtd" >
                  <input style="width:40%;height:40px;"  type="submit" value="가입하기" onclick="fn_memberSubmit(); return false;"> 
                  <input style="width:40%;height:40px;"  type="button" value="재작성" > 
                  
                  </th>
      
            </table>
         </form>




</section>

<%@ include file = "../include/footer.jsp" %> 
   
</body>
</html>