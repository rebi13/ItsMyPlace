<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<style type="text/css">
  
.product-content .target
{
	display:block;
	font-weight:nomal;
	white-space:nowrap;
	overflow: hidden;
	text-overflow:ellipsis;
}
  
.star_rating
{
	font-size:0;
	letter-spacing:-4px;
}

.star_rating a
{
    font-size:15px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}

.star_rating a:first-child
{
	margin-left:0;
}
.star_rating a.on
{
	color:#CC0000;
}

.section .container .row
{
	position: relative;
}

.section .container .row nav
{
	position: absolute;
	bottom: -10vh;
	left: 49.5%;
}
</style>

<script>
function fn_list(curPage)
{
	document.reviewForm.rsrvSeq.value = "";
	document.reviewForm.curPage.value = curPage;
	document.reviewForm.action = "/board/review";
	document.reviewForm.submit();   
}

$(document).ready(function() {
    
	$("#btnWrite").on("click", function() {
	      
		document.reviewForm.rsrvSeq.value = "";
		document.reviewForm.action = "/board/reviewWrite";
		document.reviewForm.submit();
	});
	   
	$("#btnSearch").on("click", function() {
		document.reviewForm.rsrvSeq.value = "";
		document.reviewForm.searchType.value = $("#_searchType").val();
		document.reviewForm.searchValue.value = $("#_searchValue").val();
		document.reviewForm.curPage.value = "1";
		document.reviewForm.action = "/board/review";
		document.reviewForm.submit();
	});
		
	$("#btnUpdate").on("click", function() {
		document.reviewForm.action = "/board/reviewUpdate";
		document.reviewForm.submit();
	});
});
</script>

</head>

<body class="is-loading">
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name"><img src="/resources/images/KakaoTalk_20210819_131147855_02.png" alt="image" width="200" height="60"/></h1>
					<ol class="breadcrumb">
						<li><a href="/index">Home</a></li>
						<li class="active">Review</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>


<section class="products section">
	<div class="container">
		<div class="row">
		
			<!-- 조회창 -->
			<div class="ml-auto input-group" style="display:flex; margin-bottom:0.8rem; position: relative; left: 630px;">
				<select name="_searchType" id="_searchType" class="custom-select" style="font-size:1rem; width:10rem; height:3rem; margin-left:.5rem;">
					<option value="">조회 항목</option>
					<option value="1" <c:if test="${searchType eq '1'}"> selected</c:if>>카페이름</option>
					<option value="2" <c:if test="${searchType eq '2'}"> selected</c:if>>제목</option>
					<option value="3" <c:if test="${searchType eq '3'}"> selected</c:if>>내용</option>
				</select>
				<input type="text" name="_searchValue" id="_searchValue" value="${searchValue}" class="form-control mx-1" maxlength="20" style="width:25rem; height: 3rem; margin-left:.5rem;" placeholder="조회값을 입력하세요." />
				<button type="button" id="btnSearch" class="btn btn-secondary mb-3 mx-1" style="margin-left:.10rem;">조회</button>
			</div>
			
<c:if test="${!empty reviewList}">
	<c:forEach var="review" items="${reviewList}" varStatus="status">
			
			<div class="col-md-3">
				<div class="product-item">
					<div class="product-thumb">
						<img class="img-responsive" src="/resources/reviewimages/${review.phtName}" alt="product-img" />
						<div class="preview-meta">
							<ul>
								<c:if test="${review.bbsPublic eq 'Y'}">
								<li>
									<button type="button" id="viewModal" data-toggle="modal" data-target="#product-modal-${review.rsrvSeq}">
										<i class="tf-ion-ios-search-strong"></i>
									</button>
								</li>
								</c:if>
								<li>							
			                        <button type="button"><i class="tf-ion-ios-heart"></i></button>
								</li>
							</ul>
                      	</div>
					</div>
					<div class="product-content">
						<h4><c:out value="${review.bbsTitle}" /></h4>
						<div class="target"><c:out value="${review.bbsContent}" /></div>
						<c:if test="${review.bbsStar == 1.0}">
						<div class="star_rating">
							<a href="#" class="on">★</a>
						    <a href="#" >★</a>
						    <a href="#" >★</a>
						    <a href="#">★</a>
						    <a href="#">★</a>
						</div>
						</c:if>
						<c:if test="${review.bbsStar == 2.0}">
						<div class="star_rating">
							<a href="#" class="on">★</a>
						    <a href="#" class="on">★</a>
						    <a href="#" >★</a>
						    <a href="#">★</a>
						    <a href="#">★</a>
						</div>
						</c:if>
						<c:if test="${review.bbsStar == 3.0}">
						<div class="star_rating">
							<a href="#" class="on">★</a>
						    <a href="#" class="on">★</a>
						    <a href="#" class="on">★</a>
						    <a href="#">★</a>
						    <a href="#">★</a>
						</div>
						</c:if>
						<c:if test="${review.bbsStar == 4.0}">
						<div class="star_rating">
							<a href="#" class="on">★</a>
						    <a href="#" class="on">★</a>
						    <a href="#" class="on">★</a>
						    <a href="#" class="on">★</a>
						    <a href="#">★</a>
						</div>
						</c:if>
						<c:if test="${review.bbsStar == 5.0}">
						<div class="star_rating">
							<a href="#" class="on">★</a>
						    <a href="#" class="on">★</a>
						    <a href="#" class="on">★</a>
						    <a href="#" class="on">★</a>
						    <a href="#" class="on">★</a>
						</div>
						</c:if>																		
					</div>
				</div>
			</div>	
			
				<!-- Modal -->
					<div class="modal product-modal fade" id="product-modal-${review.rsrvSeq}">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<i class="tf-ion-close"></i>
						</button>
					  	<div class="modal-dialog " role="document">
					    	<div class="modal-content">
						      	<div class="modal-body">
						        	<div class="row">
						        		<div class="col-md-8 col-sm-6 col-xs-12">
						        			<div class="modal-image">
							        			<img class="img-responsive" src="/resources/reviewimages/${review.phtName}" alt="product-img" />
						        			</div>
						        		</div>
						        		<div class="col-md-4 col-sm-6 col-xs-12">
						        			<div class="product-short-details">
						        				<h2 class="product-title"><c:out value="${review.bbsTitle}" /></h2>
						        				<p class="product-short-description"><c:out value="${review.cafeName}" /></p>
									        	<c:if test="${review.bbsStar == 1.0}">
												<div class="star_rating">
													<a href="#" class="on">★</a>
												    <a href="#" >★</a>
												    <a href="#" >★</a>
												    <a href="#">★</a>
												    <a href="#">★</a>
												</div>
												</c:if>
												<c:if test="${review.bbsStar == 2.0}">
												<div class="star_rating">
													<a href="#" class="on">★</a>
												    <a href="#" class="on">★</a>
												    <a href="#" >★</a>
												    <a href="#">★</a>
												    <a href="#">★</a>
												</div>
												</c:if>
												<c:if test="${review.bbsStar == 3.0}">
												<div class="star_rating">
													<a href="#" class="on">★</a>
												    <a href="#" class="on">★</a>
												    <a href="#" class="on">★</a>
												    <a href="#">★</a>
												    <a href="#">★</a>
												</div>
												</c:if>
												<c:if test="${review.bbsStar == 4.0}">
												<div class="star_rating">
													<a href="#" class="on">★</a>
												    <a href="#" class="on">★</a>
												    <a href="#" class="on">★</a>
												    <a href="#" class="on">★</a>
												    <a href="#">★</a>
												</div>
												</c:if>
												<c:if test="${review.bbsStar == 5.0}">
												<div class="star_rating">
													<a href="#" class="on">★</a>
												    <a href="#" class="on">★</a>
												    <a href="#" class="on">★</a>
												    <a href="#" class="on">★</a>
												    <a href="#" class="on">★</a>
												</div>
												</c:if>	
						        				<p class="product-short-description"><c:out value="${review.bbsContent}" /></p>
						        				<button type="button" id="btnUpdate" class="btn btn-main">수정</button>
						        				<button type="button" id="btnDelete" class="btn btn-main">삭제</button>
						        			</div>
						        		</div>
						        	</div>
						        </div>
					    	</div>
					  	</div>
					</div>
				<!-- /modal -->
								
			</c:forEach>
		</c:if>
		
				
		<!-- 페이징 -->
		<table>
			<tfoot>
				<tr>
					<td colspan="5"></td>
				</tr>
			</tfoot>
		</table>
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
		
		<!-- 글쓰기 버튼 -->
			<button type="button" id="btnWrite" class="btn btn-main">글쓰기</button>		
		
		<form name="reviewForm" id="reviewForm" method="post">
			<input type="hidden" name="rsrvSeq" value="" />
			<input type="hidden" name="searchType" value="${searchType}" />
			<input type="hidden" name="searchValue" value="${searchValue}" />
			<input type="hidden" name="curPage" value="${curPage}" />
		</form>

		</div>
	</div>	
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>