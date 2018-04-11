<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="dto.Review"%>
<%@ page import="dao.ReviewDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
   String id = "";

   id = (String)session.getAttribute("id");

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

<style type="text/css">
@charset "UTF-8";

/* 전체 스타일 설정 */
#header *, #footer *, .sidebar * {
	font-family: 'Noto Sans KR', '맑은고딕', 'Malgun Gothic', 'MGothic',
		sans-serif, "돋움", Dotum, "굴림", Gulim
}

#wrap {
	height: 100%
}

#container {
	min-height: 100%;
	margin: -80px 0 -250px
}

/* Header */
#header {
	*z-index: 1001;
	position: relative;
	height: 80px
}

.hgroup {
	position: relative;
	*display: inline-block;
	*zoom: 1;
	z-index: 7000
}

.hgroup .inbox {
	position: relative;
	width: 1080px;
	height: 80px;
	margin: 0 auto;
	z-index: 555
}

/* navigation */
.hgroup .logo {
	position: absolute;
	top: 0;
	left: 10px
}

.hgroup .logo a {
	display: block;
	width: 156px;
	height: 68px;
	padding-top: 12px
}

.hgroup .logo a span {
	display: block;
	padding-top: 48px;
	background: url('./images/common/logo.png') no-repeat 0 0;
	font: 0/0 dotum;
	color: transparent
}

.nvalinks {
	position: absolute;
	top: 19px;
	right: 10px
}

.nvalinks a {
	float: left;
	height: 40px;
	padding-left: 13px;
	background: url('./images/main/bg_dot.png') no-repeat 6px center;
	font-size: 13px;
	line-height: 40px;
	letter-spacing: -0.05em;
	color: #fff
}

.nvalinks a:first-child {
	padding-left: 0;
	background: none
}

.nvalinks a:hover {
	text-decoration: underline
}

a.nvalinks-rev {
	margin-left: 14px;
	padding: 0 18px;
	background: none;
	border: 1px solid #fff;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	font-size: 16px;
	letter-spacing: -0.03em;
	line-height: 38px;
	-webkit-transition-duration: 0.2s;
	transition-duration: 0.2s
}

a.nvalinks-rev:hover {
	background: #f1c40f;
	border: 1px solid #f1c40f;
	text-decoration: none
}

.navigation {
	overflow: hidden;
	height: 80px;
	padding-left: 197px
}

.navigation li {
	float: left;
	text-align: center
}

.navigation li a {
	display: block;
	margin: 0 27px;
	height: 80px;
	line-height: 78px;
	font-size: 18px;
	letter-spacing: -0.03em;
	color: #fff
}

.navi-sublist {
	display: none;
	z-index: 9000;
	position: absolute;
	padding-top: 19px
}

.navi-sublist.on {
	display: block
}

.navi-sublist li {
	float: none;
	text-align: left
}

.navi-sublist li a {
	display: block;
	width: auto;
	height: auto;
	line-height: 34px;
	font-size: 16px;
	color: #3c3c3c;
	letter-spacing: -0.03em
}

.navi-sublist li a:hover {
	color: #f1c40f
}

#header.sub .hgroup {
	background: #fff;
	border-bottom: 1px solid #eee
}

#header.sub .hgroup .inbox {
	height: 79px
}

#header.sub .hgroup .logo a span {
	background-position: 0 -58px
}

#header.sub .nvalinks a {
	background: url('./images/main/bg_dot02.png') no-repeat 6px center;
	color: #636363
}

#header.sub .nvalinks a:first-child {
	padding-left: 0;
	background: none
}

#header.sub .nvalinks a:hover {
	color: #171717
}

#header.sub a.nvalinks-rev {
	background: none;
	border: 1px solid #f1c40f;
	color: #f1c40f
}

#header.sub a.nvalinks-rev:hover {
	background: #f1c40f;
	color: #fff
}

#header.sub .navigation li a {
	color: #171717
}

#header.sub .navi-sublist li a:hover {
	color: #f1c40f
}

.nav-sub-wrap {
	overflow: hidden;
	height: 0;
	z-index: 5555;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	padding-top: 80px;
	-webkit-transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
	-moz-transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
	-o-transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
	transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1)
}

.nav-sub-wrap.on {
	height: 222px;
	background: #fff;
	border-bottom: 1px solid #e2e2e2
}

/*탑메뉴*/
#topMenu {
	height: 40px;
	width: 800px;
	float: left;
	margin-left: 190px;
	margin-top: 25px;
	min-width: 500px;
	min-height: 40px;
	color: black;
}

#topMenu ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
}

#topMenu ul li {
	background-color: white;
	float: left;
	line-height: 20px;
	vertical-align: middle;
	text-align: center;
	position: relative;
	margin-left: 30p%;
	font-size: 15px;
}

.menuLink, .submenuLink {
	text-decoration: none;
	display: block;
	width: 200px;
	color: black;
	font-size: 15px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum;
}

.menuLink {
	color: black;
	font-size: 1.2em;
}

.topMenuLi:hover .menuLink {
	color: white;
	background-color: #f1c40f;
}

.submenuLink {
	color: #f1c40f;
	background-color: white;
}
/* 좀 더 긴 메뉴 스타일 설정 */
.longLink {
	width: 200px;
}

.submenu {
	position: absolute;
	height: 0px;
	overflow: hidden;
	transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
	-webkit-transition: height .2s; /* (구버전 크롬/사파리) */
	-moz-transition: height .2s; /* (구버전 파이어폭스) */
	-o-transition: height .2s; /* (구버전 오페라) */
}

#topMenu:hover .topMenuLi:hover .submenu {
	height: 100px;
} /* 한 메뉴당 하위메뉴 하나만*/
/* #topMenu:hover .topMenuLi .submenu {height: 180px;}		/*메뉴 전체 드롭다운 	헤더 전체 드롭다운은 어떻게..*/
.submenu {
	background: white;
}

.submenuLink:hover {
	color: white;
	background-color: #f1c40f;
}
</style>

<script type="text/javascript">
	//현재 서버 시간

	var curYear = "2018"; //현재 년

	var curMonth = "3"; //현재 월

	var curDay = "6"; //현재 일

	var curHour = "18"; //현재 시간

	var curMinute = "21"; //현재 분

	var ___isLogin___ = "false"; //로그인 여부

	var __ciYn__ = "";

	var _globalFullContextSSL = "https://www.greencar.co.kr";

	var ___isCorpChk___ = "";

	var _ssoDomain = 'member.lpoint.com';

	var _joinReturnUrl = 'https://www.greencar.co.kr/login/';

	var _fullImgHostAddr = '';

	var _birth = "";
</script>

<link type="text/css" rel="stylesheet" media="all" href="css/common.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/master.css" />
<link type="text/css" rel="stylesheet" media="all"
	href="css/calendar.css" />

<link type="text/css" rel="stylesheet" href="/js/lib/magnific-popup.css" />

<!-- <link type="text/css" rel="stylesheet" media="all" -->
<!-- 	href="./css/master.css" /> -->

<title>라젠카란 &lt; 라젠카 소개</title>

</head>

<body>


	<!-- Begin #wrap -->

	<div id="wrap">

		<div class="top_banner join" style="display: none;">
			<!-- // free 클래스 삭제 (2015-12-30) -->

			<div class="cont">

				<a href="https://www.greencar.co.kr/member/index.jsp"
					target="_blank"><img
					src="./images/common/top_banner_160825.gif"
					alt="신규가입시 3시간 무료쿠폰 전원증정" /></a>


				<p class="close">
					<a href="javascript:void(0)"><img
						src="./images/common/btn_close.png" alt="닫기" /></a>
				</p>

			</div>

		</div>

		<!-- [e]top_banner -->



		<!-- Begin #header -->

		<div id="header" class="sub">

			<div class="hgroup">

				<div class="inbox">

					<h1 class="logo">
						<a href="http://www.greencar.co.kr/"><span>라젠카</span></a>
					</h1>

					<div class="nvalinks">

						<a href="javascript:void(0);" onclick="openLapComLogin();">로그인</a>

						<a href="https://www.greencar.co.kr/member/index.jsp">회원가입</a> <a
							class="nvalinks-rev"
							href="https://www.greencar.co.kr/reserve/index.do">라젠카 예약하기</a>

					</div>
					<nav id="topMenu">
						<ul>
							<li class="topMenuLi"><a class="menuLink" href="#">LaZencar
									소개</a>
								<ul class="submenu">
									<li><a href="#" class="submenuLink longLink">Lazencar란?</a></li>
									<li><a href="#" class="submenuLink longLink">이용안내</a></li>
									<li><a href="#" class="submenuLink longLink">요금안내</a></li>
									<li><a href="#" class="submenuLink longLink">위치</a></li>
								</ul></li>

							<li class="topMenuLi"><a class="menuLink" href="#">서비스/혜택</a>
								<ul class="submenu">
									<li><a href="#" class="submenuLink longLink">특가상품</a></li>
									<li><a href="#" class="submenuLink longLink">쿠폰받기</a></li>
									<li><a href="#" class="submenuLink longLink">후기</a></li>
								</ul></li>

							<li class="topMenuLi"><a class="menuLink" href="#">고객센터</a>
								<ul class="submenu">
									<li><a href="#" class="submenuLink longLink">1:1 문의</a></li>
									<li><a href="#" class="submenuLink longLink">자주찾는 질문</a></li>
									<li><a href="#" class="submenuLink longLink">공지사항</a></li>
								</ul></li>
						</ul>
					</nav>
				</div>

			</div>

		</div>

		<!-- // End #header -->
		
		<!-- Begin #container -->

		<div id="container">

			<div class="content-wrap">

				<div class="sidebar">
					<!-- 왼쪽 메뉴 -->

					<h2 class="left-tit">라젠카 소개</h2>

					<ul class="leftMenu">

						<li class="top"><a href="#" class='on'><span>라젠카란?</span></a></li>

						<li><a
							href="http://localhost:8082/Page/p03_Use_Guide_01.html"><span>이용안내</span></a></li>

						<li><a href="#"><span>요금안내</span></a></li>

						<li><a href="http://localhost:8082/Page/p05_Road_Guide.html"><span>찾아오시는길</span></a></li>

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

				<div class="location">
					<div class="location_in">
						<p><span>고객센터</span>&gt; <strong>자주찾는 질문</strong></p>
					</div>
				</div>
				<div class="subtop-content bg_subvisual_05_01">
					<h3 class="subtit">자주찾는 질문</h3>
					<p class="subtxt"><strong>그린카가 궁금하세요? 자주찾는 질문을 이용하세요.</strong> <br />고객님의 궁금하신 사항을 빠르고 정확하게 해결하실 수 있습니다.</p>
				</div>
				<div class="bodystart">
<!-- bodystart -->

				<form id="frmSearch" name="frmSearch" method="get" action="./list.do">
					<div class="form-searchbox">
						<h4><img src="../../images/board/txt_tit_search.gif" alt="검색" /></h4>
						<div class="form-search-01">
							<label for="searchItem" class="hidden">카테고리</label>
							<select id="searchItem" name="searchItem" class="selstyle">
								<option value="ALL" >전체</option>
								<option value="TITLE" >제목</option>
								<option value="CONT" >내용</option>
							</select>
						</div>
						<div class="form-search-02"><input id="searchWord" name="searchWord" type="text" class="inputTxt" value="" title="검색어 입력" /></div>
						<div class="form-search-03"><input type="image" src="../../images/button/btn_form_search.gif" alt="검색" title="검색" /></div>
					</div>		<!-- form-searchbox -->
				</form>

					<ul class="question-tab">
					
						<li  class='on'><a href="./list.do">BEST 10<!-- (137) --></a></li>
			
							<li ><a href="./list.do?bbsCateId=1">가입/탈퇴<!-- (29) --></a></li>
							
							<li ><a href="./list.do?bbsCateId=2">예약/취소<!-- (11) --></a></li>
							
							<li ><a href="./list.do?bbsCateId=3">쿠폰/포인트<!-- (16) --></a></li>							
							
							<li ><a href="./list.do?bbsCateId=4">요금/결제<!-- (23) --></a></li>
												
							<li ><a href="./list.do?bbsCateId=5">사용/반납<!-- (26) --></a></li>
							
							<li ><a href="./list.do?bbsCateId=6">보험/사고<!-- (10) --></a></li>
							
							<li ><a href="./list.do?bbsCateId=7">전기차<!-- (15) --></a></li>
			
							<li class=' last-tab'><a href="./list.do?bbsCateId=8">편도<!-- (7) --></a></li>
						
					</ul>
					<script type="text/javascript">
						$(".question-tab li:nth-child(5)").addClass("list-ling01");
						$(".question-tab li:nth-child(6)").addClass("list-ling02");
					</script>

					<ul class="question-wrap">
				
							<li>
								<p class="question-list">
									<a href="#1WIswga4dGaM5TPA/xC9Kqg==">면허 등록이 불가능 합니다.<span class="btn"><img src="../../images/icons/icon_up.png" alt="닫기" /></span></a>
								</p>
								<div class="answer" style="display:none;">
									<div class="bul_a"><p>운전 면허 등록이 불가능하다면 하기 안내 내용을 참고 부탁드립니다.</p><p>&nbsp;</p><p>&nbsp;</p><p><strong></strong></p><p><strong>1. 운전면허 취득일자 체크</strong><br> -&nbsp; 만 21세 이상 + 면허 취득 후 1년 이후 회원가입/등록이 가능합니다.</p><p>&nbsp;</p><p><strong>2. 면허정보 수기 입력 시도</strong><br>&nbsp;-&nbsp; 사진 촬영을 통해 면허정보 등록 시, 텍스트가 완벽하게 인식되지 않아<br>&nbsp;&nbsp;&nbsp; 면허정보 불일치로 정상 등록되지 않았을 수 있습니다.</p><p>&nbsp;</p><p><strong>3. 면허 진위여부 확인 필요</strong><br>&nbsp;-&nbsp; 면허 정지/취소 후 재취득 여부에 따라 등록이 어려울 수 있습니다.<br>&nbsp;&nbsp;&nbsp; 음주, 뺑소니 등 중대 사고로 인해 면허 취소 후 재 취득 시 1년 경과 후<br>&nbsp;&nbsp;&nbsp; 가입 및 면허정보 변경이 가능하며 이외 등록 불가 상황 발생 시<br>&nbsp;&nbsp;&nbsp; 운전경력증명서(재취득 사유포함), 운전면허증을 하기 메일로 접수하신 후 <br>&nbsp;&nbsp;&nbsp; 고객센터로 연락주시면 서류 검토 후 개별 면허 등록 처리를 도와 드리고 있습니다.</p><p>&nbsp;-&nbsp; 이메일 : greencar@greencar.co.kr <br>&nbsp;-&nbsp; 고객센터 : 080-2000-3000<br>&nbsp;&nbsp;&nbsp; (개인정보 서류 발송 시 주민번호 뒷 6자리는 마스킹 처리 해 주세요)</p><p>&nbsp;</p><p><strong>4. 기존 가입 정보 확인요청</strong><br>&nbsp;-&nbsp; 기존 그린카 OR 엘포인트 통합 회원 가입이력이 있으신 경우<br>&nbsp;&nbsp;&nbsp; 동일 면허 번호로 가입/정보 수정이 불가능합니다.<br>&nbsp;&nbsp;&nbsp; 기존 계정을 확인하시어 탈퇴 OR 수정 후 등록이 가능합니다</p><p>&nbsp;</p><p>&nbsp;-&nbsp; 내 가입 정보 확인하기<br>&nbsp;&nbsp; https://<a href="http://www.greencar.co.kr/customer/license/openLicenseChkPage.do">www.greencar.co.kr/customer/license/openLicenseChkPage.do</a>&nbsp;</p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#1lx60e/cfp/eQqLsdFuTtNg==">사고가 나면 어떻게 해야 하나요? <span class="btn"><img src="../../images/icons/icon_up.png" alt="닫기" /></span></a>
								</p>
								<div class="answer" style="display:none;">
									<div class="bul_a"><p>사고 발생 즉시 고객센터(080-2000-3000)로 연락이 필요합니다.</p><p>&nbsp;</p><p>차량번호 및 기타 파손된 시설물 있다면</p><p>소유자 연락처를 확인 해 주시고 사고 사진은 필수 확보가&nbsp;</p><p>필요하므로 하기 경로를 통해 등록 부탁 드립니다.</p><p>&nbsp;</p><p><strong>* APP &gt; 고객센터 &nbsp;&gt; 사고접수 센터 &gt; 사고차량 선택, 하기 내용기입</strong></p><p><strong>&nbsp;- 사고일시&nbsp;</strong></p><p><strong>&nbsp;- 사고경위&nbsp;</strong></p><p><strong>&nbsp;- 사고사진</strong></p><p>&nbsp;</p><p>&nbsp;</p><p>사고 발생 시 모든 사고 처리가 완료될 때 까지&nbsp;</p><p>회원 자격이 일시 정지되며, 처리가 완료된 후에 다시 회원으로&nbsp;</p><p>이용이 가능합니다.</p><p>&nbsp;</p><p>만약 사고 발생 시 고객센터 연락없이&nbsp;</p><p>상대방과 합의하시거나 현장을 떠나 시간 경과 후&nbsp;</p><p>연락하시는 경우 면책적용 및 상대방에 대한&nbsp;</p><p>보험접수는 어려울 수 있으니 명심해 주시기 바랍니다.&nbsp;</p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#1tiyD3/65k/KLGzyDFCMETw==">차량에 주유는 어떻게 해야 하나요?<span class="btn"><img src="../../images/icons/icon_up.png" alt="닫기" /></span></a>
								</p>
								<div class="answer" style="display:none;">
									<div class="bul_a"><p>'주유카드는 운전석 대쉬보드 왼쪽에 위치하고 있습니다.</p><p>&nbsp;</p><p>주유카드 사용 후에는 반드시&nbsp;</p><p>원래 위치로 삽입하여 주시기 바라며 분실/파손 시 별도의</p><p>패널티가 부과될 수 있는 점 참고 부탁드립니다.</p><p>&nbsp;</p><p><strong>반드시 회사에서 지정한 차량에&nbsp;</strong></p><p><strong>배치된 주유카드를 통해 결제되어야 하며&nbsp;</strong></p><p><strong>다른 차량의 주유, 기타 비용을 결제 할 수 없습니다.</strong></p><p>&nbsp;</p><p><u><span style="color: rgb(255, 108, 0);"><u>또한 고객센터로 사전 연락 없이&nbsp;</u></span></u></p><p><u><span style="color: rgb(255, 108, 0);"><u>회원 카드/현금으로 결제된 주유비는 환불되지 않습니다.</u></span></u><span style="color: rgb(255, 108, 0);">&nbsp;</span></p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#1ad4qAORllmqZ9JHBtxrUjQ=="> 예약한 장소가 아닌 다른 그린존에 반납이 가능한가요?<span class="btn"><img src="../../images/icons/icon_up.png" alt="닫기" /></span></a>
								</p>
								<div class="answer" style="display:none;">
									<div class="bul_a"><p>왕복으로 예약하신 경우 </p><p>대여하신 그린존으로 반납해주셔야 합니다. </p><p>(그린존/프리존 편도 서비스 제외)</p><p>&nbsp;</p><p>각 차량은 소속된 그린존(주차장)에&nbsp;</p><p>차량번호 등록하여 주차 중으로 정해진 그린존이 아닌 경우,&nbsp;</p><p>일반 차량으로 간주되어 주차비가 발생됩니다.</p><p>&nbsp;</p><p>이로 인한 비용 발생(차량 이동, 주차)시&nbsp;</p><p>패널티(주차비, 견인비용)가 별도 청구되오니 주의 부탁 드립니다.&nbsp;</p><p>&nbsp;</p><p><u>부득이한 상황으로 지정된 그린존에 반납이 불가한 경우<br>고객센터(080-2000-3000)으로 연락하시어 상담 부탁드리며<br>주차하신 위치는 그린댓글에 기재하시어 이후 사용자가 <br>차량 위치를 확인하는데 혼동이 없도록 배려 부탁드립니다.</u></p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#1s6DmrBldGpTd8c6NXnfJ2A==">차량을 늦게 반납하면 어떻게 되나요?<span class="btn"><img src="../../images/icons/icon_up.png" alt="닫기" /></span></a>
								</p>
								<div class="answer" style="display:none;">
									<div class="bul_a"><p>다음 사용자 예약건이 대기 중인 상태에서&nbsp;</p><p>반납 시간 지연으로 인한 다음 사용자의 피해가 발생한 경우&nbsp;</p><p>예약 건당 30,000원과 추가 이용료가 과금 될 수 있습니다.&nbsp;</p><p>&nbsp;</p><p>예약 사용 중인 자동차는&nbsp;</p><p>다른 회원이 대기 중이지 않을 경우 연장 사용 신청이 가능하며&nbsp;</p><p>사용 종료 시간으로 부터 10분 단위로 적용됩니다.&nbsp;</p><p>&nbsp;</p><p>사전 통보 없이 반납 시간 연장을 하지 않고&nbsp;</p><p>이용을 하는 경우 회사가 임의로 반납 시간을 연장하여 요금을&nbsp;</p><p>청구 할 수 있습니다.</p><p>&nbsp;</p><p>&nbsp;</p><p>카셰어링에서 정시 반납은 반드시 지켜야 할 중요한 규칙 입니다.</p><p>&nbsp;</p><p>반납 지연 시 다음 예약 회원의&nbsp;</p><p>정상 사용이 어렵게 되며 이러한 컴플레인에 대한 문제는</p><p>그린카에서 모든 편의를 제공하여야 합니다.</p><p>&nbsp;</p><p>그 과정에서 대차 진행, 택시 등의 운송수단 보상 비용이&nbsp;</p><p>발생하게 되며 회사 측의 이익을 위한 벌금이 아닌 피해 회원들을&nbsp;</p><p>위한 제도인 점을 안내드립니다.</p><p>&nbsp;</p><p>이러한 문제 상황을 피하기 위해&nbsp;</p><p>하기 내용을 참고하시어 이용 부탁 드립니다.</p><p>&nbsp;</p><p>1. 차량 예약 시 운행시간을 고려하여 충분한 시간으로 예약&nbsp;</p><p>&nbsp; &nbsp; 운전시간과 기타 부대시간을&nbsp;</p><p>&nbsp; &nbsp; 모두 포함해서 30분~1시간 여유롭게 예약하시기를 추천 합니다.</p><p>&nbsp;</p><p>2. 정시에 목적지에서 출발</p><p>&nbsp; &nbsp; 차고지 특성에 따라 차량 위치 확인 시간이 소요 될 수 있으며</p><p>&nbsp; &nbsp; 출발/복귀 예상 시간이 다를 수 있기 때문에 충분한 시간을&nbsp;</p><p>&nbsp; &nbsp; 두는 것이 유리합니다.&nbsp;</p><p>&nbsp;</p><p>만약 주행 중에 예약 마감 시간까지&nbsp;</p><p>반납 불가능 시 스마트폰으로 예약을 연장하시거나&nbsp;</p><p>고객센터(080-2000-3000)를 통해 예약 시간을 연장 해 주세요.&nbsp;</p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#1PSv+wK6iH2LsVfkuSuuiUA==">차량 사용 후 반납 방법이 궁금합니다.<span class="btn"><img src="../../images/icons/icon_up.png" alt="닫기" /></span></a>
								</p>
								<div class="answer" style="display:none;">
									<div class="bul_a"><p><strong>1. 그린존 반납 위치에 차량 주차</strong></p><p><strong><br></strong></p><p><strong>2. 시동 OFF (미등/ 실내등/ 창문 / 썬루프 상태확인)</strong>&nbsp;</p><p>ㄴ 미등,실내등 ON 상태로 배터리 방전 / 창문이 열려 비가&nbsp;</p><p>&nbsp; &nbsp; 유입되어 세차 필요 시 패널티 금액 추가 됩니다.&nbsp;</p><p>ㄴ 전기차의 경우 차고지에 배치되어 있는 완속 충전기를</p><p>&nbsp; &nbsp; 연결해주셔야 정상 반납이 가능 합니다.</p><p>&nbsp;</p><p><strong>3. 개인용품 및 쓰레기 수거</strong></p><p><strong><br></strong></p><p>4. 문을 닫은 후 차량 밖에서 회원카드 또는&nbsp;</p><p>&nbsp; &nbsp; APP 스마트키(반납하기)를 이용하여 잠금처리</p><p>&nbsp;</p><p>5. 반납처리 후 1~2분 내에 반납처리 완료 문자 수신상태 확인</p><p>&nbsp;</p><p>위 사항 중 한가지라도 처리되지 않아&nbsp;</p><p>반납이 지연되는 경우 반납실패 문자가 발송되며 안내에 따라&nbsp;</p><p>다시 한번 반납처리를 해 주시면 됩니다.&nbsp;</p><p>&nbsp;</p><p>반납지연 시 대여요금+패널티가&nbsp;</p><p>추가로 발생되오니 문제발생 즉시 고객센터로 연락주시기 바랍니다. &nbsp;</p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#14ao9XrbyHgtEMYWUCPgy0g==">차량 손해 면책 보험이 무엇인가요?<span class="btn"><img src="../../images/icons/icon_up.png" alt="닫기" /></span></a>
								</p>
								<div class="answer" style="display:none;">
									<div class="bul_a"><p>그린카는 ‘차량손해 보상제도’에 가입되어 있으며&nbsp;</p><p>2016년 7월 요금정책 변경 적용과 함께 </p><p>회원님께서 예약 시 선택한 면책금 30/70만원에 따라 </p><p>보험료를 차등 부과하여 결제합니다.</p><p>&nbsp;</p><p><strong>차량 손해 면책제도란?</strong></p><p>차량 손해 액수에 관계없이 사고건당 차량수리비 30만원/70만원</p><p>(예약 단계에서 자기 부담금액 선택)을 지불 시</p><p>차량 손해에 대한 책임을 일정 부분 보호받을 수 있는 제도 입니다.</p><p>&nbsp;</p><p><strong>차량 손해 면책 예외 적용 상황은?</strong></p><p>1) 계약자 및 동반운전자(예약 시 등록)가 아닌 제3자의&nbsp;</p><p>&nbsp; &nbsp; 운행으로 발생한 사고(동반운전자 단독운행 포함)</p><p>2) 사고 발생 미신고, 허위신고, 고의적 파손 상태인 경우</p><p>3) 음주/불법 약물 복용 후&nbsp;</p><p>4) 1종 보통 이상의 면허 소지자 외에 승합 차량운전&nbsp;</p><p>5) 사고 발생 즉시 미신고</p><p>&nbsp;</p><p><u>위와 같은 상황인 경우 손해 면책제도를&nbsp;</u></p><p><u>적용 받으실 수 없으며 실수리비 전액 배상과 휴차료 지불, </u></p><p><u>법적조치 및 서비스 이용정지 조치가 이루어 집니다.</u></p><p>&nbsp;</p><p>* 손해 면책보험은 가입 즉시&nbsp;</p><p>&nbsp; &nbsp;그 효력을 발휘하며 환불 및 반환되지 않습니다.&nbsp;</p><p>* 손해 면책보험은 종합 보험의 책임 한도와 관계가 없습니다.</p><p>* 상해나 재물상의 손실이 본사의 배상 한도를 초과 했을 경우</p><p>&nbsp; &nbsp;회원이 초과분에 대하여 지급할 책임이 있으며 관련&nbsp;</p><p>&nbsp; &nbsp;보험사나 상대측 보험사와 컨택하여 처리 할 수 있습니다.&nbsp;</p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#1efIktY86FuCcoJxhq0gcgw==">결제카드 등록이 되지 않습니다.<span class="btn"><img src="../../images/icons/icon_up.png" alt="닫기" /></span></a>
								</p>
								<div class="answer" style="display:none;">
									<div class="bul_a">결제카드 등록이 불가능한 경우 하기 내용을 확인 부탁드리며<div>문제가 없는 경우 고객센터(080-2000-3000)으로&nbsp;</div><div>연락주시면 빠르게 확인하여 도움드릴 수 있도록 하겠습니다.</div><div><br></div><div>* 도난/분실카드 여부 확인</div><div>* 한도/잔고부족 상태 확인</div><div>* 다른 카드로 등록 시도 시 동일증상 발생여부</div><div><br></div><div>2014년 11월 26일 부터&nbsp;</div><div>개인정보 강화를 위해 예약 시 본인 정보를 인증하고 있습니다.</div><div>&nbsp;</div><div>2016년 11월 부터 명의도용 방지를 위해 가입자와</div><div>동일한 명의로 된 결제 카드(신용/체크)만 등록이 가능합니다.</div><div><br></div><div>- 기존에 등록한 타인 명의 카드는 사용가능</div><div>- 법인회원은 무기명 카드 등록가능 (가입한 사업자 등록번호 기준)</div><div><br></div><div>번거로우시겠지만 회원님의&nbsp;</div><div>자산과 정보를 보호하기 위함이니 양해 부탁드립니다.&nbsp;</div><div><br></div><div>결제카드 등록은 나이스 결제에서 제공하는&nbsp;</div><div>안전한 결제 시스템으로 운영되고 있으며 최대 7개까지&nbsp;</div><div>등록 가능합니다.</div><div><br></div><div>- 카드번호&nbsp;</div><div>- 유효기간&nbsp;</div><div>- 카드 소유주의 주민번호 앞 7자리(법정 생년월일+성별)</div><div><br></div>위와 같은 정보 이력 시 정상적으로 등록이 가능합니다.</div>
								</div>
							</li>			
					</ul>

					<div class="paging">
						<a href="./list.do?searchItem=&amp;searchWord=&amp;bbsCateId=0&amp;gotoPage=1" class="page_first"><img src="/images/board/page_first.gif" alt="처음" /></a><a href="./list.do?searchItem=&amp;searchWord=&amp;bbsCateId=0&amp;gotoPage=1" class="page_prev"><img src="/images/board/page_prev.gif" alt="이전" /></a><strong>1</strong><a href="./list.do?searchItem=&amp;searchWord=&amp;bbsCateId=0&amp;gotoPage=1" class="page_next"><img src="/images/board/page_next.gif" alt="다음" /></a><a href="./list.do?searchItem=&amp;searchWord=&amp;bbsCateId=0&amp;gotoPage=1" class="page_end"><img src="/images/board/page_end.gif" alt="마지막" /></a>
					</div>
<!-- // bodyend -->
				</div>
				
			</div> <!-- // end contentBox -->

			</div>
		</div>
		<!-- // End #container -->

		<!-- Begin #footer -->


		<div id="footer">

			<div class="footer_box01">

				<div class="footer_inner">

					<ul class="footer_family">

						<li><a
							href="https://www.lotterentacar.net/kor/info/sinchajangCall.do?mnCd=MK0501"
							target="_blank">장기렌터카</a></li>

						<li><a
							href="https://www.lotterentacar.net/kor/short/shortSubmain.do"
							target="_blank">단기렌터카</a></li>

						<li><a
							href="https://www.lotterentacar.net/kor/long/usedList.do"
							target="_blank">중고차렌터카</a></li>

						<li><a
							href="https://www.lotteautoauction.net/sell/sellMyCar/greenCarSellMyCar.do"
							target="_blank">내차팔기</a></li>

						<li><a href="https://www.lpoint.com/" target="_blank">L.POINT</a></li>

					</ul>

					<ul class="footer_partner">

						<li><a
							href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D01&seoul=Y"><img
								src="./images/common/img_partner_seoul.gif" alt="공유서울 나눔카 예약하기" /></a></li>

						<li><a
							href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D03"><img
								src="./images/common/img_partner_suwon.gif"
								alt="휴먼시티 수원 라젠카 예약하기" /></a></li>

						<li><a
							href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D02"><img
								src="./images/common/img_partner_incheon.gif"
								alt="인천광역시 라젠카 예약하기" /></a></li>

					</ul>

				</div>

			</div>

			<div class="footer_box02">

				<div class="footer_inner">

					<ul class="footer_sns">

						<li><a class="facebook"
							href="https://www.facebook.com/greencarkorea" target="_blank">라젠카
								페이스북</a></li>

						<li><a class="blog" href="http://blog.naver.com/greencar_co"
							target="_blank">라젠카 블로그</a></li>

						<li><a class="instagram"
							href="https://www.instagram.com/greencar_kr/" target="_blank">라젠카
								인스타그램</a></li>

					</ul>

					<ul class="footer_links">

						<li><a href="http://www.greencar.co.kr/service/company/">회사소개</a></li>

						<li><a href="http://www.greencar.co.kr/alliance/">제휴신청</a></li>

						<li><a href="http://www.greencar.co.kr/service/useclause/">회원이용약관</a></li>

						<li><a href="http://www.greencar.co.kr/service/personalinfo/"
							class="point">개인정보처리방침</a></li>

						<li><a href="http://www.greencar.co.kr/service/carclause/">자동차대여
								표준약관</a></li>

						<li><a href="http://www.greencar.co.kr/service/location/">위치기반
								서비스 이용약관</a></li>

						<li><a href="http://www.greencar.co.kr/service/sitemap/">사이트맵</a></li>

					</ul>

					<div class="footer_info">

						<div class="info">

							<span>(주) 라젠카</span> <span>사업자등록번호 : 220-87-91595</span> <span>통신판매업신고번호
								: 제2011-서울강남-01456호</span> <span>대표이사 : 안아름</span>

						</div>

						<div class="addr">

							<span>서울특별시 강남구 테헤란로 14길 6 (남도빌라 4층)</span> <span>TEL :
								010-9550-0167</span> <span>FAX : 02-9550-0167</span>

						</div>

						<span class="copy">Copyright &#169; 2018 LazenCar. All
							Rights Reserved.</span>

					</div>

					<div class="footer_emblem">

						<img src="./images/common/img_emblem_brandpower.jpg"
							alt="2016년 한국산업의 브랜드파워 1위" /> <img
							src="./images/common/img_emblem_brandstar.jpg"
							alt="2016년 대한민국 브랜드스타" /> <img
							src="./images/common/img_emblem_award.jpg" alt="모바일 어워드 코리아 2016" />

						<img src="./images/common/img_emblem_kspbi.jpg" alt="KS PBI" />

					</div>

				</div>

			</div>

		</div>

		<!-- // End #footer -->

	</div>

	<!-- // End #wrap -->



</body>

</html>


