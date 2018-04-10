<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Promotion" %>
<%@ page import="dao.adminDao.PromotionRegisterDao" %>
<%@ page import="dao.adminDao.PromotionRegisterDaoImpl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<html>

<head>

<meta charset="UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

<link rel="stylesheet" type="text/css" href="/Manage_Page/css/main.css" />
	
<style>
	tr.hiddenTr{
 	display:none;  
/*  	display:table-row;  */
	}
	tr.hiddenTr td{
		padding: 15px 0 15px 100px;
	
	}
	tr.hiddenTr td div{    
	text-align: left;
	float: left; 
	width: 33%;
	margin-left:30px;
	}
	tr.hiddenTr td div font{
		font-size:17px;
	}
	tr.hiddenTr td div button{
		text-align:right;
	}

.level1 :nth-child(9) .fly {background: #ffb505 !important;}
</style>
	
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script> 
<script type="text/javascript">
  
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
	
//수정 버튼 눌렀을시 실행
function update_clicked(a){
	if(confirm("수정하시겠습니까?")){
		var btnEdit = "updatePromotion";
		var key_proNum = $("#key_proNum_"+a).text();		
		var key_proName = $("#key_proName_"+a).val();
		var key_proStartDate = $("#key_startDate_"+a).val();
		var key_proEndDate = $("#key_endDate_"+a).val();
		
		//확인
		console.log(key_proNum);
		console.log(key_proName);
		console.log(key_proStartDate);
		console.log(key_proEndDate);
		
		var $form3 = $("<form>").attr("action","/admin/promotionList.do").attr("method","get");
		$("<input>").attr("type","hidden").attr("name","key_proNum").attr("value",key_proNum).appendTo($form3);
		$("<input>").attr("type","hidden").attr("name","key_proName").attr("value",key_proName).appendTo($form3);
		$("<input>").attr("type","hidden").attr("name","key_proStartDate").attr("value",key_proStartDate).appendTo($form3);
		$("<input>").attr("type","hidden").attr("name","key_proEndDate").attr("value",key_proEndDate).appendTo($form3);
		$("<input>").attr("type","hidden").attr("name","btnEdit").attr("value",btnEdit).appendTo($form3);
		$form3.appendTo($(document.body));
		
		$form3.submit();
	}else return;
}

//삭제 버튼 눌렸을시 실행
function delete_clicked(a){
	if(confirm("삭제하시겠습니까?")){
		var key_proNum = $("#key_proNum_"+a).text();
		var btnEdit ="deletePromotion";
		
		var $form2 = $("<form>").attr("action","/admin/promotionList.do").attr("method","get");
		$("<input>").attr("type","hidden").attr("name","key_proNum").attr("value",key_proNum).appendTo($form2);
		$("<input>").attr("type","hidden").attr("name","btnEdit").attr("value",btnEdit).appendTo($form2);
		$form2.appendTo($(document.body));
		
		$form2.submit();	
	}
	else return;
}
  
// 	검색 및 정렬하는 ajax
$(document).ready(function(){
	$("#search_Pro").click(function(){
		var clicked="clicked";
		var content=$("#search_content").val();

		console.log("입력내용:"+content);
		
		if(checkSearch_content()==true){
			console.log("내용있음");
			
			var $form = $("<form>").attr("action", "/admin/promotionList.do").attr("method", "get");
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
﻿
  </script>
 

</head>
<body>
<jsp:include page="/Manage_Page/util/sideMenu.jsp" />
<div class="wrap">

<div class="header">
라젠카 관리자 페이지

</div>		<!-- header end -->


<div class="contains">

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
	
		<button class="btnSearch" id="search_Pro" type="button">검색</button>
		
		<div class="clear"></div>
		
	<div>
		 <table id="table2">
			<thead>
			<tr>
				<th class="left">특가 상품 번호</th>
				<th>특가 상품 명</th>
				<th>특가 상품 시작일</th>
				<th>특가 상품 종료일</th>
				<th>특가 상품 배너 이미지</th>
				<th>특가 상품 상세 이미지</th>
				<th class="right">버튼</th>
			</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${list }" begin="0" end="${paging.listCount }" var="i" varStatus="listNumber">
			
			<tr>
<%-- 				${i.dto 변수명 } --%>
				<td class="left" id="key_proNum_${listNumber.count}">${i.no }</td>
				<td>${i.name }</td>
				<td>${i.proStartDate }</td>
				<td>${i.proEndDate }</td>
				<td><img width="200px" height="150px" src="/upload/${i.bannerImg }"></td>
				<td><img width="200px" height="150px" src="/upload/${i.detailImg }"></td>
				<td class="right">	
					<button id="btn_listDown" onclick="showDetail('hiddenTr_${listNumber.count}');" style="margin:auto 0;">수정</button><br>
					<button id="btn_delete_${listNumber.count}" onclick="delete_clicked(${listNumber.count});" style="margin:auto 0;">삭제</button>
				</td>
			</tr>	
			<tr class="hiddenTr" id="hiddenTr_${listNumber.count }">
				<td colspan="7" style="text-align: left;">
				특가상품명 : <textarea rows="1" cols="30" id="key_proName_${listNumber.count}">${i.name }</textarea><br>
				<br>
				특가 시작일 : <input type="date" id="key_startDate_${listNumber.count}" /> 
				특가 종료일 : <input type="date" id="key_endDate_${listNumber.count}" />
				<img width="200px" height="150px" src="/upload/${i.bannerImg }">
				<img width="200px" height="150px" src="/upload/${i.detailImg }">
					
				<div>
					<button id="btn_update_${listNumber.count }" onclick="update_clicked(${listNumber.count })">수정완료</button>
				</div>
				
				</td>
			</tr>	
			
			</c:forEach>

			</tbody>
			
			</table>
		</div>
		
		<div class="clear"></div>
		
		<jsp:include page="/Manage_Page/util/PromotionPaging.jsp" />

</div>		<!-- content end -->

</div>		<!-- container end -->


</div>		<!-- wrap end -->

</body>
</html>

