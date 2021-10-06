<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/progress-bar.css" type="text/css">
<meta charset="UTF-8">
<script type="text/javascript">
$(document).ready(function(){
	
	alert("insertTest" + $("#ArsrvSeq").val());
	$.ajax({
	      type: "POST",
	      url: "/kakao/payProc",
	      data: {
	         rsrvSeq: $("#ArsrvSeq").val(),
	      },
	      datatype: "JSON",
	      beforeSend : function (xhr){
	         xhr.setRequestHeader("AJAX","true");
	      },
	      success:function(response){
	         if(response.code == 0)
	         {
	            alert("결제 성공(업데이트)");
	            //location.href="/mypage/userPayment";
	         }
	         else if(response.code == 503)
	         {
	            alert("회원 포인트 갱신에 실패했습니다.");
	         }
	         else
	         {
	            alert("결제단계 갱신에 실패했습니다.");
	         }
	         location.href="/mypage/userPayment";
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
	//document.testForm.action = "/mypage/userPayment";
	//document.testForm.submit();
});
</script>
<title>test</title>
</head>
<body>
<input type="text" name="aaaa" id="aaaa" value="abcdefg" />
<form name="testForm" method="post">
	<input type="hidden" name="ArsrvSeq" id="ArsrvSeq" value="${rsrvSeq}"/>
</form> 
</body>
</html>