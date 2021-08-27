<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <link rel="stylesheet" href="style.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약관리</title>
</head>
    <h1>예약관리</h1>
<body>
 	<form method="get" action="goroom">
 	<input type="submit" value="객실관리">
 	</form>
    <form method="get" action="backhome">
	<input type="submit" value="로그아웃">
	</form><br><br>  
    <label for="room_list">객실목록</label>
          <p>
            <textarea name="" id="room_list" cols="10" rows="20">
              백두산 SuiteRoom 4명
              한라산 FamilyRoom 6명
            </textarea>
          </p>
    <div class="room_list">
    객실이름 <input type="text"><br><br>
    객실분류 <select size=5 multiple>
            <option>Suite Room</option>
            <option>Family Room</option>
            <option>Double Room</option>
            <option>Single Room</option>
            <option>Domitory Room</option>
    </select><br><br>
    숙박가능인원 <select size=5 multiple>
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
</select>명<br><br>
    1박요금 <input type="text">원<br><br>
    <input type="button" value="등록">
    <input type="button" value="삭제">
    <input type="button" value="Clear">
    </div>
</body>
</html>