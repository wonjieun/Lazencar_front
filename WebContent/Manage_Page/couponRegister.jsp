<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>


<meta charset="UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

	<link rel="stylesheet" type="text/css" href="./css/main.css" />
	<link rel="stylesheet" type="text/css" href="./css/paging.css" />  

	<style>
	.level1 :nth-child(8) .fly {background: #ffb505 !important;}
	</style>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
 
<script type="text/javascript">
//만약 비어있는 데이터가 있다면 alert 띄워주기
  function checkCouponDataInsert() {
  	if ($("#content").val() != "" 
  	 && $("#startDate").val() != "" 
  	 && $("#endDate").val() != ""
  	 && $("#age").val() != ""
  	 && $("#time").val() != ""
  	 && $("#carKind").val() != ""
  	 && $("#couponImg").val() != "") {
  		//모든 칸이 채워져 있으면 return true
  		console.log("체크완료 : 모두채워짐");
  		return true;
  	} else {
  		console.log("체크완료 : 빈칸있음, or 실패")
  		return false;
  	}
  }
	
//초기화, 전송 버튼
  $(document).ready(function() {
  	$("#reset").click(function() {
  		$("#f")[0].reset();
  	});
  	$("#submit").click(function() {
  		if (checkCouponDataInsert() == false) {
  			alert("빈칸을 모두 채워주세요.");
  			return;
  		} else {
  			
  			$("#f").submit();
//   			alert("등록완료")		여기 말고 controller에서 
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
            <li><a href="/admin/memberManage.do" >회원목록 조회</a></li>
         </ul>
      </li>
      
      <li><a class="fly" href="javascript:void(0);">예약 관리</a>
         <ul>
            <li><a href="./reservManage.jsp">예약목록 조회</a></li>
         </ul>
      </li>
      
      <li><a class="fly" href="javascript:void(0);">차량 관리</a>
         <ul>
            <li><a href="/admin/carRegister.do">차량 등록/해제</a></li>
            <li><a href="/admin/carCheckList.do">차량 점검일지</a></li>
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



<div class="content">
         <div class="subtop-content bg_subvisual_02_01">
          <h3 class="subtit">쿠폰 등록</h3>
           <p class="subtxt"><strong>쿠폰을 등록합니다.</strong><br />등록할 쿠폰의 정보를 입력하고 등록할 수 있습니다.</p>
        </div>
        
	<div class="center" >
	
	<form id="f" action="/admin/promotionRegister.do" method="post" enctype="multipart/form-data">
		 <table class="table1">
			<tr>
				<th>쿠폰 명</th>
				<th>쿠폰 시작일</th>
				<th>쿠폰 종료일</th>
			</tr>
			<tr>
				<td class="left">
				쿠폰의 이름을 입력하세요.		<br><br>
				<input type="text" id="content" name="content" size="30" value="">
				</td>
				<td>
				쿠폰의 시작일을 입력하세요.<br><br>
				<input type="date" id="startDate" name="startDate" size="30" value="" />
				</td>
				<td class="right">
				쿠폰의 종료일을 입력하세요.<br><br>
				<input type="date" id="endDate" name="endDate" size="30" value="">				
				</td>
			</tr>			
			<tr>
				<th>제약 조건</th>
				<th>할인율</th>
				<th>쿠폰 이미지</th>
			</tr>
			<tr>
				<td class="left">
				<p>나이 : <input type="text" id="ageConst" name="ageConst" value="0" size="5"> 세 이상 </p>
				<p>사용 시간 : <input type="text" id="timeConst" name="timeConst" value="0" size="5"> 시간 이상 </p>
				<p>차종 : 
					<select class="sort" id="carConst" name="carConst">
					    <option value="All">전차종
					    <option value="smallCar">소형차 이상
					    <option value="mediumCar">중형차 이상
					    <option value="SUV">SUV 이상
					    <option value="largeCar">대형차 이상
					</select>
					</p>
				</td>
				<td>
				쿠폰의 할인율을 입력하세요.		<br><br>
				<p><input type="text" id="discount" name="discount" size="5" value="0">%</p>
				</td>	
				<td class="right">
				<label><input type="file" name="couponImg" id="couponImg" value=""/></label><br>
				</td>
			</tr>				
		</table>
		</form>
	
		<div class="clear"></div>

		<div class="btnSave">
		<button id="reset">초기화</button>
		<button id="submit" value="submit">등록</button>
		</div>
	
	</div>	

</div>		<!-- content end -->

</div>		<!-- container end -->


</div>		<!-- wrap end -->

</body>
</html>