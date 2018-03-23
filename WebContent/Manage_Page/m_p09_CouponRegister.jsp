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



<div class="wrap">

<div class="header">
라젠카 관리자 페이지

</div>		<!-- header end -->


<div class="container">



<div id="menu">
	<ul class="level1">
		<li><a href="#url">Home</a></li>
		<li><a class="fly" href="#url">회원 관리</a>
			<ul>
				<li><a href="#url">회원목록 조회</a></li>
			</ul>
		</li>
		
		<li><a class="fly" href="#url">예약 관리</a>
			<ul>
				<li><a href="#url">예약목록 조회</a></li>
			</ul>
		</li>
		
		<li><a class="fly" href="#url">차량 관리</a>
			<ul>
				<li><a href="#url">차량 등록/해제</a></li>
				<li><a href="#url">차량 점검일지</a></li>
			</ul>
		</li>
		
		<li><a class="fly" href="#url">공지 사항</a>
			<ul>
				<li><a href="#url">공지사항 등록</a></li>
			</ul>
		</li>
		
		<li><a class="fly" href="#url">후기 관리</a>
			<ul>
				<li><a href="#url">후기목록 조회</a></li>
			</ul>
		</li>
		
		<li><a class="fly" href="#url">문의 관리</a>
			<ul>
				<li><a href="#url">문의 내역 확인</a></li>
				<li><a href="#url">문의 답변 등록</a></li>
			</ul>
		</li>
		
		<li><a class="fly" href="#url">쿠폰 관리</a>
			<ul>
				<li><a href="#url">쿠폰 등록/삭제</a></li>
			</ul>
		</li>
		
	</ul>
</div>		<!-- sideMenu end -->



<div class="content">
         <div class="subtop-content bg_subvisual_02_01">
          <h3 class="subtit">쿠폰 등록/삭제</h3>
          <p class="subtxt"><strong>쿠폰을 등록하고 삭제합니다.</strong><br />조회할 쿠폰 조건을 선택하고 검색버튼을 누르시면 쿠폰목록을 볼 수 있으며<br>쿠폰을 등록/삭제할 수 있습니다.</p>
        </div>
        
	<div class="center" >
						
		 <table class="table1">
			<tr>
				<th>기간</th>
				<th>종류</th>
				<th>정렬</th>
			</tr>
			<tr>
				<td class="left">
				달력필요!
				<form id="pickerForm">
					<fieldset>
						<div class="rangePicker futureRange">
							<label for="start_date">From:</label>
							<input type="text" name="start_date" id="start_date" value="yyyy/mm/dd" /><br>
							<label for="end_date">To:</label>
							<input type="text" name="end_date" id="end_date" value="yyyy/mm/dd" />
						</div>
					</fieldset>
				</form>
				</td>
				<td></td>
				<td class="right">cell</td>
			</tr>						
		</table>
		
	</div>	
	
		<button class="btnSearch" type="button">검색</button>
		<div class="clear"></div>
	<div>
		 <table id="table2">
			
			<tr>
				<th>no</th>
				<th>상세정보</th>
			</tr>
			<tr>
				<td class="left">cell</td>
				<td class="right"></td>
			</tr>		
			<tr>
				<td class="left">cell</td>
				<td class="right"></td>
			</tr>
			<tr>
				<td class="left">cell</td>
				<td class="right"></td>
			</tr>
			<tr>
				<td class="left">cell</td>
				<td class="right"></td>
			</tr>
			<tr>
				<td class="left">cell</td>
				<td class="right"></td>
			</tr>											
			<tr>
				<td class="left">cell</td>
				<td class="right"></td>
			</tr>															
			<tr>
				<td class="left">cell</td>
				<td class="right"></td>
			</tr>											
		</table>
		</div>
		
		<div class="btnSave">
		<button type="button">쿠폰 등록</button>
		<button type="button">수정</button>
		<button type="submit">완료</button>
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