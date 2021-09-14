<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>객실관리</title>
    <style>
     .big {
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
     .container {
        	width: 80%;
        	margin: 0 auto;
        	display: flex;
     }
     .box1, .box2 {
            margin: 150px 50px 0px 200px;
            border: 5px solid black;
            border-radius: 4px;
            text-align: center;
            /* background-color: aqua; */
            width: 300px;
     }
    </style>
</head>
<body>
	<div class="menu">
        <b class="big">객실관리</b>
        <div class="menu-right-item">
            <div class="menu-item"><a href="booking"><b class="small">예약관리</b></a></div>
            <div class="menu-item"><a href="logout"><b class="small">로그아웃</b></a></div>
        </div>
    </div>
    <div class="main">
    	<div class="container">
    		<div class="box1">
    			<select id="selRoom" size="20" style="width: 250px;">
					<%-- 	<c:forEach items="${list}" var="room">
					<option value="${room.roomcode}">${room.roomname}, ${room.typename}, ${room.howmany}, ${room.howmuch}</option>
					</c:forEach>  --%>
			</select>
    		</div>
    		<div class="box2">
	    		<br><br>객실명
				<input type="text" id="txtName">
				<input type="hidden" id="roomcode">
				<br><br>타입
				<select id="selType" size="5" style="width: 120px;">
					<c:forEach items="${typelist}" var="type">
						<option value="${type.typecode}">${type.name}</option>
					</c:forEach>
				</select>
				<br><br>최대숙박인원
				<input type="text" id="txtNum">
				<br><br>1박 가격
				<input type="text" id="txtPrice"><br><br>
				<input type="button" value="등록" id="btnAdd">&nbsp;
				<input type="button" value="삭제" id="btnDelete">&nbsp;
				<input type="button" value="취소" id="btnEmpty">
    		</div>
    	</div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
/*	$(document)
	.on('click','#selRoom', function(){
		var str1 = $('#selRoom option:selected').text(); // option 값 가져오기
		var str2 = $('#selRoom').val(); // value에서 typecode 가져오기
		var box = String(str2).split(" "); // typecode를 가져오기 위해 split
		var typecode = parseInt(box[0]); // int로 타입 변환
		var list = String(str1).split(","); // option에서 가져온 값들 배열로 슬라이싱
		
		var roomname = list[0];
		var roomtype = list[1];
		var howmany = list[2];
		var howmuch = list[3];
		
		$('#txtName').val(roomname);
		$('#txtNum').val(howmany);
		$('#txtPrice').val(howmuch);
		
		if(typecode==1) {
			$('#selType').val(1).prop("selected", true);
		} else if(typecode==2) {
			$('#selType').val(2).prop("selected", true);
		} else if(typecode==3) {
			$('#selType').val(3).prop("selected", true);
		} else if(typecode==4) {
			$('#selType').val(4).prop("selected", true);
		}
		
	}) */
	$(document)
	.ready(function(){
		$.post("http://localhost:8080/hotel/getRoomList",{},function(result){
			console.log(result);
			$.each(result, function(ndx,value){
				str='<option value="'+value['roomcode']+'">'+value['roomname']+','+
					value['typename']+','+value['howmany']+','+value['howmuch']+'</option>';
				$('#selRoom').append(str);
				/* str='<option value="${value['roomcode']}">${value['roomname']},${value}['typename']},'+
				'${value['howmany']},${value['howmuch']}</option>'; */
			});
		},'json'); 
	})
	
	.on('click','#selRoom option',function(){
		let str=$(this).text(); // selRoom option 데이터를 텍스트로 str 변수로 선언.
		let ar=str.split(',');
		$('#txtName').val($.trim(ar[0])); // ar[1]을 txtName에 넣기.
		$('#selType option:contains("'+$.trim(ar[1])+'")').prop('selected','true');
		$('#txtNum').val($.trim(ar[2])); // ar[2]을 txtNum에 넣기.
		$('#txtPrice').val($.trim(ar[3])); // ar[3]을 txtPrice에 넣기.
		let code = $(this).val();
		$('#roomcode').val(code); // roomcode의 value 값을 code에 넣는다.
		return false;
	})
	
	.on('click','#btnEmpty',function(){
		$('#txtName,#txtNum,#txtPrice,#roomcode,#selType').val('');
		return false;
	})
	
	.on('click','#btnDelete',function(){
		$.post('http://localhost:8080/hotel/deleteRoom',{roomcode:$('#roomcode').val()},
				function(result){
			console.log(result);
			if(result=="ok") {
				$('#btnEmpty').trigger('click'); // 입력란 비우기.
				$('#selRoom option:selected').remove(); // room 리스트에서 제거.
			}
		},'text');
		return false;
	})
	
	.on('click','#btnAdd',function(){
		let roomname=$('#txtName').val();
		let roomtype=$('#selType').val();
		let howmany=$('#txtNum').val();
		let howmuch=$('#txtPrice').val();
		// validation (유효성 검사)
		if( roomname=='' || roomtype=='' || howmany=='' || howmuch=='') {
			alert('누락 된 값이 있습니다.');
			return false;
		}
		let roomcode = $('#roomcode').val();
		if(roomcode=='') { // insert
			$.post('http://localhost:8080/hotel/addRoom',
					{roomname:roomname,roomtype:roomtype,howmany:howmany,howmuch:howmuch},
					function(result) {
						if(result=='ok') {
							location.reload();
						}
					},'text');
		} else {
			console.log('roomcode ['+roomcode+']');
			$.post('http://localhost:8080/hotel/updateBook',
					{roomcode:roomcode,roomname:roomname,
					roomtype:roomtype,howmany:howmany,howmuch:howmuch},
					function(result) {
						if(result=='ok'){
							location.reload();
						} 
					},'text');
		}
	})
</script>
</html>