<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.adminDao.PromotionRegisterDao" %>
<%@ page import="dao.adminDao.PromotionRegisterDaoImpl" %>

    
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
	
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script> 
<script type="text/javascript">
  
  //초기화 버튼
  $(document).ready(function(){
	  
  });
  
  
  
  
  //리스트 하단에 추가로 출력해주기 위해서 토글 함수 생성
  	function showDetail(id){
		  obj = document.getElementById(id);
		  
		  if(obj.style.display == "none"){
			  obj.style.display = "table-row";
		  }else{
			  obj.style.display="none";
		  }
  	}

  //   	검색창에 값이 있는가 판별
	function checkSearch_content(){
		if($("#search_content").val()==''){
			return false;
		}else{
			return true;
		}
	}
	
// 	검색 및 정렬하는 ajax
$(document).ready(function(){
	$("#searchPro").click(function(){
		var clicked="clicked";
		var content=$("#search_content").val();

		console.log("입력내용:"+content);
		
		if(checkSearch_content()==true){
			console.log("내용있음");
			
			var $form = $("<form>").attr("action", "/admin/promotionList.do").attr("method", "post");
			$("<input>").attr("type", "hidden").attr("name", "content").attr("value", content).appendTo($form);
			$("<input>").attr("type", "hidden").attr("name", "clicked").attr("value", clicked).appendTo($form);
			$form.appendTo($(document.body));
			
			$form.submit();	
			
		}else{
			alert("검색어를 입력하세요");
			console.log("내용을 채워주세요");
		}
	});
	
});
  </script>
 

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
				<li><a href="/admin/promotionRegister.do">특가 등록</a></li>
				<li><a href="/admin/promotionList.do">특가 조회/삭제</a></li>
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
	List<PromotionManage> dto = (List)request.getAttribute("dto");
	for(PromotionManage i : dto){ %>
		<a href="/FileDownload?type=i&no="<%=i.getName() %>"><%=i.getName() %> <%=i.getBannerImg() %></a><br>
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
	
		<button class="btnSearch" id="saerchPro" type="button">검색</button>
		<div class="clear"></div>
	<div>
		 <table id="table2">
			<thead>
			<tr>
				<th>특가 상품 명</th>
				<th>특가 상품 시작일</th>
				<th>특가 상품 종료일</th>
				<th>특가 상품 배너 이미지</th>
				<th>특가 상품 상세 이미지</th>
			</tr>
			</thead>
			
			<tbody>
			
			<c:forEach items="${list }" begin="0" end="${paging.listCount }" var="i" varStatus="listNumber">
			
			<tr>
<%-- 				${i.dto 변수명 } --%>
				<td class="left">${i.name }</td>
				<td>${i.StartDate }</td>
				<td>${i.EndDate }</td>
				<td>${i.BannerOrg }</td>
				<td>${i.DetailOrg }</td>
				<td class="right"></td>
			</tr>	
			
			</c:forEach>
			</tbody>
			
			</table>
		</div>
		
		<div class="btnSave">
		<button typ="reset">초기화</button>
		<button type="submit">삭제</button>
		</div>
		<div class="clear"></div>
		
		<jsp:include page="/Manage_Page/util/paging.jsp" />

</div>		<!-- content end -->

</div>		<!-- container end -->


</div>		<!-- wrap end -->

</body>
</html>

