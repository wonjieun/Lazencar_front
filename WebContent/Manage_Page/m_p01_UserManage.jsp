<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta charset="UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

  <link rel="stylesheet" type="text/css" href="./css/main.css" />  
  <script  src="./js/jquery.js"></script>
  <script  src="./js/colResizable-1.5.min.js"></script>

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
          <h3 class="subtit">회원목록 조회</h3>
          <p class="subtxt"><strong>회원목록을 조회하고 관리합니다.</strong><br />조회할 회원조건을 선택하고 검색버튼을 누르시면 해당 회원목록을 볼 수 있습니다.</p>
        </div>
        
	<div class="center" >
						
		 <table class="table1">
			<tr>
				<th>기간</th>
				<th>회원 계정</th>
				<th>정렬</th>
			</tr>
			<tr>
				<td class="left">
				달력필요!
				<form id="pickerForm">
					<fieldset>
						<div class="rangePicker futureRange">
							<label for="start_date">From:</label>
							<input type="text" name="start_date" id="start_date" value="yyyy/mm/dd" />
							<label for="end_date">To:</label>
							<input type="text" name="end_date" id="end_date" value="yyyy/mm/dd" />
						</div>
					</fieldset>
				</form>
				</td>
				<td>
				<form ></form>
				
				</td>
				<td class="right">cell</td>
			</tr>		
			<tr>
				<th>렌트 차량</th>
				<th>예약 상태</th>
				<th>결제 상태</th>
			</tr>
			<tr>
				<td class="left">cell</td>
				<td>cell</td>
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
				<th>상세 정보</th>
			</tr>
			<tr>
				<td class="left">cell</td>
				<td class="right">cell</td>
			</tr>		
			<tr>
				<td class="left">cell</td>
				<td class="right">cell</td>
			</tr>
			<tr>
				<td class="left">cell</td>
				<td class="right">cell</td>
			</tr>
			<tr>
				<td class="left">cell</td>
				<td class="right">cell</td>
			</tr>
			<tr>
				<td class="left">cell</td>
				<td class="right">cell</td>
			</tr>											
		</table>
		</div>
		

</div>		<!-- content end -->

</div>		<!-- container end -->


</div>		<!-- wrap end -->

</body>
</html>