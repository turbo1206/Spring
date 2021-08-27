<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
</head>
<body>
	<form method="post" action="/hotel/check_user">
	사용자ID: <input type="text" name="userid"><br>
	비밀번호: <input type="password" name="passcode"><br>
	<input type="submit" value="로그인">
	</form>
	<a href='/hotel/login'>취소</a>
</body>
</html>