<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Lazencar | ¹ÏÀ½À» ÁÖ´Â °íÇ°°İ Ä«¼Î¾î¸µ</title>

<style type="text/css">
@charset "UTF-8";

/* ÀüÃ¼ ½ºÅ¸ÀÏ ¼³Á¤ */
#header *, #footer *, .sidebar * 
{
	font-family: 'Noto Sans KR', '¸¼Àº°íµñ', 'Malgun Gothic', 'MGothic',
		sans-serif, "µ¸¿ò", Dotum, "±¼¸²", Gulim
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

/*Å¾¸Ş´º*/
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
/* Á» ´õ ±ä ¸Ş´º ½ºÅ¸ÀÏ ¼³Á¤ */
.longLink {  width: 200px;} 
.submenu {
position: absolute;
height: 0px;
overflow: hidden;
transition: height .2s; /* height¸¦ º¯È­ ½ÃÄ×À» ¶§ 0.2ÃÊ°£ º¯È­ µÇµµ·Ï ¼³Á¤(±âº») */ 
-webkit-transition: height .2s; /* (±¸¹öÀü Å©·Ò/»çÆÄ¸®) */ 
-moz-transition: height .2s; /* (±¸¹öÀü ÆÄÀÌ¾îÆø½º) */ 
-o-transition: height .2s; /* (±¸¹öÀü ¿ÀÆä¶ó) */ 
} 
#topMenu:hover .topMenuLi:hover .submenu {height: 100px;}  		/* ÇÑ ¸Ş´º´ç ÇÏÀ§¸Ş´º ÇÏ³ª¸¸*/ 
/* #topMenu:hover .topMenuLi .submenu {height: 180px;}		/*¸Ş´º ÀüÃ¼ µå·Ó´Ù¿î 	Çì´õ ÀüÃ¼ µå·Ó´Ù¿îÀº ¾î¶»°Ô..*/ 
.submenu {background:white;}
.submenuLink:hover {
color: white;
background-color: #f1c40f;
} 

</style>

<script type="text/javascript">
	//ÇöÀç ¼­¹ö ½Ã°£

	var curYear = "2018"; //ÇöÀç ³â

	var curMonth = "3"; //ÇöÀç ¿ù

	var curDay = "6"; //ÇöÀç ÀÏ

	var curHour = "18"; //ÇöÀç ½Ã°£

	var curMinute = "21"; //ÇöÀç ºĞ

	var ___isLogin___ = "false"; //·Î±×ÀÎ ¿©ºÎ

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

<title>¶óÁ¨Ä«¶õ &lt; ¶óÁ¨Ä« ¼Ò°³</title>

</head>

<body>


	<!-- Begin #wrap -->

	<div id="wrap">

		<div class="top_banner join" style="display: none;">
			<!-- // free Å¬·¡½º »èÁ¦ (2015-12-30) -->

			<div class="cont">

				<a href="https://www.greencar.co.kr/member/index.jsp"
					target="_blank"><img
					src="./images/common/top_banner_160825.gif"
					alt="½Å±Ô°¡ÀÔ½Ã 3½Ã°£ ¹«·áÄíÆù Àü¿øÁõÁ¤" /></a>


				<p class="close">
					<a href="javascript:void(0)"><img
						src="./images/common/btn_close.png" alt="´İ±â" /></a>
				</p>

			</div>

		</div>

		<!-- [e]top_banner -->



		<!-- Begin #header -->

		<div id="header" class="sub">

			<div class="hgroup">

				<div class="inbox">

					<h1 class="logo">
<<<<<<< HEAD:WebContent/Page/introduction1.html
						<a href="/main.do"><span>ë¼ì  ì¹´</span></a>
=======
						<a href="http://www.greencar.co.kr/"><span>¶óÁ¨Ä«</span></a>
>>>>>>> 8b32c8568a86884a869e0f2d685e0a1ad5437dcd:WebContent/Page/guide_Introduction.jsp
					</h1>

					<div class="nvalinks">

						<a href="javascript:void(0);" onclick="openLapComLogin();">·Î±×ÀÎ</a>

						<a href="https://www.greencar.co.kr/member/index.jsp">È¸¿ø°¡ÀÔ</a> <a
							class="nvalinks-rev"
							href="https://www.greencar.co.kr/reserve/index.do">¶óÁ¨Ä« ¿¹¾àÇÏ±â</a>

					</div>
		<nav id="topMenu" > 
			<ul> 
						<li class="topMenuLi"> 
				<a class="menuLink" href="#">LaZencar ¼Ò°³</a> 
				<ul class="submenu"> 
<<<<<<< HEAD:WebContent/Page/introduction1.html
					<li><a href="/Page/introduction1.html" class="submenuLink longLink">Lazencarë€?</a></li> 
					<li><a href="/Page/guide_use1.html" class="submenuLink longLink">ì´ìš©ì•ˆë‚´</a></li> 
					<li><a href="/Page/chargeGuide.html" class="submenuLink longLink">ìš”ê¸ˆì•ˆë‚´</a></li> 
					<li><a href="/Page/guide_road.html" class="submenuLink longLink">ìœ„ì¹˜</a></li> 
=======
					<li><a href="#" class="submenuLink longLink">Lazencar¶õ?</a></li> 
					<li><a href="#" class="submenuLink longLink">ÀÌ¿ë¾È³»</a></li> 
					<li><a href="#" class="submenuLink longLink">¿ä±İ¾È³»</a></li> 
					<li><a href="#" class="submenuLink longLink">À§Ä¡</a></li> 
>>>>>>> 8b32c8568a86884a869e0f2d685e0a1ad5437dcd:WebContent/Page/guide_Introduction.jsp
				</ul> 
					</li>
					
								<li class="topMenuLi"> 
				<a class="menuLink" href="#">¼­ºñ½º/ÇıÅÃ</a> 
				<ul class="submenu"> 
					<li><a href="#" class="submenuLink longLink">Æ¯°¡»óÇ°</a></li> 
					<li><a href="#" class="submenuLink longLink">ÄíÆù¹Ş±â</a></li> 
					<li><a href="#" class="submenuLink longLink">ÈÄ±â</a></li> 
				</ul> 
					</li>
				
							<li class="topMenuLi"> 
				<a class="menuLink" href="#">°í°´¼¾ÅÍ</a> 
				<ul class="submenu"> 
					<li><a href="#" class="submenuLink longLink">1:1 ¹®ÀÇ</a></li> 
					<li><a href="#" class="submenuLink longLink">ÀÚÁÖÃ£´Â Áú¹®</a></li> 
					<li><a href="#" class="submenuLink longLink">°øÁö»çÇ×</a></li> 
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
					<!-- ¿ŞÂÊ ¸Ş´º -->



					<h2 class="left-tit">¶óÁ¨Ä« ¼Ò°³</h2>

					<ul class="leftMenu">

						<li class="top"><a href="#" class = 'on' ><span>¶óÁ¨Ä«¶õ?</span></a></li>

						<li><a href="http://localhost:8082/Page/p03_Use_Guide_01.html"><span>ÀÌ¿ë¾È³»</span></a></li>

						<li><a href="#"><span>¿ä±İ¾È³»</span></a></li>

						<li><a href="http://localhost:8082/Page/p05_Road_Guide.html"><span>Ã£¾Æ¿À½Ã´Â±æ</span></a></li>

					</ul>



					<div class="side_sns">

						<span class="tit">SNS<em></em></span> <a class="facebook"
							href="https://www.facebook.com/greencarkorea" target="_blank">¶óÁ¨Ä«
							ÆäÀÌ½ººÏ</a> <a class="blog" href="http://blog.naver.com/greencar_co"
							target="_blank">¶óÁ¨Ä« ºí·Î±×</a> <a class="instagram"
							href="https://www.instagram.com/greencar_kr" target="_blank">¶óÁ¨Ä«
							ÀÎ½ºÅ¸±×·¥</a>

					</div>

					<div class="side_cscenter">

						<span class="tit">°í°´¼¾ÅÍ</span> <span class="tel">010-9550-0167</span>

					</div>

				</div>

				<div class="contentbox">

				<div class="location">
					<div class="location_in">
						<p><span>¼­ºñ½º¾È³»</span>&gt; <strong>¶óÁ¨Ä«¶õ?</strong></p>
					</div>
				</div>

				<div class="subtop-content bg_subvisual_01_01">
					<h3 class="subtit">¶óÁ¨Ä«¶õ?</h3>
					<p class="subtxt"><strong>365ÀÏ 24½Ã°£ Àü±¹ ¾îµğ¼­µç ¸¸³¯ ¼ö ÀÖ´Â ³» Â÷!</strong><br />ÇÊ¿äÇÑ ½Ã°£¸¸Å­ 10ºĞ ´ÜÀ§·Î Áï½Ã ¶óÁ¨Ä«¸¦ ´ë¿©ÇÏ½Ç ¼ö ÀÖ½À´Ï´Ù.</p>
				</div>
				<div class="bodystart">
<!-- bodystart -->

					<div class="sevice_index">
					

						<!-- [s]top_info -->
						<div class="top_info">
							<h4 class="stit02">´ëÇÑ¹Î±¹ No.1 ¶óÁ¨Ä«</h4>
							<div class="top_info_box">
								<dl class="top_info01" >
									<dt>±¹³» ÃÖÃÊ</dt>
									<dd>
										<p class="txt">±¹³» Ä«¼Î¾î¸µ ½ÃÀåÀ»<br />°³Ã´ÇÑ First Runner<span class="bar"></span></p>
										<p class="txt_sub">2011³â ±¹³» ÃÖÃÊ<br />Ä«¼Î¾î¸µ ¼­ºñ½º µµÀÔ</p>
									</dd>
								</dl>
								<dl class="top_info02">
									<dt>±¹³» ÃÖ´ë</dt>
									<dd>
										<p class="txt">Àü±¹ 2,800¿©°³ ±×¸°Á¸<br />6,000¿©´ë Â÷·®<span class="bar"></span></p>
										<p class="txt_sub">°æÂ÷ºÎÅÍ ¼öÀÔÂ÷±îÁö <span>ÃÑ 55Á¾</span>À¸·Î<br />Ä«¼Î¾î¸µ ºÎ¹® ÃÖ´Ù Â÷Á¾ ¿î¿µ</p>
									</dd>
								</dl>
								<dl class="top_info03">
									<dt>±¹³» ÃÖ°í</dt>
									<dd>
										<p class="txt">ÃÖ°íÀÇ ¼­ºñ½º¸¦ Á¦°øÇÏ´Â<br />´ëÇÑ¹Î±¹ Ä«¼Î¾î¸µ ´ëÇ¥ ºê·£µå<span class="bar"></span></p>
										<p class="txt_sub">2018 K-BPI(ÇÑ±¹»ê¾÷ÀÇ ºê·£µåÆÄ¿ö)<br />Ä«¼Î¾î¸µ ºÎ¹® 4³â ¿¬¼Ó 1À§ ¼ö»ó</p>
									</dd>
								</dl>
							</div>
						</div>
						<!-- [s]top_info -->	
						
						<!-- Ãß°¡ (2015-07-28) -->
						<!--div class="txt-img-userguide"><img src="/images/service/txt_img_user_share.jpg" alt="Ä«¼Î¾î¸µ? ¶óÁ¨Ä«!" /></div-->
						<div class="video">
							<iframe width="750px" height="452px" src="https://www.youtube.com/embed/639Cydro8NE" frameborder="0" title="¶óÁ¨Ä« tv cf" ></iframe>
<!-- 							<iframe width="750px" height="452px" src="https://www.youtube.com/embed/AyOVD1ahSMc?autoplay=1&loop=1" frameborder="0" title="¶óÁ¨Ä« tv cf" allowfullscreen></iframe> -->
						</div>
						<!-- // Ãß°¡ (2015-07-28) -->
						
						<h4 class="stit02">³» Â÷°¡ ÇÊ¿ä¾ø´Â ÀÌÀ¯, ¶óÁ¨Ä«!</h4>


						<!-- [s]data_box01 -->
						<ul class="data_box01">
							<li>
								<dl class="txtbox01">
									<dt>¿øÇÏ´Â ¸¸Å­</dt>
									<dd>
										µ¥ÀÌÆ®/¿Ü±Ù/¼îÇÎ µî Â÷°¡ ÇÊ¿äÇÏ¸é ¾ğÁ¦µçÁö<br />10ºĞ ´ÜÀ§·Î ÀÚÀ¯·Ó°Ô ¶óÁ¨Ä«¸¦ ÀÌ¿ëÇÏ½Ç ¼ö ÀÖ½À´Ï´Ù.
									</dd>
								</dl>
							</li>
							<li>
								<dl class="txtbox02">
									<dt>´Ù¾çÇÑ Â÷Á¾</dt>
									<dd>
										°æÂ÷/½Â¿ëÂ÷/SUV/Àü±âÂ÷/½ÂÇÕÂ÷ µî 55Á¾ÀÇ Â÷·®À»<br />»ç¿ë ¿ëµµ¿¡ µû¶ó ¼±ÅÃÇÏ½Ç ¼ö ÀÖ½À´Ï´Ù.
									</dd>
								</dl>
							</li>
							<li>
								<dl class="txtbox03">
									<dt>Àü±¹ °÷°÷¿¡</dt>
									<dd>
										¿ì¸®µ¿³×/ÇĞ±³/È¸»ç/°øÇ×/ÅÍ¹Ì³Î µî<br />¿©·¯ºĞÀÇ °¡±î¿î °÷¿¡ ¶óÁ¨Ä«°¡ ±â´Ù¸®°í ÀÖ½À´Ï´Ù.
										<p class="btn"><a class="btn btn_ws" href="https://www.greencar.co.kr/reserve/index.do"><span style="padding:0 10px 0 8px;">¶óÁ¨Ä« Ã£¾Æº¸±â</span></a></p>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="txtbox04">
									<dt>Æí¸®ÇÑ ¹æ½Ä</dt>
									<dd>
										Á÷¿øÀ» ¸¸³ª °è¾à¼­¸¦ ÀÛ¼ºÇÏÁö ¾ÊÀ¸¼Åµµ µË´Ï´Ù.<br />½º¸¶Æ®Æù ¿¹¾à &gt; ±×¸°Á¸¿¡¼­ Â÷·® Å¾½Â &gt; ½º¸¶Æ®Å°·Î µµ¾î¿ÀÇÂÇÏ¼¼¿ä.
									</dd>
								</dl>
							</li>
							<!--
							<li>
								<dl class="txtbox05">
									<dt>°£ÆíÇÑ ¿¹¾à¹æ½Ä</dt>
									<dd>
										È¨ÆäÀÌÁö/¸ğ¹ÙÀÏÀ¥/¾ÛÀ¸·Î °£ÆíÇÏ°Ô ¿¹¾àÇÏ°í ¾Û ½º¸¶Æ®Å°¸¦ ÅëÇØ<br />Áï½Ã ¶óÁ¨Ä« ÀÌ¿ëÀÌ °¡´ÉÇÕ´Ï´Ù.
									</dd>
								</dl>
							</li>
							<li>
								<dl class="txtbox06">
									<dt>½¬¿î ´ë¿©/¹İ³³/°áÁ¦</dt>
									<dd>Â÷·®À» ´ë¿©ÇÑ À§Ä¡¿¡ ¹İ³³ÇÏ¸éµÇ°í,<br />¿¹¾àÇÑ ½Ã°£/°Å¸®¸¸Å­ ¿ä±İÀÌ ÀÚµ¿°áÁ¦ µË´Ï´Ù. </dd>
								</dl>
							</li>
							-->
							<li>
								<dl class="txtbox07">
									<dt>¶È¶ÈÇÑ ¼Òºñ</dt>
									<dd>Â÷·® ¼ÒÀ¯·Î ¹ß»ıÇÏ´Â °¢Á¾ À¯Áö ºñ¿ëÀÌ Àı°¨µË´Ï´Ù.<br />»õ·Ó°í ÇÕ¸®ÀûÀÎ ¹æ½ÄÀ¸·Î Â÷·®À» ¼ÒºñÇÏ¼¼¿ä.</dd>
								</dl>
							</li>
							<li>
								<dl class="txtbox08">
									<dt>»çÈ¸Àû ±â¿©</dt>
									<dd>Â÷·®À» °øÀ¯ÇÔÀ¸·Î½á ±³ÅëÈ¯°æÀ» °³¼±ÇÏ°í È¯°æº¸È£¿¡ ±â¿©ÇÕ´Ï´Ù.</dd>
								</dl>
							</li>
						</ul>
						<!-- [e]data_box01 -->


						<h4 class="stit02">¶óÁ¨Ä« VS ÀÏ¹İ ·»ÅÍÄ« ºñ±³</h4>


					<!-- [s]boardList01 -->
					<table summary="±¸ºĞ,¶óÁ¨Ä«,ÀÏ¹İ·»ÅÍÄ«" class="boardList04 type02">
						<caption>¶óÁ¨Ä« VS ÀÏ¹İ ·»ÅÍÄ« ºñ±³ Å×ÀÌºí</caption>
						<colgroup>
							<col width="119px" />
							<col width="284px" />
							<col width="285px" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">±¸ºĞ</th>
								<th scope="col">¶óÁ¨Ä«</th>
								<th class="th_last" scope="col">ÀÏ¹İ ·»ÅÍÄ«</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">´ë¿©½Ã°£</th>
								<td>10ºĞ ´ÜÀ§(ÃÖ¼Ò 30ºĞ)</td>
								<td class="td_last">24½Ã°£ ´ÜÀ§</td>
							</tr>
							<tr>
								<th scope="row">´ë¿©Àå¼Ò</th>
								<td>Áı/ÇĞ±³/È¸»ç ±ÙÃ³ÀÇ ±×¸°Á¸</td>
								<td class="td_last">ÁöÁ¡ ¿µ¾÷¼Ò</td>
							</tr>
							<tr>
								<th scope="row">°è¾à¹æ½Ä</th>
								<td>È¸¿ø°¡ÀÔ ÈÄ ´ë¿© ½Ã º°µµ °è¾à¼­ ¾øÀ½</td>
								<td class="td_last">´ë¿©ÇÒ ¶§¸¶´Ù °è¾à¼­ ÀÛ¼º</td>
							</tr>
							<tr>
								<th scope="row">´ë¿©¹æ½Ä</th>
								<td>¹«ÀÎ(½º¸¶Æ®Æù ¶Ç´Â È¸¿øÄ«µå ÀÌ¿ë)</td>
								<td class="td_last">À¯ÀÎ</td>
							</tr>
							<!-- 
							<tr>
								<td>º¸Çè</td>
								<td>Æ÷ÇÔ</td>
								<td class="td_last">º¸Çè·á Ãß°¡Â¡¼ö</td>
							</tr>
							-->
							<tr>
								<th scope="row">¿î¿µ½Ã°£</th>
								<td>24½Ã°£</td>
								<td class="td_last">ÁöÁ¡ ¿µ¾÷¼Òº° ¿î¿µ½Ã°£ Á¦ÇÑ</td>
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
							target="_blank">Àå±â·»ÅÍÄ«</a></li>

						<li><a
							href="https://www.lotterentacar.net/kor/short/shortSubmain.do"
							target="_blank">´Ü±â·»ÅÍÄ«</a></li>

						<li><a
							href="https://www.lotterentacar.net/kor/long/usedList.do"
							target="_blank">Áß°íÂ÷·»ÅÍÄ«</a></li>

						<li><a
							href="https://www.lotteautoauction.net/sell/sellMyCar/greenCarSellMyCar.do"
							target="_blank">³»Â÷ÆÈ±â</a></li>

						<li><a href="https://www.lpoint.com/" target="_blank">L.POINT</a></li>

					</ul>

					<ul class="footer_partner">

						<li><a
							href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D01&seoul=Y"><img
								src="./images/common/img_partner_seoul.gif" alt="°øÀ¯¼­¿ï ³ª´®Ä« ¿¹¾àÇÏ±â" /></a></li>

						<li><a
							href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D03"><img
								src="./images/common/img_partner_suwon.gif"
								alt="ÈŞ¸Õ½ÃÆ¼ ¼ö¿ø ¶óÁ¨Ä« ¿¹¾àÇÏ±â" /></a></li>

						<li><a
							href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D02"><img
								src="./images/common/img_partner_incheon.gif"
								alt="ÀÎÃµ±¤¿ª½Ã ¶óÁ¨Ä« ¿¹¾àÇÏ±â" /></a></li>

					</ul>

				</div>

			</div>

			<div class="footer_box02">

				<div class="footer_inner">

					<ul class="footer_sns">

						<li><a class="facebook"
							href="https://www.facebook.com/greencarkorea" target="_blank">¶óÁ¨Ä«
								ÆäÀÌ½ººÏ</a></li>

						<li><a class="blog" href="http://blog.naver.com/greencar_co"
							target="_blank">¶óÁ¨Ä« ºí·Î±×</a></li>

						<li><a class="instagram"
							href="https://www.instagram.com/greencar_kr/" target="_blank">¶óÁ¨Ä«
								ÀÎ½ºÅ¸±×·¥</a></li>

					</ul>

					<ul class="footer_links">

						<li><a href="http://www.greencar.co.kr/service/company/">È¸»ç¼Ò°³</a></li>

						<li><a href="http://www.greencar.co.kr/alliance/">Á¦ÈŞ½ÅÃ»</a></li>

						<li><a href="http://www.greencar.co.kr/service/useclause/">È¸¿øÀÌ¿ë¾à°ü</a></li>

						<li><a href="http://www.greencar.co.kr/service/personalinfo/"
							class="point">°³ÀÎÁ¤º¸Ã³¸®¹æÄ§</a></li>

						<li><a href="http://www.greencar.co.kr/service/carclause/">ÀÚµ¿Â÷´ë¿©
								Ç¥ÁØ¾à°ü</a></li>

						<li><a href="http://www.greencar.co.kr/service/location/">À§Ä¡±â¹İ
								¼­ºñ½º ÀÌ¿ë¾à°ü</a></li>

						<li><a href="http://www.greencar.co.kr/service/sitemap/">»çÀÌÆ®¸Ê</a></li>

					</ul>

					<div class="footer_info">

						<div class="info">

							<span>(ÁÖ) ¶óÁ¨Ä«</span> <span>»ç¾÷ÀÚµî·Ï¹øÈ£ : 220-87-91595</span> <span>Åë½ÅÆÇ¸Å¾÷½Å°í¹øÈ£
								: Á¦2011-¼­¿ï°­³²-01456È£</span> <span>´ëÇ¥ÀÌ»ç : ¾È¾Æ¸§</span>

						</div>

						<div class="addr">

							<span>¼­¿ïÆ¯º°½Ã °­³²±¸ Å×Çì¶õ·Î 14±æ 6 (³²µµºô¶ó 4Ãş)</span> <span>TEL :
								010-9550-0167</span> <span>FAX : 02-9550-0167</span>

						</div>

						<span class="copy">Copyright &#169; 2018 LazenCar. All
							Rights Reserved.</span>

					</div>

					<div class="footer_emblem">

						<img src="./images/common/img_emblem_brandpower.jpg"
							alt="2016³â ÇÑ±¹»ê¾÷ÀÇ ºê·£µåÆÄ¿ö 1À§" /> <img
							src="./images/common/img_emblem_brandstar.jpg"
							alt="2016³â ´ëÇÑ¹Î±¹ ºê·£µå½ºÅ¸" /> <img
							src="./images/common/img_emblem_award.jpg" alt="¸ğ¹ÙÀÏ ¾î¿öµå ÄÚ¸®¾Æ 2016" />

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


