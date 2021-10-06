<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Pragma", "no-cache");
%>
<meta charset="utf-8">
<script type="text/javascript">


function fn_list(curPage)
{
   document.bbsForm.bbsSeq.value = "";
   document.bbsForm.curPage.value = curPage;
   document.bbsForm.action = "/mypage/userPoint";
   document.bbsForm.submit();   
}

</script>
</head>

<body id="body">
<c:if test="${user.userClass eq 'N'}">
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>

<!--상단-->
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<ol class="breadcrumb">
						<li><a href="/index">홈</a></li>
						<li class="active">마이페이지</li>
						<li class="active">내 포인트내역</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 본문 -->
<section class="user-dashboard page-wrapper" style="padding-top: 0px;">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <ul class="list-inline dashboard-menu text-center">
          <li><a href="userProfile">내 정보</a></li>
          <li><a href="userPost">내가 쓴 게시물</a></li>
			<c:choose>
			<c:when test="${user.userClass == 'N'}">
	          <li><a href="userPayment">내 결제내역</a></li>
	          <li><a class="active" href="userPoint">내 포인트내역</a></li>
			</c:when>
			<c:otherwise>
			<li><a href="rsrvInfo">예약현황</a></li>
			</c:otherwise>
			</c:choose>
        </ul>




	  <div class="dashboard-wrapper user-dashboard">
		<h3>내 포인트내역</h3>

    
		<div class="checkbox_group">
			<table class="table table-hover" border="2" bordercolor="#ADD8E6">
				<thead>
               	 <tr style="background-color: #4397CF;">
         			<th scope="col" class="text-center" style="width:10%">적립번호</th>
         			<th scope="col" class="text-center" style="width:15%">적립포인트</th>
        		    <th scope="col" class="text-center" style="width:45%">적립사유</th>    
       			    <th scope="col" class="text-center" style="width:15%">적립일자</th>
       			    <th scope="col" class="text-center" style="width:15%">만료일자</th>
              	  </tr>
             	</thead>
				<tbody>
		 			<c:if test="${!empty list}">
					<c:forEach var="userPointList" items="${list}" varStatus="status">
					<tr>
						<td class="text-center" style="width:10%"><c:out value="${userPointList.pointSeq}" /></td>
						<td class="text-center" style="width:15%"><c:out value="${userPointList.savePoint}" /></td>
						<td class="text-center" style="width:45%">${userPointList.savePath}</td>
						<td class="text-center" style="width:15%">${userPointList.saveDate}</td>
						<td class="text-center" style="width:15%">${userPointList.delDate}</td>
					</tr>
					</c:forEach>
					</c:if>
				</tbody>	
			</table>
		</div>
<br/>
<nav>
	<ul class="pagination justify-content-center">
		<c:if test="${!empty paging}">
			<c:if test="${paging.prevBlockPage gt 0}">
				<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})">이전블럭</a></li>
			</c:if>
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
				<c:choose>
					<c:when test="${i ne curPage}">
						<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${i})">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item active"><a class="page-link" href="javascript:void(0)" style="cursor:default;">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
				<c:if test="${paging.nextBlockPage gt 0}">
					<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})">다음블럭</a></li>
				</c:if>
		</c:if>
	</ul>
</nav>

   <br/>
 	  <form name="bbsForm" id="bbsForm" method="post">
     	 <input type="hidden" id="bbsSeq" name="bbsSeq" value="" />
     	 <input type="hidden" id="curPage" name="curPage" value="${curPage}" />
  	 </form>
  	 
  	 			</div>
  	 			
			</div>
		</div>
	</div>			
</section>



<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</c:if>
<input type="hidden" id="userClass" name="userClass" value="${user.userClass}" />
  </body>
  </html>