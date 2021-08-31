<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form method="post" action="/hotel/">
	실명: <input type="text" name="username"><br>
	ID: <input type="text" name="userid"><br>
	비밀번호: <input type="text" name="password"><br>
	비밀번호 확인: <input type="text" name="password2"><br>
	모바일: <input type="text" name="phonenumber"><br>
	<br><input type="submit" value="회원가입">
	<input type="submit" value="취소">
	</form>
</body>
</html>