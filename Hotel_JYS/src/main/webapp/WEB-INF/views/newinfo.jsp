<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규 가입자 정보</title>
</head>
<body>
	실명<br>
	<p>${un}</p><br>
	아이디<br>
	<p>${loginid}</p><br>
	비밀번호<br>
	<p>${loginpw}</p><br>
	비밀번호 확인<br>
	<p>${loginpw1}</p><br>
	모바일<br>
	<p>${pn}</p><br>
	<form method="get" action="backhome">
	<input type="submit" value="돌아가기">
	</form>
	<form method="get" action="backhome">
	<input type="submit" value="취소">
	</form>
	<form method="get" action="backlogin">
	<input type="submit" value="로그인">
	</form>
</body>
</html>