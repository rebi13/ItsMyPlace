<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><!-- 아이콘요소 -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Constra HTML Template v1.0">
  
  <!-- timepicker css-->
  <link type="text/css" rel="stylesheet" href="/resources/plugins/jquery/dist/jquery.timepicker.css" media=""/>
</head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<style>

.seatStructure{
   margin: 0px 140px;
}

#seatsBlock {
	padding-top: 60px;
	padding-left: 60px;
}

/* 수정 */
.seat {
    display: inline-block;
}

.seat > img {
	 width : 60px;
	 height: 45px;
	 background: bottom;
}

.table2 , .table1 , .table3, .table4, .table5{
    display: inline-block;
    margin
}

.table2 , .table3 ,.table4, .table5{
	padding-left: 140px;
}

.table4, .table5{
    padding-top: 80px;
}

.seat input[type=checkbox]+ img {
 	background-image: url("/resources/images/reservation/chairs.png"); 
  	background-size: cover;
  	width: 50px;
}

.seat input[type=checkbox]:checked + img {
 	background-image: url("/resources/images/reservation/checkseat.png"); 
 	background-size: cover;
}

</style>

<script type="text/javascript">



/* 당일시간표현 함수*/
function printTime() {
		var clock = document.getElementById("clock");
		var now = new Date();
		clock.innerHTML = (now.getMonth()+1) + "월 " + now.getDate() + "일 " ;
}

function leftSeat() {
	var noEmptyleng = $("#seatsBlock").find('img.noEmpty').length;
	var leftSeats = document.getElementById("leftSeats");
	leftSeats.innerHTML =  (20-noEmptyleng) + "/20";
}

function tableCheck() {
	//테이블별로 예약하게끔 한좌석만예약이되있다면 체크못하게 하는함수
	if($("#table1").find('img.noEmpty').length)
	{
		$('input#seatsNum0:checkbox').prop('disabled', true);
		$('input#seatsNum1:checkbox').prop('disabled', true);
		$('input#seatsNum2:checkbox').prop('disabled', true);
		$('input#seatsNum3:checkbox').prop('disabled', true);
	}
	if($("#table2").find('img.noEmpty').length)
	{
		$('input#seatsNum4:checkbox').prop('disabled', true);
		$('input#seatsNum5:checkbox').prop('disabled', true);
		$('input#seatsNum6:checkbox').prop('disabled', true);
		$('input#seatsNum7:checkbox').prop('disabled', true);
	}
	if($("#table3").find('img.noEmpty').length)
	{
		$('input#seatsNum8:checkbox').prop('disabled', true);
		$('input#seatsNum9:checkbox').prop('disabled', true);
		$('input#seatsNum10:checkbox').prop('disabled', true);
		$('input#seatsNum11:checkbox').prop('disabled', true);
	}
	if($("#table4").find('img.noEmpty').length)
	{
		$('input#seatsNum12:checkbox').prop('disabled', true);
		$('input#seatsNum13:checkbox').prop('disabled', true);
		$('input#seatsNum14:checkbox').prop('disabled', true);
		$('input#seatsNum15:checkbox').prop('disabled', true);
	}
	if($("#table5").find('img.noEmpty').length)
	{
		$('input#seatsNum16:checkbox').prop('disabled', true);
		$('input#seatsNum17:checkbox').prop('disabled', true);
		$('input#seatsNum18:checkbox').prop('disabled', true);
		$('input#seatsNum19:checkbox').prop('disabled', true);
	}
	
}

function getCheckboxValue(event)  {
	
	$('#table1').click(function(){
		$(":checkbox").prop('disabled', true);
		if ($('input[name="seats"]:checked').length == ($("#Numseats").val()))  //체크박스와 인원수가 같다면, 체크를못하게한다
		{
			 $(":checkbox").prop('disabled', true);
		}
		else
		{
			$('input#seatsNum0:checkbox').prop('disabled', false);
			$('input#seatsNum1:checkbox').prop('disabled', false);
			$('input#seatsNum2:checkbox').prop('disabled', false);
			$('input#seatsNum3:checkbox').prop('disabled', false);
		}
	});
	$('#table2').click(function(){
		$(":checkbox").prop('disabled', true);
		if ($('input[name="seats"]:checked').length == ($("#Numseats").val()))  //체크박스와 인원수가 같다면, 체크를못하게한다
		{
			$(":checkbox").prop('disabled', true);
		}
		else
		{
			$('input#seatsNum4:checkbox').prop('disabled', false);
			$('input#seatsNum5:checkbox').prop('disabled', false);
			$('input#seatsNum6:checkbox').prop('disabled', false);
			$('input#seatsNum7:checkbox').prop('disabled', false);
		}
	});
	$('#table3').click(function(){
		$(":checkbox").prop('disabled', true);
		if ($('input[name="seats"]:checked').length == ($("#Numseats").val()))  //체크박스와 인원수가 같다면, 체크를못하게한다
		{
			$(":checkbox").prop('disabled', true);
		}
		else
		{
			$('input#seatsNum8:checkbox').prop('disabled', false);
			$('input#seatsNum9:checkbox').prop('disabled', false);
			$('input#seatsNum10:checkbox').prop('disabled', false);
			$('input#seatsNum11:checkbox').prop('disabled', false);
		}
	});
	$('#table4').click(function(){
		$(":checkbox").prop('disabled', true);
		if ($('input[name="seats"]:checked').length == ($("#Numseats").val()))  //체크박스와 인원수가 같다면, 체크를못하게한다
		{
			$(":checkbox").prop('disabled', true);
		}
		else
		{
			$('input#seatsNum12:checkbox').prop('disabled', false);
			$('input#seatsNum13:checkbox').prop('disabled', false);
			$('input#seatsNum14:checkbox').prop('disabled', false);
			$('input#seatsNum15:checkbox').prop('disabled', false);
		}
	});
	$('#table5').click(function(){
		$(":checkbox").prop('disabled', true);
		if ($('input[name="seats"]:checked').length == ($("#Numseats").val()))  //체크박스와 인원수가 같다면, 체크를못하게한다
		{
			$(":checkbox").prop('disabled', true);
		}
		 //반복문돌린다 사람수만큼?
		else
		{
			$('input#seatsNum16:checkbox').prop('disabled', false);
			$('input#seatsNum17:checkbox').prop('disabled', false);
			$('input#seatsNum18:checkbox').prop('disabled', false);
			$('input#seatsNum19:checkbox').prop('disabled', false);
		}
	});
	var query = 'input[name="seats"]:checked';
	var selectedEls = document.querySelectorAll(query);
	var arrr = new Array();
	selectedEls.forEach((el) => {
		arrr.push(el.value);
	});
	// 화면 출력
	document.getElementById('result').innerText = arrr + "입니다."; 
	
		//반복문으로 돌려보기
		//$('input#seatsNum4:checkbox').prop('disabled', true);
		//$('input#seatsNum5:checkbox').prop('disabled', true);
		//id="seatsNum${Numid.index}" 무기력하게하기

	tableCheck();	
	
}

function changePplSelect(){

	$(":checkbox").prop('disabled', false);	//체크박스 초기화
	if($("input:checkbox[name=seats]").is(":checked") == true) { //체크박스를 선택했었다면
		alert("인원수를 다시체크해주세요");
		$("input[type=checkbox]").prop("checked",false);	//체크박스 선택초기화
	}
	tableCheck();
}
	
$(document).ready(function() {
	
	$("#btnReserve").on("click", function() {
		var pplCnt = $("#Numseats option:selected").val();
		var now = new Date();
		var clockstring = (now.getMonth()+1) + "월 " + now.getDate() + "일 " ;
		var year = now.getFullYear();
		var month = now.getMonth()+1;
		var day = now.getDate();
		var clockServer = year+(("00"+month.toString()).slice(-2))+(("00"+day.toString()).slice(-2));
		var timeSel = $("#timeSel option:selected").val();
		var arr = "";   //new Array();
		
		$("input[name=seats]:checked").each(function(){
			//arr.push($(this).val());
			if(arr == "")
			{
				arr = $(this).val();
			}
			else
			{
				arr = arr + "," + $(this).val();
			}
		});
		
		if($("input:checkbox[name=seats]").is(":checked") == false)
		{
			alert("자리를 선택해주세요");
		}
		else if($('input[name="seats"]:checked').length != ($("#Numseats").val()))
		{
			alert("인원수에 맞게 자리를 선택해주세요");
		}
		else
		{
			location.href="/cafe/reservationNext?cafeNum=${cafe.cafeNum}"+"&pplCnt="+pplCnt+ 
						"&clockServer="+clockServer+"&timeSel="+timeSel+"&arr="+arr;
		}
	});
	
	leftSeat();
	printTime();
	tableCheck();
	
});



</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<div class="container">
	<div class="resevtable">
		<font size="4">
		<table class="table">
		  <thead>
		    <tr style="background-color: white;">
				<th colspan=12 style="text-align: center;">자리예약 / 인원 / 시간</th>
		    </tr>
		  </thead>
		  <tbody>
			<tr style="height: 80px; padding-top: 30px;">
				<th style="padding-top: 30px;">선택한 카페 </th>
				<th  style="padding-top: 30px;">${cafe.cafeName}</th>
				<td  style="padding-top: 30px;">카페주소</td>
				<td  style="padding-top: 30px;">${cafe.cafeAddr}</td>
		    </tr>
		    <tr>
				<th scope="row">성함</th>
				<td id="name">${user.userName}</td>
				<td>남은좌석수</td>
				<td style="color: red;"><span id="leftSeats" ></span></td>
		    </tr>
		    <tr>
				<th scope="row">인원수</th>
				<td>
					<select class="selectpicker" id="Numseats" style="width: 160px;"  onchange="changePplSelect()">
						 <option value="1">1명</option>
						 <option value="2">2명</option>
						 <option value="3">3명</option>
						 <option value="4">4명</option>
					</select>
				</td>
				<th scope="row">예약시간</th>
			  	<td>
				  	<select class="selectpicker" id="timeSel" style="width: 160px;">
						 <option value="0900">9:00</option>
						 <option value="1000">10:00</option>
						 <option value="1100">11:00</option>
						 <option value="1200">12:00</option>
						 <option value="1300">13:00</option>
						 <option value="1400">14:00</option>
						 <option value="1500">15:00</option>
						 <option value="1600">16:00</option>
						 <option value="1700">17:00</option>
						 <option value="1800">18:00</option>
						 <option value="1900">19:00</option>
						 <option value="2000">20:00</option>
						 <option value="2100">21:00</option>
					</select>
			 	</td>
		    </tr>
		    <tr>
		      	<td colspan="2" style="text-align: center; background-color: #f0ff0129;">예약일자</td>
		      	<th colspan="2" style="text-align: center; background-color: #f0ff0129;">선택하신 좌석번호
		      	</th>
		    </tr>
		    <tr>
				<td colspan="2"  style="text-align: center; background-color: #f0ff0129;"><span id="clock" ></span><div id="selectTime"  style="display:inline-block;"></div></td>
				<td colspan="2" id="result" style="text-align: center; background-color: #f0ff0129;"></td>
		    </tr>
		  </tbody>
		</table>
		</font>
	</div>
	<span><font size="3">※ 당일예약, 테이블단위로 예약가능합니다</font></span>
    <div class="seatStructure">
    	<div class="" style="text-align: right;">
    		<img src="/resources/images/reservation/noemptyseat1.png" width="40" height="40">사용중
    		<img src="/resources/images/reservation/chairs.png" width="40" height="40">빈좌석
    	</div>
		<div id="seatsBlock">
			<div class="row">
			<div class="table1" id="table1">
				<div class="seat">
				<c:forEach var="seat" items="${seat}" begin="0" end="1" varStatus="Numid">
					<c:choose>
						<c:when test="${seat.vacancy eq 'N'}">
							<img src="/resources/images/reservation/noemptyseat1.png" class="noEmpty" alt="" style="width: 65px;" />
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="seats" id="seatsNum${Numid.index}" value="${seat.seatNum}" onclick='getCheckboxValue()'/>
							<img></img>	
						</c:otherwise>
					</c:choose>
				</c:forEach>
				</div>
				<div class="table">
					<img src="/resources/images/reservation/desk.png" style=" width: 140px ;"/>
				</div>
				<div class="seat">
				<c:forEach var="seat" items="${seat}" begin="2" end="3" varStatus="Numid">
					<c:choose>
						<c:when test="${seat.vacancy eq 'N'}">
							<img src="/resources/images/reservation/noemptyseat1.png" class="noEmpty" alt="" style="width: 65px;" />
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="seats" id="seatsNum${Numid.index}" value="${seat.seatNum}" onclick='getCheckboxValue()'/>
							<img></img>	
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				</div>
			</div>
			
			<div class="table2" id="table2">
				<div class="seat">
				<c:forEach var="seat" items="${seat}" begin="4" end="5" varStatus="Numid">
					<c:choose>
						<c:when test="${seat.vacancy eq 'N'}">
							<img src="/resources/images/reservation/noemptyseat1.png" class="noEmpty" alt="" style="width: 65px;" />
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="seats" id="seatsNum${Numid.index}" value="${seat.seatNum}" onclick='getCheckboxValue()'/>
							<img></img>	
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				</div>
				<div class="table">
					<img src="/resources/images/reservation/desk.png" style=" width: 140px ;"/>
				</div>
				<div class="seat">
				<c:forEach var="seat" items="${seat}" begin="6" end="7" varStatus="Numid">
					<c:choose>
						<c:when test="${seat.vacancy eq 'N'}">
							<img src="/resources/images/reservation/noemptyseat1.png" class="noEmpty" alt="" style="width: 65px;" />
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="seats" id="seatsNum${Numid.index}" value="${seat.seatNum}" onclick='getCheckboxValue()'/>
							<img></img>	
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				</div>
			</div>
			
			<div class="table3"  id="table3">
				<div class="seat">
				<c:forEach var="seat" items="${seat}" begin="8" end="9" varStatus="Numid">
					<c:choose>
						<c:when test="${seat.vacancy eq 'N'}">
							<img src="/resources/images/reservation/noemptyseat1.png" class="noEmpty" alt="" style="width: 65px;" />
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="seats" id="seatsNum${Numid.index}" value="${seat.seatNum}" onclick='getCheckboxValue()'/>
							<img></img>	
						</c:otherwise>
					</c:choose>		
				</c:forEach>
				</div>
				<div class="table">
					<img src="/resources/images/reservation/desk.png" style=" width: 140px ;"/>
				</div>
				<div class="seat">
				<c:forEach var="seat" items="${seat}" begin="10" end="11" varStatus="Numid">
					<c:choose>
						<c:when test="${seat.vacancy eq 'N'}">
							<img src="/resources/images/reservation/noemptyseat1.png" class="noEmpty" alt="" style="width: 65px;" />
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="seats" id="seatsNum${Numid.index}" value="${seat.seatNum}" onclick='getCheckboxValue()'/>
							<img></img>	
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				</div>
			</div>
			
			<div class="table4" id="table4">
				<div class="seat">
				<c:forEach var="seat" items="${seat}" begin="12" end="13" varStatus="Numid">
					<c:choose>
						<c:when test="${seat.vacancy eq 'N'}">
							<img src="/resources/images/reservation/noemptyseat1.png" class="noEmpty" alt="" style="width: 65px;" />
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="seats" id="seatsNum${Numid.index}" value="${seat.seatNum}" onclick='getCheckboxValue()'/>
							<img></img>	
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				</div>
				<div class="table">
					<img src="/resources/images/reservation/desk.png" style=" width: 140px ;"/>
				</div>
				<div class="seat">
				<c:forEach var="seat" items="${seat}" begin="14" end="15" varStatus="Numid">
					<c:choose>
						<c:when test="${seat.vacancy eq 'N'}">
							<img src="/resources/images/reservation/noemptyseat1.png" class="noEmpty" alt="" style="width: 65px;" />
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="seats" id="seatsNum${Numid.index}" value="${seat.seatNum}" onclick='getCheckboxValue()'/>
							<img></img>	
						</c:otherwise>
					</c:choose>		
				</c:forEach>
				</div>
			</div>
			
			<div class="table5"  id="table5">
				<div class="seat">
				<c:forEach var="seat" items="${seat}" begin="16" end="17" varStatus="Numid">
					<c:choose>
						<c:when test="${seat.vacancy eq 'N'}">
							<img src="/resources/images/reservation/noemptyseat1.png" class="noEmpty" alt="" style="width: 65px;"/>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="seats" id="seatsNum${Numid.index}" value="${seat.seatNum}" onclick='getCheckboxValue()'/>
							<img></img>	
						</c:otherwise>
					</c:choose>		
				</c:forEach>
				</div>
				<div class="table">
					<img src="/resources/images/reservation/desk.png" style=" width: 140px ;"/>
				</div>
				<div class="seat">
				<c:forEach var="seat" items="${seat}" begin="18" end="19" varStatus="Numid">
					<c:choose>
						<c:when test="${seat.vacancy eq 'N'}">
							<img src="/resources/images/reservation/noemptyseat1.png" class="noEmpty" alt="" style="width: 65px;" />
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="seats" id="seatsNum${Numid.index}" value="${seat.seatNum}" onclick='getCheckboxValue()'/>
							<img></img>	
						</c:otherwise>
					</c:choose>	
				</c:forEach>
				</div>
			</div>
		</div>
   	 </div>
   	 <div style="text-align: right;padding-bottom: 100px;">
   	 <button class="btn btn-main mt-20" id="btnReserve">예약 하러가기</button>
   	 </div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
    <!-- timepicker jquery-->
    <script type="text/javascript" src="/resources/plugins/jquery/dist/jquery.timepicker.min.js"></script><!-- 타이머js -->
</body>
</html>