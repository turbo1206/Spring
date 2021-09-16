<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>회원가입</title>
<style>
		body{
			background-image: url("./resources/img/newbie.jpg");
		}
		h1{
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
		    left:955px;
		    top:400px;
		    margin-left:-150px;
		    margin-top:-150px;
		}
		.btnCancle, .btnNewbie{
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
	<h1>회원가입</h1>
	<div class="box">
		<form method="POST" action="signin" id="frmlogin">
		<br>
		<b>실명</b> <input type="text" name="realname" required><br><br>
		<b>ID</b> <input type="text" name="userid" required><br><br>
		<b>비밀번호</b> <input type="password" name="passcode1" required><br><br>
		<b>비밀번호 확인</b> <input type="password" name="passcode2" required>
		<br><br><input type="submit" value="회원가입" id="btnNewbie" class="btnNewbie">
		<a href="/hotel/" class="btnCancle">취소</a>
		</form>
	</div>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
$(document)
.on('click','#btnNewbie',function(){
	if($('input[name=passcode1]').val()!=$('input[name=passcode2]').val())
	/*if($('#passcode1').val()!=$('#passcode2').val())*/ {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
})
</script>
</html>