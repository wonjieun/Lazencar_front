<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>
<%@ page import="dto.adminDto.Image" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>


<meta charset="UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

	<link rel="stylesheet" type="text/css" href="/Manage_Page/css/main.css" />
<!-- 	<link rel="stylesheet" type="text/css" href="./css/paging.css" />   -->
	
	<style>
	.level1 :nth-child(9) .fly {background: #ffb505 !important;}
	</style>
	
 

</head>
<body>

<div id="menu">
   <ul class="level1">
      <li><a href="./home.jsp">Home</a></li>
      <li><a class="fly" href="javascript:void(0);">회원 관리</a>
         <ul>
            <li><a href="./userManage.jsp" >회원목록 조회</a></li>
         </ul>
      </li>
      
      <li><a class="fly" href="javascript:void(0);">예약 관리</a>
         <ul>
            <li><a href="./reservManage.jsp">예약목록 조회</a></li>
         </ul>
      </li>
      
      <li><a class="fly" href="javascript:void(0);">차량 관리</a>
         <ul>
            <li><a href="./carRegister.jsp">차량 등록/해제</a></li>
            <li><a href="./carCheckList.jsp">차량 점검일지</a></li>
         </ul>
      </li>
      
      <li><a class="fly" href="javascript:void(0);">공지 사항</a>
         <ul>
            <li><a href="./noticeManage.jsp">공지사항 등록</a></li>
         </ul>
      </li>
      
      <li><a class="fly" href="javascript:void(0);">후기 관리</a>
         <ul>
            <li><a href="./reviewManage.jsp">후기목록 조회</a></li>
         </ul>
      </li>
      
      <li><a class="fly" href="javascript:void(0);">문의 관리</a>
         <ul>
            <li><a href="./qnaManage.jsp">문의 내역 확인</a></li>
            <li><a href="./qnaRegister.jsp">문의 답변 등록</a></li>
         </ul>
      </li>
		
		<li><a class="fly" href="javascript:void(0);">쿠폰 관리</a>
			<ul>
				<li><a href="./couponRegister.jsp">쿠폰 등록</a></li>
				<li><a href="./couponDelete.jsp">쿠폰 조회/삭제</a></li>
			</ul>
		</li>
		
		<li><a class="fly" href="javascript:void(0);">특가 상품</a>
			<ul>
				<li><a href="./promotionRegister.jsp">특가 등록</a></li>
				<li><a href="./promotionDelete.jsp">특가 조회/삭제</a></li>
			</ul>
		</li>
		
	</ul>
</div>		<!-- sideMenu end -->

<div class="wrap">

<div class="header">
라젠카 관리자 페이지

</div>		<!-- header end -->


<div class="container">


<%
	List<Image> images = (List)request.getAttribute("images");
	for(Image i : images){ %>
		<a href="/FileDoenload?type=i&no="<%=i.getNo() %>"><%=i.getNo() %> <%=i.getImage() %></a><br>
<% } %>




<div class="content">
         <div class="subtop-content bg_subvisual_02_01">
          <h3 class="subtit">특가 상품 조회/삭제</h3>
          <p class="subtxt"><strong>특가 상품을 조회하고 삭제합니다.</strong><br />조회할 특가 상품 조건을 선택하고 검색버튼을 누르시면 특가 상품 목록을 볼 수 있으며<br>특가 상품을 수정/삭제할 수 있습니다.</p>
        </div>
        
	<div class="center" >
						
					<table class="table1">
						<tr>
							<th>검색 내용</th>
						</tr>
						<tr>
							<td class="left right">
							<textarea rows="1" cols="50" id="search_content"></textarea>
							</td>
						</tr>
					</table>
	</div>	
	
		<button class="btnSearch" type="button">검색</button>
		<div class="clear"></div>
	<div>
		 <table id="table2">
			
			<tr>
				<th>no</th>
				<th>상세정보</th>
			</tr>
			<tr>
				<td class="left">cell</td>
				<td class="right"></td>
			</tr>		
			<tr>
				<td class="left">cell</td>
				<td class="right"></td>
			</tr>
			<tr>
				<td class="left">cell</td>
				<td class="right"></td>
			</tr>
			<tr>
				<td class="left">cell</td>
				<td class="right"></td>
			</tr>
			<tr>
				<td class="left">cell</td>
				<td class="right"></td>
			</tr>											
			<tr>
				<td class="left">cell</td>
				<td class="right"></td>
			</tr>															
			<tr>
				<td class="left">cell</td>
				<td class="right"></td>
			</tr>											
		</table>
		</div>
		
		<div class="btnSave">
		<button type="reset">초기화</button>
		<button type="submit">삭제</button>
		</div>
		<div class="clear"></div>
		
<!-- 		<div class="paging"> -->
<!-- 				<a href="#" class="page_first"><img src="./images/page_first.gif" alt="처음" /></a> -->
<!-- 				<a href="#" class="page_prev"><img src="./images/page_prev.gif" alt="이전" /></a> -->
<!-- 				<strong>1</strong> -->
<!-- 				<a href="#" class="page_next"><img src="./images/page_next.gif" alt="다음" /></a> -->
<!-- 				<a href="#" class="page_end"><img src="./images/page_end.gif" alt="마지막" /></a> -->
<!-- 		</div>	 -->
		
		<jsp:include page="/Manage_Page/util/paging.jsp" />

</div>		<!-- content end -->

</div>		<!-- container end -->


</div>		<!-- wrap end -->

</body>
</html>