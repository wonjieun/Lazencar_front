<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>

<meta charset="UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

	<link rel="stylesheet" type="text/css" href="./css/main.css" />
	<link rel="stylesheet" type="text/css" href="./css/paging.css" />  

	<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
	<style>
	.level1 :nth-child(2) .fly {background: #ffb505 !important;}
	</style>
	
  <script type="text/javascript">
	/*
  만들어야 할 기능들
	1. 특별한 검색조건을 지정하지 않아도 바로 회원 목록 불러오기
	2. 검색 조건에 따른 회원 목록 정렬, 필요한 정보만 불러오기
	3. 페이징.. 
  */
  
$(document).ready(function(){
			
		$("#searchMember").click(function(){
			var searchClicked="눌림";
			var memId="";		//카테고리에 따른 조건 지정 변수
			var memJumin="";
			
			var category = $("#category").val();
			var content = $("#search_content").val();
			var sort = $("#sort").val();
			
			//입력 데이터 확인 코드
			console.log("카테고리 선택 : "+category);
			console.log("검색내용 : "+content);
			console.log("정렬  : "+sort);
			
			if(category=="회원 계정"){
				memId = content;		
				return;
			} else if(category=="출생 년도"){
				memJumin = content;		
				return;
			} else{
// 				showAll
				console.log("기준 ㅇㅔ러");

			}
			
		var $form = $("<form>").attr("action", "/Lazencar_front/admin/userManage.do").attr("method", "post");
		$("<input>").attr("type", "hidden").attr("name", "searchClicked").attr("value", searchClicked).appendTo($form);
		$("<input>").attr("type", "hidden").attr("name", "category").attr("value", category).appendTo($form);
		$("<input>").attr("type", "hidden").attr("name", "content").attr("value", content).appendTo($form);
		$("<input>").attr("type", "hidden").attr("name", "sort").attr("value", sort).appendTo($form);
		$form.appendTo($(document.body));
		
		$form.submit();	
		

		//각 입력칸들의 데이터를 받아와서
// 		console.log();  받아와지는지확인하고
// 			$.ajax({
// 				type : "POST",
// 				url : "/admin/userManage.do",
// 				data : {
// 					memId:memId,
// 					memJumin:memJumin,
// 					searchClicked:searchClicked
// 					},
// 				dataType : "json",
// 				success : function(data) {
// 					alert("회원목록을 불러옵니다.");
	
				
// 				},
// 				error : function(e) {
// 					console.log("------error------");
// 					console.log(e.responseText);
// 				}
// 				});
		
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
            <li><a href="/admin/userManage.do" >회원목록 조회</a></li>
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


<div class="content">
 
        <div class="subtop-content bg_subvisual_02_01">
          <h3 class="subtit">회원목록 조회</h3>
          <p class="subtxt"><strong>회원목록을 조회하고 관리합니다.</strong><br />조회할 회원조건을 선택하고 검색버튼을 누르시면 해당 회원목록을 볼 수 있습니다.</p>
        </div>
        
	<div class="center" >
						
		 <table class="table1">
			<tr>
				<th>카테고리</th>
				<th>검색 내용</th>
				<th>정렬</th>
			</tr>
			<tr>
				<td class="left">
				<select class="sort" id="category" name="category">
				    <option value="회원계정">회원 계정
				    <option value="출생년도">출생 년도
				  </select>
				</td>
				
				<td>		
				<textarea rows="1" cols="30" id="search_content"></textarea>
				</td>

				<td class="right">		<!-- 정렬 -->
				  <select class="sort" id="sort" name="sort">
					<option value="회원이름">회원 이름
				    <option value="면허여부">면허 여부
				    <option value="예약날짜">예약 날짜
				    <option value="예약상태">예약 상태
				    <option value="결제상태">결제 상태
				  </select>
				</td>
			</tr>		
										
		</table>
		
	</div>	
	
		<button class="btnSearch" id="searchMember" type="button" >검색</button>
		<div class="clear"></div>
		
	<div>
		 <table id="table2">
			
			<tr>
				<th>no</th>
				<th>상세 정보</th>
			</tr>
<c:forEach items="${list }" var="i">
			<tr>
				<td>${i.memId }</td>
				<td>${i.memPw }</td>
				<td>${i.memName }</td>
				<td>${i.memPhone }</td>
				<td>${i.memJumin }</td>
				<td>${i.memEmail }</td>
				<td>${i.memAddr }</td>
				<td>${i.memLicense }</td>
			</tr>
</c:forEach>												
		</table>
		</div>
				<div class="clear"></div>
		<div class="paging">
				<a href="#" class="page_first"><img src="./images/page_first.gif" alt="처음" /></a>
				<a href="#" class="page_prev"><img src="./images/page_prev.gif" alt="이전" /></a>
				<strong>1</strong>
				<a href="#" class="page_next"><img src="./images/page_next.gif" alt="다음" /></a>
				<a href="#" class="page_end"><img src="./images/page_end.gif" alt="마지막" /></a>
		</div>	
		

</div>		<!-- content end -->

</div>		<!-- container end -->


</div>		<!-- wrap end -->

</body>
</html>