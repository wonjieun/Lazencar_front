<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
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
<link type="text/css" rel="stylesheet" media="all" href="css/calendar.css" />

<link type="text/css" rel="stylesheet" href="/js/lib/magnific-popup.css"/>



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
		<nav id="topMenu" > 
			<ul> 
						<li class="topMenuLi"> 
				<a class="menuLink" href="#">LaZencar 소개</a> 
				<ul class="submenu"> 
					<li><a href="#" class="submenuLink longLink">Lazencar란?</a></li> 
					<li><a href="#" class="submenuLink longLink">이용안내</a></li> 
					<li><a href="#" class="submenuLink longLink">요금안내</a></li> 
					<li><a href="#" class="submenuLink longLink">위치</a></li> 
				</ul> 
					</li>
					
								<li class="topMenuLi"> 
				<a class="menuLink" href="#">서비스/혜택</a> 
				<ul class="submenu"> 
					<li><a href="#" class="submenuLink longLink">특가상품</a></li> 
					<li><a href="#" class="submenuLink longLink">쿠폰받기</a></li> 
					<li><a href="#" class="submenuLink longLink">후기</a></li> 
				</ul> 
					</li>
				
							<li class="topMenuLi"> 
				<a class="menuLink" href="#">고객센터</a> 
				<ul class="submenu"> 
					<li><a href="#" class="submenuLink longLink">1:1 문의</a></li> 
					<li><a href="#" class="submenuLink longLink">자주찾는 질문</a></li> 
					<li><a href="#" class="submenuLink longLink">공지사항</a></li> 
				</ul> 
					</li>
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

						<li class="top"><a href="#" class = 'on' ><span>라젠카란?</span></a></li>

						<li><a href="http://localhost:8082/Page/p03_Use_Guide_01.html"><span>이용안내</span></a></li>

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
						<p><span>서비스안내</span>&gt; <strong>라젠카란?</strong></p>
					</div>
				</div>

				<div class="subtop-content bg_subvisual_01_01">
					<h3 class="subtit">라젠카란?</h3>
					<p class="subtxt"><strong>365일 24시간 전국 어디서든 만날 수 있는 내 차!</strong><br />필요한 시간만큼 10분 단위로 즉시 라젠카를 대여하실 수 있습니다.</p>
				</div>
				<div class="bodystart">
<!-- bodystart -->

					<div class="sevice_index">
					

						<!-- [s]top_info -->
						<div class="top_info">
							<h4 class="stit02">대한민국 No.1 라젠카</h4>
							<div class="top_info_box">
								<dl class="top_info01" >
									<dt>국내 최초</dt>
									<dd>
										<p class="txt">국내 카셰어링 시장을<br />개척한 First Runner<span class="bar"></span></p>
										<p class="txt_sub">2011년 국내 최초<br />카셰어링 서비스 도입</p>
									</dd>
								</dl>
								<dl class="top_info02">
									<dt>국내 최대</dt>
									<dd>
										<p class="txt">전국 2,800여개 그린존<br />6,000여대 차량<span class="bar"></span></p>
										<p class="txt_sub">경차부터 수입차까지 <span>총 55종</span>으로<br />카셰어링 부문 최다 차종 운영</p>
									</dd>
								</dl>
								<dl class="top_info03">
									<dt>국내 최고</dt>
									<dd>
										<p class="txt">최고의 서비스를 제공하는<br />대한민국 카셰어링 대표 브랜드<span class="bar"></span></p>
										<p class="txt_sub">2018 K-BPI(한국산업의 브랜드파워)<br />카셰어링 부문 4년 연속 1위 수상</p>
									</dd>
								</dl>
							</div>
						</div>
						<!-- [s]top_info -->	
						
						<!-- 추가 (2015-07-28) -->
						<!--div class="txt-img-userguide"><img src="/images/service/txt_img_user_share.jpg" alt="카셰어링? 라젠카!" /></div-->
						<div class="video">
							<iframe width="750px" height="452px" src="https://www.youtube.com/embed/639Cydro8NE" frameborder="0" title="라젠카 tv cf" ></iframe>
<!-- 							<iframe width="750px" height="452px" src="https://www.youtube.com/embed/AyOVD1ahSMc?autoplay=1&loop=1" frameborder="0" title="라젠카 tv cf" allowfullscreen></iframe> -->
						</div>
						<!-- // 추가 (2015-07-28) -->
						
						<h4 class="stit02">내 차가 필요없는 이유, 라젠카!</h4>


						<!-- [s]data_box01 -->
						<ul class="data_box01">
							<li>
								<dl class="txtbox01">
									<dt>원하는 만큼</dt>
									<dd>
										데이트/외근/쇼핑 등 차가 필요하면 언제든지<br />10분 단위로 자유롭게 라젠카를 이용하실 수 있습니다.
									</dd>
								</dl>
							</li>
							<li>
								<dl class="txtbox02">
									<dt>다양한 차종</dt>
									<dd>
										경차/승용차/SUV/전기차/승합차 등 55종의 차량을<br />사용 용도에 따라 선택하실 수 있습니다.
									</dd>
								</dl>
							</li>
							<li>
								<dl class="txtbox03">
									<dt>전국 곳곳에</dt>
									<dd>
										우리동네/학교/회사/공항/터미널 등<br />여러분의 가까운 곳에 라젠카가 기다리고 있습니다.
										<p class="btn"><a class="btn btn_ws" href="https://www.greencar.co.kr/reserve/index.do"><span style="padding:0 10px 0 8px;">라젠카 찾아보기</span></a></p>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="txtbox04">
									<dt>편리한 방식</dt>
									<dd>
										직원을 만나 계약서를 작성하지 않으셔도 됩니다.<br />스마트폰 예약 &gt; 그린존에서 차량 탑승 &gt; 스마트키로 도어오픈하세요.
									</dd>
								</dl>
							</li>
							<!--
							<li>
								<dl class="txtbox05">
									<dt>간편한 예약방식</dt>
									<dd>
										홈페이지/모바일웹/앱으로 간편하게 예약하고 앱 스마트키를 통해<br />즉시 라젠카 이용이 가능합니다.
									</dd>
								</dl>
							</li>
							<li>
								<dl class="txtbox06">
									<dt>쉬운 대여/반납/결제</dt>
									<dd>차량을 대여한 위치에 반납하면되고,<br />예약한 시간/거리만큼 요금이 자동결제 됩니다. </dd>
								</dl>
							</li>
							-->
							<li>
								<dl class="txtbox07">
									<dt>똑똑한 소비</dt>
									<dd>차량 소유로 발생하는 각종 유지 비용이 절감됩니다.<br />새롭고 합리적인 방식으로 차량을 소비하세요.</dd>
								</dl>
							</li>
							<li>
								<dl class="txtbox08">
									<dt>사회적 기여</dt>
									<dd>차량을 공유함으로써 교통환경을 개선하고 환경보호에 기여합니다.</dd>
								</dl>
							</li>
						</ul>
						<!-- [e]data_box01 -->


						<h4 class="stit02">라젠카 VS 일반 렌터카 비교</h4>


					<!-- [s]boardList01 -->
					<table summary="구분,라젠카,일반렌터카" class="boardList04 type02">
						<caption>라젠카 VS 일반 렌터카 비교 테이블</caption>
						<colgroup>
							<col width="119px" />
							<col width="284px" />
							<col width="285px" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">구분</th>
								<th scope="col">라젠카</th>
								<th class="th_last" scope="col">일반 렌터카</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">대여시간</th>
								<td>10분 단위(최소 30분)</td>
								<td class="td_last">24시간 단위</td>
							</tr>
							<tr>
								<th scope="row">대여장소</th>
								<td>집/학교/회사 근처의 그린존</td>
								<td class="td_last">지점 영업소</td>
							</tr>
							<tr>
								<th scope="row">계약방식</th>
								<td>회원가입 후 대여 시 별도 계약서 없음</td>
								<td class="td_last">대여할 때마다 계약서 작성</td>
							</tr>
							<tr>
								<th scope="row">대여방식</th>
								<td>무인(스마트폰 또는 회원카드 이용)</td>
								<td class="td_last">유인</td>
							</tr>
							<!-- 
							<tr>
								<td>보험</td>
								<td>포함</td>
								<td class="td_last">보험료 추가징수</td>
							</tr>
							-->
							<tr>
								<th scope="row">운영시간</th>
								<td>24시간</td>
								<td class="td_last">지점 영업소별 운영시간 제한</td>
							</tr>
						</tbody>
					</table>
					<!-- [e]boardList01 -->



					</div>



						<!-- // bodyend -->

					</div>

				</div>
				<!-- // end contentBox -->

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


