<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form method="get" action="/hotel/newinfo">
	실명: <input type="text" name="username"><br><br>
	ID: <input type="text" name="userid"><br><br>
	비밀번호: <input type="text" name="password"><br><br>
	비밀번호 확인: <input type="text" name="password2"><br><br>
	모바일: <input type="text" name="phonenumber"><br><br>
	</form>
	<form method="get" action="/hotel/backlogin">
	<input type="submit" value="회원가입">
	</form>
	<form method="get" action="/hotel/backhome">
	<input type="submit" value="취소">
	</form>
</body>
</html>