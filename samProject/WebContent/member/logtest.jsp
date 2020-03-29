<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href="style.css">
<script src="jquery-3.4.1.js"></script>



</head>
<body>
<section class="login-form">
<h1>LOGIN</h1>
<form action="">
<div class="int-area">
<input type="text"name="id"id="id" autocomplete="off" required>
<label for="id">USER NAME</label> 
</div>

<div class="int-area">
<input type="password"name="pwd" id="pwd" autocomplete="off" required>
<label for="pwd">PASSWORD</label> 
</div>
<div class="btn-area">
<button id="btn" type="submit">LOGIN</button>


</form>
<div class="caption">
<a href="">Forgot password?</a>
</div>

</section>
<script >
let id = $('#id');
let pwd = $('#pwd');
let btn=$('#btn');

$(btn).on('click',function(){
if($(id).val() ==""){
	$(id).next('label').addclass('warning');	
	setTimeout(function(){
		
	$('label').removeClass('warning')	
	},1500);
}	
else if($(pwd).val()==""){
	
	$(pwd).next('label').addclass('warning');
	$('label').removeClass('warning')	
},1500);
}
});
</script>
</body>
</html>