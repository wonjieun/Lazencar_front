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

<meta  http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

	<link rel="stylesheet" type="text/css" href="/Manage_Page/css/main.css" />
	<link rel="stylesheet" type="text/css" href="/Manage_Page/css/paging.css" />  
	<link rel="stylesheet" href="/Manage_Page/css/daterangepicker.css" />

	<script  src="/Manage_Page/js/jquery.js"></script>
	<script  src="/Manage_Page/js/colResizable-1.5.min.js"></script>
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
		var searchItem =$("#category").val();
		var orderItem=$("#sort").val();
		console.log(searchItem);
		console.log(orderItem);
		
		if(checkSearch_content()==true){
			console.log("내용있음");
			$.ajax({
				type:"POST",
				url:"/admin/carCheckList.do",
				data:{
					searchItem:searchItem,
					orderItem:orderItem
				},
				dataType:"json",
				success:function(data){
					alert("ajax 성공");
				},
				error:function(e){
					console.log("---------error--------");
					console.log("수신 실패");
				}
				
			});
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
		<li><a class="fly" href="#url">회원 관리</a>
			<ul>
				<li><a href="./userManage.jsp">회원목록 조회</a></li>
			</ul>
		</li>
		
		<li><a class="fly" href="#url">예약 관리</a>
			<ul>
				<li><a href="./reservManage.jsp">예약목록 조회</a></li>
			</ul>
		</li>
		
		<li><a class="fly" href="#url">차량 관리</a>
			<ul>
				<li><a href="./
				carRegister.jsp">차량 등록/해제</a></li>
				<li><a href="/admin/carCheckList.do">차량 정보 수정</a></li>
			</ul>
		</li>
		
		<li><a class="fly" href="#url">공지 사항</a>
			<ul>
				<li><a href="./noticeManage.jsp">공지사항 등록</a></li>
			</ul>
		</li>
		
		<li><a class="fly" href="#url">후기 관리</a>
			<ul>
				<li><a href="./reviewManage.jsp">후기목록 조회</a></li>
			</ul>
		</li>
		
		<li><a class="fly" href="#url">문의 관리</a>
			<ul>
				<li><a href="./qnaManage.jsp">문의 내역 확인</a></li>
				<li><a href="./qnaRegister.jsp">문의 답변 등록</a></li>
			</ul>
		</li>
		
		<li><a class="fly" href="#url">쿠폰 관리</a>
			<ul>
				<li><a href="./couponRegister.jsp">쿠폰 등록/삭제</a></li>
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
									<option value="carName">차량이름</option>
									<option value="carCategory">차량종류</option>
									<option value="carCondi">차량상태</option>
							</select></td>
							<td><textarea rows="1" cols="30" id="search_content"></textarea>
							</td>
							<td class="right">
								<!-- 정렬 --> <select class="sort" id="sort">
									<option value="carNum">차량번호</option>
									<option value="carCategory">차랑종류</option>
									<option value="carCondi">차량상태</option>
									<option value="carLCD">최근점검일</option>
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
								<td id="td_carId">${i.carNum }</td>
								<td>${i.carName }</td>
								<td>${i.carCondi }</td>
								<td>${i.carCategory }</td>
								<td>${i.carOil }</td>
								<td>${i.carLCD }</td>								<td>
								<button id="btn_listDown" onclick="showDetail('hiddenTr_${listNumber.count}');" style="margin:auto 0;">수정</button><br>
								<button id="btn_delete" style="margin:auto 0;">삭제</button>
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
									<font>${i.carNum }</font><br>
									<font>${i.carName }</font><br>
											<select class="sort" id="carCondi"	name="condiSelect">
											<option>${i.carCondi }</option>
											<option value="대기중">대기중</option>
											<option value="예약중">예약중</option>
											<option value="점검중">점검중</option>
											<option value="수리중">수리중</option>
									</select><br>
									<font>${i.carCategory }</font><br>
									<font>${i.carOil }</font><br>
									<input value="${i.carLCD }"/><br>
								</div>
								<div>
									<button id="btn_update">수정완료</button>
								</div>
								</td>
							</tr>	
						</c:forEach>
							

					</tbody>
						
					</table>
				</div>
				
				<%-- 페이징 불러오기 (Manage_Page/util에 있음) --%>
				<jsp:include page="/Manage_Page/util/paging.jsp" />
<!-- 				<div class="clear"></div> -->
<!-- 				<div class="paging"> -->
<!-- 					<a href="#" class="page_first"><img -->
<!-- 						src="./images/page_first.gif" alt="처음" /></a> <a href="#" -->
<!-- 						class="page_prev"><img src="./images/page_prev.gif" alt="이전" /></a> -->
<!-- 					<strong>1</strong> <a href="#" class="page_next"><img -->
<!-- 						src="./images/page_next.gif" alt="다음" /></a> <a href="#" -->
<!-- 						class="page_end"><img src="./images/page_end.gif" alt="마지막" /></a> -->
<!-- 				</div> -->
			</div>

</div>		<!-- content end -->

</div>		<!-- container end -->




</body>
</html>