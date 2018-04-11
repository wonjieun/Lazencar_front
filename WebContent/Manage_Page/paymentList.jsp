<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="dto.Car" %>
<%@ page import ="dao.adminDao.CarCheckListDaoImpl" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="java.util.List" %>
<%@ page import ="dao.adminDao.CarCheckListDao" %>
<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

	<link rel="stylesheet" type="text/css" href="/Manage_Page/css/main.css" />
	<link rel="stylesheet" type="text/css" href="/Manage_Page/css/paging.css" />  
	<link rel="stylesheet" href="/Manage_Page/css/daterangepicker.css" />

	<script  src="/Manage_Page/js/jquery.js"></script>
	<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
	
	<style>
	.demo { margin:30px 0;}
	.date-picker-wrapper .month-wrapper table .day.lalala { background-color:orange; }
	.options { display:none; border-left:6px solid #8ae; padding:10px; font-size:12px; line-height:1.4; background-color:#eee; border-radius:4px;}
	.date-picker-wrapper.date-range-picker19 .day.first-date-selected { background-color: red !important; }
	.date-picker-wrapper.date-range-picker19 .day.last-date-selected { background-color: orange !important; }
	
	#table2 th:first-child{
	    background: #f1c40f;
	    height: 30px;
	    background-repeat: no-repeat;
	    color: white;
	    text-align: center;
	    width: 20%;
	}
	#table2 th:last-child{
	background:#f1c40f;
	height:30px;
	background-repeat:no-repeat;
	color:white;
	text-align: center;   
	width: 10%;}
	
	.level1 :nth-child(10) .fly {background: #ffb505 !important;}
	
	
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
	</style>
	
  <script type="text/javascript">
  
	//검색창에 값이 있는가 판별
	function checkSearch_content(){
		if($("#search_content").val()==''){
			return false;
		}else{
			return true;
		}
	}

// 	검색 및 정렬하는 form 보내기
$(document).ready(function(){
	$("#searchPayment").click(function(){
// 		var carName,carCondi,carCategory;
		var category =$("#category").val();
		var sort=$("#sort").val();
		var content=$("#search_content").val();
		var clicked="clicked";
		
		console.log("카테고리:"+category);
		console.log("정렬기준:"+sort);
		console.log("입력내용:"+content);
		if(checkSearch_content()==true){
			console.log("내용있음");
			
			var $form = $("<form>").attr("action", "/admin/paymentList.do").attr("method", "get");
			$("<input>").attr("type", "hidden").attr("name", "category").attr("value", category).appendTo($form);
			$("<input>").attr("type", "hidden").attr("name", "content").attr("value", content).appendTo($form);
			$("<input>").attr("type", "hidden").attr("name", "sort").attr("value", sort).appendTo($form);
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

<jsp:include page="/Manage_Page/util/sideMenu.jsp" />

<div class="wrap">

<div class="header">
라젠카 관리자 페이지

</div>		<!-- header end -->


<div class="contain">


<div class="content">
         <div class="subtop-content bg_subvisual_02_01">
          <h3 class="subtit">결제 조회</h3>
          <p class="subtxt"><strong>결제</strong><br />결제 목록을 볼 수 있습니다.</p>
        </div>
        
	<div class="center">
					<table class="table1">
						<tr>
							<th>카테고리</th>
							<th>검색 내용</th>
							<th>정렬</th>
						</tr>
						<tr>
							<td class="left"><select class="sort" id="category">
									<option value="pay_Name">구매자이름</option>
									<option value="pay_Num">결제번호</option>
							</select></td>
							<td><input size='30' id="search_content"/>
							</td>
							<td class="right">
								<!-- 정렬 --> <select class="sort" id="sort">
									<option value="pay_Name">이름</option>
									<option value="pay_Num">결제번호</option>
									<option value="pay_Amount">결제금액</option>
									<option value="pay_Status">결제상태</option>
							</select>
							</td>
						</tr>
					</table>
				</div>
				<button class="btnSearch" id="searchPayment" type="button">결제 검색</button>
				<div class="clear"></div>
				<div>
					<table id="table2">
					<thead>
						<tr>
							<th>결제 번호</th>
							<th>결제 금액</th>
							<th>구매자 이름</th>
							<th>구매자 이메일</th>
							<th>구매자 핸드폰</th>
							<th>결제 상태</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
							
						<c:forEach items="${list }" begin="0" end="${paging.listCount }" var="i" varStatus="listNumber">
								
							<tr>
								<td>${i.payNum }</td>
								<td>${i.payAmount }</td>
								<td>${i.payName }</td>
								<td>${i.payEmail }</td>
								<td>${i.payPhone }</td>
								<td>${i.payStatus }</td>							
							</tr>
						</c:forEach>
							

					</tbody>
						
					</table>
				</div>
				
				<jsp:include page="/Manage_Page/util/paging.jsp" />
			</div>

</div>		<!-- content end -->

</div>		<!-- container end -->




</body>
</html>