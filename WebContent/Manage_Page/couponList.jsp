<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>


<meta charset="UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

<link rel="stylesheet" type="text/css" href="/Manage_Page/css/main.css" />

	
<style>
.level1 :nth-child(8) .fly {background: #ffb505 !important;}
</style>


<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>	
<script type="text/javascript">

  
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
					<option value="CouponName">쿠폰 이름
					<option value="CouponConst">제약 조건
				</select>
			</td>

			<td>
				<textarea rows="1" cols="30" id="search_content">
				</textarea>
			</td>

			<td class="right">
				<select class="sort" id="sort" name="sort">
					<option value="CouponName">쿠폰 이름
					<option value="Discount">할인율
				</select>
			</td>
		</tr>
	</table>

</div>	

	<button class="btnSearch" id="searchCoupon" type="button">검색</button>
	<div class="clear"></div>
<div>
	 <table id="table2">

		<tr>
			<th class="left">쿠폰 이름</th>
			<th>쿠폰 시작일</th>
			<th>쿠폰 종료일</th>
			<th>제약 조건</th>
			<th>할인율</th>
			<th class="right">쿠폰 이미지</th>
		</tr>
		<c:forEach items="${list }" var="i">
		<tr>
			<td class="left">cell</td>
			<td class="right"></td>
		</tr>
		</c:forEach>
	</table>
	</div>
	
<div class="btnSave">
	<button type="reset">초기화</button>
	<button type="submit">삭제</button>
</div>
	
<div class="clear"></div>


</div>		<!-- content end -->

</div>		<!-- container end -->


</div>		<!-- wrap end -->

</body>
</html>