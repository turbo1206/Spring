<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<form method="post" action="/hotel/check_user">
	사용자ID: <input type="text" name="userid"><br>
	비밀번호: <input type="password" name="passcode"><br>
	<br><input type="submit" value="로그인">
	&nbsp;<input type="submit" value="취소">
	&nbsp;<a href="/hotel/newbie">회원가입</a>
	</form>
</body>
</html>
