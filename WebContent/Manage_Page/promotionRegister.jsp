<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>


<meta charset="UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

	<link rel="stylesheet" type="text/css" href="./css/main.css" />
	<link rel="stylesheet" type="text/css" href="./css/paging.css" />  
	<link rel="stylesheet" href="./css/daterangepicker.css" />

	<script  src="./js/jquery.js"></script>
	<script  src="./js/colResizable-1.5.min.js"></script>

	<script src="./js/Date_moment.min.js"></script>
	<script src="./js/Date_rangepicker.js"></script>
	<script src="./js/Date_demo.js"></script>
	
	<style>
	.demo { margin:30px 0;}
	.date-picker-wrapper .month-wrapper table .day.lalala { background-color:orange; }
	.options { display:none; border-left:6px solid #8ae; padding:10px; font-size:12px; line-height:1.4; background-color:#eee; border-radius:4px;}
	.date-picker-wrapper.date-range-picker19 .day.first-date-selected { background-color: red !important; }
	.date-picker-wrapper.date-range-picker19 .day.last-date-selected { background-color: orange !important; }
	
	.level1 :nth-child(9) .fly {background: #ffb505 !important;}
	</style>
	
  <script type="text/javascript">
	$(function(){	

		var onSampleResized = function(e){
			var columns = $(e.currentTarget).find("th");
			var msg = "columns widths: ";
			columns.each(function(){ msg += $(this).width() + "px; "; })
			$("#table2Txt").html(msg);
			
		};	
	
		$("#table2").colResizable({
			liveDrag:true, 
			gripInnerHtml:"<div class='grip'></div>", 
			draggingClass:"dragging", 
			onResize:onSampleResized});
		
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
          <h3 class="subtit">특가상품 등록</h3>
          <p class="subtxt"><strong>특가 상품을 등록합니다.</strong><br />등록할 특가 상품의 정보를 입력하고 등록할 수 있습니다.</p>
        </div>
        
	<div class="center" >
						
		 <table class="table1">
			<tr>
				<th>특가 상품 명</th>
				<th>특가 기간</th>
			</tr>
			<tr>
				<td class="left">
				<input type="text" />
				</td>
				<td class="right">
				<div class="demo">
					기간을 선택하세요.<br> <input id="date-range0" size="30" value=""> 
					</div>
				</td>
			</tr>			
			<tr>
				<th>특가 상품 배너 이미지</th>
				<th>특가 상품  상세 이미지</th>
			</tr>
			<tr>
				<td class="left">
				<p>이미지 등록</p>
				</td>
				<td class="right">
				<p>이미지 등록</p>
				</td>
			</tr>				
		</table>
		
	</div>	
	
		<div class="btnSave">
		<button type="reset">초기화</button>
		<button type="submit" id="submit">등록</button>
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