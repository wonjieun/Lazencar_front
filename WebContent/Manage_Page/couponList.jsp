<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="dto.Coupon"%>
<%@ page import="dao.adminDao.CouponListDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
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



.level1 :nth-child(8) .fly {background: #ffb505 !important;}
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
// 검색창에 값이 있는지 확인
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
		var btnEdit = "updateCoupon";
		var key_couNum = $("#key_couNum_"+a).text();		
		var key_couName = $("#key_couName_"+a).val();
		var key_couStartDate = $("#key_startDate_"+a).val();
		var key_couEndDate = $("#key_endDate_"+a).val();
		var key_couAgeConst = $("#key_ageConst_"+a).val();
		var key_couTimeConst = $("#key_timeConst_"+a).val();
		var key_couCarConst = $("#key_carConst_"+a).val();
		var key_couDiscount = $("#key_couDiscount_"+a).val();
		
		//확인
		console.log(key_couNum);
		console.log(key_couName);
		console.log(key_couStartDate);
		console.log(key_couEndDate);
		console.log(key_couAgeConst);
		console.log(key_couTimeConst);
		console.log(key_couCarConst);
		
		var $form3 = $("<form>").attr("action","/admin/couponList.do").attr("method","get");
		$("<input>").attr("type","hidden").attr("name","key_couNum").attr("value",key_couNum).appendTo($form3);
		$("<input>").attr("type","hidden").attr("name","key_couName").attr("value",key_couName).appendTo($form3);
		$("<input>").attr("type","hidden").attr("name","key_couStartDate").attr("value",key_couStartDate).appendTo($form3);
		$("<input>").attr("type","hidden").attr("name","key_couEndDate").attr("value",key_couEndDate).appendTo($form3);
		$("<input>").attr("type","hidden").attr("name","key_couAgeConst").attr("value",key_couAgeConst).appendTo($form3);
		$("<input>").attr("type","hidden").attr("name","key_couTimeConst").attr("value",key_couTimeConst).appendTo($form3);
		$("<input>").attr("type","hidden").attr("name","key_couCarConst").attr("value",key_couCarConst).appendTo($form3);
		$("<input>").attr("type","hidden").attr("name","key_couDiscount").attr("value",key_couDiscount).appendTo($form3);
		$("<input>").attr("type","hidden").attr("name","btnEdit").attr("value",btnEdit).appendTo($form3);
		$form3.appendTo($(document.body));
		
		$form3.submit();
	}else return;
}

//삭제 버튼 눌렸을시 실행
function delete_clicked(a){
	if(confirm("삭제하시겠습니까?")){
		var key_couNum = $("#key_couNum_"+a).text();
		var btnEdit ="deleteCoupon";
		
		var $form2 = $("<form>").attr("action","/admin/couponList.do").attr("method","get");
		$("<input>").attr("type","hidden").attr("name","key_couNum").attr("value",key_couNum).appendTo($form2);
		$("<input>").attr("type","hidden").attr("name","btnEdit").attr("value",btnEdit).appendTo($form2);
		$form2.appendTo($(document.body));
		
		$form2.submit();	
	}
	else return;
}

//검색
$(document).ready(function(){
	$("#searchCoupon").click(function(){
		var clicked="clicked";
		var category =$("#category").val();
		var content = $("#search_content").val();
		var sort = $("#sort").val();
		
		console.log("카테고리:"+category);
		console.log("정렬기준:"+sort);
		console.log("입력내용:"+content);
		
		if(checkSearch_content()==true){
			var $form = $("<form>").attr("action", "/admin/couponList.do").attr("method", "get");
			$("<input>").attr("type", "hidden").attr("name", "clicked").attr("value", clicked).appendTo($form);
			$("<input>").attr("type", "hidden").attr("name", "category").attr("value", category).appendTo($form);
			$("<input>").attr("type", "hidden").attr("name", "content").attr("value", content).appendTo($form);
			$("<input>").attr("type", "hidden").attr("name", "sort").attr("value", sort).appendTo($form);
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
          <h3 class="subtit">쿠폰 조회/삭제</h3>
          <p class="subtxt"><strong>쿠폰을 조회하고 삭제합니다.</strong><br />조회할 쿠폰 조건을 선택하고 검색버튼을 누르시면 쿠폰목록을 볼 수 있으며 쿠폰을 삭제할 수 있습니다.</p>
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
				<select class="sort" id="category"	name="category">
					<option value="COU_NAME">쿠폰 이름
					<option value="COU_DISCOUNT">할인율
				</select>
			</td>

			<td>
				<textarea rows="1" cols="30" id="search_content"></textarea>
			</td>

			<td class="right">
				<select class="sort" id="sort" name="sort">
					<option value="COU_NAME">쿠폰 이름
					<option value="COU_DISCOUNT">할인율
<!-- 					<option value="CouponState">쿠폰 상태 -->
				</select>
			</td>
		</tr>
	</table>

	</div>	

	<button class="btnSearch" id="searchCoupon" type="button">검색</button>
	
	<div class="clear"></div>
<div>
	 <table id="table2">
		<thead>
		<tr>
			<th class="left">쿠폰 번호</th>
			<th>쿠폰 이름</th>
			<th>쿠폰 시작일</th>
			<th>쿠폰 종료일</th>
			<th colspan="3">제약 조건</th>
			<th>할인율</th>
			<th>쿠폰 이미지</th>
			<th class="right">버튼</th>
		</tr>
		</thead>
		
		<tbody>
		<c:forEach items="${list }"  begin="0" end="${paging.listCount }" var="i" varStatus="listNumber">
	
		<tr>
		<%-- 				${i.dto 변수명 } --%>
			<td class="left" id="key_couNum_${listNumber.count}">${i.no }</td>
			<td>${i.name }</td>
			<td>${i.startDate }</td>
			<td>${i.endDate }</td>
			<td>${i.ageConst } 세 이상</td>
			<td>${i.timeConst } 시간 이상</td>							
			<td>${i.carConst }</td>							
			<td>${i.discount } %</td>							
			<td><img width="200px" height="150px" src="/upload/${i.couponImg }"></td>						
			<td class="right">	
			<button id="btn_listDown" onclick="showDetail('hiddenTr_${listNumber.count}');" style="margin:auto 0;">수정</button><br>
			<button id="btn_delete_${listNumber.count}" onclick="delete_clicked(${listNumber.count});" style="margin:auto 0;">삭제</button>
			</td>
		</tr>
		<tr class="hiddenTr" id="hiddenTr_${listNumber.count }" style="display:none;">
				<td colspan="10" style="text-align: left;">
				쿠폰명 : <textarea rows="1" cols="30" id="key_couName_${listNumber.count}">${i.name }</textarea><br>
				<br>
				쿠폰 시작일 : <input type="date" id="key_startDate_${listNumber.count}" /> 
				쿠폰 종료일 : <input type="date" id="key_endDate_${listNumber.count}" />
				<br><br>
				<font>
				나이 제한 : <input type="text" id="key_ageConst_${listNumber.count}" value="0" size="5"> 세 이상  &nbsp;&nbsp; | &nbsp;&nbsp;
				</font>
				<font>
				시간 제한 : <input type="text" id="key_timeConst_${listNumber.count}" value="0" size="5"> 시간 이상 &nbsp;&nbsp; | &nbsp;&nbsp;
				</font>
				<font>
				차종 제한: <select class="sort" id="key_carConst_${listNumber.count}" name="key_carConst">
							<option>${i.carConst }</option>
							<option value="All">전차종</option>
							<option value="smallCar">소형차 이상</option>
							<option value="mediumCar">중형차 이상</option>
							<option value="SUV">SUV 이상</option>
							<option value="largeCar">대형차 이상</option>
						</select>
				</font>
				<br><br>
				<font>
					할인율 : <input type="text" id="key_couDiscount_${listNumber.count}" value="0" size="5"> %
				</font>
				<p></p>
					
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
<jsp:include page="/Manage_Page/util/CouponPaging.jsp" />

</div>		<!-- content end -->

</div>		<!-- container end -->


</div>		<!-- wrap end -->

</body>
</html>