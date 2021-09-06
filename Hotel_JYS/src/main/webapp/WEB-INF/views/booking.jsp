<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            width: 1700px;
            margin: 0 auto;
        }
        .box {
            display: flex;
        }
        .box-items1 {
            width: 300px;
            height: 600px;
            border: 5px solid black;
            margin-top: 150px;
            margin-left: 200px;
            margin-right: 200px;
            border-radius: 4px;
            text-align: center;
        }
        .box-items2 {
            width: 300px;
            height: 520px;
            border: 5px solid black;
            margin-top: 150px;
            margin-right: 200px;
            border-radius: 4px;
            text-align: center;
        }
        .box-items3 {
            width: 300px;
            height: 520px;
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
                <br><b class="small">예약기간</b><br><br>
                <input type="date" id="checkin"><br>
                <b class="small">~</b>
              	<br><input type="date" id="checkout">
                <br><br><b class="small">객실종류</b><br><br>
                <select id="selRoomType" slot="5" style="width: 140px;">
                </select>
                <input type="button" value="조회" id="btnFind">
                <br><br><br><b class="small">예약가능객실</b><br><br>
                <select id="selAvaiable" size="19" style="width: 260px; height: 200px;">
                </select>
            </div>
            <div class="box-items2">
                <br><br><b class="small">객실명</b>
                <input type="text" size="20" id="roomname">
                <input type="hidden" id="roomcode">
                <br><br><b class="small">객실종류</b>
                <select slot="4" style="width: 160px;" id="selType">
                	<c:forEach items="${typelist}" var="room">
                		<option value="${room.typecode}">${room.name}</option>
                	</c:forEach>
                </select>
                <br><br><b class="small">예약인원</b>
                <input type="text" size="10" id="howmany">
                <b class="small"> 명</b>
                <br><br><b class="small">최대인원</b>
                <input type="text" size="10" id="max_howmany">
                <b class="small"> 명</b>
                <br><br><b class="small">예약기간</b>
                <input type="date" id="checkin1">
                <br><b class="small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~</b>
                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="date" id="checkout1">
                <br><br><b class="small">숙박비총액</b>
                <input type="text" size="7" id="total">
                <b class="small"> 원</b>
                <br><br><b class="small" id="booker">예약자명</b>
                <input type="text" size="10">
                <br><br><b class="small" id="mobile">모바일</b>
                <input type="text" size="15">
                <br><br><br><br>
               	<input type="button" value="예약완료" id="btnBook">
               	<input type="button" value="비우기" id="btnEmpty">
               	<input type="button" value="예약취소" id="btnCancle">
            </div>
            <div class="box-items3">
                <br><b class="small">예약 된 객실</b>
                <br><br>
                <select id="viewRoom" size="27" style="width: 280px;"></select>
            </div>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
	// 조회 버튼.
	$(document)
	.on('click','#btnFind', function(){
		$.post("http://localhost:8080/hotel/getRoomList",{},function(result){
			$('#selAvaiable').empty();
			$.each(result, function(ndx,value){
				str='<option value="'+value['roomcode']+'">'+value['roomname']+','+
					value['typename']+','+value['howmany']+','+value['howmuch']+'</option>';
				$('#selAvaiable').append(str);
				/* str='<option value="${value['roomcode']}">${value['roomname']},${value}['typename']},'+
				'${value['howmany']},${value['howmuch']}</option>'; */
			});
		},'json');
	})
	
	// 객실 정보 표현.
	.on('click','#selAvaiable option', function(){
		let str=$(this).text(); // selRoom option 데이터를 텍스트로 str 변수로 선언.
		let ar=str.split(',');
		$('#roomname').val($.trim(ar[0])); // ar[1]을 txtName에 넣기.
		$('#selType option:contains("'+$.trim(ar[1])+'")').prop('selected','true');
		$('#max_howmany').val($.trim(ar[2])); // ar[2]을 txtNum에 넣기.
		$('#total').val($.trim(ar[3])); // ar[3]을 txtPrice에 넣기.
		$('#checkin1').val($('#checkin').val());
		$('#checkout1').val($('#checkout').val());
		return false;
	})
	
</script>
</html>