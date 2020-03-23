<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%
    String sessionUserid = (String) session.getAttribute("sessionUserid");
    String adminConfirm = (String) session.getAttribute("adminConfirm");
       //set
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 홈</title>

</head>
<style>

</style>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



<body> 



  <header style="background-color:#2d3246;height:100px;width:1920px;">
   <div style="float:left;margin-left:100px;">
      <img style="width:250px;height:90px;" src="../images/logo.JPG">
   </div>
   <br>
   <br>
   <div id="hdiv" style="margin-right:100px;">
   <div class="menubar">
   <ul>
      <li><a href="home.jsp">홈</a></li>
      <li><a href="#">대리점</a>
      <ul>
         
           <li><a href="#">대리점찾기</a></li>
           <li><a href="#">온라인구매</a></li>
           <li><a href="#">대량구매</a></li>
           
         </ul>
      <li><a href="#">커뮤니티</a>
      <li><a href="#">회사소개</a>
      <li><a href="login.jsp">로그인</a>
      <li><a href="memberWrite.jsp">회원가입</a>
      
      </li>
     
   </ul>
</div>

</header>

<div class="tabmenu">
  <ul>
    <li id="tab1" class="btnCon"><a class="btn first" href="#tab1">프리미엄 스토어</a>
      <div class="tabCon" >1</div></li>


<li id="tab2" class="btnCon"><a class="btn" href="#tab2">전기자전거 서비스지정점</a>
      <div class="tabCon" >234</div>
      
    </li> 
    
    <li id="tab3" class="btnCon"><a class="btn" href="#tab3">서비스지정점</a>
      <div class="tabCon" >789</div>
      
    </li>
    
    <li id="tab4" class="btnCon"><a class="btn" href="#tab4">전기자전거취급점</a>
      <div class="tabCon" >456</div>
      
    </li>
</ul>
</div>
</div>








<br>
<br>
<br>
<br>

<br>
<br>
<br>
<br>
<br>
<br>
<br>

<footer class="section footer-classic context-dark bg-image" style="background: #aabacc;">
        <div class="container">
          <div class="row row-30">
            <div class="col-md-4 col-xl-5">
              <div class="pr-xl-4"><a class="brand" href="index.html"><img class="brand-logo-light" src="images/agency/logo-inverse-140x37.png" alt="" width="140" height="37" srcset="images/agency/logo-retina-inverse-280x74.png 2x"></a>
                <p>We are an award-winning creative agency, dedicated to the best result in web design, promotion, business consulting, and marketing.</p>
                <!-- Rights-->
                <p class="rights"><span>©  </span><span class="copyright-year">2018</span><span> </span><span>Waves</span><span>. </span><span>All Rights Reserved.</span></p>
              </div>
            </div>
            <div class="col-md-4">
              <h5>Contacts</h5>
              <dl class="contact-list">
                <dt>Address:</dt>
                <dd>798 South Park Avenue, Jaipur, Raj</dd>
              </dl>
              <dl class="contact-list">
                <dt>email:</dt>
                <dd><a href="mailto:#">dkstudioin@gmail.com</a></dd>
              </dl>
              <dl class="contact-list">
                <dt>phones:</dt>
                <dd><a href="tel:#">https://karosearch.com</a> <span>or</span> <a href="tel:#">https://karosearch.com</a>
                </dd>
              </dl>
            </div>
            <div class="col-md-4 col-xl-3">
              <h5>Links</h5>
              <ul class="nav-list">
                <li><a href="#">About</a></li>
                <li><a href="#">Projects</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Contacts</a></li>
                <li><a href="#">Pricing</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="row no-gutters social-container">
          <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-facebook"></span><span>Facebook</span></a></div>
          <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-instagram"></span><span>instagram</span></a></div>
          <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-twitter"></span><span>twitter</span></a></div>
          <div class="col"><a class="social-inner" href="#"><span class="icon mdi mdi-youtube-play"></span><span>google</span></a></div>
        </div>
      </footer>
   
</body>
</html>