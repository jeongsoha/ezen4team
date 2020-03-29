	function fn_boardsubmit(){
 		var f= document.frm;
 		
 		if(f.title.value==""){
 			alert("제목을 입력해주세요");
 			f.title.focus();
 			return false;
 		}
 		if(f.pwd.value==""){
 			alert("암호를 입력해주세요");
 			f.pwd.focus();
 			return false;
 		}
 		
 		f.submit();
 	}
	function fn_schesubmit(){
 		var f= document.frm;
 		if(f.title.value==""){
 			alert("제목을 입력해주세요");
 			f.title.focus();
 			return false;
 		}
 		if(f.pass.value==""){
 			alert("암호를 입력해주세요");
 			f.pass.focus();
 			return false;
 		}
 		
 		f.submit();
 	}
	
	
	
	
	
	