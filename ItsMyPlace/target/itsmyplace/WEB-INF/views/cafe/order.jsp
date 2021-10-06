<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script>

function javascript(){
    
    document.getElementById("pay").style.border = "3px solid #4397cf"; 
    location.href = "/pay";//3픽셀로 색 넣습니다.        
    
}

function comm() {
	alert('준비되지 않은 서비스입니다.');
}

</script>
</head>

<body id="body">
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<img src="/resources/images/logo21.png" alt="image" width="230" height="50" />
					<ol class="breadcrumb">
						<li><a href="/index">Home</a></li>
						<li class="active">checkout</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>

   <div class="checkout shopping">
      <div class="container">
         <div class="row">
            <div class="col-md-8">
               <div class="block billing-details">
                  <h4 class="widget-title">주문자 정보</h4>
                  <form class="checkout-form">
                     <div class="form-group">
                        <label for="full_name">예약자 이름</label>
                        <input type="text" class="form-control" id="full_name" placeholder="">
                     </div>
                     <div class="form-group">
                        <label for="user_address">예약 카페</label>
                        <input type="text" class="form-control" id="user_address" placeholder="">
                     </div>
                     <div class="checkout-country-code clearfix">
                        <div class="form-group">
                           <label for="user_post_code">예약자리</label>
                           <input type="text" class="form-control" id="user_post_code" name="zipcode" value="">
                        </div>
                        <div class="form-group" >
                           <label for="user_city">예약 시간</label>
                           <input type="text" class="form-control" id="user_city" name="city" value="">
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="user_country">결제 날짜</label>
                        <input type="text" class="form-control" id="user_country" placeholder="">
                     </div>
                  </form>
               </div>
               <div class="block">
                  <h4 class="widget-title">결제하기</h4>
                  <div class="checkout-product-details">
                     <div class="payment">
                        <div class="card-details">
                           <form  class="checkout-form">                                                     
                              <a href="/cafe/pay">
                              <img src="/resources/images/kakao.png" alt="image" width="150" height="150" onclick='javascript()'name="pay" id="pay"/>
                              </a >
                              <img src="/resources/images/comm.png" alt="image" width="150" height="150" onclick='javascript:comm()'/>
                              <img src="/resources/images/comm.png" alt="image" width="150" height="150" onclick='javascript:comm()'/>
				          </form>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-md-4">
               <div class="product-checkout-details">
                  <div class="block">
                     <h4 class="widget-title">결제 상품</h4>
                     <div class="media product-card">
                        <a class="pull-left" href="product-single.html">
                           <img class="media-object" src="/resources/images/shop/cart/cart-1.jpg" alt="Image" />
                        </a>
                        <div class="media-body">
                           <h4 class="media-heading"><a href="product-single.html">상품명 들어오기(리스트로)</a></h4>
                           <p class="price">가격</p>
                           <span class="remove" >Remove</span>
                        </div>
                     </div>
                     <div class="discount-code">
                        <p>적립금 사용하기 <a data-toggle="modal" data-target="#coupon-modal" href="#!">클릭!</a></p>
                     </div>
                     <ul class="summary-prices">
                        <li>
                           <span>Subtotal:</span>
                           <span class="price">$190</span>
                        </li>
                        <li>
                           <span>Shipping:</span>
                           <span>Free</span>
                        </li>
                     </ul>
                     <div class="summary-total">
                        <span>총 금액</span>
                        <span>$250</span>
                     </div>
                     <div class="verified-icon">
                        <img src="/resources/images/shop/verified.png">
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

   <!-- Modal -->
   <div class="modal fade" id="coupon-modal" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-body">
               <form>
                  <div class="form-group">
                     <input class="form-control" type="text" placeholder="Enter Coupon Code">
                  </div>
                  <button type="submit" class="btn btn-main">Apply Coupon</button>
               </form>
            </div>
         </div>
      </div>
   </div>
 <%@ include file="/WEB-INF/views/include/footer.jsp" %>
  </body>
  </html>
</body>
</html>