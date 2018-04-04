<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>


<meta charset="UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

<link rel="stylesheet" type="text/css" href="./css/main.css" />
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>	
<style>
.level1 :nth-child(9) .fly {background: #ffb505 !important;}
</style>

<script type="text/javascript">

//만약 비어있는 데이터가 있다면 alert 띄워주기
function checkCarDataInsert() {
	if ($("#startDate").val() != "" 
	 && $("#endDate").val() != ""
	 && $("#content").val() != "" 
	 && $("#bannerImg").val() != ""
	 && $("#detailImg").val() != "") {
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
		if (checkCarDataInsert() == false) {
			alert("빈칸을 모두 채워주세요.");
			return;
		} else {
			
			$("#f").submit();
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
				<li><a href="./admin/promotionRegister.do">특가 등록</a></li>
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
          <h3 class="subtit">특가상품 등록</h3>
          <p class="subtxt"><strong>특가 상품을 등록합니다.</strong><br />등록할 특가 상품의 정보를 입력하고 등록할 수 있습니다.</p>
        </div>
        
	<div class="center" >
						

	<form id="f" action="/admin/promotionRegister.do" method="post" enctype="multipart/form-data">
		 <table class="table1">
			<tr>
				<th>특가 시작일</th>
				<th>특가 종료일</th>
			</tr>
			<tr>
				<td class="left">
				특가 상품의 시작일을 입력하세요.<br><br>
				<input type="date" id="startDate" name="startDate" size="30" value="" />
				</td>
				<td class="right">
				특가 상품의 종료일을 입력하세요.<br><br>
				<input type="date" id="endDate" name="endDate" size="30" value="">				
				</td>
			</tr>			
			<tr>
				<th>특가 상품 명</th>
				<th>특가 상품  이미지</th>
			</tr>
			<tr>
				<td class="left">
				특가 상품의 이름을 입력하세요.		<br><br>
				<input type="text" id="content" name="content" size="30" value="">
				</td>
				<td class="right">
					<label>특가 배너 이미지 : <input type="file" name="bannerImg" id="bannerImg" value=""/></label><br>
					<label>특가 상세 이미지 : <input type="file" name="detailImg" id="detailImg" value=""/></label>
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


