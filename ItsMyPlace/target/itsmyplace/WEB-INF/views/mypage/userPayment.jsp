<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="utf-8">
<script>

function fn_list(curPage){
	
	document.bbsForm.curPage.value = curPage;
	document.bbsForm.action = "/mypage/userPayment";
	document.bbsForm.submit();
}

</script>
</head>

<body id="body">
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<!-- Modal -->
<div class="modal product-modal fade" id="product-modal">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		<i class="tf-ion-close"></i>
	</button>
  	<div class="modal-dialog " role="document">
    	<div class="modal-content">
	      	<div class="modal-body">
	        	<div class="row">
	        		<div class="col-md-8 col-sm-6 col-xs-12">
	        			<div class="modal-image">
		        			<img class="img-responsive" src="resources/images/shop/products/modal-product.jpg" alt="product-img" />
	        			</div>
	        		</div>
	        		<div class="col-md-4 col-sm-6 col-xs-12">
	        			<div class="product-short-details">
	        				<h2 class="product-title">GM Pendant, Basalt Grey</h2>
	        				<p class="product-price">$200</p>
	        				<p class="product-short-description">
	        					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem iusto nihil cum. Illo laborum numquam rem aut officia dicta cumque.
	        				</p>
	        				<a href="cart.html" class="btn btn-main">Add To Cart</a>
	        				<a href="product-single.html" class="btn btn-transparent">View Product Details</a>
	        			</div>
	        		</div>
	        	</div>
	        </div>
    	</div>
  	</div>
</div><!-- /.modal -->

<body id="body">

<!--상단-->
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<ol class="breadcrumb">
						<li><a href="index.html">Home</a></li>
						<li class="active">My Account</li>
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
          <li><a href="userProfile">Profile</a></li>	
          <li><a href="userPost">My Post</a></li>
          <li><a class="active" href="userPayment">Payment Statement</a></li>
        </ul>
        
				
				<div class="dashboard-wrapper user-dashboard">
					<h3>결제 내역서</h3>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>주문 번호</th>
									<th>이용 날짜</th>
									<th>이용 시간</th>
									<th>카페 이름</th>
									<th>결제 금액</th>
									<th>결제 상태</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${!empty rsRv}">
							<c:forEach var="payInfo" items="${rsRv}" varStatus="status">
								<tr>
									<td>${payInfo.rsrvSeq}</td>
									<td>${payInfo.rsrvDate}</td>
									<td>${payInfo.rsrvTime}</td>
									<td>${payInfo.cafeName}</td>
									<td>${payInfo.totalPrice_s}</td>
									<td>${payInfo.payStep}</td>
									<td><a href="/mypage/userPurchaseConfirmation?rsrvSeq=${payInfo.rsrvSeq}" class="btn btn-default">상세보기</a></td>
								</tr>
							</c:forEach>
							</c:if>
								<!--  
								<tr>
									<td>#451231</td>
									<td>Mar 25, 2016</td>
									<td>3</td>
									<td>$150.00</td>
									<td><window.open('userPurchaseConfirmation','PopupWin','width=450,height=350,scrollbars=no'); class="btn btn-default">상세보기</a></td>
								</tr>
								-->
							</tbody>
						
						</table>
					</div>	
					
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
   
   <form name="bbsForm" id="bbsForm" method="post">
      <input type="hidden" name="hiBbsSeq" value="" />
      <input type="hidden" name="curPage" value="${curPage}" />
   </form>		
								
				</div>			
			</div>
		</div>
	</div>

</section>


 <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    


  </body>
  </html>