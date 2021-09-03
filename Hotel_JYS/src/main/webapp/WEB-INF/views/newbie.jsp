<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form method="POST" action="signin" id="frmlogin">
	실명: <input type="text" name="realname" ><br>
	ID: <input type="text" name="userid" ><br>
	비밀번호: <input type="password" name="passcode1"><br>
	비밀번호 확인: <input type="password" name="passcode2"><br>
	<br><input type="submit" value="회원가입">
	<a href="/hotel/">(홈페이지로)취소</a>
	</form>
	
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#frmlogin',function(){
	if($('#passcode1').val()!=$('#passcode2').val()) {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
})
</script>
</html>