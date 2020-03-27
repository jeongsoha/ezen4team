

function fn_boardSubmit() {
		var f = document.frm;

		if (f.title.value == "") {
			alert("제목을 입력해주세요.")
			f.title.focus(); // 커서 자동클릭 이동
			return false;
		}
		if (f.name.value == "") {
			alert("이름을 입력해주세요.")
			f.name.focus(); // 커서 자동클릭 이동
			return false;
		}
		if (f.pwd.value == "") {
			alert("암호를 입력해주세요.")
			f.pwd.focus(); // 커서 자동클릭 이동
			return false;
		}
		if (f.content.value == "") {
			alert("내용을 입력해주세요.")
			f.content.focus(); // 커서 자동클릭 이동
			return false;
		}

		f.submit(); // 위 조건을 안타면 전송하게끔.

	}

