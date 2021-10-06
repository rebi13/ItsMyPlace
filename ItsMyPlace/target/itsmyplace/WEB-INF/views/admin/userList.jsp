<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="utf-8">
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>

<style>

     
      td {
        text-align: center;
      }
</style>
<script type="text/javascript">
function del_table(k_obj)
{
	document.getElementById('k_tbody').removeChild(k_obj.parentElement.parentElement);
}


function selectAll(selectAll)  {
const checkboxes 
   = document.getElementsByName('animal');

checkboxes.forEach((checkbox) => {
checkbox.checked = selectAll.checked;
})
}


var arr = $('input[name=_selected_]:checked').serializeArray().map(function(item) { return item.value });
﻿

 

</script>
</head>

<body id="body">
<section class="user-dashboard page-wrapper">
	
	<div class="container">
<h1 class="page-name">회원 관리</h1><br><br>
		<div class="row">
		
			<div class="col-md-12">
				<ul class="list-inline dashboard-menu text-center">
					<li><a class="active"href="/admin/userList">회원 리스트</a></li>			
					<li><a href="/admin/userPoint">포인트 관리</a></li>
					<li><a href="/admin/userWrite">게시글 관리</a></li>
					<li><a href="/admin/userDelete">탈퇴 회원</a></li>
				</ul>
				<div class="dashboard-wrapper user-dashboard">
					<div class="table-responsive">
					<form action="/examples/media/action_target.php" method="get" align="right">
				    	검색 : <input type="search" name="q">
				    	<select>				    	
				            <option value="">검색타입</option>
				            <option value="1">작성자</option>
				            <option value="2">제목</option>
				            <option value="3">내용</option>
				          	</select>				    	
				    	<input type="submit">
					</form><br>
						<table class="table">
						
							<thead>
								<tr>
									<th scope="col" class="text-center" style="width:5%">
									<input type='checkbox'name='animal' value='selectall'onclick='selectAll(this)'/></th>
					                <th scope="col" class="text-center" style="width:15%">아이디</th>
					                <th scope="col" class="text-center" style="width:15%">회원명</th>
					                <th scope="col" class="text-center" style="width:10%">회원코드</th>
					                <th scope="col" class="text-center" style="width:10%">성별</th>
					                <th scope="col" class="text-center" style="width:15%">보유 포인트</th>
					                <th scope="col" class="text-center" style="width:15%">가입일자</th>
					                <th scope="col" class="text-center" style="width:15%">기능</th>
								</tr>
							</thead>
							<tbody id="k_tbody">
								<tr>
									<td><input type='checkbox'name='animal' value='dog'/></td>
									<td>1234</td>
									<td>콩쥐</td>
					                <td><a href="/cs/faq">c</a></td>
					                <td>여</td>
					                <td>2000p</td>
					                <td>2021.01.01</td>
									<td>
										<Input type="button" value="상세보기" onclick="" />
										<Input type="button" value="삭제" onclick="del_table(this)" />
									</td>
								</tr>
								<tr>
									<td><input type='checkbox'name='animal' value='dog'/></td>
									<td>1234</td>
									<td>콩쥐</td>
					                <td><a href="/cs/faq">c</a></td>
					                <td>여</td>
					                <td>2000p</td>
					                <td>2021.01.01</td>
									<td>
										<Input type="button" value="상세보기" onclick="" />
										<Input type="button" value="삭제" onclick="del_table(this)" />
									</td>
								</tr>
								<tr>
									<td><input type='checkbox'name='animal' value='dog'/></td>
									<td>1234</td>
									<td>콩쥐</td>
					                <td><a href="/cs/faq">c</a></td>
					                <td>여</td>
					                <td>2000p</td>
					                <td>2021.01.01</td>
									<td>
										<Input type="button" value="상세보기" onclick="" />
										<Input type="button" value="삭제" onclick="del_table(this)" />
									</td>
								</tr>
								<tr>
									<td><input type='checkbox'name='animal' value='dog'/></td>
									<td>1234</td>
									<td>콩쥐</td>
					                <td><a href="/cs/faq">c</a></td>
					                <td>여</td>
					                <td>2000p</td>
					                <td>2021.01.01</td>
									<td>
										<Input type="button" value="상세보기" onclick="" />
										<Input type="button" value="삭제" onclick="del_table(this)" />
									</td>
								</tr>
								<tr>
									<td><input type='checkbox'name='animal' value='dog'/></td>
									<td>1234</td>
									<td>콩쥐</td>
					                <td><a href="/cs/faq">c</a></td>
					                <td>여</td>
					                <td>2000p</td>
					                <td>2021.01.01</td>
									<td>
										<Input type="button" value="상세보기" onclick="" />
										<Input type="button" value="삭제" onclick="del_table(this)" />
									</td>
								</tr>
								<tr>
									<td><input type='checkbox'name='animal' value='dog'/></td>
									<td>1234</td>
									<td>콩쥐</td>
					                <td><a href="/cs/faq">c</a></td>
					                <td>여</td>
					                <td>2000p</td>
					                <td>2021.01.01</td>
									<td>
										<Input type="button" value="상세보기" onclick="del_table(this)" />
										<Input type="button" value="삭제" onclick="del_table(this)" />
									</td>
								</tr>
								<tr>
									<td><input type='checkbox'name='animal' value='dog'/></td>
									<td>1234</td>
									<td>콩쥐</td>
					                <td><a href="/cs/faq">c</a></td>
					                <td>여</td>
					                <td>2000p</td>
					                <td>2021.01.01</td>
									<td>
										<Input type="button" value="상세보기" onclick="" />
										<Input type="button" value="삭제" onclick="del_table(this)" />
									</td>
								</tr>
								<tr>
									<td><input type='checkbox'name='animal' value='dog'/></td>
									<td>1234</td>
									<td>콩쥐</td>
					                <td><a href="/cs/faq">c</a></td>
					                <td>여</td>
					                <td>2000p</td>
					                <td>2021.01.01</td>
									<td>
										<Input type="button" value="상세보기" onclick="" />
										<Input type="button" value="삭제" onclick="del_table(this)" />
									</td>
								</tr>
								
							
							</tbody>
						</table><br>
						
        				</div>
					</div>
				</div>
				
			</div>
		</div>
		
		
	</div>
	
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>

  </body>
  </html>