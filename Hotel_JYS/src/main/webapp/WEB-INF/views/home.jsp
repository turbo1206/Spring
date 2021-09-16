<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>로그인</title>
	<style>
		
		body{
			background-image: url("./resources/img/newbie.jpg");
		}
		h1{
			font:bold;
			color:white;
		}
		h2{
			font:bold;
			color:white;
		}
		b{
			font:bold;
			color:white;
		}
		#wrap{
		    width:100%;
		    height:100%
		    position:relative;
		    text-align:center;
		} 
		#wrap .box{
			text-align:center;
			border:5px solid white; 
		    width:300px;
		    height:300px;
		    position:absolute;
		    left:960px;
		    top:400px;
		    margin-left:-150px;
		    margin-top:-150px;
		}
		#btnLogin,#btnCancle,#btnNewbie{
        	margin-top: 30px;
			font-weight: 600;
		   	width: 80px;
		    height: 40px;
		   	padding: 10px;
		    margin-left: 10px;
		   	border: none;
		   	font-size: 15px;
		    border-radius: 10%;
		   	background-color: white;
        }
	</style>
</head>

<body>
	<div id="wrap">
	<br><br><br>
	<h1>호텔 관리 홈페이지</h1>
	<h2>로그인을 하십시요.</h2>
		<div class="box">
			<form method="post" action="/hotel/check_user" id="frmlogin">
			<br><br><br><br>
			<b>사용자ID</b> <input type="text" name="userid">
			<br><br>
			<b>비밀번호</b>  <input type="password" name="passcode">
			<br><br><br><br>
			<input type="submit" value="로그인" id="btnLogin">
			<input type="submit" value="취소" id="btnCancle">
			<a href="/hotel/newbie" id="btnNewbie">회원가입</a>
			</form>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
/*	$(document)
	.on('submit','#frmlogin', function(){
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
	}) */
</script>	
</body>
</html>
