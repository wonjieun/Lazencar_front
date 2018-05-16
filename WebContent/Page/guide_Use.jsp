<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

<style type="text/css">
@charset "UTF-8";

/* 전체 스타일 설정 */
#header *, #footer *, .sidebar * 
{
	font-family: 'Noto Sans KR', '맑은고딕', 'Malgun Gothic', 'MGothic',
		sans-serif, "돋움", Dotum, "굴림", Gulim
}
#wrap 		{	height: 100% }
#container 	{	min-height: 100%; margin: -80px 0 -250px	}

/* Header */
#header {*z-index:1001;position:relative;height:80px}
.hgroup {position:relative;*display:inline-block;*zoom:1;z-index:7000}
.hgroup .inbox {position:relative;width:1080px;height:80px;margin:0 auto;z-index:555}

/* navigation */
.hgroup .logo {position:absolute;top:0;left:10px}
.hgroup .logo a {display:block;width:156px;height:68px;padding-top:12px}
.hgroup .logo a span {display:block;padding-top:48px;background:url('./images/common/logo.png') no-repeat 0 0;font:0/0 dotum;color:transparent}
.nvalinks {position:absolute;top:19px;right:10px}
.nvalinks a {float:left;height:40px;padding-left:13px;background:url('./images/main/bg_dot.png') no-repeat 6px center;font-size:13px;line-height:40px;letter-spacing:-0.05em;color:#fff}
.nvalinks a:first-child {padding-left:0;background:none}
.nvalinks a:hover {text-decoration:underline}
a.nvalinks-rev {margin-left:14px;padding:0 18px;background:none;border:1px solid #fff;-webkit-border-radius:3px;border-radius:3px;font-size:16px;letter-spacing:-0.03em;line-height:38px;-webkit-transition-duration:0.2s;transition-duration:0.2s}
a.nvalinks-rev:hover {background:#f1c40f;border:1px solid #f1c40f;text-decoration:none}
.navigation {overflow:hidden;height:80px;padding-left:197px}
.navigation li {float:left;text-align:center}
.navigation li a {display:block;margin:0 27px;height:80px;line-height:78px;font-size:18px;letter-spacing:-0.03em;color:#fff}
.navi-sublist {display:none;z-index:9000;position:absolute;padding-top:19px}
.navi-sublist.on {display:block}
.navi-sublist li {float:none;text-align:left}
.navi-sublist li a {display:block;width:auto;height:auto;line-height:34px;font-size:16px;color:#3c3c3c;letter-spacing:-0.03em}
.navi-sublist li a:hover {color:#f1c40f}


#header.sub .hgroup {background:#fff;border-bottom:1px solid #eee}
#header.sub .hgroup .inbox {height:79px}
#header.sub .hgroup .logo a span {background-position:0 -58px}
#header.sub .nvalinks a {background:url('./images/main/bg_dot02.png') no-repeat 6px center;color:#636363}
#header.sub .nvalinks a:first-child {padding-left:0;background:none}
#header.sub .nvalinks a:hover {color:#171717}
#header.sub a.nvalinks-rev {background:none;border:1px solid #f1c40f;color:#f1c40f}
#header.sub a.nvalinks-rev:hover {background:#f1c40f;color:#fff}
#header.sub .navigation li a {color:#171717}
#header.sub .navi-sublist li a:hover {color:#f1c40f}
.nav-sub-wrap {overflow:hidden;height:0;z-index:5555;position:absolute;top:0;left:0;width:100%;padding-top:80px;-webkit-transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
-moz-transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
-o-transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1)}
.nav-sub-wrap.on {height:222px;background:#fff;border-bottom:1px solid #e2e2e2}

/*탑메뉴*/
#topMenu { 
height: 40px; 
width: 800px; 
float : left;
margin-left :190px;
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
text-decoration:none;
display: block;
width: 200px;
color : black;
font-size: 15px;
font-weight: bold;
font-family: "Trebuchet MS", Dotum;
}
.menuLink {
color: black; 
font-size: 1.2em;} 

.topMenuLi:hover .menuLink {
color: white;
background-color: #f1c40f;
} 
.submenuLink {
color: #f1c40f;
background-color: white;
} 
/* 좀 더 긴 메뉴 스타일 설정 */
.longLink {  width: 200px;} 
.submenu {
position: absolute;
height: 0px;
overflow: hidden;
transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */ 
-webkit-transition: height .2s; /* (구버전 크롬/사파리) */ 
-moz-transition: height .2s; /* (구버전 파이어폭스) */ 
-o-transition: height .2s; /* (구버전 오페라) */ 
} 
#topMenu:hover .topMenuLi:hover .submenu {height: 100px;}  		/* 한 메뉴당 하위메뉴 하나만*/ 
/* #topMenu:hover .topMenuLi .submenu {height: 180px;}		/*메뉴 전체 드롭다운 	헤더 전체 드롭다운은 어떻게..*/ 
.submenu {background:white;}
.submenuLink:hover {
color: white;
background-color: #f1c40f;
} 

</style>
<%-- header include --%><jsp:include page="header.jsp" />

<link type="text/css" rel="stylesheet" media="all" href="css/common.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/master.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/calendar.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/service.css" />
<link type="text/css" rel="stylesheet" href="/js/lib/magnific-popup.css"/>



<!-- <link type="text/css" rel="stylesheet" media="all" -->
<!-- 	href="./css/master.css" /> -->

<title>요금안내 &lt; 라젠카 소개</title>

</head>

<body>


	<!-- Begin #wrap -->

	<div id="wrap">

		<!-- [e]top_banner -->






		<!-- Begin #container -->

		<div id="container">

			<div class="content-wrap">

				<div class="sidebar">
					<!-- 왼쪽 메뉴 -->



					<h2 class="left-tit">라젠카 소개</h2>

					<ul class="leftMenu">

						<li class="top"><a href="#" ><span>라젠카란?</span></a></li>

						<li><a href="#" class = 'on' ><span>이용안내</span></a></li>

						<li><a href="#"><span>요금안내</span></a></li>

						<li><a href="#"><span>찾아오시는길</span></a></li>

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
						<p><span>서비스 안내</span>&gt; <strong>이용안내</strong></p>
					</div>
				</div>
				<div class="subtop-content bg_subvisual_01_02">
					<h3 class="subtit">이용안내</h3>
					<p class="subtxt"><strong>가입부터 결제까지 간편하게 이용 할 수 있는 라젠카</strong><br />합리적인 자동차생활의 제안! 라젠카 이용방법을 알려드립니다.</p>
				</div>
				<div class="bodystart">
<!-- bodystart -->
			
				<p class="member-subtxt"><strong>라젠피플의 Pride! 라젠피플 에티켓!</strong><br />다음 사용자를 위한 배려, 에티켓 실천은 기본입니다.</p>
				<h4 class="stit01">라젠피플 에티켓</h4>
				<ul class="etiquette-wrap">
					<li class="etiquette01">
						<div class="bg-wrap">
							<div class="txt">
								<p class="point-color02">차량상태 보고</p>
								<p>사용 전 차량운전 전에 차량  외관과 내부에 사고흔적이 있는지 잘 살펴주세요.</p>
								<p>주행 중 사고가 나거나 문의사항이 있으면 본사로 바로 연락 부탁 드립니다.</p>
							</div>
						</div>
					</li>
					<li class="etiquette02">
						<div class="bg-wrap">
							<div class="txt">
								<p class="point-color02">깨끗이 사용해 주세요</p>
								<p>사용 후 개인소지품은 꼭 챙겨주시고 쓰레기는 모두 비워주세요. </p>
							</div>
						</div>
					</li>
					<li class="etiquette03">
						<div class="bg-wrap">
							<div class="txt">
								<p class="point-color02">금연</p>
								<p>라젠카의 모든 차량내 흡연은  절대금지되어 있습니다. </p>
								<p>차내에서는 반드시 금연 부탁드립니다.</p>
								<p>흡연 시 패널티 30만원 부과되며 회원 자격이 영구적으로 박탈됩니다.</p>
							</div>
						</div>
					</li>
					<li class="etiquette04">
						<div class="bg-wrap">
							<div class="txt">
								<p class="point-color02">사전주유필수</p>
								<p>기름은 항상 적어도 ¼ 유지해  주시고 주유가 필요하시면 <br />차량 내 비치된 주유카드를 사용해 주세요. </p>
								<p>주유카드는 라젠카가 부담하는 카드입니다.</p>
							</div>
						</div>
					</li>
					<li class="etiquette05">
						<div class="bg-wrap">
							<div class="txt">
								<p class="point-color02">차량반납시간 준수</p>
								<p>지연반납 패널티는 최소 3만원부터 시작합니다. </p>
								<p>다음 고객의 예약이 있을 경우 연장은 불가능 합니다. </p>
							</div>
						</div>
					</li>
					<li class="etiquette06 line-none">
						<div class="bg-wrap">
							<div class="txt">
								<p class="point-color02">애완동물은 캐리어안에 </p>
								<p>사랑하는 애완동물은 반드시 캐리어에 넣어 탑승부탁 드립니다. </p>
							</div>
						</div>
					</li>
				</ul>

<!-- // bodyend -->
				</div>

			</div> <!-- // end contentBox -->
			
		</div>
		
	</div>
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


