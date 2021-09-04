<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약관리</title>
    <style>
        b {
            font-size: 30px;
        }
        .menu {
            height: 70px;
            border-bottom : 1px solid black;
            display: flex;
            align-items: center;
        }
        .menu-right-item {
            display: flex;
            margin-left: auto;
        }
        .menu-item {
            margin-left: 10px;
        }
        .main {
            width: 1800px;
            margin: 0 auto;
        }
        .box {
            display: flex;
        }
        .box-items1 {
            width: 300px;
            height: 500px;
            border: 5px solid black;
            margin-top: 150px;
            margin-left: 200px;
            margin-right: 200px;
            border-radius: 4px;
            text-align: center;
        }
        .box-items2 {
            width: 300px;
            height: 500px;
            border: 5px solid black;
            margin-top: 150px;
            margin-right: 200px;
            border-radius: 4px;
            text-align: center;
        }
        .box-items3 {
            width: 300px;
            height: 500px;
            border: 5px solid black;
            margin-top: 150px;
            margin-right: 200px;
            border-radius: 4px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="menu">
        <b>예약관리</b>
        <div class="menu-right-item">
            <div class="menu-item"><a href="room">객실관리</a></div>
            <div class="menu-item"><a href="logout">로그아웃</a></div>
        </div>
    </div>
    <div class="main">
        <div class="box">
            <div class="box-items1">
                <br><br>예약기간
                <input type="text" size="7"> ~
                <input type="text" size="7">
                <br><br>객실종류
                <select slot="5" style="width: 170px;"></select>
                <br><br>예약가능객실<br><br>
                <select size="20" style="width: 280px;"></select>
            </div>
            <div class="box-items2">
                <br><br>객실명
                <input type="text" size="20">
                <br><br>객실종류
                <select slot="5" style="width: 160px;"></select>
                <br><br>예약인원
                <input type="text" size="10"> 명
                <br><br>최대인원
                <input type="text" size="10"> 명
                <br><br>예약기간
                <input type="text" size="7"> ~
                <input type="text" size="7">
                <br><br>예약자명
                <input type="text" size="10">
                <br><br>모바일
                <input type="text" size="15">
                <br><br><br><br><br>
                <input type="button" style="border-radius: 4;" value="예약완료">
                <input type="button" style="border-radius: 4;" value="비우기">
                <input type="button" style="border-radius: 4;" value="예약취소">
            </div>
            <div class="box-items3">
                <br>예약 된 객실
                <br><br>
                <select size="27" style="width: 280px;"></select>
            </div>
        </div>
    </div>
</body>
</html>