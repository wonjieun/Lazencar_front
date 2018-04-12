<<<<<<< HEAD
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- header include --%><jsp:include page="header.jsp" />
<!-- 세션 불러오기 -->
id:${sessionScope.id}
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/main.css" />
<link rel="stylesheet" href="/Page/css/normalize.css">
<link rel="stylesheet" href="/Page/css/style.css">
<link rel="stylesheet" href="/Page/css/layout_01.css">
<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,100,100,italic'
	rel='stylesheet' type='text/css'>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<!-- //세션으로 받아온다 -->
<!-- //로그인 상태 정보 아이디  -->


<script type="text/javascript">
var tmpCarPrice = null;
var tmpCouDiscount = null;
var tmpCarDamagePrice = null;
var tmpEtcPrice = null;

	//버튼 체크
	$(document).ready(function() {
		$("#center_sel_car").hide();
		$("#center_sel_option").hide();
		$("#center_resfinsh").hide();
		$("#click_1").hide();
		$("#click_3").hide();
		
		$("#click_1").click(function() {
			$("#center_sel_car").hide();
			$("#center_sel_option").hide();
			$("#center_resfinsh").hide();
			$("#center_sel_day").show();
			
		});
		$("#click_2").click(function() {
			$("#center_sel_day").hide();
			$("#center_sel_option").hide();
			$("#center_resfinsh").hide();
			$("#center_sel_car").show();
			$("#click_3").show();
			$("#click_1").hide();
		});
		$("#click_3").click(function() {
			$("#center_sel_day").hide();
			$("#center_sel_car").hide();
			$("#center_resfinsh").hide();
			$("#center_sel_option").show();
			$("#click_1").show();
			$("#click_2").show();
			$("#click_3").hide();
		});
		$("#ckreservation").click(function() {
			$("#center_sel_day").hide();
			$("#center_sel_car").hide();
			$("#center_sel_option").hide();
			$("#center_resfinsh").show();
		});
		console.log("test");
		
		//차량
		$("input[type=radio][name=selectedCar]").change(function(){
// 			console.log($(this).val());
// 			console.log( $(this).parent().next(".tdName").text() );
			$("dd.model").text( $(this).parent().next(".tdName").text() );
			$(".resultCar").text( $(this).parent().next(".tdName").text() );
			$("#CAR_NUM").val( $(this).val() ); // 차량번호
			
			tmpCarPrice = Number($(this).parent().nextAll(".tdcarPrice").text());
		});
		
		//쿠폰
		$("input[type=radio][name=selectedCou]").change(function(){
// 			console.log( $(this).parent().next(".couName").text() );
			$(".discount1").text($(this).parent().next(".couName").text());
			$("#COU_NAME").val( $(this).val());
			
			tmpCouDiscount = Number($(this).parent().nextAll(".CouDiscount").text());
		});
		
		//차량 보험
		$("input[type=radio][name=selectedOption]").change(function(){
			console.log($(this).val());
			$("#selectOption").text($(this).val());
			$(".resultOption").text($(this).val());
			
			//$("#selectOption").text($(this).val());
			$("#carcondi").val( $(this).val()); 
			
			tmpCarDamagePrice = Number($(this).attr("data-carDamagePrice"));
		});
		
		//부대장비
		var str = "";
		$("input:checkbox[name=selectedEtc]").change(function(){
			tmpEtcPrice=0;
			str = "";
			$("input:checkbox[name=selectedEtc]:checked").each(function(idx) {
				str+=$(this).val();
				if(idx != $("input:checkbox[name=selectedEtc]:checked").length-1) {
					str+="/";
				}
				tmpEtcPrice+=Number($(this).attr("data-etcPrice"));
			});
			$("#Option").text(str);
			$(".resultdis").text(str);
			$("#CaptionSend").val(str);
			//console.log("test:"+str);
		});
		
		$("#calPrice").click(function() {
			if($("#RES_START").val() == null || $("#RES_START").val() == "") {
				alert("대여일을 선택해 주세요.")
				return false;
			}
			if($("#RES_END").val() == null || $("#RES_END").val() == "") {
				alert("반납일을 선택해 주세요.")
				return false;
			}
			if($("#CAR_NUM").val() == null || $("#CAR_NUM").val() == "") {
				alert("차량을 선택해 주세요.")
				return false;
			}
			if($("#COU_NAME").val() == null || $("#COU_NAME").val() == "") {
				alert("쿠폰을 선택해 주세요.")
				return false;
			}
			if($("#CaptionSend").val() == null || $("#CaptionSend").val() == "") {
				alert("부대장비를 선택해 주세요.")
				return false;
			}
			if($("#carcondi").val() == null || $("#carcondi").val() == "") {
				alert("보험을 선택해 주세요.")
				return false;
			}
			
			var startArr = $("#ddDateRentDescription").text().split("-");
			var startDate = new Date(startArr[0], Number(startArr[1])-1, startArr[2]);

			var endArr = $("#ddDateReturnDescription").text().split("-");
			var endDate = new Date(endArr[0], Number(endArr[1])-1, endArr[2]);
// console.log(endDate.getTime() - startDate.getTime());
			var diffTime = endDate.getTime() - startDate.getTime();
			var oneDay = 1000 * 60 * 60 * 24;
			
			var diffDay = diffTime/oneDay;
// 			console.log(diffDay);
			
// 			쿠폰 할인율 * 0.01 * 대여일수 * 차대여료 + 보험 + 옵션

			console.log(tmpCarPrice);
			console.log(diffDay);
			console.log(tmpCouDiscount);
			console.log(tmpCarDamagePrice);
			console.log(tmpEtcPrice);

			var discount = (tmpCarPrice * diffDay * tmpCouDiscount * 0.01)
				+ tmpCarDamagePrice + tmpEtcPrice;
			$(".resPrice strong").text(discount);
			
			var normal = (tmpCarPrice * diffDay)
			+ tmpCarDamagePrice + tmpEtcPrice;
			$(".normalPrice strong").text(normal);
		});
		
		$("#reserForm").submit(function() {
// 			alert($(".normalPrice strong").text());
			
			if($(".normalPrice strong").text() == 0
					|| $(".normalPrice strong").text() == ""
					|| $(".normalPrice strong").text() == null) {
				alert("계산 버튼을 클릭하세요.");
				return false;
			}
			
			$("#DC_PRICE").val($(".resPrice strong").text());
			$("#NORMAL_PRICE").val($(".normalPrice strong").text());
// 			return false;
		});
});
</script>
</head>
<body>
<!-- 메뉴 4개 감싸는 div : tal-menu 시작 -->
<div class="tal-menu">

	<!-- 왼쪽 메뉴 시작 -->
	<div class="leftbar">
		<div class="sidebar">
			<h2 class="left-tit">실시간 예약</h2>
			<ul class="leftMenu">
				<li class="top"><a href="#"><span>일정선택</span></a></li>
				<li><a href="#"><span>차량선택</span></a></li>
				<li><a href="#"><span>결제하기</span></a></li>
			</ul>
			<div class="side_sns">
				<span class="tit">SNS<em></em></span> <a class="facebook"
					href="https://www.facebook.com/greencarkorea" target="_blank">라젠카
					페이스북</a> <a class="blog" href="http://blog.naver.com/greencar_co"
					target="_blank">라젠카 블로그</a> <a class="instagram"
					href="https://www.instagram.com/greencar_kr" target="_blank">라젠카
					인스타그램</a>
			</div>
			<div class="side_cscenter">
				<span class="tit">고객센터</span> <span class="tel">010-9550-0167</span>
			</div>
		</div>
	</div>
	<!-- 왼쪽 메뉴 끝 -->

	<!-- 일정 선택 중앙 메뉴 시작 -->
	<div id="center_sel_day">
		<h2 class="left-tit">일정 선택</h2>
		<p class="rsvHeadingTxt">고객님의 총 대여하실 기간을 선택해주세요.</p>
		<div id="calHelp">
			<div class="first active">
				<i>A</i> <b id="sel1text">대여일시</b>
			</div>
			<div class="disabled">
				<i>B</i> <b id="sel2text">반납일시</b>
			</div>
		</div>
		<div id="disp">
			<div id="prev" class="nav">&larr;</div>
			<div id="month">Hello world</div>
			<div id="next" class="nav">&rarr;</div>
		</div>
		<div id="cal"></div>
		<!-- 스타일 다시 설정 <div style="text-align: right; margin-top:68px; ">     	</div>-->
	</div>
	<!-- 일정 선택 중앙 메뉴 끝 -->

	<!-- 차량 선택 중앙 메뉴 시작 -->
	<div id="center_sel_car">
		<div class="rsvHeading">
			<h2 class="left-tit">차량을 선택해 주세요.</h2>
			<p class="rsvHeadingTxt">고객님께서 승차하실 차량을 선택하여 주세요.</p>
		</div>
		<div class="rsvContentBody">
			<div class="rsvStep rsvStep_car">
			<div class="rsvCarList">
				<table>
				<c:forEach items="${carList}" var="car">
					<tr>
						<td class="tdNum"><input type="radio" name="selectedCar" value="${car.carNum}" /></td>
						<td class="tdName">${car.carName }</td>
						<td class="tdNum">${car.carNum }</td>
						<td class="tdCategory">${car.carCategory }</td>
						<td class="tdOIL">${car.carOil }</td>
						<td class="tdCondi">${car.carCondi }</td>
						<td class="tdLCD">${car.carLCD }</td>
						<td class="tdcarPrice">${car.carPrice }</td>
					</tr>
				</c:forEach>
				</table>
				</div>
				<p class="rsvHeadingTxt">알려드립니다</p>
				<div class="rsvHeadingTxt">
					<p>대여자격 만 26세 이상, 운전경력 3년이상 차량 안내<br /> 대형, 고급, 4륜, 승합, 제네시스쿠페</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 차량 선택 중앙 메뉴 끝 -->
	
	<!-- 옵션 선택 중앙 메뉴 시작 -->
	<div id="center_sel_option">
	<h2 class="left-tit">옵션 및 할인 선택</h2>
	<p class="rsvHeadingTxt">부대장비 및 자차손해면책제도, 할인 항목 등을 선택하세요.</p>
	
	<div class="sel_option_check">
	<table >
		
		<c:forEach items="${couponList}" var="coupon">
			<tr>
				<td class="couNum"><input type="radio" name="selectedCou" value="${coupon.no}" /></td>
				<td class="couName">${coupon.name }</td>
				<td class="couStart">${coupon.startDate }</td>
				<td class="couEnd">${coupon.endDate }</td>
				<td class="CouDiscount">${coupon.discount }</td>
				<td class="CouAgeConst">${coupon.ageConst }</td>
				<td class="CouTimeConst">${coupon.timeConst }</td>
				<td class="CouCarconst">${coupon.carConst }</td>
			</tr>
				</c:forEach>

	</table>
	<table class="clear">
	<tr>
	<td colspan="2">자차손해면책제도</td>
	</tr>
		<tr>
		<td>자차손해면책제도</td>
			<tr>
			<c:forEach items="${damageList}" var="damage">
			<td class="dmNum">
			<input type="radio" name="selectedOption" data-carDamagePrice="${damage.carDamagePrice}" value="${damage.carDamageSel}" >${damage.carDamageSel}
			</input>
			</td>

			</c:forEach>
		</tr>
		</td>
		</tr>
	</table>
	
	<table class="clear">
	<tr>
	<td colspan="2">부대장비 선택</td>
	</tr>
		<tr>
		<td>부대장비 선택</td>
		
		<!-- <input type="checkbox" name="Caption" id="caption1" value="내비게이션(0원)">내비게이션
		<input type="checkbox" name="Caption" id="caption2" value="베이비 카시트(0원)">베이비 카시트
		<input type="checkbox" name="Caption" id="caption3" value="유모차(0원)">유모차 -->
		<tr>
			<c:forEach items="${etcList}" var="etc">
			<td class="etcName">
			<input type="checkbox" id="EtcName" data-etcPrice="${etc.etcPrice }" name="selectedEtc" value="${etc.etcSelect}" >${etc.etcSelect}
			</input>
			</td>

			</c:forEach>
		</tr>
		</td>
		</tr>
	</table>
	</div>
</div>
<!-- 옵션 선택 중앙 메뉴 끝 -->

<!-- 예약 확인 중앙 메뉴 시작 -->
<div id="center_resfinsh">
	<div class="rsvHeading">
		<p class="rsvHeadingTit"><strong>예약</strong>이 완료되었습니다.</p>
		<p class="rsvHeadingTxt">예약하신 내용을 확인해 주세요.</p>
	</div>
		
			<div class="rsvStep rsvStep_result rsvStep_realResult">
				<div class="rsvResultTableWrap">	
					<table cellpadding="0" cellspacing="0" border="1" class="rsvResultTable">
						<caption>임시저장내역</caption>
						<tbody>
							<tr>
								<th scope="row"><span>차&nbsp;&nbsp;&nbsp;&nbsp;량</span></th>
								<td>
									<div class="resultCar" id="resultCarName">
										
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><span>신&nbsp;&nbsp;&nbsp;&nbsp;청</span></th>
								<td>
									<div class="" id="">
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><span>일&nbsp;&nbsp;&nbsp;&nbsp;시</span></th>
								<td>
									<div id="resultDay1">
										
										
									</div>
									<div id="resultDay2">
										
										
									</div>
								</td>
							</tr>
							
							<tr>
								<th scope="row"><span>옵&nbsp;&nbsp;&nbsp;&nbsp;션</span></th>
								<td>
									<div class="resultOption">
										<input type="text" id="carcondi" />
										<input type="text" id="CaptionSend" /> 
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><span>할&nbsp;&nbsp;&nbsp;&nbsp;인</span></th>
								<td>
									<div class="resultdis">
										 
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><span>금&nbsp;&nbsp;&nbsp;&nbsp;액</span></th>
								<td>
									<div class="resultItem itemPrice">
									<span class=""><strong id="resultNormalPrice"></strong> 원</span>
									<span class=""><strong id="resultDcPrice"></strong> 원</span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
		</div>
	</div>

<!-- 예약 확인 중앙 메뉴 끝 -->

	<!-- 오른쪽 메뉴 시작 -->
	<div class="rightbar">
		<div class="rsvHeading">
			<h2 class="left-tit">안내 사항</h2>
			<p class="rsvHeadingTxt">차량 예약 사항 입니다.</p>
		</div>
		<div class="rsvCarStatus">
			<div class="rsvCarStatusDefault">
				<div class="rsvDefaultThumb" id="spnimgRsvSelectedImage">
					<img src="../Page/images/icons/car_thumb_default.gif" alt="" />
				</div>
				<div class="rsvDefaultInfo">
					<dl>
						<dt class="model">차종명칭</dt>
						<dd class="model" id="ddCarModelDescription"></dd>
						<dt class="dateRent">대여일시</dt>
						<dd class="dateRent" id="ddDateRentDescription"></dd>
						<dt class="dateReturn">반납일시</dt>
						<dd class="dateReturn" id="ddDateReturnDescription"></dd>
					</dl>
				</div>
			</div>
			<div class="rsvCarStatusOption">
				<div class="rsvOptionInstitution">
					<p class="rsvOptionTit">자차손해면책제도</p>
					<div id="selectOption">
					
					</div>
					
				</div>
				<div class="rsvOptionDiscount">
					<p class="rsvOptionTit">부대장비</p>
					<div id="Option">
					
					</div>
				</div>
				
				<div class="rsvOptionDiscount">
					<p class="rsvOptionTit">할인내용</p>
					<div class="discount1">
					</div>
					
				</div>
				
			</div>
			<div class="rsvCarStatusPrice">
				<dl>
					<dt class="normalPrice">정상금액</dt>
					<dd class="normalPrice"><strong></strong> 원</dd>
					<dt class="resPrice">예약금액</dt>
					<dd class="resPrice"><strong></strong> 원</dd>
				</dl>
			</div>

		
		<div class="rsvCarStatusMenu">
		<button id="calPrice">금액확인</button>
		<button id="ckreservation">예약확인</button>
		<!-- 예약 정보 폼  -->
		<form id="reserForm" action="/reservation/reservation.do" method="post">
			<input type="hidden" id="MEM_ID" name="MEM_ID" value="${sessionScope.id }" />
			<input type="hidden" id="CAR_NUM" name="CAR_NUM" />
			<input type="hidden" id="RES_START" name="RES_START" />
			<input type="hidden" id="RES_END" name="RES_END" />
			<input type="hidden" id="COU_NAME" name="COU_NAME" />
			<input type="hidden" id="CaptionSend" name="CaptionSend" />
			<input type="hidden" id="carcondi" name="carcondi" />
			<input type="hidden" id="DC_PRICE" name="DC_PRICE" />
			<input type="hidden" id="NORMAL_PRICE" name="NORMAL_PRICE" />
			
			<input type="IMAGE" src="/Page/images/icons/btn_reserve.gif" name="Submit" value="Submit" />
		</form>
		</div>
		</div>
	</div>
	<!-- 오른쪽 메뉴 끝 -->

	<!-- 화면 전환 시작 -->
	<button id="click_1">일정 선택</button>
	<button id="click_2">차량 선택</button>
	<button id="click_3">옵션 선택</button>
	<!-- 화면 전환 끝 -->

</div>
<!-- tal-menu 끝 -->
</body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="/Page/js/index.js"></script>
=======
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- header include --%><jsp:include page="header.jsp" />
<!-- 세션 불러오기 -->
id:${sessionScope.id}
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/main.css" />
<link rel="stylesheet" href="/Page/css/normalize.css">
<link rel="stylesheet" href="/Page/css/style.css">
<link rel="stylesheet" href="/Page/css/layout_01.css">
<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,100,100,italic'
	rel='stylesheet' type='text/css'>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<!-- //세션으로 받아온다 -->
<!-- //로그인 상태 정보 아이디  -->


<script type="text/javascript">
var tmpCarPrice = null;
var tmpCouDiscount = null;
var tmpCarDamagePrice = null;
var tmpEtcPrice = null;


	//버튼 체크
	$(document).ready(function() {
		
		
		
		$("#center_sel_car").hide();
		$("#center_sel_option").hide();
		$("#center_resfinsh").hide();
		$("#click_1").hide();
		$("#click_3").hide();
		
		$("#click_1").click(function() {
			$("#center_sel_car").hide();
			$("#center_sel_option").hide();
			$("#center_resfinsh").hide();
			$("#center_sel_day").show();
			
		});
		$("#click_2").click(function() {
			$("#center_sel_day").hide();
			$("#center_sel_option").hide();
			$("#center_resfinsh").hide();
			$("#center_sel_car").show();
			$("#click_3").show();
			$("#click_1").hide();
		});
		$("#click_3").click(function() {
			$("#center_sel_day").hide();
			$("#center_sel_car").hide();
			$("#center_resfinsh").hide();
			$("#center_sel_option").show();
			$("#click_1").show();
			$("#click_2").show();
			$("#click_3").hide();
		});
		$("#ckreservation").click(function() {
			$("#center_sel_day").hide();
			$("#center_sel_car").hide();
			$("#center_sel_option").hide();
			$("#center_resfinsh").show();
		});
		console.log("test");
		
		//차량
		$("input[type=radio][name=selectedCar]").change(function(){
// 			console.log($(this).val());
// 			console.log( $(this).parent().next(".tdName").text() );
			$("dd.model").text( $(this).parent().next(".tdName").text() );
			$(".resultCar").text( $(this).parent().next(".tdName").text() );
			$("#CAR_NUM").val( $(this).val() ); // 차량번호
			
			tmpCarPrice = Number($(this).parent().nextAll(".tdcarPrice").text());
		});
		
		//쿠폰
		$("input[type=radio][name=selectedCou]").change(function(){
// 			console.log( $(this).parent().next(".couName").text() );
			$(".discount1").text($(this).parent().next(".couName").text());
			$("#COU_NAME").val( $(this).val());
			
			tmpCouDiscount = Number($(this).parent().nextAll(".CouDiscount").text());
		});
		
		//차량 보험
		$("input[type=radio][name=selectedOption]").change(function(){
			console.log($(this).val());
			$("#selectOption").text($(this).val());
			$(".resultOption").text($(this).val());
			
			//$("#selectOption").text($(this).val());
			$("#carcondi").val( $(this).val()); 
			
			tmpCarDamagePrice = Number($(this).attr("data-carDamagePrice"));
		});
		
		//부대장비
		var str = "";
		$("input:checkbox[name=selectedEtc]").change(function(){
			tmpEtcPrice=0;
			str = "";
			$("input:checkbox[name=selectedEtc]:checked").each(function(idx) {
				str+=$(this).val();
				if(idx != $("input:checkbox[name=selectedEtc]:checked").length-1) {
					str+="/";
				}
				tmpEtcPrice+=Number($(this).attr("data-etcPrice"));
			});
			$("#Option").text(str);
			$(".resultdis").text(str);
			$("#CaptionSend").val(str);
			//console.log("test:"+str);
		});
		
		$("#calPrice").click(function() {
			if($("#RES_START").val() == null || $("#RES_START").val() == "") {
				alert("대여일을 선택해 주세요.")
				return false;
			}
			if($("#RES_END").val() == null || $("#RES_END").val() == "") {
				alert("반납일을 선택해 주세요.")
				return false;
			}
			if($("#CAR_NUM").val() == null || $("#CAR_NUM").val() == "") {
				alert("차량을 선택해 주세요.")
				return false;
			}
			if($("#COU_NAME").val() == null || $("#COU_NAME").val() == "") {
				alert("쿠폰을 선택해 주세요.")
				return false;
			}
			if($("#CaptionSend").val() == null || $("#CaptionSend").val() == "") {
				alert("부대장비를 선택해 주세요.")
				return false;
			}
			if($("#carcondi").val() == null || $("#carcondi").val() == "") {
				alert("보험을 선택해 주세요.")
				return false;
			}
			
			var startArr = $("#ddDateRentDescription").text().split("-");
			var startDate = new Date(startArr[0], Number(startArr[1])-1, startArr[2]);

			var endArr = $("#ddDateReturnDescription").text().split("-");
			var endDate = new Date(endArr[0], Number(endArr[1])-1, endArr[2]);
// console.log(endDate.getTime() - startDate.getTime());
			var diffTime = endDate.getTime() - startDate.getTime();
			var oneDay = 1000 * 60 * 60 * 24;
			
			var diffDay = diffTime/oneDay;
// 			console.log(diffDay);
			
// 			쿠폰 할인율 * 0.01 * 대여일수 * 차대여료 + 보험 + 옵션

			console.log(tmpCarPrice);
			console.log(diffDay);
			console.log(tmpCouDiscount);
			console.log(tmpCarDamagePrice);
			console.log(tmpEtcPrice);

			var discount = (tmpCarPrice * diffDay * (100-tmpCouDiscount) * 0.01)
				+ tmpCarDamagePrice + tmpEtcPrice;
			$(".resPrice strong").text(discount);
			
			var normal = (tmpCarPrice * diffDay)
			+ tmpCarDamagePrice + tmpEtcPrice;
			$(".normalPrice strong").text(normal);
		});
		
		$("#reserForm").submit(function() {
// 			alert($(".normalPrice strong").text());
			
			if($(".normalPrice strong").text() == 0
					|| $(".normalPrice strong").text() == ""
					|| $(".normalPrice strong").text() == null) {
				alert("계산 버튼을 클릭하세요.");
				return false;
			}
			
			$("#DC_PRICE").val($(".resPrice strong").text());
			$("#NORMAL_PRICE").val($(".normalPrice strong").text());
			console.log("예약하기 끝 결제 시작");
				
// 			return false;
		});
});
</script>
</head>
<body>
<!-- 메뉴 4개 감싸는 div : tal-menu 시작 -->
<div class="tal-menu">

	<!-- 왼쪽 메뉴 시작 -->
	<div class="leftbar">
		<div class="sidebar">
			<h2 class="left-tit">실시간 예약</h2>
			<ul class="leftMenu">
				<li class="top"><a href="#"><span>일정선택</span></a></li>
				<li><a href="#"><span>차량선택</span></a></li>
				<li><a href="#"><span>결제하기</span></a></li>
			</ul>
			<div class="side_sns">
				<span class="tit">SNS<em></em></span> <a class="facebook"
					href="https://www.facebook.com/greencarkorea" target="_blank">라젠카
					페이스북</a> <a class="blog" href="http://blog.naver.com/greencar_co"
					target="_blank">라젠카 블로그</a> <a class="instagram"
					href="https://www.instagram.com/greencar_kr" target="_blank">라젠카
					인스타그램</a>
			</div>
			<div class="side_cscenter">
				<span class="tit">고객센터</span> <span class="tel">010-9550-0167</span>
			</div>
		</div>
	</div>
	<!-- 왼쪽 메뉴 끝 -->

	<!-- 일정 선택 중앙 메뉴 시작 -->
	<div id="center_sel_day">
		<h2 class="left-tit">일정 선택</h2>
		<p class="rsvHeadingTxt">고객님의 총 대여하실 기간을 선택해주세요.</p>
		<div id="calHelp">
			<div class="first active">
				<i>A</i> <b id="sel1text">대여일시</b>
			</div>
			<div class="disabled">
				<i>B</i> <b id="sel2text">반납일시</b>
			</div>
		</div>
		<div id="disp">
			<div id="prev" class="nav">&larr;</div>
			<div id="month">Hello world</div>
			<div id="next" class="nav">&rarr;</div>
		</div>
		<div id="cal"></div>
		<!-- 스타일 다시 설정 <div style="text-align: right; margin-top:68px; ">     	</div>-->
	</div>
	<!-- 일정 선택 중앙 메뉴 끝 -->

	<!-- 차량 선택 중앙 메뉴 시작 -->
	<div id="center_sel_car">
		<div class="rsvHeading">
			<h2 class="left-tit">차량을 선택해 주세요.</h2>
			<p class="rsvHeadingTxt">고객님께서 승차하실 차량을 선택하여 주세요.</p>
		</div>
		<div class="rsvContentBody">
			<div class="rsvStep rsvStep_car">
			<div class="rsvCarList">
				<table>
				<c:forEach items="${carList}" var="car">
					<tr>
						<td class="tdNum"><input type="radio" name="selectedCar" value="${car.carNum}" /></td>
						<td class="tdName">${car.carName }</td>
						<td class="tdNum">${car.carNum }</td>
						<td class="tdCategory">${car.carCategory }</td>
						<td class="tdOIL">${car.carOil }</td>
						<td class="tdCondi">${car.carCondi }</td>
						<td class="tdLCD">${car.carLCD }</td>
						<td class="tdcarPrice">${car.carPrice }</td>
					</tr>
				</c:forEach>
				</table>
				</div>
				<p class="rsvHeadingTxt">알려드립니다</p>
				<div class="rsvHeadingTxt">
					<p>대여자격 만 26세 이상, 운전경력 3년이상 차량 안내<br /> 대형, 고급, 4륜, 승합, 제네시스쿠페</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 차량 선택 중앙 메뉴 끝 -->
	
	<!-- 옵션 선택 중앙 메뉴 시작 -->
	<div id="center_sel_option">
	<h2 class="left-tit">옵션 및 할인 선택</h2>
	<p class="rsvHeadingTxt">부대장비 및 자차손해면책제도, 할인 항목 등을 선택하세요.</p>
	
	<div class="sel_option_check">
	<table >
		
		<c:forEach items="${couponList}" var="coupon">
			<tr>
				<td class="couNum"><input type="radio" name="selectedCou" value="${coupon.no}" /></td>
				<td class="couName">${coupon.name }</td>
				<td class="couStart">${coupon.startDate }</td>
				<td class="couEnd">${coupon.endDate }</td>
				<td class="CouDiscount">${coupon.discount }</td>
				<td class="CouAgeConst">${coupon.ageConst }</td>
				<td class="CouTimeConst">${coupon.timeConst }</td>
				<td class="CouCarconst">${coupon.carConst }</td>
			</tr>
				</c:forEach>

	</table>
	<table class="clear">
	<tr>
	<td colspan="2">자차손해면책제도</td>
	</tr>
		<tr>
		<td>자차손해면책제도</td>
			<tr>
			<c:forEach items="${damageList}" var="damage">
			<td class="dmNum">
			<input type="radio" name="selectedOption" data-carDamagePrice="${damage.carDamagePrice}" value="${damage.carDamageSel}" >${damage.carDamageSel}
			</input>
			</td>

			</c:forEach>
		</tr>
		</td>
		</tr>
	</table>
	
	<table class="clear">
	<tr>
	<td colspan="2">부대장비 선택</td>
	</tr>
		<tr>
		<td>부대장비 선택</td>
		
		<!-- <input type="checkbox" name="Caption" id="caption1" value="내비게이션(0원)">내비게이션
		<input type="checkbox" name="Caption" id="caption2" value="베이비 카시트(0원)">베이비 카시트
		<input type="checkbox" name="Caption" id="caption3" value="유모차(0원)">유모차 -->
		<tr>
			<c:forEach items="${etcList}" var="etc">
			<td class="etcName">
			<input type="checkbox" id="EtcName" data-etcPrice="${etc.etcPrice }" name="selectedEtc" value="${etc.etcSelect}" >${etc.etcSelect}
			</input>
			</td>

			</c:forEach>
		</tr>
		</td>
		</tr>
	</table>
	</div>
</div>
<!-- 옵션 선택 중앙 메뉴 끝 -->

<!-- 예약 확인 중앙 메뉴 시작 -->
<div id="center_resfinsh">
	<div class="rsvHeading">
		<p class="rsvHeadingTit"><strong>예약</strong>이 완료되었습니다.</p>
		<p class="rsvHeadingTxt">예약하신 내용을 확인해 주세요.</p>
	</div>
		
			<div class="rsvStep rsvStep_result rsvStep_realResult">
				<div class="rsvResultTableWrap">	
					<table cellpadding="0" cellspacing="0" border="1" class="rsvResultTable">
						<caption>임시저장내역</caption>
						<tbody>
							<tr>
								<th scope="row"><span>차&nbsp;&nbsp;&nbsp;&nbsp;량</span></th>
								<td>
									<div class="resultCar" id="resultCarName">
										
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><span>신&nbsp;&nbsp;&nbsp;&nbsp;청</span></th>
								<td>
									<div class="" id="">
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><span>일&nbsp;&nbsp;&nbsp;&nbsp;시</span></th>
								<td>
									<div id="resultDay1">
										
										
									</div>
									<div id="resultDay2">
										
										
									</div>
								</td>
							</tr>
							
							<tr>
								<th scope="row"><span>옵&nbsp;&nbsp;&nbsp;&nbsp;션</span></th>
								<td>
									<div class="resultOption">
										<input type="text" id="carcondi" />
										<input type="text" id="CaptionSend" /> 
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><span>할&nbsp;&nbsp;&nbsp;&nbsp;인</span></th>
								<td>
									<div class="resultdis">
										 
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><span>금&nbsp;&nbsp;&nbsp;&nbsp;액</span></th>
								<td>
									<div class="resultItem itemPrice">
									<span class=""><strong id="resultNormalPrice"></strong> 원</span>
									<span class=""><strong id="resultDcPrice"></strong> 원</span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
		</div>
	</div>

<!-- 예약 확인 중앙 메뉴 끝 -->

	<!-- 오른쪽 메뉴 시작 -->
	<div class="rightbar">
		<div class="rsvHeading">
			<h2 class="left-tit">안내 사항</h2>
			<p class="rsvHeadingTxt">차량 예약 사항 입니다.</p>
		</div>
		<div class="rsvCarStatus">
			<div class="rsvCarStatusDefault">
				<div class="rsvDefaultThumb" id="spnimgRsvSelectedImage">
					<img src="../Page/images/icons/car_thumb_default.gif" alt="" />
				</div>
				<div class="rsvDefaultInfo">
					<dl>
						<dt class="model">차종명칭</dt>
						<dd class="model" id="ddCarModelDescription"></dd>
						<dt class="dateRent">대여일시</dt>
						<dd class="dateRent" id="ddDateRentDescription"></dd>
						<dt class="dateReturn">반납일시</dt>
						<dd class="dateReturn" id="ddDateReturnDescription"></dd>
					</dl>
				</div>
			</div>
			<div class="rsvCarStatusOption">
				<div class="rsvOptionInstitution">
					<p class="rsvOptionTit">자차손해면책제도</p>
					<div id="selectOption">
					
					</div>
					
				</div>
				<div class="rsvOptionDiscount">
					<p class="rsvOptionTit">부대장비</p>
					<div id="Option">
					
					</div>
				</div>
				
				<div class="rsvOptionDiscount">
					<p class="rsvOptionTit">할인내용</p>
					<div class="discount1">
					</div>
					
				</div>
				
			</div>
			<div class="rsvCarStatusPrice">
				<dl>
					<dt class="normalPrice">정상금액</dt>
					<dd class="normalPrice"><strong></strong> 원</dd>
					<dt class="resPrice">예약금액</dt>
					<dd id="resPrice" class="resPrice"><strong></strong> 원</dd>
				</dl>
			</div>

		
		<div class="rsvCarStatusMenu">
		<button id="calPrice">금액확인</button>
		<button id="ckreservation">예약확인</button>
		<!-- 예약 정보 폼  -->
		<form id="reserForm" action="/reservation/reservation.do" method="post">
			<input type="hidden" id="MEM_ID" name="MEM_ID" value="${sessionScope.id }" />
			<input type="hidden" id="CAR_NUM" name="CAR_NUM" />
			<input type="hidden" id="RES_START" name="RES_START" />
			<input type="hidden" id="RES_END" name="RES_END" />
			<input type="hidden" id="COU_NAME" name="COU_NAME" />
			<input type="hidden" id="CaptionSend" name="CaptionSend" />
			<input type="hidden" id="carcondi" name="carcondi" />
			<input type="hidden" id="DC_PRICE" name="DC_PRICE" />
			<input type="hidden" id="NORMAL_PRICE" name="NORMAL_PRICE" />
			
			<input type="IMAGE" src="/Page/images/icons/btn_reserve.gif" name="Submit" value="Submit" />
		</form>
		</div>
		</div>
	</div>
	<!-- 오른쪽 메뉴 끝 -->

	<!-- 화면 전환 시작 -->
	<button id="click_1">일정 선택</button>
	<button id="click_2">차량 선택</button>
	<button id="click_3">옵션 선택</button>
	<!-- 화면 전환 끝 -->

</div>
<!-- tal-menu 끝 -->
</body>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="/Page/js/index.js"></script>
>>>>>>> 63ee6ba3a7e836bffd4b5bd2c60b36bc123f650a
<%-- footer include --%><jsp:include page="footer.jsp" />