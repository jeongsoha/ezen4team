<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon2.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>

<%

String userid1 = (String) session.getAttribute("sessionUserid"); 

   String sql = " select b.* from ( "
             + "    select rownum rn, a.* from( "
            + " select bunq,title" 
            + " from pboard where pub='1' and gubun='1' "
            + " order by bunq desc ) a ) b "
                  + " where rn <= 5 ";
   ResultSet rs = stmt.executeQuery(sql);
   
   String sql2 = " select d.* from ( "
           + "    select rownum rn, c.* from( "
           + " select bunq,title " 
           + " from pboard where gubun='2' "
           + " order by bunq desc ) c ) d "
           + " where rn <= 5 " ;
   
   ResultSet rs2 = stmt2.executeQuery(sql2);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 홈</title>
</head>

<link rel="stylesheet" href="../css/bootstrap.min.css">

<style>

* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
   clear:both;
  max-width: 1920px;
  max-height: 600px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}

/* --------- */
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
   border-radius: 12px;
   width:120px;
   height:50px;
   float:right;
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
.d{
   float:left;
}
.d1{
   clear:both;
   width:1920px;
     height:600px;
     text-align:center;
}
.d2{
   width:500px;
     height:295px;
     text-align:center;
     /* background-color : #E8D9FF; */
}
.d3{
   width:500px;
     height:295px;
     text-align:center;
    /* background-color : #ECADFF; */
}
.d4{
   clear:both;
   width:1000px;
   height:305px;
     text-align:center;
     background-color : #f7fff7;
}
.detail {
   margin-left:460px;
     width:1010px;             //1006
     height:610px;             //906
     text-align:center;
  }





</style>



<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>

/* ------js------- */
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
   showSlides(slideIndex += n);
}

function currentSlide(n) {
   showSlides(slideIndex = n);
}

function showSlides(n) {
   var i;
   var slides = document.getElementsByClassName("mySlides");
   var dots = document.getElementsByClassName("dot");
   if(n > slides.length) {slideIndex=1}
   if(n < 1){slideIndex = slides.length}
   for(i=0;i<slides.length; i++){
      slides[i].style.display = "none";
   }
   for(i=0;i<dots.length; i++){
      dots[i].className = dots[i].className.replace(" active", "");
   }
   slides[slideIndex-1].style.display = "block";
   dots[slideIndex-1].className += " active";

}
</script>


<body> 


<%@ include file = "../include/header.jsp" %>

<section>


<!-- -------------------111 -->
<div class="d d1 slideshow-container">

<div class="mySlides fade">
   <div class="numbertext"> 1 / 3 </div>
   <img src="../images/bicycle1.JPG" style="width:1920px; height:600px;">
   <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
   <div class="numbertext"> 2 / 3 </div>
   <img src="../images/bicycle2.JPG" style=" width:1920px; height:600px;">
   <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
   <div class="numbertext"> 3 / 3 </div>
   <img src = "../images/bicycle3.JPG" style=" width:1920px; height:600px;">
   <div class="text">Caption Three</div>
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(-1)">&#10095;</a>


<br>

<div style="text-align:center">
   <span class="dot" onclick="currentSlide(1)"></span>
   <span class="dot" onclick="currentSlide(2)"></span>
   <span class="dot" onclick="currentSlide(3)"></span>
</div>
</div>

<!-- ------- -->
<!-- <div class="d d1" >
   <img src = "../images/11.JPG" width="332" height="300"><img src = "../images/12.JPG" width="332" height="300"><img src = "../images/13.JPG" width="332" height="300">
</div>   -->


<div class="detail">
   
   
<!-- -------------------222 -->

<div class="d d2">
<table align="center" style="width:500px;" class="table table-striped">
   <thead>
      <tr align="center">
         <th width="15%" scope="col"></th>
         <th width="85%" scope="col">공지사항</th>
      </tr>
   </thead>
   <%
      int number=1;
      while(rs.next()){
         String bunq = rs.getString("bunq");
         String title = rs.getString("title");
   %>
   <tr align="center">
      <td scope="row"><%=bunq %></td>
      <td style="text-align:left;">
   <%
   if(userid1 == null || "".equals(userid1)) {
   %>
      <a href="../member/login.jsp"><%=title %></a>
      <script>
      //alert("로그인을 해주세요!"");
      </script>
   <%   
   } else{
   %>   
      <a href="../nboard/nBoardDetail.jsp?bunq=<%=bunq%>"><%=title %></a></td>
   </tr>
   <%
      }
      number++;
   }
   %>
</table>
      
      
   
   </div>

<!-- -------------------333 -->

   <div class="d d3">
      <table align="center" style="width:500px;" class="table table-striped table-dark">
         <thead>
               <tr align="center">
                  <th width="15%" scope="col"></th>
                  <th width="85%" scope="col">자유게시판</th>
            </tr>
         </thead>
      <%
              int number2 = 1;
              while(rs2.next()){
                 String bunq = rs2.getString("bunq");
                 String title = rs2.getString("title");
      %>
         <tr align="center">
            <td scope="row"><%=bunq %></td>
            <td style="text-align:left;">
        <%
           if(userid1 == null || "".equals(userid1)){
        %>
              <a href="../member/login.jsp"><%=title %></a>
              <script>
              //alert("로그인을 해주세요!");
              </script>
        <%
           }else{
        %>
                 <a href="../fboard/fBoardDetail.jsp?bunq=<%=bunq%>"><%=title %></a></td>
               </tr>
      <%      
           }
              number2++;
              }      
              %>
          </table>  
   </div>

<!-- -------------------444 -->

   <div class="d d4" >
   <br><br>
      <p> 우리회사 상품 </p>
   </div>
   
<!-- -------------------- -->

</div>
</section>

<%@ include file = "../include/footer.jsp" %> 
   
</body>
</html>