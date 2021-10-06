<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<body id="body">
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<img src="/resources/images/logo22.png" alt="image" width="230" height="50" />
					<ol class="breadcrumb">
						<li><a href="/index">Home</a></li>
						<li class="active">결제 정보</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>

<div class="page-wrapper">
  	<div class="purchase-confirmation shopping">
    	<div class="container">
      		<div class="row">
        		<div class="col-md-8 col-md-offset-2">
          			<div class="block ">
            			<div class="purchase-confirmation-details">
				            <table id="purchase-receipt" class="table">
				                <thead>
									<tr>
					                    <th><strong>예약 번호</strong></th>
					                    <th>33056</th>
				                  	</tr>
				                </thead>

				                <tbody>

				                  	<tr>
				                    	<td class=""><strong>예약카페</strong></td>
				                    	<td class="">Complete</td>
				                  	</tr>


				                  	<tr>
				                    	<td><strong>예약 자리</strong></td>
				                    	<td>Free Purchase</td>
				                  	</tr>
				                  	<tr>
				                    	<td><strong>예약 날짜 시간</strong></td>
				                    	<td>December 20, 2016</td>
				                  	</tr>
				                  	<tr>
				                    	<td><strong>주문 내역</strong></td>
				                    	<td>
				                      	$18.00        </td>
				                    </tr>

				                    <tr>
				                      	<td><strong>결제방법</strong></td>
				                      	<td>카카오페이</td>
				                    </tr>
				                </tbody>
				            </table>
              			</div>
            		</div>
          		</div>
        	</div>
      	</div>
    </div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
 </body>
 </html>

