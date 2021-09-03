<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<form method="post" action="/hotel/check_user" id="frmlogin">
	사용자ID: <input type="text" name="userid"><br>
	비밀번호: <input type="password" name="passcode"><br>
	<br><input type="submit" value="로그인">
	&nbsp;<input type="submit" value="취소">
	&nbsp;<a href="/hotel/newbie">회원가입</a>
	</form>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
	$(document)
	.on('submit','#frmlogin' function(){
		let pstr=$.trim($('input[name=userid]').val());
		$('input[name=userid]').val(pstr);
		pstr=$.trim('input[name=passcode]').val());
		$('input[name=passcode]').val(pstr);
		if($('input[name=userid]').val()=='') {
			alert('로긴아이디를 입력하시오.');
			return false;
		}
		if($('input[name=passcode]').val()=='')) {
			alert('비밀번호를 입력하시오.');
			return false;
		}
	})
</script>	
</body>
</html>
