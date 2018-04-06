<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

<link rel="stylesheet" type="text/css" href="/Manage_Page/css/main.css" />
<link rel="stylesheet" type="text/css" href="/Manage_Page/css/paging.css" />
<link rel="stylesheet" href="/Manage_Page/css/daterangepicker.css" />

<style>
.demo {
	margin: 30px 0;
}

.date-picker-wrapper .month-wrapper table .day.lalala {
	background-color: orange;
}

.options {
	display: none;
	border-left: 6px solid #8ae;
	padding: 10px;
	font-size: 12px;
	line-height: 1.4;
	background-color: #eee;
	border-radius: 4px;
}

.date-picker-wrapper.date-range-picker19 .day.first-date-selected {
	background-color: red !important;
}

.date-picker-wrapper.date-range-picker19 .day.last-date-selected {
	background-color: orange !important;
}

#table2 th:last-child {
	background: #f1c40f;
	height: 30px;
	background-repeat: no-repeat;
	color: white;
	text-align: center;
	width: 10%;
}

.level1 :nth-child(4) .fly {
	background: #ffb505 !important;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">

	function checkCarDataInsert() {
		if ($("#carLCD").val() != "" && $("#carName").val() != ""
				&& $("#carNum").val() != "" && $("#carCategory").val() != ""
				&& $("#carOil").val() != "" && $("#carCondi").val() != "") {
			//모든 칸이 채워져 있으면 return true
			console.log("체크완료 : 모두채워짐");
			return true;
		} else {
			console.log("체크완료 : 빈칸있음, or 실패")
			return false;
		}
	}
	
	$(document).ready(function() {
		$("#btn_carRegist").click(function() {
			if (checkCarDataInsert() == false) {
				alert("빈칸을 모두 채워주세요.");
				return;

			} else {
				var carLCD = $("#carLCD").val();
				var carName = $("#carName").val(); 
				var carNum = $("#carNum").val();
				var carCategory = $("#carCategory").val();
				var carOil = $("#carOil").val();
				var carCondi = $("#carCondi").val();
				//입력 데이터 확인 코드
				console.log("최종점검일 : " + carLCD);
				console.log("차량 명  : " + carName);
				console.log("차량번호  : " + carNum);
				console.log("차량 종류 : " + carCategory);
				console.log("유종 : " + carOil);
				console.log("차량상태 : " + carCondi);

				$.ajax({
					type : "POST",
					url : "/admin/carRegister.do",
					data : {
						carLCD : carLCD,
						carName : carName,
						carNum : carNum,
						carCategory : carCategory,
						carOil : carOil,
						carCondi : carCondi
					},
					dataType : "json",
					success : function(data) {
						alert("차량 등록 성공");
					},
					error : function(e) {
// 						alert("입력 형식을 확인해주세요.");
						console.log("------error------");
// 						console.log(e.responseText);
					}
				});
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
          <h3 class="subtit">차량 등록/해제</h3>
          <p class="subtxt"><strong>차량을 등록하고 해제합니다.</strong><br />조회할 차량 조건을 선택하고 검색버튼을 누르시면 해당 차량의 상세정보를 볼 수 있습니다.</p>
        </div>
        
	<div class="center" >

					<table class="table1">
						<tr>
							<th>최종점검일</th>
							<th>차량모델명</th>
							<th>차량분류</th>
						</tr>
						<tr>
							<td class="left">
								<!-- 기간 -->

								<div class="demo">
									<h6 style="margin: 0;">날짜를 입력 하세요.(ex.2018.03.28)</h6>
									<input id="carLCD" size="30" value="">
								</div>

							</td>

							<td>
								<div>
									<h6 style="margin: 0;">이름을 입력하세요(ex. 아반떼 MD)</h6>
									<input id="carName" size="15" value="">
								</div>
							</td>

							<td class="right">
								<!-- 정렬 -->
								<h6 style="margin: 0;">차량의 배기량을 기준으로 지정</h6> <select
								class="sort" name="categorySelect" id="carCategory">
									<option value="경차">경차</option>
									<option value="소형차">소형차</option>
									<option value="준중형차">준중형차</option>
									<option value="중형차">중형차</option>
									<option value="대형차">대형차</option>
									<option value="소형SUV">소형SUV</option>
									<option value="SUV">SUV</option>
							</select>
							</td>
						</tr>

						<tr>
							<th>오일</th>
							<th>차량 번호</th>
							<th>차량 상태</th>
						</tr>

						<tr>
							<td class="left"><select class="sort" id="carOil"
								name="oilSelect">
									<option value="경유">경유</option>
									<option value="휘발유">휘발유</option>
									<option value="LPG">LPG</option>
							</select></td>

							<td><textarea rows="1" cols="20" id="carNum"></textarea></td>

							<td class="right"><select class="sort" id="carCondi"
								name="condiSelect">
									<option value="대기중">대기중</option>
									<option value="예약중">예약중</option>
									<option value="점검중">점검중</option>
									<option value="수리중">수리중</option>
							</select></td>
						</tr>
					</table>

				</div>

				<button class="btnSearch" type="button" id="btn_carRegist">차량등록</button>
				<div class="clear"></div>


			</div>
			<!-- content end -->
		</div>
		<!-- container end -->
	</div>
	<!-- wrap end -->

</body>
</html>