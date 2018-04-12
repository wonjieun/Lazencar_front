<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
	clear: both;
} /*대체 뭘하려는걸까*/
.contentbox {
	float: right;
	width: 750px;
}

/* 왼쪽메뉴 */
.sidebar {
	float: left;
	width: 240px;
	padding-top: 62px;
}

.left-tit {
	height: 49px;
	line-height: 33px;
	font-size: 28px;
	font-weight: 500;
	color: #f1c40f;
}

.leftMenu li a {
	display: block;
	height: 48px;
	padding: 0 20px;
	border-bottom: 1px solid #e2e2e2;
	cursor: pointer;
}

.leftMenu li a:hover {
	margin-top: -1px;
	border-bottom-color: #f1c40f;
	background-color: #f1c40f;
}

.leftMenu li:first-child a:hover {
	margin-top: 0;
}

.leftMenu li.top a {
	border-top: 1px solid #e2e2e2;
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

/*content 상단 제목*/
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
	font-family: "맑은고딕";
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

#mini-title {
	margin-top: 10px;
	margin-bottom: 10px;
}

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

/*common 전체 설정*/
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
	font-family: 'NanumGothic', '맑은고딕', 'Malgun Gothic', 'MGothic',
		sans-serif, "돋움", Dotum, "굴림", Gulim;
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
	font-family: 'NanumGothic', '맑은고딕', 'Malgun Gothic', 'MGothic',
		sans-serif, "돋움", Dotum, "굴림", Gulim;
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
	font-family: 'NanumGothic', '맑은고딕', 'Malgun Gothic', 'MGothic',
		sans-serif, "돋움", Dotum, "굴림", Gulim;
}
/*input[type="password"] { color:#555;}*/
input::-ms-clear {
	display: none;
}

textarea {
	border: 1px solid #d9d9d9;
	font-size: 12px;
	font-family: 'NanumGothic', '맑은고딕', 'Malgun Gothic', 'MGothic',
		sans-serif, "돋움", Dotum, "굴림", Gulim;
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

/* 기본 링크 스타일 */
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

/* 요금안내 */
.charges-wrap {
	font-size: 13px;
}

.charges-wrap h4 {
	padding-left: 18px;
	font-size: 18px;
	color: #f1c40f;
	font-weight: bold;
	background: url("./images/common/blt01.gif") left 6px no-repeat;
}

.charges-wrap h4.mgtop {
	margin-top: 60px;
}

.tbl-green-member {
	margin-top: 20px;
}

.tbl-green-member th, .tbl-green-member td {
	padding: 15px 0;
	padding-left: 20px;
	font-size: 14px;
	border-bottom: 1px solid #e2e2e2;
}

.tbl-green-member th {
	font-weight: bold;
	text-align: left;
	background-color: #b7b0a7;
	border-bottom: 1px solid #9e9890 !important;
	color: #fff;
}

.tbl-green-member tr.top th, .tbl-green-member tr.top td {
	border-top: 2px solid #9e9890;
}

.tbl-green-member .btn_coupon_now a {
	display: inline-block;
	margin-left: 20px;
}
/* 2017 1 02 */
.tbl-green-member .btn_coupon_now .black_border_btn {
	width: 97px;
	height: 27px;
	line-height: 27px;
}

.tbl-green-member .btn_coupon_now  img {
	vertical-align: middle;
}

.green-charges-txt-wrap {
	font-size: 14px;
}

.green-charges-txt-wrap .subtxt {
	margin-top: 5px;
}

.charges-boxing {
	padding: 20px;
	border: 1px solid #e2e2e2;
}

.green-charges-box {
	margin-top: 20px;
}

.green-charges-txt li {
	padding-left: 10px;
	background: url("./images/common/blt04.gif") left 6px no-repeat;
	padding-bottom: 15px;
}

.green-charges-txt li.last {
	padding-bottom: 0;
}

.green-charges-txt li span {
	color: #ff5907;
}

.chargesImg01 {
	margin: 20px 0 10px 0;
}

/* 정상웅 id,pw find */
#find .title {
	font-size: 18px;
	padding-bottom: 5px;
	color: #f1c40f;
}

#find {
	border-top: 2px solid #f1c40f;
	border-bottom: 1px solid #f1c40f;
	padding: 40px 0;
	margin: auto;
}

#find .idPadding {
	padding: 7px;
	border-bottom: 1px solid #ececec;
}

#find .pwPadding {
	padding: 8px;
	border-bottom: 1px solid #ececec;
}

#find .left {
	width: 368px;
	/* 	padding-left:100px; */
	padding-top: 30px;
	position: relative;
	padding-bottom: 55px;
	vertical-align: top;
}

#find .right {
	width: 368px;
	/* 	padding-right:100px; */
	padding-top: 30px;
	position: relative;
	padding-bottom: 55px;
	vertical-align: top;
}

#find .frm {
	padding: 23px 0;
	padding-left: 15px;
	border-bottom: 1px solid #ececec;
	overflow: hidden;
	color: #6e6e6e;
	margin-bottom: 20px;
}

#find .frm input {
	width: 255px;
	padding-left: 5px;
	height: 27px;
	line-height: 27px;
	border: 2px solid #ececec;
	margin-bottom: 5px;
}

#find .frm span {
	line-height: 29px;
	height: 29px;
	margin-bottom: 5px;
	color: #6d6e72;
	width: 57px;
	display: inline-block;
}

#find .ok button {
	background-color: #f1c40f;
	color: white;
	width: 100px;
	height: 50px;
	margin-left: 145px;
	/* margin: auto; */
	/* align-self: center; */
}

#find .ok button {
	width: 100px;
	height: 55px;
	line-height: 55px;
	font-size: 16px;
	color: #fff;
	background: #f1c40f;
	display: block;
	text-align: center;
	margin: 0 auto;
}

.dotted_y {
	width: 40px;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

#find .frm .join_hidden {
	color: #fa5c3f;
	font-size: 12px;
	/*     display: none; */
	line-height: 1.5;
	width: auto;
	padding-left: 57px;
	height: auto;
	margin: 0;
}
/* 정상웅 id,pw find end */
</style>






<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
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

// 	비밀번호찾기 - 폰번호입력 란에 숫자만 입력 받기 (isNaN함수)
function checkNumber(){
    if(isNaN($("#phone2_pw").val()) || isNaN($("#phone3_pw").val())){
          alert("숫자만 입력하세요");
          document.getElementById("phone2_pw").value="";
    }
}
	
	$(document).ready(
			function() {
				$("#btnOk_id").click(
						function() {

							var name_id = $("#name_id").val();
							var email_id = $("#email1_id").val()
							+ "@"
							+ $("#email2_id").val();
							console.log("이름 : " + name_id);
							console.log("이메일: " + email_id);

							if ($("#name_id").val() == null
									|| $("#name_id").val() == "") {
								alert("이름 입력후 눌러주세요");
								return;
							} else if ($("#email1_id").val() == null
									|| $("#email2_id").val() == null
									|| $("#email1_id").val() == ""
									|| $("#email2_id").val() == "") {
								alert("이메일 입력후 눌러주세요");
								return;
							}
							if($("#name_id").val()!="" && $("#email1_id").val() !="" && $("#email2_id").val() !=""){
								$.ajax({
									type : "POST",
									url : "/login/findId.do",
									data : {
										memName:name_id,
										memEmail:email_id
									},
									dataType : "json",
									success : function(data) {
										console.log("아이디찾기Ajax success");
										
										var memId = JSON.parse(data.memId);
										var msg = JSON.parse(data.msg);
										var email = JSON.parse(data.memEmail);
										console.log("---"+memId);
										console.log("---"+msg);
										
										var showIdHtml = "";
// 										if (memId != "" && memId!=null) {
// 											showIdHtml = "아이디는 " + memId + " 입니다.";
// 										}else{
											showIdHtml = msg;
// 										}
// 										$("#alert_id").html(showIdHtml);
										
										if(memId !=null && memId!=""){
											
											var $form = $("<form>").attr("action","/mail").attr("method","post");
											$("<input>").attr("type","hidden").attr("name","from_email").attr("value","lazencarboss@gmail.com").appendTo($form);
											$("<input>").attr("type","hidden").attr("name","to_email").attr("value",email).appendTo($form);
											$("<input>").attr("type","hidden").attr("name","subtitle").attr("value","Lazencar Send your Id").appendTo($form);
											$("<input>").attr("type","hidden").attr("name","content").attr("value","your Id is :"+memId).appendTo($form);
											
											$form.appendTo($(document.body));
											
											$form.submit();
											$("#alert_id").html(showIdHtml);
										}else{
											$("#alert_id").html(showIdHtml);
										}
									},
									error : function(e) {
										console.log("------error------");
										console.log(e.responseText);
									}
								});
							}
						});
				$("#btnOk_pw").click(function() {
					
					var id_pw = $("#id_pw").val();
					var email_pw = $("#email1_pw").val()
					+ "@"
					+ $("#email2_pw").val();
					var phone_pw = $("#phone1_pw").val()+$("#phone2_pw").val()+$("#phone3_pw").val();
					
					console.log("아이디 : " + id_pw);
					console.log("이메일: " + email_pw);
					console.log("휴대폰: " + phone_pw);
					
					if ($("#id_pw").val() == null
							|| $("#id_pw").val() == "") {
						alert("이름 입력후 눌러주세요");
						return;
					} else if ($("#email1_pw").val() == null
							|| $("#email2_pw").val() == null
							|| $("#email1_pw").val() == ""
							|| $("#email2_pw").val() == "") {
						alert("이메일 입력후 눌러주세요");
						return;
					}else if ($("#phone1_pw").val() ==null
							||$("#phone1_pw").val() ==""
							||$("#phone2_pw").val() == null
							||$("#phone2_pw").val() == ""
							||$("#phone3_pw").val() == null
							||$("#phone3_pw").val() == ""){
						alert("핸드폰 번호를 입력 후 눌러주세요.");
						return;
					}
					if($("#id_pw").val()!="" 
							&& $("#email1_pw").val() !="" 
							&& $("#email2_pw").val() !="" 
							&& $("#phone2_pw").val() != ""
							&& $("#phone3_pw").val() !=""){
						$.ajax({
							type : "POST",
							url : "/login/findPw.do",
							data : {
								memId:id_pw,
								memEmail:email_pw,
								memPhone:phone_pw
							},
							dataType : "json",
							success : function(data) {
								console.log("비번찾기Ajax success");

								var memPw = JSON.parse(data.memPw);
								var msg = JSON.parse(data.msg);
								var email = JSON.parse(data.memEmail);
								console.log(memPw);
								console.log("--"+data.memPw);
								console.log(msg);
								var showPwHtml = "";
// 								if (memPw != "" || memPw != null) {
// 									showPwHtml = "비밀번호는 " + memPw + " 입니다.";
// // 								}else if(memPw == "" || memPw==null){
// 								}else{
									showPwHtml = msg;
// 								}
// 								$("#alert_pw").html(showPwHtml);
// // 								$("#alert_pw").html().attr('href','meilto:')
							if(memPw !=null && memPw!=""){
								$("#alert_pw").html(showIdHtml);
									var $form = $("<form>").attr("action","/mail").attr("method","post");
									$("<input>").attr("type","hidden").attr("name","from_email").attr("value","lazencarboss@gmail.com").appendTo($form);
									$("<input>").attr("type","hidden").attr("name","to_email").attr("value",email).appendTo($form);
									$("<input>").attr("type","hidden").attr("name","subtitle").attr("value","Lazencar Send your Password").appendTo($form);
									$("<input>").attr("type","hidden").attr("name","content").attr("value","your password is : "+memPw).appendTo($form);
									$form.appendTo($(document.body));
									
									$form.submit();
									$("#alert_pw").html(showPwHtml);
							}else{
								$("#alert_pw").html(showPwHtml);
							}
							},
							error : function(e) {
								console.log("------error------");
								console.log(e.responseText);
							}
						});
					}
				});
			});
</script>

<title>ID PW 찾기</title>

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

					<ul class="navigation">

						<li><a href="javascript:void(0);">라젠카 소개</a>

							<ul class="navi-sublist subnav01">

								<li><a href="#">라젠카란?</a></li>

								<li><a href="#">이용안내</a></li>

								<li><a href="#">요금안내</a></li>

								<li><a href="#">찾아오시는길</a></li>

							</ul></li>

						<li><a href="javascript:void(0);">서비스/혜택</a>

							<ul class="navi-sublist subnav02">

								<li><a href="#">쿠폰받기</a></li>

								<li><a href="#">특가상품</a></li>

								<li><a href="#">후기</a></li>

							</ul></li>

						<li><a href="javascript:void(0);">고객센터</a>

							<ul class="navi-sublist subnav03">

								<li><a href="#">자주찾는질문</a></li>

								<li><a href="#">1:1문의</a></li>

								<li><a href="#">공지사항</a></li>

							</ul></li>

					</ul>

				</div>

			</div>

			<div class="nav-sub-wrap"></div>
			<!-- navi sublist box -->

		</div>

		<!-- // End #header -->



		<!-- Begin #container -->

		<div id="container">

			<div class="content-wrap">

				<div class="bodystart">

					<!-- bodystart 	=========================================컨텐츠 변경가능 영역!!================================================  -->










					<div class="charges-wrap">

						<table id="find" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td class="left">
										<div class="title">아이디 찾기</div>
										<div class="idPadding"></div>
										<div class="frm" style="padding-bottom: 62px;">
											<span>이름</span> <input type="text" id="name_id"
												name="name_id" /><br> <span>이메일</span> <input
												type="text" id="email1_id" name="email1_id"
												style="width: 100px;" /> @ <input type="text"
												id="email2_id" name="email2_id" style="width: 126px;" /> <span
												class="join_hidden" id="alert_id"></span>
										</div>
										<div class="ok">
											<!-- 											<a href="javascript:fnSearch('I');" id="btnOk_id">확인</a> -->
											<button id="btnOk_id">확인</button>
										</div>
									</td>
									<td class="dotted_y"></td>
									<td class="right">
										<div class="title">비밀번호 찾기</div>
										<div class="pwPadding"></div>
										<div class="frm">
											<span>아이디</span> <input type="text" id="id_pw"
												name="id_pw"> <br> <span>이메일</span> <input
												type="text" style="width: 100px;" id="email1_pw"
												name="email1_pw" /> @ 
												<input type="text" style="width: 126px;" id="email2_pw" name="email2_pw" /> <br>
											<span>휴대폰</span> <select id="phone1_pw" name="phone1_pw"
												style="font-size: 13px; margin-bottom: 5px; height: 30px; border: 2px solid #ececec;">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select> &nbsp; -&nbsp; 
											<input type="text" style="width: 70px;" id="phone2_pw" name="phone2_pw" maxlength="4" onkeyup='checkNumber()'/> &nbsp;- &nbsp; 
											<input type="text" style="width: 80px;" id="phone3_pw" name="phone3_pw" maxlength="4"  onkeyup='checkNumber()'/>
											<span class ="join_hidden" id="alert_pw"></span>
										</div>
										<div class="ok">
											<!--										<a href="javascript:fnSearch('P');">확인</a> -->
											<button id="btnOk_pw">확인</button>
										</div>
									</td>
								</tr>

							</tbody>

						</table>


					</div>
					<!-- charges-wrap -->

				</div>
				<!-- // bodyend -->
			</div>
			<!-- // end contentBox -->

		</div>
		<!-- // End #content-wrap -->

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
	<!-- // End #wrap -->

</body>

</html>


