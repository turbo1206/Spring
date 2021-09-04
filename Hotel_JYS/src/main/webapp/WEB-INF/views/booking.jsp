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
        .big {
            font-size: 30px;
        }
        .small {
        	font:bold;
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
        <b class="big">예약관리</b>
        <div class="menu-right-item">
            <div class="menu-item"><a href="room"><b class="small">객실관리</b></a></div>
            <div class="menu-item"><a href="logout"><b class="small">로그아웃</b></a></div>
        </div>
    </div>
    <div class="main">
        <div class="box">
            <div class="box-items1">
                <br><br><b class="small">예약기간</b>
                <input type="text" size="7"><b class="small"> ~</b>
                <input type="text" size="7">
                <br><br><b class="small">객실종류</b>
                <select slot="5" style="width: 170px;"></select>
                <br><br><b class="small">예약가능객실</b><br><br>
                <select size="20" style="width: 280px;"></select>
            </div>
            <div class="box-items2">
                <br><br><b class="small">객실명</b>
                <input type="text" size="20">
                <br><br><b class="small">객실종류</b>
                <select slot="5" style="width: 160px;"></select>
                <br><br><b class="small">예약인원</b>
                <input type="text" size="10"> 명
                <br><br><b class="small">최대인원</b>
                <input type="text" size="10"> 명
                <br><br><b class="small">예약기간</b>
                <input type="text" size="7"><b class="small"> ~</b>
                <input type="text" size="7">
                <br><br><b class="small">예약자명</b>
                <input type="text" size="10">
                <br><br><b class="small">모바일</b>
                <input type="text" size="15">
                <br><br><br><br><br>
                <input type="button" style="border-radius: 4; font:bold;" value="예약완료">
                <input type="button" style="border-radius: 4; font:bold;" value="비우기">
                <input type="button" style="border-radius: 4; font:bold;" value="예약취소">
            </div>
            <div class="box-items3">
                <br><b class="small">예약 된 객실</b>
                <br><br>
                <select size="27" style="width: 280px;"></select>
            </div>
        </div>
    </div>
</body>
</html>