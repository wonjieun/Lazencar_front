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
	
	.level1 :nth-child(4) .fly {background: #ffb505 !important;}
	
	
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
			var btnEdit = "updateCar";
			var font_carNum = $("#font_carNum_"+a).text();		
			var font_carCondi = $("#font_carCondi_"+a).val();
			var car_LCD = $("#car_LCD_"+a).val();
			console.log(car_LCD);
			
			var $form3 = $("<form>").attr("action","/admin/carCheckList.do").attr("method","post");
			$("<input>").attr("type","hidden").attr("name","font_carNum").attr("value",font_carNum).appendTo($form3);
			$("<input>").attr("type","hidden").attr("name","font_carCondi").attr("value",font_carCondi).appendTo($form3);
			$("<input>").attr("type","hidden").attr("name","car_LCD").attr("value",car_LCD).appendTo($form3);
			$("<input>").attr("type","hidden").attr("name","btnEdit").attr("value",btnEdit).appendTo($form3);
			$form3.appendTo($(document.body));
			
			$form3.submit();
		}else return;
	}
	//삭제 버튼 눌렸을시 실행
	function delete_clicked(a){
		if(confirm("삭제하시겠습니까?")){
			var font_carNum = $("#font_carNum_"+a).text();
			var btnEdit ="deleteCar";
			
			var $form2 = $("<form>").attr("action","/admin/carCheckList.do").attr("method","post");
			$("<input>").attr("type","hidden").attr("name","font_carNum").attr("value",font_carNum).appendTo($form2);
			$("<input>").attr("type","hidden").attr("name","btnEdit").attr("value",btnEdit).appendTo($form2);
			$form2.appendTo($(document.body));
			
			$form2.submit();	
		}
		else return;
	}
	$(function(){	

		var onSampleResized = function(e){
			var columns = $(e.currentTarget).find("th");
			var msg = "columns widths: ";
			columns.each(function(){ msg += $(this).width() + "px; "; })
			$("#table2Txt").html(msg);
			
		};
	});
// 	검색 및 정렬하는 ajax
$(document).ready(function(){
	$("#searchCar").click(function(){
		var carName,carCondi,carCategory;
		var category =$("#category").val();
		var sort=$("#sort").val();
		var content=$("#search_content").val();
		var clicked="clicked";
		
		console.log("카테고리:"+category);
		console.log("정렬기준:"+sort);
		console.log("입력내용:"+content);
		if(checkSearch_content()==true){
			console.log("내용있음");
			
			var $form = $("<form>").attr("action", "/admin/carCheckList.do").attr("method", "post");
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


<div class="container">


<div class="content">
         <div class="subtop-content bg_subvisual_02_01">
          <h3 class="subtit">차량 점검 일지</h3>
          <p class="subtxt"><strong>차량 점검일정을 관리합니다.</strong><br />조회할 차량 조건을 선택하고 검색버튼을 누르시면 차량의 점검일정을 볼 수 있습니다.</p>
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
									<option value="car_Name">차량모델명</option>
									<option value="car_Category">차량종류</option>
									<option value="car_Condi">차량상태</option>
							</select></td>
							<td><input size='30' id="search_content">
							</td>
							<td class="right">
								<!-- 정렬 --> <select class="sort" id="sort">
									<option value="car_Num">차량번호</option>
									<option value="car_Category">차랑종류</option>
									<option value="car_Condi">차량상태</option>
									<option value="car_LCD">최근점검일</option>
							</select>
							</td>
						</tr>
					</table>
				</div>
				<button class="btnSearch" id="searchCar" type="button">차량 검색</button>
				<div class="clear"></div>
				<div>
					<table id="table2">
					<thead>
						<tr>
							<th>차량번호</th>
							<th>차량모델명</th>
							<th>차량상태</th>
							<th>차량종류</th>
							<th>유종</th>
							<th>차량 최종 점검일</th>
							<th></th>
						</tr>
					</thead>
					<tbody>

							
						<c:forEach items="${list }" begin="0" end="${paging.listCount }" var="i" varStatus="listNumber">
								
							<tr>
								<td id="font_carNum_${listNumber.count}">${i.carNum }</td>
								<td>${i.carName }</td>
								<td>${i.carCondi }</td>
								<td>${i.carCategory }</td>
								<td>${i.carOil }</td>
								<td>${i.carLCD }</td>								<td>
								<button id="btn_listDown" onclick="showDetail('hiddenTr_${listNumber.count}');" style="margin:auto 0;">수정</button><br>
								<button id="btn_delete_${listNumber.count}" onclick="delete_clicked(${listNumber.count});" style="margin:auto 0;">삭제</button>
								</td>
							</tr>
							<tr class="hiddenTr" id="hiddenTr_${listNumber.count }">
								<td colspan="7">
								<div style="width:90px" >
								<font>차랑번호: </font><br>
								<font>차량모델명: </font><br>
								<font>차량상태: </font><br>
								<font>차량종류:</font><br>
								<font>유종: </font><br>
								<font>최종점검일: </font>
								</div>
								<div>
									<font >${i.carNum }</font><br>
									<font>${i.carName }</font><br>
											<select class="sort" id="font_carCondi_${listNumber.count}"	name="condiSelect">
											<option>${i.carCondi }</option>
											<option value="대기중">대기중</option>
											<option value="예약중">예약중</option>
											<option value="점검중">점검중</option>
											<option value="수리중">수리중</option>
									</select><br>
									<font>${i.carCategory }</font><br>
									<font>${i.carOil }</font><br>
									<font>${i.carLCD }</font>
									<input type="date" id="car_LCD_${listNumber.count}"/><br>
<%-- 									<input type="text" id="car_LCD_${listNumber.count}" value="${i.carLCD }"/><br> --%>
								</div>
								<div>
									<button id="btn_update_${listNumber.count }"
									 onclick="update_clicked(${listNumber.count })">수정완료</button>
								</div>
								</td>
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