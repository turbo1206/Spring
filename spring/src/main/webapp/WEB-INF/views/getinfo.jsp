<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get info</title>
</head>
<body>
<!-- getinfo 진입 시 나오는 내용 -->
<form method = "get" action = "/app/info">
	USERID : <input type="text" name="userid"><br>
	ADDRESS : <input type="text" name="address"><br><br>
	<input type="submit" name="전송">
</form>
<br>
<% // 웹 서버 안에서 먼저 실행.
	int i;
	for(i=0; i<10; i++) {
		out.println("<p>"+i+"</p>");
	}
%>
<%=i %>
</body>
<script></script>
</html>