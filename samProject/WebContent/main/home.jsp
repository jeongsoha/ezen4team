<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon2.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
String admin = (String) session.getAttribute("adminConfirm");

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
   width:1920px;
     height:600px;
     text-align:center;
}
.d2{
   width:600px;
     height:395px;
     text-align:center;
     font-size: 23px;
     /* font: 67.5% "맑은고딕"; */
     /* background-color : #E8D9FF; */
}
.d3{
   width:600px;
     height:395px;
     text-align:center;
     font-size: 15px;
    /* background-color : #ECADFF; */
}
.d4{
   clear:both;
   width:1200px;
   height:405px;
     text-align:center;
     background-color : #f7fff7;
}
.detail {
   margin-left:360px;
     width:1210px;             //1006
     height:810px;             //906
     text-align:center;
  }
  .s {
  	font-size:20px;
  	font: "맑은고딕";
  }



</style>



<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



<style>
html,body,div,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,center,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tr,th,td,article,aside,canvas,details,embed,audio,video{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline}
body{line-height:1}
ol,ul{list-style:none}
table{border-collapse:collapse;border-spacing:0}
caption,th,td{text-align:left;font-weight:normal;vertical-align:middle}
q,blockquote{quotes:none}
q:before,q:after,blockquote:before,blockquote:after{content:"";content:none}
a img{border:none}
article{display:block}
body{background:#f0523f;overflow-x:hidden}
h1,h2,h3,h4,h5,h6{font-weight:bold;font-size:16px;margin:12px 0}
span{margin:35px 0 5px;font-size:26px;font-weight:normal;color:#fff}
#slider{text-align:center}
h2{margin:40px 0 25px;border-bottom:1px solid #bbb;padding:0 0 10px}
p{margin:20px 0 16px}
strong{font-weight:bold}
label,a{color:brown;cursor:pointer;text-decoration:none;font-style:italic}
label:hover,a:hover{color:#ddd!important}
*{-moz-box-sizing:border-box;-webkit-box-sizing:border-box;box-sizing:border-box}
label,#active,img{-moz-user-select:none;-webkit-user-select:none}
.catch{display:block;height:0;overflow:hidden}
#slider{margin:0 auto}
input{display:none}
#slide1:checked ~ #slides .inner{margin-left:0}
#slide2:checked ~ #slides .inner{margin-left:-100%}
#slide3:checked ~ #slides .inner{margin-left:-200%}
#slide4:checked ~ #slides .inner{margin-left:-300%}
#slide5:checked ~ #slides .inner{margin-left:-400%}
#container{width:100%;overflow:hidden}
article img{width:100%}
#slides .inner{width:500%;line-height:0}
#slides article{width:20%;float:left}
#commands{margin:-25% 0 0 0;width:100%;height:50px}
#commands label{display:none;width:80px;height:80px;opacity:0.5}
#commands label:hover{opacity:0.8}
#active{position:relative;z-index:5;margin:16% 0 0;text-align:center}
#active label{-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;display:inline-block;width:10px;height:10px;background:#bbb}
#active label:hover{background:#333;border-color:#777!important}
#slide1:checked ~ #commands label:nth-child(2),#slide2:checked ~ #commands label:nth-child(3),#slide3:checked ~ #commands label:nth-child(4),#slide4:checked ~ #commands label:nth-child(5),#slide5:checked ~ #commands label:nth-child(1){background:url('https://0.s3.envato.com/files/84450220/img/next.png') no-repeat;float:right;margin:0 12px 0 0;display:block}
#slide1:checked ~ #commands label:nth-child(5),#slide2:checked ~ #commands label:nth-child(1),#slide3:checked ~ #commands label:nth-child(2),#slide4:checked ~ #commands label:nth-child(3),#slide5:checked ~ #commands label:nth-child(4){background:url('https://0.s3.envato.com/files/84450220/img/previous.png') no-repeat;float:left;margin:0 0 0 -6px;display:block}
#slide1:checked ~ #active label:nth-child(1),#slide2:checked ~ #active label:nth-child(2),#slide3:checked ~ #active label:nth-child(3),#slide4:checked ~ #active label:nth-child(4),#slide5:checked ~ #active label:nth-child(5){background:#000;opacity:0.6;border-color:#fff!important;border:2px solid #fff}
.caption{line-height:20px;margin:0 0 -150%;position:absolute;padding:320px 12px;opacity:0;color:#fff;text-transform:none;font-family:'Open Sans',Arial,Helvetica,sans-serif;text-align:left;font-size:18px}
.caption bar{display:inline-block;padding:10px;background:#000;border-radius:3px 3px 3px 3px;-moz-border-radius:3px 3px 3px 3px;-webkit-border-radius:3px 3px 3px 3px;opacity:0.7;filter:progid:DXImageTransform.Microsoft.Alpha(opacity=70)}
#slides{position:relative;padding:2px;border:1px solid #ddd;margin:45px 0 0;background:#FFF;background:-webkit-linear-gradient(#FFF,#FFF 20%,#EEE 80%,#DDD);background:-moz-linear-gradient(#FFF,#FFF 20%,#EEE 80%,#DDD);background:-ms-linear-gradient(#FFF,#FFF 20%,#EEE 80%,#DDD);background:-o-linear-gradient(#FFF,#FFF 20%,#EEE 80%,#DDD);background:linear-gradient(#FFF,#FFF 20%,#EEE 80%,#DDD);-webkit-border-radius:2px 2px 2px 2px;-moz-border-radius:2px 2px 2px 2px;border-radius:2px 2px 2px 2px;-webkit-box-shadow:0 0 3px rgba(0,0,0,0.2);-moz-box-shadow:0 0 3px rgba(0,0,0,0.2);box-shadow:0 0 3px rgba(0,0,0,0.2)}
#slides .inner{-webkit-transform:translateZ(0);-webkit-transition:all 800ms cubic-bezier(0.770,0.000,0.175,1.000);-moz-transition:all 800ms cubic-bezier(0.770,0.000,0.175,1.000);-ms-transition:all 800ms cubic-bezier(0.770,0.000,0.175,1.000);-o-transition:all 800ms cubic-bezier(0.770,0.000,0.175,1.000);transition:all 800ms cubic-bezier(0.770,0.000,0.175,1.000);-webkit-transition-timing-function:cubic-bezier(0.770,0.000,0.175,1.000);-moz-transition-timing-function:cubic-bezier(0.770,0.000,0.175,1.000);-ms-transition-timing-function:cubic-bezier(0.770,0.000,0.175,1.000);-o-transition-timing-function:cubic-bezier(0.770,0.000,0.175,1.000);transition-timing-function:cubic-bezier(0.770,0.000,0.175,1.000)}
#slider{-webkit-transform:translateZ(0);-webkit-transition:all 0.5s ease-out;-moz-transition:all 0.5s ease-out;-o-transition:all 0.5s ease-out;transition:all 0.5s ease-out}
#commands label{-webkit-transform:translateZ(0);-webkit-transition:opacity 0.2s ease-out;-moz-transition:opacity 0.2s ease-out;-o-transition:opacity 0.2s ease-out;transition:opacity 0.2s ease-out}
#slide1:checked ~ #slides article:nth-child(1) .caption,#slide2:checked ~ #slides article:nth-child(2) .caption,#slide3:checked ~ #slides article:nth-child(3) .caption,#slide4:checked ~ #slides article:nth-child(4) .caption,#slide5:checked ~ #slides article:nth-child(5) .caption{opacity:1;-webkit-transition:all 1s ease-out 0.6s;-moz-transition:all 1s ease-out 0.6s;-o-transition:all 1s ease-out 0.6s;transition:all 1s ease-out 0.6s}
#commands,#commands label,#slides,#active,#active label{-webkit-transform:translateZ(0);-webkit-transition:all 0.5s ease-out;-moz-transition:all 0.5s ease-out;-o-transition:all 0.5s ease-out;transition:all 0.5s ease-out}
#slider{max-width:960px}
@media only screen and (max-width:850px) and (min-width:450px){
  #slider #commands{margin:-25% 0 0 5%;width:90%;height:50px}
  #slider #commands label{-moz-transform:scale(0.9);-webkit-transform:scale(0.9);-o-transform:scale(0.9);-ms-transform:scale(0.9);transform:scale(0.9)}
  #slider #slides .caption{padding:280px 12px}
  #slider #slides{padding:2px 0;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
  #slider #active{margin:15% 0 0}
}
@media only screen and (max-width:450px){
  #slider #commands{margin:-28% 0 0 1%;width:100%;height:70px}
  #slider #active{margin:12% 0 0}
  #slider #slides{padding:2px 0;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}
  #slider #slides .caption{opacity:0!important}
  #slider #commands label{-moz-transform:scale(0.7);-webkit-transform:scale(0.7);-o-transform:scale(0.7);-ms-transform:scale(0.7);transform:scale(0.7)}
}
@media only screen and (min-width:850px){
  body{padding:0 80px}
}


.main_body {
	float :left;
	width: 1800px;
	height: 100%;
	border: 0px solid #ccc;
	margin: 0 auto;

}

</style>

<body> 


<%@ include file = "../include/header.jsp" %>

<div class="main_body">
<section>


<article id="slider">
<div>

</div>
<input checked type='radio' name='slider' id='slide1'/>
<input type='radio' name='slider' id='slide2'/>
<input type='radio' name='slider' id='slide3'/>
<input type='radio' name='slider' id='slide4'/>
<input type='radio' name='slider' id='slide5'/>
<div id="slides">
	<div id="container">
		<div class="inner">
			<article>
			<img src="../images/pic1.png"  width=1200px height=400px />
			</article>
			<article>
			<div class='caption'>
				<bar>윤철규가 했음</bar>
			</div>
			<img src="../images/pic2.png"/>
			</article>
			<article>
			<div class='caption'>
				<bar>윤철규가 했음 </bar>
			</div>
			<img src="../images/pic3.png"/>
			</article>
			
			
		</div>
	</div>
</div>
<div id="commands">
	<label for='slide1'></label>
	<label for='slide2'></label>
	<label for='slide3'></label>

</div>
<div id="active">
	<label for='slide1'></label>
	<label for='slide2'></label>
	<label for='slide3'></label>

</div>
</article>

<br><br>
   
<!-- -------------------222 -->

<div class="d d2" style="margin-left:330px" >
<table align="center" style="width:600px; height:395px;" class="s table table-striped">
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
   
      <a href="../nboard/nBoardDetail.jsp?bunq=<%=bunq%>"><%=title %></a></td>
   </tr>
   <%
      number++;
   }
   %>
</table>
      
   </div> 

<!-- -------------------333 -->

   <div class="d d3" style="margin-left:20px;" >
      <table align="center" style="width:600px; height:395px;" class="s table table-striped table-dark">
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

                 <a href="../fboard/fBoardDetail.jsp?bunq=<%=bunq%>"><%=title %></a></td>
               </tr>
      <%
              number2++;
              }      
      %>
          </table>  
   </div>

<!-- -------------------444 -->

  
   
<!-- -------------------- -->
</section>
</div>

	     
<div Style=clear:both;height:30px;></div><!--   본문 body 와 간격 30px 띄우기 -->
		

<%@ include file = "../include/footer.jsp" %> 
   
</body>
</html>