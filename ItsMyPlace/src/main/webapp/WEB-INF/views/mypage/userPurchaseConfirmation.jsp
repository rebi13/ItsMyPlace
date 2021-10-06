<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="utf-8">
<script>




function btn_Refund(){
   var refundWay = prompt("환불사유를 입력해주세요.", "");
   
   if(confirm("정말로 환불하시겠습니까?")){

      $.ajax({
           type: "POST",
           url: "/kakao/refundProc",
           data: {
              rsrvSeq: $("#rsrvSeq").val(),
              rfdReason: refundWay
           },
           datatype: "JSON",
           beforeSend : function (xhr){
              xhr.setRequestHeader("AJAX","true");
           },
           success:function(response){
              if(response.code == 0)
              {
                 alert("환불 처리되었습니다.");
                 location.href = "/mypage/userPayment";
              }
             
              else{
                 alert("환불 진행 중 오류가 발생했습니다. 다시 시도해 주세요.");
              }
              
           },
           complete: function(data)
           {
              //응답이 종료되면
              icia.common.log(data);
           },
           error: function(xhr, status, error)
           {
              icia.common.error(error);
           }
        
        });
   }
   else{
      alert("환불이 취소되었습니다.");
   }
}

$(document).ready(function(){
		
	$("#btnPay").on("click", function(){
		
		var a = $(".aIndex").last().val();
		
		var b = $(".bIndex").last().val();
		
		var menuNumList = "";
		var menuCountList = "";
		var _quantity = 0;

		for(var i=0; i<a; i++){
			menuNumList = menuNumList + $("#menu_Num"+i).val() + " ";
		}
		
		for(var i=0; i<b; i++){
			menuCountList = menuCountList + $("#menu_Count"+i).val() + " ";
			_quantity += Number($("#menu_Count"+i).val());
		}
	   
       $.ajax({
            type: "POST",
            url: "/kakao/payReady",
            data: {
            	rsrvCafe: $("#rsrv_Cafe").val(), 		//예약카페이름 -- 카카오페이 itemName
                rsrvSeat: $("#rsrv_Seat").val(),			//예약자리
                rsrvTime: $("#rsrv_Time").val(),			//예약시간
                rsrvDate: $("#rsrv_Date").val(),			//결제날짜
                originPrice: $("#origin_Price").val(),	//결제금액
                payPoint: $("#use_Point").val(),			//사용한포인트
                resultPrice: $("#result_Price").val(),	//최종결제금액 - 포인트할인 적용 -- 카카오페이 totalAmount 
                rsrvPplCnt: $("#rsrv_PplCnt").val(),		//예약인원
                cafeNum: $("#cafeNum").val(),			//예약한 카페의 번호 -- 카카오페이 itemCode
                menuNum: menuNumList,					//예약한 메뉴의 번호값
                menuCount: menuCountList,
                rsrvSeq: $("#rsrvSeq").val(),
				quantity: _quantity		//수량(메뉴 선택 갯수) -- 카카오페이 quantity
               
            },
            datatype: "JSON",
            beforeSend : function (xhr){
               xhr.setRequestHeader("AJAX","true");
            },
            success:function(response){
               if(response.code == 0)
               {
					var orderId = response.data.orderId;
					var tId = response.data.tId;
					var pcUrl = response.data.pcUrl; 
					//var rsrvSeq = response.data.rsrvSeq;
					
					$("#orderId").val(orderId);
					$("#tId").val(tId);
					$("#pcUrl").val(pcUrl);
					
					var frm = document.getElementById('kakaoForm');	
					
					var win = window.open('', 'kakaoPopUp', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=540,height=700,left=700,top=100');
					    
					frm.submit();
               }
              
               else{
                  alert("결제 진행 중 오류가 발생했습니다. 다시 시도해 주세요.");
               }
               
            },
            complete: function(data)
            {
               //응답이 종료되면
               icia.common.log(data);
            },
            error: function(xhr, status, error)
            {
               icia.common.error(error);
            }
         
         });
		
	});
	
})

function movePage()
{	
	document.insertForm.action = "/kakao/insertTest";
	document.insertForm.submit();
}

</script>

</head>

<body id="body">
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>

<!--상단-->
<section class="page-header">
   <div class="container">
      <div class="row">
         <div class="col-md-12">
            <div class="content">
               <ol class="breadcrumb">
                  <li><a href="/../index">홈</a></li>
                  <li class="active">마이페이지</li>
                  <li class="active">내 결제내역</li>
                  <li class="active">결제정보 자세히 보기</li>
               </ol>
            </div>
         </div>
      </div>
   </div>
</section>

<!-- style="text-align: center;" -->
<div class="page-wrapper">
     <div class="purchase-confirmation shopping">
       <div class="container">

            <div class="row">
              <div class="col-md-8 col-md-offset-2" style="text-align: center;">
                   <div>
                   <c:if test="${!empty myPage}">
                     <div class="purchase-confirmation-details">
                        <table id="purchase-receipt" class="table" style="text-align: center;">
                            <thead>
                           <tr>
                                   <td><strong>결제일시 </strong></td>
                                   <td>${myPage.payDate}</td>                            
                                 </tr>
                            </thead>

                            <tbody>
      
                           <tr>
                                   <td><strong>결제번호 </strong></td>
                                   <td>${myPage.rsrvSeq}</td>
                                 </tr>
                                 <tr>
                                   <td><strong>카페명 </strong></td>
                                   <td>${myPage.cafeName}</td>
                                 </tr>
                                 
                                 <tr>
                                   <td><strong>예약된자리 </strong></td>
                                   <td>${myPage.rsrvSeatList}</td>
                                 </tr>
                                 <tr>
                                   <td><strong>예약시간 </strong></td>
                                   <td>${myPage.rsrvTime}</td>
                                 </tr>
                                 
                                 <tr>
                                   <td><strong>주문내역 </strong></td>
                                    
                                   <td>
                                      <c:forEach var="list" items="${myPage.orderList}" varStatus="status">
                                         <c:out value="${list.menuName}" />
                                         X
                                         <c:out value="${list.menuCount}" />&nbsp;&nbsp;
                                      </c:forEach>
                                   </td>
                                   
                                 </tr>
                                 
                                 <tr>
                                   <td><strong>결제금액 </strong></td>
                                   <td id="originPrice_s">${myPage.originPrice_s}</td>
                                </tr>
                           <tr>
                                   <td><strong>사용 포인트 </strong></td>
                                   <td>${myPage.payPoint_s}</td>
                                </tr>
                                <tr>
                                   <td><strong>최종 결제금액 </strong></td>
                                   <td>${myPage.totalPrice_s}</td>
                                </tr>
                                <tr>
                                   <td><strong>결제 상태 </strong></td>
                                   <td>${myPage.payStep}</td>
                                </tr>
                                <tr>
                                     <td><strong>결제방법 </strong></td>
                                     <c:choose>
                                        <c:when test="${myPage.originPrice_s ne myPage.payPoint_s}"><td>카카오페이</td></c:when>
                                        <c:otherwise><td>포인트전액결제</td></c:otherwise>
                                     </c:choose>      
                                </tr>
                            </tbody>
                        </table>
                       </div>
                    </c:if>
                  </div>
                  <br/>
                  <input type="button" id="btn_Back" name="btn_Back" onclick="history.back(-1);" value="뒤로가기" style="width:80px;height:40px;"/>
                  <c:if test="${myPage.payStep eq '결제완료'}">
                     <input type="button" id="btnRefund" name="btnRefund" onclick="btn_Refund();" value="환불하기" style="width:80px;height:40px;"/>
                  </c:if>
                  <c:if test="${myPage.payStep eq '결제대기'}">
                     <input type="button" id="btnPay" name="btnPay" value="결제하기" style="width:80px;height:40px;"/>
                  </c:if>
                  <input type="hidden" id="rsrvSeq" name="rsrvSeq" value="${myPage.rsrvSeq}" />
                </div>
           </div>
         </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<input type="hidden" id="rsrv_Cafe" name="rsrv_Cafe" value="${myPage.cafeName}" />
<input type="hidden" id="rsrv_Seat" name="rsrv_Seat" value="${myPage.rsrvSeatList}" />
<c:set var="rsrvTime" value="${myPage.rsrvTime}" />
<input type="hidden" id="rsrv_Time" name="rsrv_Time" value="${fn:substring(rsrvTime, 0, 2)}00" />
<input type="hidden" id="rsrv_Date" name="rsrv_Date" value="${myPage.rsrvDate}" />
<input type="hidden" id="origin_Price" name="origin_Price" value="${myPage.originPrice}" />
<input type="hidden" id="use_Point" name="use_Point" value="${myPage.payPoint}" />
<input type="hidden" id="result_Price" name="result_Price" value="${myPage.totalPrice}" />
<input type="hidden" id="rsrv_PplCnt" name="rsrv_PplCnt" value="${myPage.rsrvPplCnt}" />
<input type="hidden" id="cafeNum" name="cafeNum" value="${myPage.cafeNum}" />

<c:forEach var="aa" items="${myPage.orderList}" varStatus="status">
	<input type="hidden" id="menu_Num${status.index}" name="menu_Num${status.index}" value="${aa.menuNum}" />
	<input type="hidden" class="aIndex" id="aIndex${status.index}" name="aIndex${status.index}" value="${status.count}" />
</c:forEach>
<c:forEach var="bb" items="${myPage.orderList}" varStatus="status">
	<input type="hidden" id="menu_Count${status.index}" name="menu_Count${status.index}" value="${bb.menuCount}" />
	<input type="hidden" class="bIndex" id="bIndex${status.index}" name="bIndex${status.index}" value="${status.count}" />
</c:forEach>
    
<form name="insertForm" id="insertForm" method="post">
	<input type="hidden" name="ArsrvSeq" id="ArsrvSeq" value="${myPage.rsrvSeq}" /> 
</form>

<form name="kakaoForm" id="kakaoForm" method="post" target="kakaoPopUp" action="/kakao/payPopUp">
	<input type="hidden" name="orderId" id="orderId" value="" />
	<input type="hidden" name="tId" id="tId" value="" />
	<input type="hidden" name="pcUrl" id="pcUrl" value="" />
</form>

  </body>
  </html>