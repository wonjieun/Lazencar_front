<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta charset="UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

<%-- header include --%><jsp:include page="header.jsp" />

<script type="text/javascript" src="./js/lib/jquery-1.9.1.js"></script>

<link type="text/css" rel="stylesheet" media="all" href="/Page/css/main.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/common.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/master.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/calendar.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/calendar.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/calendar.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/calendar.css" />

<style type="text/css">
@charset "UTF-8";

.question-wrap dl .bul_q span{
	padding-left:35px;
	background:url("./images/board/icon_q_off.png") 0 50% no-repeat;
}
.question-wrap .bul_a {
	padding-left:35px;
	background:url("./images/board/icon_a.png") 0 0 no-repeat;
	min-height:23px;
	height:auto !important;
	height:23px;
}
.question-wrap .bul_a * {font-family:'NanumGothic','맑은고딕','Malgun Gothic','MGothic', sans-serif,"돋움",Dotum,"굴림",Gulim !important;font-size:14px !important}
.question-wrap .answer {
	padding:25px 20px;
	background-color:#f6f6f6;
	border-bottom:1px solid #e2e2e2;
}
.question-wrap dl.on,
.question-wrap dl.on a {
	color:#f1c40f;
}

/* 자주찾는질문 가입승인 */
.question-list {
	position:relative;
	border-bottom:1px solid #e6e6e6;
}
.question-list a {
	display:block;
	color:#888888;
	padding:12px 60px;
	background:url("./images/board/icon_q_off.png") 20px 50% no-repeat;
}
.question-wrap li .question-list.on a {
	color:#0db14b;
	background:url("./images/board/icon_q.png") 20px 50% no-repeat;
}
.question-wrap .question-list .btn {
	position:absolute;
	right:20px;
	top:20px;
}

.selstyle {
	font-size:13px;
	height:30px;
	padding:5px 8px;
	vertical-align:top;
	border:1px solid #dbd6d4;
}


/* 페이징 */
.paging {margin-top:20px; text-align:center;}
.paging a {
	display:inline-block; 
	color:#3c3c3c; 
	width:26px; 
	height:26px;
	line-height:25px;
}
.paging a:hover {color:#fff; background-color:#f1c40f;}
.paging strong {
	display:inline-block;
	width:26px; 
	height:26px;
	line-height:25px;
	color:#fff; 
	background-color:#f1c40f;
}
.paging img {vertical-align:-9px;}
.paging .page_first:hover,
.paging .page_end:hover {background-color:#fff;}
.paging .page_prev {margin:0 10px 0 -4px;}
.paging .page_next {margin:0 -4px 0 10px;}

.paging .page_prev01 {margin:0 4px 0 0;}
.paging .page_next01 {margin:0 0 0 4px;}

</style>

</head>

<body>

	<!-- Begin #wrap -->

	<div id="wrap">

		<!-- Begin #container -->

		<div id="container">

			<div class="content-wrap">

				<div class="sidebar">
					<!-- 왼쪽 메뉴 -->



					<h2 class="left-tit">고객센터</h2>

					<ul class="leftMenu">

						<li class="top"><a href="#"><span>1 : 1 문의</span></a></li>

						<li><a href="#"><span>자주찾는질문</span></a></li>

						<li><a href="#" class = 'on'><span>공지사항</span></a></li>

<!-- 					class = 'on'	현재 페이지를 나타낼때 on 사용하는 듯 -->

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

				<div class="contentbox">
					<!-- contentbox로 묶기 -->

        <div class="location">
          <div class="location_in">
            <p><span>고객센터</span>&gt; <strong>자주찾는질문</strong></p>
          </div>
        </div>
        <div class="subtop-content bg_subvisual_02_01">
          <h3 class="subtit">자주 찾는 질문</h3>
          <p class="subtxt"><strong>라젠카가 궁금하세요? 자주찾는 질문을 이용하세요.</strong><br />고객님의 궁금하신 사항을 빠르고 정확하게 해결하실 수 있습니다.</p>
        </div>


		<div class="bodystart">

			<!-- bodystart 	=========================================컨텐츠 변경가능 영역!!================================================  -->

					<ul class="question-tab">
						
		<li ><a href="./help_Faq.jsp">BEST 10<!-- (137) --></a></li>
					
							<li ><a href="./help_Faq2.jsp">예약/취소<!-- (11) --></a></li>
						
							<li ><a href="./help_Faq3.jsp">쿠폰/포인트<!-- (16) --></a></li>
						
							<li ><a href="./help_Faq4.jsp">요금/결제<!-- (23) --></a></li>

							<li class='on last-tab' ><a href="./help_Faq5.jsp">사용/반납<!-- (7) --></a></li>
						
					</ul>
					<script type="text/javascript">
						$(".question-tab li:nth-child(5)").addClass("list-ling01");
						$(".question-tab li:nth-child(6)").addClass("list-ling02");
					</script>

						<script>
						
						    for(var i = 0; i<8; i++) {
							function SirenFunction(i) {
								var objDiv = document.getElementById(i);
								if (objDiv.style.display == "block") {
									objDiv.style.display = "none";
								} else {
									objDiv.style.display = "block";
								}
							  }
						    }
						    
						</script>

						<ul class="question-wrap">
									
							<li>
								<p class="question-list">
									<a href="#" onclick= "SirenFunction('1'); return false;" class="blind_view"> 면허 등록이 불가능합니다 </a> 
							</p>
								<div class="answer" style="display:none;" id= "1">
									<p>운전 면허 등록이 불가능하다면 하기 안내 내용을 참고 부탁드립니다.</p><p>&nbsp;</p><p>&nbsp;</p><p><strong></strong></p><p><strong>1. 운전면허 취득일자 체크</strong><br> -&nbsp; 만 21세 이상 + 면허 취득 후 1년 이후 회원가입/등록이 가능합니다.</p><p>&nbsp;</p><p><strong>2. 면허정보 수기 입력 시도</strong><br>&nbsp;-&nbsp; 사진 촬영을 통해 면허정보 등록 시, 텍스트가 완벽하게 인식되지 않아<br>&nbsp;&nbsp;&nbsp; 면허정보 불일치로 정상 등록되지 않았을 수 있습니다.</p><p>&nbsp;</p><p><strong>3. 면허 진위여부 확인 필요</strong><br>&nbsp;-&nbsp; 면허 정지/취소 후 재취득 여부에 따라 등록이 어려울 수 있습니다.<br>&nbsp;&nbsp;&nbsp; 음주, 뺑소니 등 중대 사고로 인해 면허 취소 후 재 취득 시 1년 경과 후<br>&nbsp;&nbsp;&nbsp; 가입 및 면허정보 변경이 가능하며 이외 등록 불가 상황 발생 시<br>&nbsp;&nbsp;&nbsp; 운전경력증명서(재취득 사유포함), 운전면허증을 하기 메일로 접수하신 후 <br>&nbsp;&nbsp;&nbsp; 고객센터로 연락주시면 서류 검토 후 개별 면허 등록 처리를 도와 드리고 있습니다.</p><p>&nbsp;-&nbsp; 이메일 : greencar@greencar.co.kr <br>&nbsp;-&nbsp; 고객센터 : 080-2000-3000<br>&nbsp;&nbsp;&nbsp; (개인정보 서류 발송 시 주민번호 뒷 6자리는 마스킹 처리 해 주세요)</p><p>&nbsp;</p><p><strong>4. 기존 가입 정보 확인요청</strong><br>&nbsp;-&nbsp; 기존 그린카 OR 엘포인트 통합 회원 가입이력이 있으신 경우<br>&nbsp;&nbsp;&nbsp; 동일 면허 번호로 가입/정보 수정이 불가능합니다.<br>&nbsp;&nbsp;&nbsp; 기존 계정을 확인하시어 탈퇴 OR 수정 후 등록이 가능합니다</p><p>&nbsp;</p><p>&nbsp;-&nbsp; 내 가입 정보 확인하기<br>&nbsp;&nbsp; https://<a href="http://www.greencar.co.kr/customer/license/openLicenseChkPage.do">www.greencar.co.kr/customer/license/openLicenseChkPage.do</a>&nbsp;</p>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#" onclick= "SirenFunction('2'); return false;" class="blind_view"> 사고가 나면 어떻게 하나요? </a>
								</p>
								<div class="answer" style="display:none;" id= "2">
									<div class="bul_a"><p>사고 발생 즉시 고객센터(080-2000-3000)로 연락이 필요합니다.</p><p>&nbsp;</p><p>차량번호 및 기타 파손된 시설물 있다면</p><p>소유자 연락처를 확인 해 주시고 사고 사진은 필수 확보가&nbsp;</p><p>필요하므로 하기 경로를 통해 등록 부탁 드립니다.</p><p>&nbsp;</p><p><strong>* APP &gt; 고객센터 &nbsp;&gt; 사고접수 센터 &gt; 사고차량 선택, 하기 내용기입</strong></p><p><strong>&nbsp;- 사고일시&nbsp;</strong></p><p><strong>&nbsp;- 사고경위&nbsp;</strong></p><p><strong>&nbsp;- 사고사진</strong></p><p>&nbsp;</p><p>&nbsp;</p><p>사고 발생 시 모든 사고 처리가 완료될 때 까지&nbsp;</p><p>회원 자격이 일시 정지되며, 처리가 완료된 후에 다시 회원으로&nbsp;</p><p>이용이 가능합니다.</p><p>&nbsp;</p><p>만약 사고 발생 시 고객센터 연락없이&nbsp;</p><p>상대방과 합의하시거나 현장을 떠나 시간 경과 후&nbsp;</p><p>연락하시는 경우 면책적용 및 상대방에 대한&nbsp;</p><p>보험접수는 어려울 수 있으니 명심해 주시기 바랍니다.&nbsp;</p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#" onclick= "SirenFunction('3'); return false;" class="blind_view"> 차량 주유는 어떻게 하나요? </a>
								</p>
								<div class="answer" style="display:none;" id= "3">
									<div class="bul_a"><p>'주유카드는 운전석 대쉬보드 왼쪽에 위치하고 있습니다.</p><p>&nbsp;</p><p>주유카드 사용 후에는 반드시&nbsp;</p><p>원래 위치로 삽입하여 주시기 바라며 분실/파손 시 별도의</p><p>패널티가 부과될 수 있는 점 참고 부탁드립니다.</p><p>&nbsp;</p><p><strong>반드시 회사에서 지정한 차량에&nbsp;</strong></p><p><strong>배치된 주유카드를 통해 결제되어야 하며&nbsp;</strong></p><p><strong>다른 차량의 주유, 기타 비용을 결제 할 수 없습니다.</strong></p><p>&nbsp;</p><p><u><span style="color: rgb(255, 108, 0);"><u>또한 고객센터로 사전 연락 없이&nbsp;</u></span></u></p><p><u><span style="color: rgb(255, 108, 0);"><u>회원 카드/현금으로 결제된 주유비는 환불되지 않습니다.</u></span></u><span style="color: rgb(255, 108, 0);">&nbsp;</span></p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#" onclick= "SirenFunction('4'); return false;" class="blind_view"> 면허 등록이 불가능합니다 </a>
								</p>
								<div class="answer" style="display:none;" id= "4">
									<div class="bul_a"><p>왕복으로 예약하신 경우 </p><p>대여하신 그린존으로 반납해주셔야 합니다. </p><p>(그린존/프리존 편도 서비스 제외)</p><p>&nbsp;</p><p>각 차량은 소속된 그린존(주차장)에&nbsp;</p><p>차량번호 등록하여 주차 중으로 정해진 그린존이 아닌 경우,&nbsp;</p><p>일반 차량으로 간주되어 주차비가 발생됩니다.</p><p>&nbsp;</p><p>이로 인한 비용 발생(차량 이동, 주차)시&nbsp;</p><p>패널티(주차비, 견인비용)가 별도 청구되오니 주의 부탁 드립니다.&nbsp;</p><p>&nbsp;</p><p><u>부득이한 상황으로 지정된 그린존에 반납이 불가한 경우<br>고객센터(080-2000-3000)으로 연락하시어 상담 부탁드리며<br>주차하신 위치는 그린댓글에 기재하시어 이후 사용자가 <br>차량 위치를 확인하는데 혼동이 없도록 배려 부탁드립니다.</u></p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#" onclick= "SirenFunction('5'); return false;" class="blind_view"> 면허 등록이 불가능합니다 </a>
								</p>
								<div class="answer" style="display:none;" id= "5">
									<div class="bul_a"><p>다음 사용자 예약건이 대기 중인 상태에서&nbsp;</p><p>반납 시간 지연으로 인한 다음 사용자의 피해가 발생한 경우&nbsp;</p><p>예약 건당 30,000원과 추가 이용료가 과금 될 수 있습니다.&nbsp;</p><p>&nbsp;</p><p>예약 사용 중인 자동차는&nbsp;</p><p>다른 회원이 대기 중이지 않을 경우 연장 사용 신청이 가능하며&nbsp;</p><p>사용 종료 시간으로 부터 10분 단위로 적용됩니다.&nbsp;</p><p>&nbsp;</p><p>사전 통보 없이 반납 시간 연장을 하지 않고&nbsp;</p><p>이용을 하는 경우 회사가 임의로 반납 시간을 연장하여 요금을&nbsp;</p><p>청구 할 수 있습니다.</p><p>&nbsp;</p><p>&nbsp;</p><p>카셰어링에서 정시 반납은 반드시 지켜야 할 중요한 규칙 입니다.</p><p>&nbsp;</p><p>반납 지연 시 다음 예약 회원의&nbsp;</p><p>정상 사용이 어렵게 되며 이러한 컴플레인에 대한 문제는</p><p>그린카에서 모든 편의를 제공하여야 합니다.</p><p>&nbsp;</p><p>그 과정에서 대차 진행, 택시 등의 운송수단 보상 비용이&nbsp;</p><p>발생하게 되며 회사 측의 이익을 위한 벌금이 아닌 피해 회원들을&nbsp;</p><p>위한 제도인 점을 안내드립니다.</p><p>&nbsp;</p><p>이러한 문제 상황을 피하기 위해&nbsp;</p><p>하기 내용을 참고하시어 이용 부탁 드립니다.</p><p>&nbsp;</p><p>1. 차량 예약 시 운행시간을 고려하여 충분한 시간으로 예약&nbsp;</p><p>&nbsp; &nbsp; 운전시간과 기타 부대시간을&nbsp;</p><p>&nbsp; &nbsp; 모두 포함해서 30분~1시간 여유롭게 예약하시기를 추천 합니다.</p><p>&nbsp;</p><p>2. 정시에 목적지에서 출발</p><p>&nbsp; &nbsp; 차고지 특성에 따라 차량 위치 확인 시간이 소요 될 수 있으며</p><p>&nbsp; &nbsp; 출발/복귀 예상 시간이 다를 수 있기 때문에 충분한 시간을&nbsp;</p><p>&nbsp; &nbsp; 두는 것이 유리합니다.&nbsp;</p><p>&nbsp;</p><p>만약 주행 중에 예약 마감 시간까지&nbsp;</p><p>반납 불가능 시 스마트폰으로 예약을 연장하시거나&nbsp;</p><p>고객센터(080-2000-3000)를 통해 예약 시간을 연장 해 주세요.&nbsp;</p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#" onclick= "SirenFunction('6'); return false;" class="blind_view"> 면허 등록이 불가능합니다 </a>
								</p>
								<div class="answer" style="display:none;" id= "6">
									<div class="bul_a"><p><strong>1. 그린존 반납 위치에 차량 주차</strong></p><p><strong><br></strong></p><p><strong>2. 시동 OFF (미등/ 실내등/ 창문 / 썬루프 상태확인)</strong>&nbsp;</p><p>ㄴ 미등,실내등 ON 상태로 배터리 방전 / 창문이 열려 비가&nbsp;</p><p>&nbsp; &nbsp; 유입되어 세차 필요 시 패널티 금액 추가 됩니다.&nbsp;</p><p>ㄴ 전기차의 경우 차고지에 배치되어 있는 완속 충전기를</p><p>&nbsp; &nbsp; 연결해주셔야 정상 반납이 가능 합니다.</p><p>&nbsp;</p><p><strong>3. 개인용품 및 쓰레기 수거</strong></p><p><strong><br></strong></p><p>4. 문을 닫은 후 차량 밖에서 회원카드 또는&nbsp;</p><p>&nbsp; &nbsp; APP 스마트키(반납하기)를 이용하여 잠금처리</p><p>&nbsp;</p><p>5. 반납처리 후 1~2분 내에 반납처리 완료 문자 수신상태 확인</p><p>&nbsp;</p><p>위 사항 중 한가지라도 처리되지 않아&nbsp;</p><p>반납이 지연되는 경우 반납실패 문자가 발송되며 안내에 따라&nbsp;</p><p>다시 한번 반납처리를 해 주시면 됩니다.&nbsp;</p><p>&nbsp;</p><p>반납지연 시 대여요금+패널티가&nbsp;</p><p>추가로 발생되오니 문제발생 즉시 고객센터로 연락주시기 바랍니다. &nbsp;</p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#" onclick= "SirenFunction('7'); return false;" class="blind_view"> 면허 등록이 불가능합니다 </a>
								</p>
								<div class="answer" style="display:none;" id= "7">
									<div class="bul_a"><p>그린카는 ‘차량손해 보상제도’에 가입되어 있으며&nbsp;</p><p>2016년 7월 요금정책 변경 적용과 함께 </p><p>회원님께서 예약 시 선택한 면책금 30/70만원에 따라 </p><p>보험료를 차등 부과하여 결제합니다.</p><p>&nbsp;</p><p><strong>차량 손해 면책제도란?</strong></p><p>차량 손해 액수에 관계없이 사고건당 차량수리비 30만원/70만원</p><p>(예약 단계에서 자기 부담금액 선택)을 지불 시</p><p>차량 손해에 대한 책임을 일정 부분 보호받을 수 있는 제도 입니다.</p><p>&nbsp;</p><p><strong>차량 손해 면책 예외 적용 상황은?</strong></p><p>1) 계약자 및 동반운전자(예약 시 등록)가 아닌 제3자의&nbsp;</p><p>&nbsp; &nbsp; 운행으로 발생한 사고(동반운전자 단독운행 포함)</p><p>2) 사고 발생 미신고, 허위신고, 고의적 파손 상태인 경우</p><p>3) 음주/불법 약물 복용 후&nbsp;</p><p>4) 1종 보통 이상의 면허 소지자 외에 승합 차량운전&nbsp;</p><p>5) 사고 발생 즉시 미신고</p><p>&nbsp;</p><p><u>위와 같은 상황인 경우 손해 면책제도를&nbsp;</u></p><p><u>적용 받으실 수 없으며 실수리비 전액 배상과 휴차료 지불, </u></p><p><u>법적조치 및 서비스 이용정지 조치가 이루어 집니다.</u></p><p>&nbsp;</p><p>* 손해 면책보험은 가입 즉시&nbsp;</p><p>&nbsp; &nbsp;그 효력을 발휘하며 환불 및 반환되지 않습니다.&nbsp;</p><p>* 손해 면책보험은 종합 보험의 책임 한도와 관계가 없습니다.</p><p>* 상해나 재물상의 손실이 본사의 배상 한도를 초과 했을 경우</p><p>&nbsp; &nbsp;회원이 초과분에 대하여 지급할 책임이 있으며 관련&nbsp;</p><p>&nbsp; &nbsp;보험사나 상대측 보험사와 컨택하여 처리 할 수 있습니다.&nbsp;</p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#" onclick= "SirenFunction('8'); return false;" class="blind_view"> 면허 등록이 불가능합니다 </a>
								</p>
								<div class="answer" style="display:none;" id= "8">
									<div class="bul_a">결제카드 등록이 불가능한 경우 하기 내용을 확인 부탁드리며<div>문제가 없는 경우 고객센터(080-2000-3000)으로&nbsp;</div><div>연락주시면 빠르게 확인하여 도움드릴 수 있도록 하겠습니다.</div><div><br></div><div>* 도난/분실카드 여부 확인</div><div>* 한도/잔고부족 상태 확인</div><div>* 다른 카드로 등록 시도 시 동일증상 발생여부</div><div><br></div><div>2014년 11월 26일 부터&nbsp;</div><div>개인정보 강화를 위해 예약 시 본인 정보를 인증하고 있습니다.</div><div>&nbsp;</div><div>2016년 11월 부터 명의도용 방지를 위해 가입자와</div><div>동일한 명의로 된 결제 카드(신용/체크)만 등록이 가능합니다.</div><div><br></div><div>- 기존에 등록한 타인 명의 카드는 사용가능</div><div>- 법인회원은 무기명 카드 등록가능 (가입한 사업자 등록번호 기준)</div><div><br></div><div>번거로우시겠지만 회원님의&nbsp;</div><div>자산과 정보를 보호하기 위함이니 양해 부탁드립니다.&nbsp;</div><div><br></div><div>결제카드 등록은 나이스 결제에서 제공하는&nbsp;</div><div>안전한 결제 시스템으로 운영되고 있으며 최대 7개까지&nbsp;</div><div>등록 가능합니다.</div><div><br></div><div>- 카드번호&nbsp;</div><div>- 유효기간&nbsp;</div><div>- 카드 소유주의 주민번호 앞 7자리(법정 생년월일+성별)</div><div><br></div>위와 같은 정보 이력 시 정상적으로 등록이 가능합니다.</div>
								</div>
							</li>		
					</ul>
			</div>		<!-- // end contentBox -->

		</div>	<!-- // End #content-wrap -->

	</div>	<!-- // End #container -->

<%-- footer include --%><jsp:include page="footer.jsp" />

	</div>
	
	</div>

	<!-- // End #wrap -->



</body>

</html>


