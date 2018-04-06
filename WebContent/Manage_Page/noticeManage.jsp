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

<script src="/Manage_Page/js/jquery.js"></script>
<script src="/Manage_Page/js/colResizable-1.5.min.js"></script>


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
	$(function() {
		var onSampleResized = function(e) {
			var columns = $(e.currentTarget).find("th");
			var msg = "columns widths: ";
			columns.each(function() {
				msg += $(this).width() + "px; ";
			})
			$("#table2Txt").html(msg);

		};
	});
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
          <h3 class="subtit">공지사항 등록</h3>
          <p class="subtxt"><strong>공지사항을 등록합니다</strong><br />
        </div>
        
	<div class="center" >

					<table class="table1">
						<tr>
							<th>공지사항 제목</th>
							<th>파일첨부</th>
						</tr>
						<tr>
							<td class="left">
								<!-- 기간 -->

								<div class="demo">
									<h6 style="margin: 0;">제목을 입력하세요.</h6>
									<input id="notName" size="30" value="">
								</div>

							</td>
							<td>
								<div>
									<h6 style="margin: 0;">파일을 선택하세요</h6>
									<input id="notFile" size="15" value="">
								</div>
							</td>
						</tr>

						<tr>
							<th colspan="2">공지사항 내용</th>
						</tr>

						<tr>
							<td colspan="2"><textarea rows="20" cols="120" id="notContent"></textarea></td>
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