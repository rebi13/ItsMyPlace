<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="utf-8">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" >
$(document).ready(function(){	

	$("#btnSearch").on("click", function(){
		
		document.eventForm.bbsSeq.value = "";
		document.eventForm.searchStatus.value = $("#searchStatus").val();
		document.eventForm.searchType.value = $("#searchType").val();
		document.eventForm.searchValue.value = $("#searchValue").val();
		document.eventForm.curPage.value = "1";
		
		document.eventForm.action = "/event/list";
		document.eventForm.submit();
	});
	
	//카페이름 클릭시 해당 게시글만 보여주는 [김호준]
	
	
	//내자리얌 전체 이벤트
	$("#btnItsMyPlace").on("click", function(){
		document.eventForm.bbsSeq.value = "";
		document.eventForm.searchType.value = "1";
		document.eventForm.searchValue.value = ""   //여기에 전체 관리자 아이디 넣어줘
		document.eventForm.curPage.value = "1";
		document.eventForm.action = "/event/list"; 
		document.eventForm.submit();
	});
	//한잔 이벤트
	$("#btnCafeHanzan").on("click", function(){
		document.eventForm.bbsSeq.value = "";
		document.eventForm.searchType.value = "1";
		document.eventForm.searchValue.value = "cafe1"
		document.eventForm.curPage.value = "1";
		document.eventForm.action = "/event/list"; 
		document.eventForm.submit();
	});
	
	//카페도넛 이벤트
	$("#btnCafeDonut").on("click", function(){
		document.eventForm.bbsSeq.value = "";
		document.eventForm.searchType.value = "1";
		document.eventForm.searchValue.value = "cafe2"
		document.eventForm.curPage.value = "1";
		document.eventForm.action = "/event/list"; 
		document.eventForm.submit();
	});
	
	//카페노네임 이벤트
	$("#btnCafeNoname").on("click", function(){
		document.eventForm.bbsSeq.value = "";
		document.eventForm.searchType.value = "1";
		document.eventForm.searchValue.value = "cafe3"
		document.eventForm.curPage.value = "1";
		document.eventForm.action = "/event/list"; 
		document.eventForm.submit(); 
	});
	
	//카페담다 이벤트
	$("#btnCafeDamda").on("click", function(){
		document.eventForm.bbsSeq.value = "";
		document.eventForm.searchType.value = "1";
		document.eventForm.searchValue.value = "cafe4"
		document.eventForm.curPage.value = "1";
		document.eventForm.action = "/event/list"; 
		document.eventForm.submit();

	});
	

	//게시물 작성 버튼 [김호준] -> 근데 이거 나중에 관리자만 작성가능하게 처리 그거 해줘야돼 !
	$("#btnWrite").on("click", function(){
		document.eventForm.bbsSeq.value = "";
		document.eventForm.action = "/event/writeForm";
		document.eventForm.submit();
	});
	
	
	//Public 업데이트 버튼
	$("#btnPublicUpdate").on("click", function(){
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var dateString = year + month + day;
		
		document.eventForm.action = "/event/eventPublicUpdateProc";
		document.eventForm.submit();
	});
});	

function eventBoardDetail(bbsSeq)
{
	document.eventForm.bbsSeq.value = bbsSeq;
	document.eventForm.action = "/event/view";
	document.eventForm.submit();
}

function fn_list(curPage)
{
	document.eventForm.bbsSeq.value = "";
	document.eventForm.curPage.value = curPage;
	document.eventForm.action = "/event/list";
	document.eventForm.submit();	
}

</script>

</head>


<body id="body">

<%@ include file="/WEB-INF/views/include/navigation.jsp" %>

<!-- 페이지 헤드 메뉴 시작 -->
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name" style="font-family:fantasy;"><img class="img-responsive" src="/resources/images/event.png"  alt="/resources/images/avater.jpg" style="position:relative; right:45px; width:420px; height:90px;" ></h1>
					<ol class="breadcrumb" id="breadcrumb"> 
						<li><a href="/event/list">전체</a></li>
						<li class="img-responsive"><a id="btnItsMyPlace">내자리얌</a></li>
						<li><a id="btnCafeHanzan">한잔</a></li>
						<li><a id="btnCafeDonut">카페도넛</a></li>
						<li><a id="btnCafeNoname">노네임</a></li>
						<li><a id="btnCafeDamda">카페담다</a></li>
						<c:forEach var="board" items="${eventBoard}" varStatus="status">
							<c:out value="${board.bbsSeq}" />
							<li id="${event.bbsSeq}">${board.userId}</li>						
						</c:forEach>	
					</ol>
						<!-- 여기는 Public Update 버튼  나중에 관리자 페이지로 옮길거야 . -->
						<a id="btnPublicUpdate" class="btn btn-small btn-main" style="margin-left:.10rem;">Public  Update 나중에 없앨거임</a>
				</div>
			</div>
		</div>

	
		<div id="school_list" style="width:90%; margin:auto; margin-top:5rem;">
			<div class="single-product-details" style="display:flex; margin-bottom:0.8rem; position: relative; left: 490px;">
			
				<form class="product-size" name="searchForm" id="searchForm" method="post" style="place-content: flex-end;">
					<select id="searchStatus" name="searchStatus" class="form-control" style="font-size: 1rem; width: 15rem; height: 3rem;">
						<option value="">이벤트 진행 상태</option>
						<option value="Y" <c:if test="${searchStatus =='Y'}">selected</c:if>>진행중</option>
						<option value="N" <c:if test="${searchStatus =='N'}">selected</c:if>>종료</option>
					</select>
					<select id="searchType" name="searchType" class="form-control" style="font-size: 1rem; width: 10rem; height: 3rem; margin-left:.5rem; ">
						<option value="">검색타입</option>
						<option value="1" <c:if test="${searchType == '1'}">selected</c:if>>작성자</option>
						<option value="2" <c:if test="${searchType == '2'}">selected</c:if>>제목</option>
						<option value="3" <c:if test="${searchType == '3'}">selected</c:if>>내용</option>
					</select>
					<input type="text" name="searchValue" id="searchValue" class="text me-sm-2" style="width:25rem; height: 3rem; margin-left:.5rem;" placeholder="내용을 입력하세요" value="${searchValue}">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    			<a id="btnSearch"  class="btn btn-small btn-main " style="margin-left:.10rem;">조회</a>
									
				</form>
			</div>
		</div>
	</div>
</section>	


<!-- 게시판 시작[김호준] -->

<div class="container">
	<div class="row">
		<c:if test="${!empty list}">
			<c:forEach items="${list}" var="eventBoard" varStatus="status">
				<div class="col-md-6">
			        <div class="post">
			          <div class="post-thumb">
			            <a>
			            	<c:if test="${eventBoard.bbsPublic eq 'Y'}">
				            	<c:if test="${eventBoard.fileName ne ''}">
				            		<img class="img-responsive" src="/resources/upload/event/${eventBoard.fileName}" style="overflow:auto; width:600px; height:400px;" alt="/resources/images/avater.jpg" >
				            	</c:if>
				            	
				            	<c:if test="${eventBoard.fileName eq ''}">
				         	   	<img class="img-responsive" src="/resources/upload/event/No-Image.png" style="overflow:auto; width:600px; height:380px;" alt="/resources/images/avater.jpg" >
				            	</c:if>
			            	</c:if>
			            	
			            	
			            	<c:if test="${eventBoard.bbsPublic eq 'N'}"> 
				            	<c:if test="${eventBoard.fileName ne ''}">
					            	<img class="img-responsive" src="/resources/upload/event/${eventBoard.fileName}" style="position:absolute; z-index:1; overflow:auto; width:555px; height:380px;" alt="/resources/images/avater.jpg" >
					            	<img class="img-responsive" src="/resources/images/event/end.png" style="position:relative; z-index:100; overflow:auto; width:600px; height:380px;" alt="/resources/images/avater.jpg" >
				            	</c:if>
				            	
				            	<c:if test="${eventBoard.fileName eq ''}">
				            		<img class="img-responsive" src="/resources/images/event/end.png" style="overflow:auto; width:600px; height:380px;" alt="/resources/images/avater.jpg" >
				            	</c:if>
			            	</c:if>
			            </a>
			          </div>
			          
			          <h2 class="post-title" style="color: #4397CF; font-weight:700; font-size: 28px;"><a href="javascript:void(0)" onclick="eventBoardDetail(${eventBoard.bbsSeq})">${eventBoard.bbsTitle}</a></h2>
			          
			          <div class="post-meta">
			            <ul>
			              <li>
			                <i class="tf-ion-ios-contact"></i>${eventBoard.userName}
			              </li>
			              <li>
			                <i class="tf-ion-android-person"></i>${eventBoard.userId}
			              </li>	
			              <li>
			                <i class="tf-ion-ios-calendar"></i>${eventBoard.regDate}
			              </li>
			              <li>
			                <i class="tf-ion-eye"></i>${eventBoard.bbsReadCnt}
			              </li>
			            </ul>
			          </div>
			          
			          <div class="post-meta">
						<ul>
							<li>
								<c:set var="evtOpnDate" value="${eventBoard.evtOpnDate}" />
								Start<i class="tf-ion-ios-calendar-outline"></i>&nbsp;${fn:substring(evtOpnDate,0,10)}
							</li>
							<li>
								<c:set var="evtClsDate" value="${eventBoard.evtClsDate}" />
								End<i class="tf-ion-ios-calendar-outline"></i>&nbsp;${fn:substring(evtClsDate,0,10)}
							</li>
						</ul>
				       </div>
			          
			          <div class="post-content" >		
			          	<c:if test="${eventBoard.bbsPublic eq 'N'}">
			          		
			          	</c:if>
			          	<c:set var="contentLength" value="${fn:length (eventBoard.bbsContent)}" />
			          	<c:choose>
			          		<c:when test="${contentLength >= 120}">
			          			<p style="overflow:auto; width:515px; height:90px; font-size: 15px;"><c:set var="Content" value="${eventBoard.bbsContent}" /> ${fn:substring(Content,0,120)} . . . . .</p>
			          		</c:when>
			          		<c:otherwise>
			          			<p style="overflow:auto; width:515px; height:90px; font-size: 15px;"><c:set var="Content" value="${eventBoard.bbsContent}" /> ${fn:substring(Content,0,120)}</p>
			          		</c:otherwise>
			          	</c:choose>
			            	<a href="javascript:void(0)" onclick="eventBoardDetail(${eventBoard.bbsSeq})" class="btn btn-main" >READ MORE DETAIL</a>
			          </div>
					</div>
	        	</div>
			</c:forEach>
		</c:if>
	</div>
</div>

<!-- 게시판 끝[김호준] -->



<!--  글쓰기 버튼 --> 
<div class="text-center" style="position: relative; ">
	<c:if test="${boardClass eq 'Y'}">
    	<a href="/event/writeForm" class="btn btn-main " style="height: 4.5rem; width: 45 rem; left: 600 px; ">게시글 작성</a>
    </c:if>
</div>
	


<!--  페이징처리하기 -->
<div class="text-center">
	<ul class="pagination post-pagination">
		<c:if test="${!empty paging}">
			<c:if test="${paging.prevBlockPage gt 0}">
				<li><a href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})">Prev</a></li>
			</c:if>
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
				<c:choose>
					<c:when test="${i ne curPage}">
						<li class="active"><a href="javascript:void(0)" onclick="fn_list(${i})">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="javascript:void(0)" style="cursor:default;">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>	
			
			<c:if test="${paging.nextBlockPage gt 0}">	
				<li><a href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})">Next</a></li>
			</c:if>	
		</c:if>
	</ul>
</div>

<form name="eventForm" id="eventForm" method="post">
	<input type="hidden" name="bbsSeq" value="" id="bbsSeqTest" />
	<input type="hidden" name="searchStatus" value="${searchStatus}" id="searchStatusTest" />
	<input type="hidden" name="searchType" value="${searchType}" id="searchTypeTest" />
	<input type="hidden" name="searchValue" value="${searchValue}" id="searchValueTest" />
	<input type="hidden" name="curPage" value="${curPage}" />
</form>

<form name="searchForm" id="searchForm" method="post">
	<input type="hidden" name="searchType" value="${searchType}" />
	<input type="hidden" name="searchValue" value="${searchValue}" />
	<input type="hidden" name="curPage" value="${curPage}" />			
</form>
	
	
	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
   
</body>
</html>
