<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ include file="../include/dbcon2.jsp"%>
<script>
$( function ()){
	$("#birthday").datepicker({
	changeMonth:true,
	changeYear:true
	});
	});

</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script src="../js/jquest-ui.js"></script>
<script src="../js/jquest-1.12.4.js"></script>
<body>
	<%@ include file="../include/header.jsp"%>

	<section>
		<form name="frm" method="post" action="memberSave.jsp">

			<!--  표 위치를 가운데로 오도록 만듬 / 테이블 범위확인 -->
			<table
				style="width: 450px; align: 0 auto; border: 0, auto; bgcolor: #ffffff;">

				<tr>
					<td class="mtd"><input class="textBox1" type="text"
						name="userid" placeholder="  아이디를 입력해주세요"></td>
				</tr>
				<tr>
					<th class="mtd"><input class="button1" type="button"
						value="중복확인" onclick="fn_popup()"></th>
				</tr>


				<tr>
					<td class="mtd"><input class="textBox1" type="password"
						name="pwd" placeholder="  비밀번호를 입력해주세요"></td>
				</tr>


				<tr>
					<td class="mtd"><input class="textBox1" type="password"
						name="pwd2" placeholder="  비밀번호를 확인해주세요"></td>
				</tr>
				<tr>
					<td class="mtd"><input class="textBox1" type="text"
						name="username" placeholder="  이름을 입력해주세요"></td>
				</tr>

				<tr>
					<td class="mtd">
					<td><input type="text" name="birthday" id="birthday"
						placeholder="  생년월일을 입력해주세"></td>
				</tr>


				<tr>
					<td class="mtd"><label> <input type="radio" value="M"
							name="gender">남자
					</label> <label><input type="radio" value="F" name="gender">여자</label>


					</td>
				</tr>


				<tr>
					<td class="mtd"><input class="email" type="email" name=""
						id="mailcheck" placeholder="  이메일을 입력해주세요"></td>
				</tr>

				<tr>
				</tr>
				<tr>
					<td class="mtd"><input class="textBox1" type="text" name="tel"
						placeholder="  전화번호를 입력해주세요"></td>
				</tr>

				<tr>

				</tr>
				<tr>
					<td class="mtd"><input style="width: 200px; height: 40px;"
						class="textBox1" type="text" name="post" placeholder="  우편번호 "></td>
				</tr>

				<tr>

				</tr>
				<tr>
					<td class="mtd"><input class="textBox1" type="text"
						name="addr" placeholder="  주소 입력"></td>
				</tr>
				<tr>
					<th class="mtd">관심사</th>
				</tr>
				<tr>
					<td class="mtd"><select style="width: 200px; height: 40px;"
						name="inter">
							<option value="0">&nbsp; -- 선 택 --
								<!-- 참고기능  checked -->
							<option value="1">&nbsp; 자전거
								<!-- 참고기능  checked -->
							<option value="2">&nbsp; 킥보드
								<!-- 참고기능  checked -->
					</select></td>
				</tr>
				</select>
				<tr>
					<th class="mtd"><input style="width: 250px%; height: 40px;"
						type="submit" value="가입하기" onclick="memberSave.jsp"></th>
				</tr>
			</table>
		</form>




	</section>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>