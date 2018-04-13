<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Lazencar | ������ �ִ� ��ǰ�� ī�ξ</title>

<style type="text/css">
@charset "UTF-8";

/* ��ü ��Ÿ�� ���� */
#header *, #footer *, .sidebar * 
{
	font-family: 'Noto Sans KR', '�������', 'Malgun Gothic', 'MGothic',
		sans-serif, "����", Dotum, "����", Gulim
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

/*ž�޴�*/
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
/* �� �� �� �޴� ��Ÿ�� ���� */
.longLink {  width: 200px;} 
.submenu {
position: absolute;
height: 0px;
overflow: hidden;
transition: height .2s; /* height�� ��ȭ ������ �� 0.2�ʰ� ��ȭ �ǵ��� ����(�⺻) */ 
-webkit-transition: height .2s; /* (������ ũ��/���ĸ�) */ 
-moz-transition: height .2s; /* (������ ���̾�����) */ 
-o-transition: height .2s; /* (������ �����) */ 
} 
#topMenu:hover .topMenuLi:hover .submenu {height: 100px;}  		/* �� �޴��� �����޴� �ϳ���*/ 
/* #topMenu:hover .topMenuLi .submenu {height: 180px;}		/*�޴� ��ü ��Ӵٿ� 	��� ��ü ��Ӵٿ��� ���..*/ 
.submenu {background:white;}
.submenuLink:hover {
color: white;
background-color: #f1c40f;
} 


/* container */
.content-wrap {
	position: relative;
	width: 1060px;
	margin: 0 auto;
	padding: 80px 0 340px
}
.content-wrap:after {
	content: "";
	display: block;
	clear: both
} /*��ü ���Ϸ��°ɱ�*/
.contentbox {
	float: right;
	width: 750px
}

/* ���ʸ޴� */
.sidebar {
	float: left;
	width: 240px;
	padding-top: 62px
}
.left-tit {
	height: 49px;
	line-height: 33px;
	font-size: 28px;
	font-weight: 500;
	color: #f1c40f
}
.leftMenu li a {
	display: block;
	height: 48px;
	padding: 0 20px;
	border-bottom: 1px solid #e2e2e2;
	cursor: pointer
}
.leftMenu li a:hover {
	margin-top: -1px;
	border-bottom-color: #f1c40f;
	background-color: #f1c40f
}
.leftMenu li:first-child a:hover {
	margin-top: 0
}
.leftMenu li.top a {
	border-top: 1px solid #e2e2e2
}
.leftMenu li.top a:hover {
	border-top-color: #f1c40f
}
.leftMenu li a span {
	display: block;
	height: 48px;
	line-height: 49px;
	font-size: 16px;
	color: #4d4c4c;
	font-weight: 500;
	background: url(./images/icons/left_menu_off.gif) no-repeat right center
}
.leftMenu li a:hover span {
	background: url(./images/icons/left_menu_on.png) no-repeat right center;
	color: #fff
}

.side_sns {
	margin-top: 60px;
	padding: 0 0 20px 20px;
	border-bottom: 1px solid #f0f0f0
}
.side_sns .tit {
	display: inline-block;
	font-weight: 500;
	font-size: 16px;
	line-height: 34px;
	color: #3c3c3c;
	vertical-align: top
}
.side_sns em {
	display: inline-block;
	position: relative;
	top: 1px;
	width: 1px;
	height: 13px;
	margin-left: 10px;
	background: #ddd
}
.side_sns a {
	display: inline-block;
	width: 34px;
	height: 34px;
	margin-left: 10px;
	background: url('./images/common/icon_sns.png') no-repeat;
	font: 0/0 dotum;
	color: transparent;
	vertical-align: top
}
.side_sns .facebook {
	background-position: 0 -45px
}
.side_sns .facebook:hover {
	background-position: 0 -89px
}
.side_sns .blog {
	background-position: -44px -45px
}
.side_sns .blog:hover {
	background-position: -44px -89px
}
.side_sns .instagram {
	background-position: -88px -45px
}
.side_sns .instagram:hover {
	background-position: -88px -89px
}
.side_cscenter {
	padding: 15px 0 15px 20px;
	border-bottom: 2px solid #d8d8d8
}
.side_cscenter span {
	display: block;
	font-weight: 500;
	line-height: 1.4;
	color: #3c3c3c
}
.side_cscenter .tit {
	font-size: 16px
}
.side_cscenter .tel {
	font-size: 24px
}


/*content ��� ����*/
.location {
	padding-top: 34px
}
.location_in {
	display: none
}
.location_in:after {
	content: "";
	display: block;
	clear: both
}
.location_in p {
	float: right;
	padding-left: 18px;
	background: url(./images/icons/home.gif) no-repeat 0 3px;
	font-size: 13px
}
.location_in p span {
	margin: 0 4px
}
.location_in p strong {
	margin: 0 4px
}
.subtop-content {
	padding-top: 22px;
	height: 135px
}
.subtop-content.bg-none {
	height: auto;
	background-image: none
}
.subtit {
	padding-bottom: 8px;
	background: url(./images/common/bg_subtit.gif) no-repeat 0 bottom;
	font-weight: bold;
	font-size: 32px;
	color: #3c3c3c
}
.subtit2 {
    padding-bottom: 8px;
    background: url(./images/common/bg_subtit.gif) no-repeat 0 bottom;
	font-weight: bold;
	font-size: 18px;
	font-family: "�������";
	color: #3c3c3c
}
.subtop-content.bg-none .subtit {
	background-image: none
}
.subtxt {
	margin-top: 20px;
	font-size: 15px;
	line-height: 19px;
	color: #767676
}
.subtxt strong {
	color: #3c3c3c
}

/*body*/
.bodystart {
	margin-top: 41px
}
#mini-title {margin-top: 10px; margin-bottom: 10px;}


/* footer */
#footer {
	background-color: #fff;
	border-top: 1px solid #e2e2e2
}
.footer_box01 {
	height: 48px
}
.footer_box02 {
	height: 200px;
	background: #fafafa;
	border-top: 1px solid #e2e2e2
}
.footer_box01 .footer_inner {
	overflow: hidden
}
.footer_box02 .footer_inner {
	width: 1070px;
	padding: 75px 0 0 10px
}

.footer_inner {
	position: relative;
	width: 1080px;
	margin: 0 auto
}
.footer_inner ul {
	overflow: hidden;
	margin-bottom: 17px
}
.footer_inner li {
	float: left
}

.footer_family {
	float: left;
	border-left: 1px solid #e2e2e2
}
.footer_family li {
	border-right: 1px solid #e2e2e2
}
.footer_family li a {
	display: inline-block;
	width: 115px;
	font-size: 13px;
	text-align: center;
	line-height: 48px;
	color: #636363
}
.footer_family li a:hover {
	text-decoration: underline
}

.footer_partner {
	float: right;
	padding-right: 10px
}
.footer_partner a {
	display: inline-block;
	height: 48px;
	margin-left: 26px;
	vertical-align: top
}
.footer_partner a img {
	display: inline-block
}

.footer_sns {
	position: absolute;
	top: 22px;
	left: 0
}
.footer_sns li {
	width: 34px;
	height: 34px;
	margin-right: 8px
}
.footer_sns a {
	display: block;
	width: 100%;
	height: 100%;
	background: url('./images/common/icon_sns.png') no-repeat;
	font: 0/0 dotum;
	color: transparent
}
.footer_sns a.facebook {
	background-position: 0 0
}
.footer_sns a.blog {
	background-position: -42px 0
}
.footer_sns a.instagram {
	background-position: -84px 0
}

.footer_links li {
	padding-left: 17px;
	background: url('./images/common/bg_bar_footer.gif') no-repeat 8px
		center
}
.footer_links li:first-child {
	padding-left: 0
}
.footer_links a {
	font-size: 14px;
	color: #3c3c3c
}
.footer_links a.point {
	color: #ceb856
}
.footer_links a:hover {
	text-decoration: underline
}

.footer_info span {
	display: inline-block;
	margin-right: 13px;
	font-size: 13px;
	line-height: 1.4;
	color: #636363
}

.footer_emblem {
	position: absolute;
	top: 73px;
	right: 10px
}
.footer_emblem img {
	float: left;
	margin-left: 10px
}


/*common ��ü ����*/
* {
	margin: 0;
	padding: 0;
}
html {
	height: 100%;
}
body {
	height: 100%;
	font-size: 75%;
	font-family: 'NanumGothic', '�������', 'Malgun Gothic', 'MGothic',
		sans-serif, "����", Dotum, "����", Gulim;
	color: #767676;
}
img {
	border: 0;
	vertical-align: top;
	font-size: 0;
}
form, fieldset {
	display: block;
	border: 0;
}
ul, ol, li {
	list-style: none;
}
ul, ol, li, a, table, td, th, p, dl, dd, dt, strong, span, div {
	font-size: 1em;
	line-height: 1.5;
	word-spacing: -1px;
}

p, acronym, address, big, small, cite, code, dfn, em, kbd, pre, samp,
	sub, sup, tt, var {
	font-weight: normal;
	font-style: normal;
}
h1, h2, h3, h4, h5, h6 {
	font-size: 1em;
	letter-spacing: -1px;
	font-family: 'NanumGothic', '�������', 'Malgun Gothic', 'MGothic',
		sans-serif, "����", Dotum, "����", Gulim;
}
big {
	font-size: 1.125em;
} /* 14px */
small {
	font-size: 0.95em;
} /* 11px */
sub {
	font-size: 1.05em;
}
input, select {
	vertical-align: middle;
	font-size: 1em;
	color: #767676;
	font-family: 'NanumGothic', '�������', 'Malgun Gothic', 'MGothic',
		sans-serif, "����", Dotum, "����", Gulim;
}
/*input[type="password"] { color:#555;}*/
input::-ms-clear {
	display: none;
}
textarea {
	border: 1px solid #d9d9d9;
	font-size: 12px;
	font-family: 'NanumGothic', '�������', 'Malgun Gothic', 'MGothic',
		sans-serif, "����", Dotum, "����", Gulim;
	resize: none;
	box-sizing: border-box;
}
del {
	text-decoration: line-through;
}

hr {
	display: none;
}

iframe {
	border: 0;
}

/* �⺻ ��ũ ��Ÿ�� */
a:link {
	color: #767676;
	text-decoration: none;
}
a:visited {
	color: #767676;
	text-decoration: none;
}
a:hover, a:focus {
	color: #767676;
	text-decoration: none;
}
a:active {
	color: #767676;
	text-decoration: none;
}
a.hoverline:hover {
	text-decoration: underline
}


/* clear */
.clear {
	clear: both;
}




/* ��ݾȳ� */
.charges-wrap {
	font-size:13px;
}
.charges-wrap h4{
	padding-left:18px;
	font-size:18px;
	color:#f1c40f;
	font-weight:bold;
	background: url("./images/common/blt01.gif") left 6px no-repeat;		
}
.charges-wrap h4.mgtop {
	margin-top:60px;
}
.tbl-green-member {
	margin-top:20px;
}
.tbl-green-member th,
.tbl-green-member td {
	padding:15px 0;
	padding-left:20px;
	font-size:14px;
	border-bottom:1px solid #e2e2e2;	
}
.tbl-green-member th {
	font-weight:bold;
	text-align:left;
	background-color:#b7b0a7;
	border-bottom:1px solid #9e9890!important;
	color:#fff;
}
.tbl-green-member tr.top th,
.tbl-green-member tr.top td {
	border-top:2px solid #9e9890;
}
.tbl-green-member .btn_coupon_now a {
	display:inline-block;
	margin-left: 20px;
}
/* 2017 1 02 */.tbl-green-member .btn_coupon_now .black_border_btn{width:97px; height:27px; line-height:27px;}
.tbl-green-member .btn_coupon_now  img{
	vertical-align: middle;
}

.green-charges-txt-wrap {
	font-size:14px;
}
.green-charges-txt-wrap .subtxt {
	margin-top:5px;
}
.charges-boxing {
	padding:20px;
	border:1px solid #e2e2e2;
}
.green-charges-box {
	margin-top:20px;
}
.green-charges-txt li {
	padding-left:10px;
	background: url("./images/common/blt04.gif") left 6px no-repeat;
	padding-bottom:15px;
}
.green-charges-txt li.last {
	padding-bottom:0;
}
.green-charges-txt li span {
	color:#ff5907;
}
.chargesImg01 {
	margin:20px 0 10px 0;
}
</style>

<%-- header include --%><jsp:include page="header.jsp" />




<script type="text/javascript">
	//���� ���� �ð�

	var curYear = "2018"; //���� ��

	var curMonth = "3"; //���� ��

	var curDay = "6"; //���� ��

	var curHour = "18"; //���� �ð�

	var curMinute = "21"; //���� ��

	var ___isLogin___ = "false"; //�α��� ����

	var __ciYn__ = "";

	var _globalFullContextSSL = "https://www.greencar.co.kr";

	var ___isCorpChk___ = "";

	var _ssoDomain = 'member.lpoint.com';

	var _joinReturnUrl = 'https://www.greencar.co.kr/login/';

	var _fullImgHostAddr = '';

	var _birth = "";
</script>


<script type="text/javascript" src="./js/lib/jquery-1.9.1.js"></script>


<!-- <link type="text/css" rel="stylesheet" media="all" -->
<!-- 	href="./css/master.css" /> -->

<title>��ݾȳ� &lt; ����ī �Ұ�</title>

</head>

<body>


	<!-- Begin #wrap -->

	<div id="wrap">

		<div class="top_banner join" style="display: none;">
			<!-- // free Ŭ���� ���� (2015-12-30) -->

			<div class="cont">

				<a href="https://www.greencar.co.kr/member/index.jsp"
					target="_blank"><img
					src="./images/common/top_banner_160825.gif"
					alt="�ű԰��Խ� 3�ð� �������� ��������" /></a>


				<p class="close">
					<a href="javascript:void(0)"><img
						src="./images/common/btn_close.png" alt="�ݱ�" /></a>
				</p>

			</div>

		</div>

		<!-- [e]top_banner -->



		<!-- Begin #container -->

		<div id="container">

			<div class="content-wrap">

				<div class="sidebar">
					<!-- ���� �޴� -->



					<h2 class="left-tit">����ī �Ұ�</h2>

					<ul class="leftMenu">

						<li class="top"><a href="#"><span>����ī��?</span></a></li>

						<li><a href="#"><span>�̿�ȳ�</span></a></li>

						<li><a href="#"><span>��ݾȳ�</span></a></li>

						<li><a href="#" class = 'on'><span>ã�ƿ��ô±�</span></a></li>

					</ul>



					<div class="side_sns">

						<span class="tit">SNS<em></em></span> <a class="facebook"
							href="https://www.facebook.com/greencarkorea" target="_blank">����ī
							���̽���</a> <a class="blog" href="http://blog.naver.com/greencar_co"
							target="_blank">����ī ��α�</a> <a class="instagram"
							href="https://www.instagram.com/greencar_kr" target="_blank">����ī
							�ν�Ÿ�׷�</a>

					</div>

					<div class="side_cscenter">

						<span class="tit">������</span> <span class="tel">010-9550-0167</span>

					</div>

				</div>

				<div class="contentbox">
					<!-- contentbox�� ���� -->


        <div class="location">
          <div class="location_in">
            <p><span>����ī �Ұ�</span>&gt; <strong>��ݾȳ�</strong></p>
          </div>
        </div>
        <div class="subtop-content bg_subvisual_02_01">
          <h3 class="subtit">��ݾȳ�</h3>
          <p class="subtxt"><strong>30�е� �뿩 ������ �������� ����ī,</strong><br />�ִ� 86%���� ���ε� ��������� ����������.</p>
        </div>

					<div class="bodystart">

						<!-- bodystart 	=========================================������ ���氡�� ����!!================================================  -->

						<div class="charges-wrap">

						<h4 id="mini-title">����ī ȸ���� �ȳ�</h4>
						<div><img width="100%" alt="ȸ���� �ȳ�" src="./images/charge_guide/Membership.png" />  </div>

						<h4 id="mini-title">��� �ȳ�</h4>
						<p>- ������ �ð�, ������ �Ÿ���ŭ�� �����ϰ� �ո����� ������� ����ī�� �̿��Ͻ� �� �ֽ��ϴ�.</p>
						<div><img width="100%" alt="��� �ȳ�" src="./images/charge_guide/Charge.png" />	</div>

						<h4 id="mini-title">������ ���ǥ</h4>
						<p>- ����ī�� ��� �̺�Ʈ(���� �� ����)�� �����Ͽ� ǥ�ؿ�ݺ��� ���� �����ϰ� �̿� �����մϴ�.
						<div><img width="100%" alt="���ǥ" src="./images/charge_guide/CarList.png" />	</div>
						<p>	- ���� �� ����, �̺�Ʈ �� �������ǿ� ���� ���� ���� ���������� �����˴ϴ�. �ǽð� ���δ뿩����� ���� ��ȸ�غ�����.<br>
							- ����ī �̿����� �Ⱓ��(�����/������ ��) ��� ��å�� ���� �ǽð� ������ �� �ֽ��ϴ�.<br>
							- �������� ���������� ���� ����� �� �ֽ��ϴ�.<br>
						</p>
							
						<h4 id="mini-title">�ð��ȳ�(�뿩���� ����)</h4>
						<p>
						- ���� : �Ͽ��� 19:00 ~ �ݿ��� 18:50<br>
						- �ָ� : �ݿ��� 19:00 ~ �Ͽ��� 18:50<br>
						- ������ : 00:00 ~ 23:50(�ָ� ��� ����)<br>
						- �ɾ� : 00:00 ~ 06:50(�ָ�/������ ����) <br>
						   ��, �ɾ߿���� �뿩���� �ð��� ���� ���� ���� �뿩 �ǿ� ����˴ϴ�.
						</p>
							
						<h4 id="mini-title">����ȳ�</h4>
						<p>
						- ������ �ð���ŭ ����ᰡ �ΰ��Ǹ�, �ڵ��� ���պ���(���ι��/�빰���/�ڱ��ü���) �� �������ظ�å����(��������)�� ���Ե˴ϴ�.
						</p>
						<div><img width="100%" alt="���� �ȳ�" src="./images/charge_guide/Insurance.png" />	</div>	
							
						<h4 id="mini-title">������ �ڱ�δ�� �ȳ�</h4>
						<p>
						- ���� �뿩 �� �̿����� ��å������ ���� �������ذ� �߻��� ��� �뿩 �� �����Ͻ� ����ῡ ���� ���ظ�å ������ ���� �� �ֽ��ϴ�.
						</p>
						<div><img width="100%" alt="�ڱ�δ�� �ȳ�" src="./images/charge_guide/Deductible.png" />	</div>	
							
						<h4 id="mini-title">����ī ���Ȱ�� TIP</h4>
						<div><img width="80%" alt="���θ��" src="./images/charge_guide/Promotion.png" />	</div>	
							
					</div>	<!-- charges-wrap -->

				</div>		<!-- // bodyend -->
			</div>		<!-- // end contentBox -->

		</div>	<!-- // End #content-wrap -->

	</div>	<!-- // End #container -->
		
		<!-- Begin #footer -->

		<div id="footer">

			<div class="footer_box01">

				<div class="footer_inner">

					<ul class="footer_family">

						<li><a
							href="https://www.lotterentacar.net/kor/info/sinchajangCall.do?mnCd=MK0501"
							target="_blank">��ⷻ��ī</a></li>

						<li><a
							href="https://www.lotterentacar.net/kor/short/shortSubmain.do"
							target="_blank">�ܱⷻ��ī</a></li>

						<li><a
							href="https://www.lotterentacar.net/kor/long/usedList.do"
							target="_blank">�߰�������ī</a></li>

						<li><a
							href="https://www.lotteautoauction.net/sell/sellMyCar/greenCarSellMyCar.do"
							target="_blank">�����ȱ�</a></li>

						<li><a href="https://www.lpoint.com/" target="_blank">L.POINT</a></li>

					</ul>

					<ul class="footer_partner">

						<li><a
							href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D01&seoul=Y"><img
								src="./images/common/img_partner_seoul.gif" alt="�������� ����ī �����ϱ�" /></a></li>

						<li><a
							href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D03"><img
								src="./images/common/img_partner_suwon.gif"
								alt="�޸ս�Ƽ ���� ����ī �����ϱ�" /></a></li>

						<li><a
							href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D02"><img
								src="./images/common/img_partner_incheon.gif"
								alt="��õ������ ����ī �����ϱ�" /></a></li>

					</ul>

				</div>

			</div>

			<div class="footer_box02">

				<div class="footer_inner">

					<ul class="footer_sns">

						<li><a class="facebook"
							href="https://www.facebook.com/greencarkorea" target="_blank">����ī
								���̽���</a></li>

						<li><a class="blog" href="http://blog.naver.com/greencar_co"
							target="_blank">����ī ��α�</a></li>

						<li><a class="instagram"
							href="https://www.instagram.com/greencar_kr/" target="_blank">����ī
								�ν�Ÿ�׷�</a></li>

					</ul>

					<ul class="footer_links">

						<li><a href="http://www.greencar.co.kr/service/company/">ȸ��Ұ�</a></li>

						<li><a href="http://www.greencar.co.kr/alliance/">���޽�û</a></li>

						<li><a href="http://www.greencar.co.kr/service/useclause/">ȸ���̿���</a></li>

						<li><a href="http://www.greencar.co.kr/service/personalinfo/"
							class="point">��������ó����ħ</a></li>

						<li><a href="http://www.greencar.co.kr/service/carclause/">�ڵ����뿩
								ǥ�ؾ��</a></li>

						<li><a href="http://www.greencar.co.kr/service/location/">��ġ���
								���� �̿���</a></li>

						<li><a href="http://www.greencar.co.kr/service/sitemap/">����Ʈ��</a></li>

					</ul>

					<div class="footer_info">

						<div class="info">

							<span>(��) ����ī</span> <span>����ڵ�Ϲ�ȣ : 220-87-91595</span> <span>����Ǹž��Ű��ȣ
								: ��2011-���ﰭ��-01456ȣ</span> <span>��ǥ�̻� : �ȾƸ�</span>

						</div>

						<div class="addr">

							<span>����Ư���� ������ ������� 14�� 6 (�������� 4��)</span> <span>TEL :
								010-9550-0167</span> <span>FAX : 02-9550-0167</span>

						</div>

						<span class="copy">Copyright &#169; 2018 LazenCar. All
							Rights Reserved.</span>

					</div>

					<div class="footer_emblem">

						<img src="./images/common/img_emblem_brandpower.jpg"
							alt="2016�� �ѱ������ �귣���Ŀ� 1��" /> <img
							src="./images/common/img_emblem_brandstar.jpg"
							alt="2016�� ���ѹα� �귣�彺Ÿ" /> <img
							src="./images/common/img_emblem_award.jpg" alt="����� ����� �ڸ��� 2016" />

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


