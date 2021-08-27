<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="style.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>객실관리</title>
</head>
	<h1>객실관리</h1>
		<body>
		    <form method="get" action="gomanage">
		    <input type="submit" value="예약관리">
		     </form>
		    <form method="get" action="backhome">
			<input type="submit" value="로그아웃">
			</form>
			<br><br>
			    숙박기간 <input type="text">~<input type="text"><br>
		   	    객실분류 <select size=5 multiple>
		            <option></option>
		            <option></option>
		            <option></option>
		            <option></option>
		            <option></option>
		            </select>
		            <input type="button" value="찾기"><br><br>
		  	  예약가능
		    <label for="room_list"></label>
		          <p>
		            <textarea name="" id="room_list" cols="10" rows="20">
				              한라산
				              백두산
				              관악산
				              남산
				              수명산
				              태조산
		            </textarea>
		          </p>
		    <div class="room_list">
			    객실이름 <input type="text"><br>
			    숙박기간 <input type="text">~<input type="text"><br>
			    숙박인원 <input type="text">명<br>
		   	  1박비용 <input type="text">원<br>
			    총 숙박비 <input type="text">원<br>
			    예약자 모바일 <input type="text"><br><br>
		    <input type="button" value="등록">
		    <input type="button" value="취소">
		    <input type="button" value="Clear"></div><br><br>
		    <div class="room_list_right">
		    <label for="room_list">예약 된 객실</label><br>
		          <p>
		            <textarea name="" id="room_list" cols="10" rows="20">
				              광덕산
				              흑성산
				              태조산
				              관악산
		            </textarea>
		          </p>
		        </div>
        