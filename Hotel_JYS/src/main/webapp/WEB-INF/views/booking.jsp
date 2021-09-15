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
    	body {
    		background-image: url("./resources/img/booking.jpg");
    	}
        .big {
            font-size: 30px;
            color:white;
        }
        .small {
        	font:bold;
       	 	color:white;
        }
        .small_other{
        	font:bold;
        	color:black;
        }
        .menu_side{
        	color:white;
        }
        .menu {
            height: 70px;
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
        
        #selBooked {
        	display: box;
        	width: 300px;
        	height: 500px;
        	overflow-x: scroll; 
        }
        .box-items1, .box-items2, .box-items3 {
        	opacity: 0.9;
        	color:white;
            margin: 150px 200px 0px 0px;
            border: 5px solid white;
            border-radius: 4px;
            text-align: center;
            /* background-color: aqua; */
            width: 300px;
        }
        .box-items3 {
            margin-right: 0px;
            background-color: white;
        }
        #btnBook,#btnEmpty,#btnCancle,#btnChange{
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
    <div class="menu">
        <b class="big">예약관리</b>
        <div class="menu-right-item">
            <div class="menu-item"><a href="room"><b class="menu_side">객실관리</b></a></div>
            <div class="menu-item"><a href="logout"><b class="menu_side">로그아웃</b></a></div>
        </div>
    </div>
    <div class="main">
        <div class="box container">
            <div class="box-items1">
                <br><b class="small">예약기간</b><br><br>
                <input type="date" id="checkin"><br>
                <b class="small">~</b>
              	<br><input type="date" id="checkout">
                <br><br><b class="small">객실종류</b><br><br>
                <select id="selRoomType" slot="5" style="width: 140px;">
               <%-- <option value="-">전체</option> --%>
                	<c:forEach items="${typelist}" var="room">
                		<option value="${room.typecode}">${room.name}</option>
                	</c:forEach>
                </select>
                <input type="button" value="조회" id="btnFind">
                <br><br><br><b class="small">예약가능객실</b><br><br>
                <select id="selAvaiable" size="19" style="width: 280px; height: 200px;">
                </select>
            </div>
            <div class="box-items2">
                <br><br><b class="small">객실명</b>
                <input type="text" size="20" id="roomname">
                <input type="hidden" id="roomcode">
                <input type="hidden" id="bookcode">
                <br><br><b class="small">객실종류</b>
                <select slot="4" style="width: 160px;" id="selType">
                	<c:forEach items="${typelist}" var="room">
                		<option value="${room.typecode}">${room.name}</option>
                	</c:forEach>
                </select>
                <br><br><b class="small">예약인원</b>
                <input type="text" size="10" id="howmany" min="1">
                <b class="small"> 명</b>
                <br><br><b class="small">최대인원</b>
                <input type="text" size="10" id="max_howmany" min="1">
                <b class="small"> 명</b>
                <br><br><b class="small">예약기간</b>
                <input type="date" id="checkin1">
                <br><b class="small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~</b>
                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="date" id="checkout1">
                <br><br><b class="small">숙박비총액</b>
                <input type="text" id="total" size="10" min="1">
                <input type="hidden" id="price">
                <b class="small"> 원</b>
                <br><br><b class="small" >예약자명</b>
                <input type="text" size="10" id="booker">
                <br><br><b class="small" >모바일</b>
                <input type="text" size="15" id="mobile">
                <br><input type="button" value="수정" id="btnChange">
                <br>
               	<input type="button" value="예약완료" id="btnBook">
               	<input type="button" value="비우기" id="btnEmpty">
               	<input type="button" value="예약취소" id="btnCancle">
            </div>
            <div class="box-items3">
                <br><b class="small_other">예약 된 객실</b>
                <br><br>
                <select id="selBooked" size="10">
                </select>
            </div>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script>
	// 조회 버튼.
	$(document)
	.on('click','#btnFind', function(){
		var checkin = $('#checkin').val();
		var checkout = $('#checkout').val();
		var typecode = $('#selRoomType option:selected').val();
		
		$.post("http://localhost:8080/hotel/Availablerooms",{checkin:$('#checkin').val(), checkout:$('#checkout').val(), typecode:$('#selRoomType option:selected').val()},function(result){
			$('#selAvaiable').empty();
			$.each(result, function(ndx,value){
				str='<option value="'+value['roomcode']+'">'+value['roomname']+','+
					value['typename']+','+value['howmany']+','+value['howmuch']+'</option>';
				$('#selAvaiable').append(str);
				/* str='<option value="${value['roomcode']}">${value['roomname']},${value}['typename']},'+
				'${value['howmany']},${value['howmuch']}</option>'; */
			});
		},'json');
		$.post("http://localhost:8080/hotel/findBooked",{checkin:checkin, checkout:checkout, typecode:typecode},function(result){
			//alert('')
			console.log(result);
			$('#selBooked').empty();
			$.each(result, function(ndx,value){
				str='<option value="'+value['bookcode']+'">'+value['roomname']+','+
				value['roomtype']+','+value['howmany']+','+value['maxhowmany']+','+value['total']+','+value['booker']+','+value['mobile']+','+value['checkin']+','+value['checkout']+'</option>';
				$('#selBooked').append(str);
				/* str='<option value="${value['roomcode']}">${value['roomname']},${value}['typename']},'+
				'${value['howmany']},${value['howmuch']}</option>'; */ 
			});
		},'json');
	})
	
	// 객실 정보 표현.
	.on('click','#selAvaiable option', function(){
		$('#roomcode').val($(this).val());
		let str=$(this).text(); // selRoom option 데이터를 텍스트로 str 변수로 선언.
		let ar=str.split(',');
		$('#roomname').val($.trim(ar[0])); // ar[1]을 txtName에 넣기.
		$('#selType option:contains("'+$.trim(ar[1])+'")').prop('selected','true');
		$('#max_howmany').val($.trim(ar[2])); // ar[2]을 txtNum에 넣기.
		$('#price').val($.trim(ar[3])); // ar[3]을 txtPrice에 넣기.
		//console.log($.trim(ar[3]));
		$('#checkin1').val($('#checkin').val());
		$('#checkout1').val($('#checkout').val());
		$('#checkin1,#checkout1').trigger('change');
		//$('#total').val(500000);
		let checkin = $('#checkin1').val();
		let checkout = $('#checkout1').val();
		console.log('checkin ['+checkin+'] checkout ['+checkout+']');
		//console.log($('#price').val());
		if(checkin == '' || checkout == '') { 
			return false;			
		}
		checkin = new Date(checkin);
		checkout = new Date(checkout);
		
		if(checkin > checkout) {
			alert('체크인 날짜가 체크아웃보다 나중 일 수 없습니다.');
			return false;
		}
		let ms = Math.abs(checkout-checkin);
		let days = Math.ceil(ms/(1000*60*60*24));
		let price = parseInt($('#price').val())
		let total = days*price;
		
		$('#total').val(total);
		return false;
	})
	
	// 유효성 검사.
	.on('click','#btnBook', function(){
		if($('#roomname').val() == '') {
			alert('객실이 선택되어야 합니다.');
			return false;
		}
		if($('#howmany').val() == '' || isNaN($('#howmany').val())) {
			alert('숙박예정인원이 입력되어야 합니다.');
			return false;
		}
		if($('#max_howmany').val() == '' || isNaN($('#max_howmany').val())) {
			alert('총 숙박(가능)인원이 입력되어야 합니다.');
			return false;
		}
		if($('#checkin1').val() == '' || $('#checkout1').val() == '') {
			alert('숙박기간이 입력되어야 합니다.');
			return false;
		}
		if($('#total').val() == '') {
			alert('총 숙박비가 계산되지 않았습니다.');
			return false;
		}
		if($('#booker').val() == '') {
			alert('예약자명이 입력되어야 합니다.');
			return false;
		}
		if($('#mobile').val() == '') {
			alert('예약자의 연락처가 입력되어야 합니다.');
			return false;
		}
		
		// insert into DB.
		$.post('http://localhost:8080/hotel/addBook',
				{roomcode:$('#roomcode').val(),howmany:$('#howmany').val(),checkin:$('#checkin').val(),
				checkout:$('#checkout').val(),total:$('#total').val(),booker:$('#booker').val(),mobile:$('#mobile').val()},
				function(result){
					if(result=='ok') {
						pstr='<option value="'+$('#roomcode').val()+'">'+
						$('#roomname').val()+','+$('#selType option:selected').text()+','+
						$('#howmany').val()+'/'+$('#max_howmany').val()+','+
						$('#checkin1').val()+'~'+$('#checkout1').val()+','+
						$('#booker').val()+','+$('#mobile').val()+'</option>';
						$('#selBooked').append(pstr);
						$('#btnEmpty').trigger('click');
						$('#btnFind').trigger('click');
					} else {
						alert('예약이 완료되지 않았습니다.(DBinsert오류)');
					}
				},'text');
		return false;
	})
	
/*	.on('change','#checkin1,#checkout1', function(){
		//alert('')
		let checkin = $('#checkin1').val();
		let checkout = $('#checkout1').val();
		console.log('checkin ['+checkin+'] checkout ['+checkout+']');
		//console.log($('#price').val())
		if(checkin == '' || checkout == '') { 
			return false;			
		}
		checkin = new Date(checkin);
		checkout = new Date(checkout);
		
		if(checkin > checkout) {
			alert('체크인 날짜가 체크아웃보다 나중일 수 없습니다.');
			return false;
		}
		let ms = Math.abs(checkout-checkin);
		let days = Math.ceil(ms/(1000*60*60*24));
		let price = parseInt($('#price').val())
		let total = days*price;
		
		// $('#total').val(50000);
		return false;
	}) */
	
	// 비우기 버튼.
	.on('click','#btnEmpty', function(){
		$('#roomcode,#roomname,#selType,#howmany,#max_howmany,#checkin1,#checkout1,#total,#price,#booker,#mobile').val('');
		return false;
	})
	
	// 예약 된 객실 정보 표시
	.on('click','#selBooked option',function(){
		let str=$(this).text(); // selBooked option 데이터를 텍스트로 str 변수로 선언.
		let ar=str.split(',');
		var str2 = $('#selBooked').val(); // value에서 typecode 가져오기
		console.log(str2);
		$('#bookcode').val(str2);
		$('#roomname').val($.trim(ar[0]));
		$('#selType option:contains("'+$.trim(ar[1])+'")').prop('selected','true');
		$('#howmany').val($.trim(ar[2]));
		$('#max_howmany').val($.trim(ar[3]));
		$('#total').val($.trim(ar[4]));
		$('#booker').val($.trim(ar[5]));
		$('#mobile').val($.trim(ar[6]));
		$('#checkin1').val($.trim(ar[7]));
		$('#checkout1').val($.trim(ar[8]));
		return false;
	})
	
	// booking 삭제
	.on('click','#btnCancle',function(){
		$.post('http://localhost:8080/hotel/deleteBooking',{bookcode:$('#bookcode').val()},
				function(result){
			console.log(result);
			if(result=="ok") {
				$('#selBooked option:selected').remove(); // book 리스트에서 제거.
				$('#btnEmpty').trigger('click'); // 입력란 비우기.
				$('#btnFind').trigger('click'); // 예약가능객실 조회 자동으로 누르기
			}
		},'text');
		return false;
	})
	
	.on('click','#btnChange',function(){
//		let roomname=$('#txtName').val();
//		let roomtype=$('#selType').val();
//		let howmany=$('#txtNum').val();
//		let howmuch=$('#txtPrice').val();
		let howmany=$('#howmany').val();
		let booker=$('#booker').val();
		let mobile=$('#mobile').val();
		console.log(howmany);
		console.log(booker);
		console.log(mobile);
		// validation (유효성 검사)
		if( howmany == '' || booker == '' || mobile == '') {
			alert('누락 된 값이 있습니다.');
			return false;
		} else {
			$.post('http://localhost:8080/hotel/updateBooking',
					{bookcode:$('#bookcode').val(), howmany:howmany, booker:booker, mobile:mobile},
					function(result) {
						if(result=='ok'){
							$('#btnEmpty').trigger('click'); // 입력란 비우기.
							$('#btnFind').trigger('click'); // 예약가능객실 조회 자동으로 누르기
						} 
					},'text');
		}
	})
</script>
</html>