<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%@ page import = "dao.ReviewDaoImpl" %>
<%@ page import = "dto.Review" %>
<%@ page import = "java.io.PrintWriter" %>

<%

   int rev_num = 0;
   if (request.getParameter("rev_num") != null) {
	   
	   rev_num = Integer.parseInt(request.getParameter("rev_num"));
	   
   }
   
   if (rev_num == 0) {
	   
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('삭제되었거나 유효하지 않은 글입니다')");
	   script.println("location.href = 'review_Board_List'");
	   script.println("</script>");
   }
	  
   ReviewDaoImpl revDao = new ReviewDaoImpl();
   Review rev = new ReviewDaoImpl().getReview(rev_num);
   revDao.Hit(rev_num);
   Review next = new ReviewDaoImpl().getReview(revDao.getNext(rev_num));
   Review prev = new ReviewDaoImpl().getReview(revDao.getPrev(rev_num));

   
   
//    if (rev.getRev_avail() == 0) {
	   
// 	   PrintWriter script = response.getWriter();
// 	   script.println("<script>");
// 	   script.println("alert('삭제되었거나 유효하지 않은 글입니다')");
// 	   script.println("location.href = 'review_Board_List'");
// 	   script.println("</script>");
	   
//    }

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

<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js"
	charset="utf-8"></script>

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
							<p>
								<span>고객센터</span>&gt; <strong>그린존신청</strong>
							</p>
						</div>
					</div>
					<div class="subtop-content bg_subvisual_01_03">
						<h3 class="subtit">후기</h3>
						<p class="subtxt">
							<strong>합리적인 소비와 환경보호를 실천하는 신개념 차량 공유서비스</strong> <br />우리동네에도
							그린카가 필요하다면 지금 바로 신청하세요!
						</p>
					</div>
					<div class="bodystart">
						<!-- bodystart -->
						<table summary="그린존 신청 상세화면" class="boardView">
							<caption>그린존 신청 상세화면</caption>
							<colgroup>
								<col width="600" />
								<col width="150" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><%= rev.getRev_title() %></th>
									<th scope="col" class="txt_r"><%= rev.getRev_date() %></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="col_padding">
										<div class="userphoto">
<!-- 											<span><img src="/images/mypage/user_none.gif" alt="프로필 사진" width="38" height="38" /></span>  -->
											
											<strong><%= rev.getRev_userId() %></strong>
											
										</div>
									</td>
									<td class="">
										<div class="board_sym_num">
											<span>공감</span> <strong>1</strong>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="board-contview">

											<div id="map_canvas" class="networkCompany"
												style="height: 400px; display: none; border: 1px solid black;"></div>
												
											<div class="txt-wrap">
											<%= rev.getRev_content() %>
											</div>
											<p class="button-type-02">
												<a href="#1"
													onclick="doRecommend('qIYmI7NzdGj/nQYjByUmLg==');"><img
													src="images/button/btn_review_regist.png" alt="좋아요" /></a>
											</p>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="board-btn-wrap">
						
						<a href="review_Board_Update.jsp?rev_num=<%= rev_num %>"><img src="images/button/btn_review_regist.png" alt="수정" /></a> </span>
						
					    <a href="review_Delete_Action.jsp?rev_num=<%= rev_num %>"><img src="images/button/btn_review_regist.png" alt="삭제" /></a> </span>
						
				        <a href="./review_Board_List.do"><img src="images/button/btn_review_regist.png" alt="목록" /></a> </span>

						</div>
						<table summary="이전글, 다음글 목록" class="board-pagelist">
							<caption>이전글, 다음글 목록</caption>
							<colgroup>
								<col width="100" />
								<col width="" />
								<col width="90" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="next"><div>다음글</div></th>
                                    <% if (next == null){ %>
                                    	
                                    	<td> 다음 글이 없습니다</td>
                                    <%}%>
                                    
                                    <% if (next != null){ %>
                                    	
                                    <td><a href="review_Board_View.jsp?rev_num=<%= next.getRev_num() %>"><%= next.getRev_title() %> <%= revDao.getNext(rev_num) %> </a></td>

                                    <%}%>
									<td></td>
								</tr>
								<tr>
									<th scope="row" class="prev"><div>이전글</div></th>
                                    <% if (prev == null){ %>
                                    	
                                    	<td> 현재 글이 첫번째 글 입니다 </td>
                                    <%}%>
                                    
                                    <% if (prev != null){ %>
                                    	
                                    <td><a href="review_Board_View.jsp?rev_num=<%= prev.getRev_num() %>"><%= prev.getRev_title() %> <%= revDao.getPrev(rev_num) %> </a></td>

                                    <%}%>
									<td></td>

								</tr>
							</tbody>
						</table>
						<!-- // bodyend -->
					</div>

					<form id="frm" name="frm" method="post" action="./remove.do"
						enctype="multipart/form-data" style="display: none;">
						<input type="hidden" id="h-bbsId" name="h-bbsId"
							value="qIYmI7NzdGj/nQYjByUmLg==" />
					</form>
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


