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
	
	#table2 th:last-child{
	background:#f1c40f;
	height:30px;
	background-repeat:no-repeat;
	color:white;
	text-align: center;   
	width: 10%;}
	
	.level1 :nth-child(4) .fly {background: #ffb505 !important;}
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
				<li><a href="./carRegister.jsp">차량 등록/해제</a></li>
				<li><a href="./carCheckList.jsp">차량 점검일지</a></li>
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
        
	<div class="center" >
						
		 <table class="table1">
			<tr>
				<th>기간</th>
				<th>차량 등급</th>
				<th>정렬</th>
			</tr>
			<tr>
				<td class="left">
				<div class="demo">
				기간을 선택하세요. <input id="date-range0" size="30" value=""> 
				</div>
				</td>
				
				<td>
				<select class="sort" >
				    <option>S
				    <option>A+
				    <option>A
				    <option>B
				    <option>C
				    <option>D
				    <option>F
				  </select>
				</td>
				
				<td class="right">
				<select class="sort" >
				    <option>차량 등록일자
				    <option>차량 점검일자
				    <option>차량 예약상태
				    <option>차량 등급
				  </select>
				</td>
			</tr>		
			<tr>
				<th>차종</th>
				<th>차량 번호</th>
				<th>예약 상태</th>
			</tr>
			<tr>
				<td class="left">
					<select class="sort" >
				    <option>소형
				    <option>준중형
				    <option>중형
				    <option>SUV
				    <option>대형
				  </select>
				</td>
				
				<td>
				   <textarea rows="1" cols="20"></textarea>
				</td>
				<td class="right">
				  <select class="sort">
				    <option>예약 
				    <option>미예약 
				  </select>
				</td>
			</tr>													
		</table>
		
	</div>	
	
		<button class="btnSearch" type="button">검색</button>
		<div class="clear"></div>
		
	<div>
		 <table id="table2">
			
			<tr>
				<th>no</th>
				<th>점검 날짜</th>
				<th>차량 등급</th>
				<th>등록</th>
			</tr>
			<tr>
				<td class="left">cell</td>
				<td>
				<div class="demo">
				점검 기간을 선택하세요.
				<input id="date-range0" size="30" value=""> 
				</div>
				</td>
				<td>
				<select class="sort" >
				    <option>S
				    <option>A+
				    <option>A
				    <option>B
				    <option>C
				    <option>D
				    <option>F
				  </select>
				</td>
				<td class="right"><input type="checkbox"></td>
			</tr>		
			<tr>
				<td class="left">cell</td>
				<td>
				<div class="demo">
				점검 기간을 선택하세요.
				<input id="date-range0" size="30" value=""> 
				</div>
				</td>
				<td>
				<select class="sort" >
				    <option>S
				    <option>A+
				    <option>A
				    <option>B
				    <option>C
				    <option>D
				    <option>F
				  </select>
				</td>
				<td class="right"><input type="checkbox"></td>
			</tr>
			<tr>
				<td class="left">cell</td>
				<td>
				<div class="demo">
				점검 기간을 선택하세요.
				<input id="date-range0" size="30" value=""> 
				</div>
				</td>
				<td>
				<select class="sort" >
				    <option>S
				    <option>A+
				    <option>A
				    <option>B
				    <option>C
				    <option>D
				    <option>F
				  </select>
				</td>
				<td class="right"><input type="checkbox"></td>
			</tr>
			<tr>
				<td class="left">cell</td>
				<td>
				<div class="demo">
				점검 기간을 선택하세요.
				<input id="date-range0" size="30" value=""> 
				</div>
				</td>
				<td>
				<select class="sort" >
				    <option>S
				    <option>A+
				    <option>A
				    <option>B
				    <option>C
				    <option>D
				    <option>F
				  </select>
				</td>
				<td class="right"><input type="checkbox"></td>
			</tr>
											
		</table>
		</div>
		
		<div class="btnSave">
		<button type="reset">초기화</button>
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