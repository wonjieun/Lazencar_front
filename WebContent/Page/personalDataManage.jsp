<%@page import="javax.websocket.SendResult"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberModifyDataDao"%>
<%@ page import="dao.MemberModifyDataDaoImpl"%>
<%@ page import="dto.Member"%>
<%
		if(session.getAttribute("id") == null){
			response.sendRedirect("login.jsp");
		}else{
			String id = session.getAttribute("id").toString();
			MemberModifyDataDao dao = new MemberModifyDataDaoImpl();
			Member mem = dao.getMemData(id);
%>
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
	padding: 80px 0 0 0;
}

.content-wrap:after {
	content: "";
	display: block;
	clear: both
} /*대체 뭘하려는걸까*/
.contentbox {
	float: right;
	width: 750px
}

/* 왼쪽메뉴 */
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

.addr p {
	line-height: 2.0;
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
	margin-bottom: 300px;
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

/* 개인정보 관리 css start */
caption#caption {
	height: 26px;
	padding: 5px;
	background: #f9f9f9;
	border-bottom: 1px solid;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: rgb(222, 222, 222);
	color: #777777;
	text-align: left;
}

h1 {
	
}

h3 {
	margin-bottom: 30px;
	margin-top: 3px;
	color: #4c4c4c;
	font-size: 28px;
	font-family: 'NanumGothicBold';
}

h4 {
	margin-bottom: 25px;
	color: #4c4c4c;
	font-size: 18px;
	font-family: 'NanumGothicBold';
}

h5 {
	margin-bottom: 10px;
	color: #4c4c4c;
	font-size: 16px;
	font-family: 'NanumGothicBold';
}

h6 {
	margin-bottom: 10px;
	color: #ababab;
	font-size: 12px;
	font-family: 'NanumGothicBold';
}

/* section guide */
.section01 {
	margin-bottom: 25px;
}

.section02 {
	margin-bottom: 35px;
}

.section03 {
	margin-bottom: 7px;
}

/* space guide */
.ml5 {
	margin-left: 5px !important;
}

.ml10 {
	margin-left: 10px !important;
}

.tblp {
	margin-top: 5px !important;
}

/* table guide */
.tbl01 {
	overflow: hidden;
	border-top: 1px solid #f2c60f;
	/* 	border-bottom: 1px solid #dedede; */
}

.tbl01 table {
	width: 100%;
	margin-bottom: -1px;
}

.tbl01 .caption {
	height: 26px;
	padding: 5px 0 0 20px;
	background: #f9f9f9;
	border-bottom: 1px solid #dedede;
	color: #777777;
	text-align: left;
	font-family: 'NanumGothicBold';
}

.tbl01 th {
	height: 19px;
	padding: 8px 0 9px 20px;
	background: #f9f9f9;
	border-right: 1px solid #ebebeb;
	text-align: left;
	vertical-align: top;
	font-family: 'NanumGothicBold';
}

.tbl01 th em {
	display: inline-block;
	margin-right: 3px;
	color: #ba262a;
}

.tbl01 td {
	height: 19px;
	padding: 8px 20px 9px 20px;
	border-bottom: 1px solid #dedede;
	vertical-align: middle;
}

.tbl01 td .formatIn {
	display: inline-block;
	margin-top: 0;
}

/* input guide */
.w50 {
	width: 45px;
}

.w80 {
	width: 75px;
}

.w100 {
	width: 94px;
}

.w150 {
	width: 145px;
}

.w200 {
	width: 195px;
}

.w250 {
	width: 245px;
}

/* button guide */
.btnArea02 {
	margin-top: 25px;
	text-align: center;
}

.btnArea02 a {
	margin-right: 3px;
}

/* button member */
a.btnP01 {
	display: inline-block;
	height: 25px;
	padding: 0px 24px 0 24px;
	background: #f6d85d;
	border: 1px solid #c8ad55;
	color: #ffffff;
	font-family: 'NanumGothicBold';
	text-align: center;
	vertical-align: middle;
	line-height: 25px;
}

/* button table  */
a.btnTbl01 {
	line-height: 150%;
	display: inline-block;
	height: 20px;
	padding: 0 4px 0 4px;
	background: #a2a2a2;
	border: 1px solid #949494;
	color: #ffffff;
	font-family: 'NanumGothicBold';
	vertical-align: middle;
}

ul.tabs {
	border-bottom: 1px solid #f2c71a;
	margin: 0px;
	padding: 0px;
	list-style: none;
	margin: 0px;
}

ul.tabs li {
	background: #f2c71a73;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
	color: #ffff;
}

ul.tabs li.current {
	background: #f2c71a;
	color: #ffff;
}

.tabContent {
	display: none;
	padding: 15px;
}

.tabContent.current {
	display: inherit;
}

.alert_pwCheck{
	color: red;
    font-size: 7pt;
    margin-left: 15px;
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


<script type="text/javascript" src="./js/lib/jquery-1.9.1.js"></script>


<!-- <link type="text/css" rel="stylesheet" media="all" -->
<!-- 	href="./css/master.css" /> -->

<title>요금안내 &lt; 라젠카 소개</title>

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



					<h2 class="left-tit">마이 페이지</h2>

					<ul class="leftMenu">

						<li class="top"><a href="#"><span>예약확인</span></a></li>

						<li><a href="#"><span>개인정보 관리</span></a></li>

						<li><a href="#"><span>쿠폰</span></a></li>

						<li><a href="#"><span>1:1문의</span></a></li>

						<li><a href="#" class='on'><span>회원탈퇴</span></a></li>

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
							<p>
								<span>그린카 소개</span>&gt; <strong>요금안내</strong>
							</p>
						</div>
					</div>
					<div class="subtop-content">
						<h3 class="subtit">개인정보 관리</h3>
					</div>
					<div class="bodystart">

						<!-- bodystart 	=========================================컨텐츠 변경가능 영역!!================================================  -->
		
						<div class="charges-wrap">
							<ul class="tabs">
								<li class="tabLink current" data-tab="tab1">개인정보 수정</li>
								<li class="tabLink" data-tab="tab2">면허정보 관리</li>
							</ul>
							<div id="tab1" class="tabContent current">
								<div class="section02">
									<!-- S:table //-->
									<div class="tbl01">

										<table summary="">
											<colgroup>
												<col width="22%" />
												<col width="78%" />
											</colgroup>
											<tbody>
												<tr>
													<th><label>사용자 아이디</label></th>
													<td><%=mem.getMemId()%><input type="hidden"
														id="mem_id" value="<%=mem.getMemId()%>" /></td>
												</tr>
												<tr>
													<th><label>이름(실명)</label></th>
													<td><%=mem.getMemName()%><input type="hidden"
														id="mem_name" value="<%=mem.getMemName()%>" /></td>
												</tr>
												<tr>
													<th><label>주민번호</label></th>
													<td><%=mem.getMemJumin1()%><input type="hidden"
														id="mem_jumin1" value="<%=mem.getMemJumin1()%>" /> - <%=mem.getMemJumin2()%><input
														type="hidden" id="mem_jumin2"
														value="<%=mem.getMemJumin2()%>" /></td>
												</tr>
												<tr>
													<th><em title="필수입력">*</em>휴대폰번호</th>
													<td><span class="formatIn"> <input type="text"
															id="mem_phone1" class="w100" title="휴대폰번호 앞자리."
															maxlength="3" value="<%=mem.getMemPhone1()%>" /> - <input
															type="text" id="mem_phone2" class="w100"
															title="휴대폰번호 중간자리." maxlength="4"
															value="<%=mem.getMemPhone2()%>" /> - <input type="text"
															class="w100" id="mem_phone3" title="휴대폰번호 뒷자리."
															maxlength="4" value="<%=mem.getMemPhone3()%>" />
													</span></td>
												</tr>
												<tr>
													<th><em title="필수입력">*</em>주소</th>
													<td><span class="formatIn"><input type="text"
															name="homeZipCode" id="homeZipCode" class="w50"
															maxlength="6" readonly="readonly"
															value="<%=mem.getMemZip()%>" /><a href="#homeZipCode"
															id="postcodify_search_button" class="btnTbl01 ml5">우편번호검색</a></span>
														<p class="formatIn tblp">
															<input type="text" name="mem_addr1" id="mem_addr1"
																class="w200 kor" maxlength="50"
																value="<%=mem.getMemAddr1()%>" /> <input type="text"
																name="mem_addr2" id="mem_addr2" class="w200 kor"
																maxlength="50" value="<%=mem.getMemAddr2()%>" />
														</p></td>
												</tr>
												<tr>
													<th><em title="필수입력">*</em> 이메일</th>
													<td>
														<form name="form">
															<span class="formatIn"><input type="text"
																id="mem_email1" name="EMAIL_1" class="w100"
																maxlength="30" value="<%=mem.getMemEmail1()%>" /><span
																class="ml5">@</span><input type="text" id="mem_email2"
																name="EMAIL_2" class="w150 ml5" maxlength="20"
																value="<%=mem.getMemEmail2()%>" /> <select
																name="emailSelect" id="emailSelect" class="ml5">
																	<option value="">직접입력</option>
																	<option value="daum.net">daum.net</option>
																	<option value="empal.com">empal.com</option>
																	<option value="gmail.com">gmail.com</option>
																	<option value="hanmail.net">hanmail.net</option>
																	<option value="msn.com">msn.com</option>
																	<option value="naver.com">naver.com</option>
																	<option value="nate.com">nate.com</option>
															</select> </span>



														</form>

													</td>
												</tr>

											</tbody>
										</table>
									</div>
									<!--// E:table -->
								</div>

								<h6>-안전한 비밀번호 관리를 위하여 월 1회 주기적으로 비밀번호를 변경하여 주시기 바랍니다.</h6>
								<div class="section02">
									<!-- S:table //-->
									<div class="tbl01">
										<table summary="">
											<colgroup>
												<col width="22%" />
												<col width="78%" />
											</colgroup>
											<tbody>
												<tr>
													<th><em title="필수입력">*</em><label for="">비밀번호</label></th>
													<td><span class="formatIn"><input
															type="password" name="PASSWORD" id="mem_pw1" class="w100"
															title="비밀번호를 입력하세요." maxlength="20"
															value="<%=mem.getMemPw()%>" /></span> <span class="exp ml10">*
															영문,숫자,특수문자 혼합하여 6-12자 이내 이어야 합니다.</span></td>
												</tr>
												<tr>
													<th><em title="필수입력">*</em><label for="">비밀번호
															확인</label></th>
													<td><span class="formatIn"><input
															type="password" name="PASSWORD2" id="mem_pw2"
															class="w100" title="비밀번호를 재입력하세요." maxlength="20"
															value="<%=mem.getMemPw()%>" /></span> <span class="exp ml10 alert_pwCheck" id="alert_pwCheck"></span></td>
												</tr>
											</tbody>
										</table>

									</div>
									<!--// E:table -->

								</div>
								<div class="btnArea02">
									<a href="javascript:void(0);" id="btn_modifyData"
										class="btnP01" onclick="btn_modifyData;">수정</a>
								</div>
							</div>

							<div id="tab2" class="tabContent">
								<div class="tbl01" style="font-size: 11px">
									<table summary="운전면허증번호 성명 (실명) 생년월일" class="">
										<colgroup>
											<col width="45%" />
											<col width="17%" />
											<col width="42%" />
										</colgroup>
										<tbody>
											<tr>
												<td rowspan="8" class=""><img
													src="./images/license/mypage_license_v2.gif"
													alt="운전면허증 예시 이미지" /></td>
												<th scope="row">이름</th>
												<td><%=mem.getMemName()%><input type="hidden"
													id="mem_name" value="<%=mem.getMemName()%>" /></td>
											</tr>
											<tr>
												<th scope="row">주민등록번호</th>
												<td><%=mem.getMemJumin1()%><input type="hidden"
													id="mem_jumin1" value="<%=mem.getMemJumin1()%>" /> - <%=mem.getMemJumin2()%><input
													type="hidden" id="mem_jumin2"
													value="<%=mem.getMemJumin2()%>" />
											</tr>
											<tr>
												<th scope="row">면허 종류</th>
												<td><select id="licen_type" name="licen_type" class="" >
														<option value="" >선택</option>
														<option value="2" >2종 보통</option>
														<option value="1" >1종 보통</option>
														<option value="0" >1종 대형</option>
												</select></td>
											</tr>

											<tr>
												<th scope="row">면허 번호</th>
												<td>
													<p class="mgb3">
														<select id="licen_no1" name="licen_no1" class=""
															title="코드">
															<option value="">코드</option>
															<option value="11">11</option>
															<option value="12">12</option>
															<option value="13">13</option>
															<option value="14">14</option>
															<option value="15">15</option>
															<option value="16">16</option>
															<option value="17">17</option>
															<option value="18">18</option>
															<option value="19">19</option>
															<option value="20">20</option>
															<option value="21">21</option>
															<option value="22">22</option>
															<option value="23">23</option>
															<option value="24">24</option>
															<option value="25">25</option>
															<option value="26">26</option>
															<option value="28">28</option>
														</select>&nbsp;or &nbsp;&nbsp; <select id="licen_no1_1" class=""
															title="지역">
															<option value="">지역</option>
															<option value="서울">서울</option>
															<option value="경기">경기</option>
															<option value="인천">인천</option>
															<option value="부산">부산</option>
															<option value="대구">대구</option>
															<option value="대전">대전</option>
															<option value="광주">광주</option>
															<option value="울산">울산</option>
															<option value="경남">경남</option>
															<option value="경북">경북</option>
															<option value="전북">전북</option>
															<option value="전남">전남</option>
															<option value="충남">충남</option>
															<option value="충북">충북</option>
															<option value="강원">강원</option>
															<option value="제주">제주</option>
														</select>
													</p> <input type="text" class="" title="면허번호 10자리"
													name="licen_no2" id="licen_no2" value="" />
												</td>
											</tr>

											<tr>
												<th scope="row">발급일</th>

												<td><input title="발급연도" type="text" class=""
													name="licen_IssueDtYear" id="licen_IssueDtYear"
													maxlength="4" /> <span>년</span> <input title="발급월"
													type="text" class="" name="licen_IssueDtMonth"
													id="licen_IssueDtMonth" value="" maxlength="2" /> <span>월</span>
													<input title="발급일" type="text" class=""
													name="licen_IssueDtDay" id="licen_IssueDtDay" maxlength="2" />
													<span>일</span></td>
											</tr>

											<tr>
												<th scope="row">갱신기간<br />만료일
												</th>
												<td><input title="갱신기간 만료 연도" type="text" class=""
													name="licen_LimitDtYear" id="licen_LimitDtYear"
													maxlength="4" /> <span>년</span> <input title="갱신기간 만료 월"
													type="text" class="" name="licen_LimitDtMonth"
													id="licen_LimitDtMonth" value="" maxlength="2" /> <span>월</span>
													<input title="갱신기간 만료일" type="text" class=""
													name="licen_LimitDtDay" id="licen_LimitDtDay" maxlength="2" />
													<span>일</span></td>
											</tr>

											<tr>
												<th scope="row">주소</th>
												<td>
													<p class="mgb3">
														<input type="text" class="" title="우편번호"
															name="licenZipCode" id="licenZipCode" readonly="readonly" />
														<a href="#licenZipCode" id="postcodify_search_button2"
															class="btnTbl01 ml5"
															style="width: 50px; text-align: center;"><span>주소찾기</span></a>
													</p> <input type="text" class="" title="주소" name="licen_addr1"
													id="licen_addr1" style="width: 80%;" readonly="readonly" />
													<input type="text" class="" title="상세주소" name="licen_addr2"
													id="licen_addr2" style="width: 80%;" />
												</td>
											</tr>

										</tbody>
									</table>
								</div>
								<div class="btnArea02">
									<a href="javascript:void(0);" id="btn_LicenData"
										class="btnP01" onclick="btn_LicenData;">입력</a>
								</div>
							</div>
							<!-- 							<div class="btnArea02"> -->
							<!-- 								<a href="javascript:void(0);" id="btn_modifyData" class="btnP01" -->
							<!-- 									onclick="btn_modifyData;">수정</a> -->
							<!-- 							</div> -->

						</div>


					</div>
					<!-- charges-wrap -->

				</div>
				<!-- // bodyend -->
			</div>
			<!-- // end contentBox -->


			<!-- // End #content-wrap -->


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

							<li><a
								href="http://www.greencar.co.kr/service/personalinfo/"
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
								src="./images/common/img_emblem_award.jpg"
								alt="모바일 어워드 코리아 2016" /> <img
								src="./images/common/img_emblem_kspbi.jpg" alt="KS PBI" />

						</div>

					</div>

				</div>

			</div>
		</div>
		<!-- // End #footer -->
	</div>
	<!-- // End #wrap -->


	<!-- 	select text input 스크립트  start -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		//회원 기본 주소 검색
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp({
				insertPostcode5 : "#homeZipCode",
				insertAddress : "#mem_addr1",
				insertDetails : "#mem_addr2"
			});
		});

		//회원 면허 주소 검색
		$(function() {
			$("#postcodify_search_button2").postcodifyPopUp({
				insertPostcode5 : "#licenZipCode",
				insertAddress : "#licen_addr1",
				insertDetails : "#licen_addr2"
			});
		});
	</script>



	<script type="text/javascript">
		$(document).ready(function() {

			//이메일 셀렉트
			$("#emailSelect").on("change", function() {
				form.EMAIL_2.value = $(this).val();
			});

			//탭
			$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tabContent').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			})

		})

		function checkAllDataInsert() {
			if ($("#mem_pw1").val() != "" && $("#mem_pw2").val() != ""
					&& $("#mem_addr1").val() != ""
					&& $("#mem_addr2").val() != ""
					&& $("#mem_phone1").val() != ""
					&& $("#mem_phone2").val() != ""
					&& $("#mem_phone3").val() != ""
					&& $("#mem_email1").val() != ""
					&& $("#mem_email2").val() != "") {
				//모든 칸이 채워져 있으면 return true
				return true;
			} else {
				return false;
			}
		}
		function checkLicenData() {
			if ($("#licen_type").val() != "" && $("#licen_no1").val() != ""
					&& $("#licen_no1").val() != ""
					&& $("#licen_no1_1").val() != ""
					&& $("#licen_no2").val() != ""
					&& $("#licen_IssueDtYear").val() != ""
					&& $("#licen_IssueDtMonth").val() != ""
					&& $("#licen_IssueDtDay").val() != ""
					&& $("#licen_LimitDtYear").val() != ""
					&& $("#licen_LimitDtMonth").val() != ""
					&& $("#licen_LimitDtDay").val() != ""
					&& $("#licenZipCode").val() != ""
					&& $("#licen_addr1").val() != ""
					&& $("#licen_addr2").val() != "") {
				return true;
			} else {
				return false;
			}
		}
		
		$("#mem_pw2").blur(function(){
			var memPw1 = $("#mem_pw1").val();
			var memPw2 = $("#mem_pw2").val();
			if(memPw1 == memPw2){
				$("#alert_pwCheck").html("비밀번호 확인완료.");
			}else{
				$("#alert_pwCheck").html("비밀번호가 다릅니다.");
			}
		});
		
		$("#btn_LicenData").click(function() {
			if (checkLicenData()) {
				var mem_id = $("#mem_id").val();
				var mem_name = $("#mem_name").val();
				var mem_jumin = $("#mem_jumin1").val() + $("#mem_jumin2").val();
				var licen_type = $("#licen_type").val();
				var licen_num = $("#licen_no1").val() + $("#licen_no1_1").val()	+ $("#licen_no2").val();
				var licen_issuedate = $("#licen_IssueDtYear").val()	+ $("#licen_IssueDtMonth").val() + $("#licen_IssueDtDay").val();
				var licen_limitdate = $("#licen_LimitDtYear").val()	+ $("#licen_LimitDtMonth").val() + $("#licen_LimitDtDay").val();
				var licen_addr = $("#licenZipCode").val() + "/"	+ $("#licen_addr1").val() + "/"	+ $("#licen_addr2").val();
				
				console.log("이름  : " + mem_name);
				console.log("주민 : " + mem_jumin);
				console.log("면허 종류 :" + licen_type);
				console.log("면허 번호 :" + licen_num);
				console.log("면허 생성날 :" + licen_issuedate);
				console.log("면허 갱신날 :" + licen_limitdate);
				console.log("면허 주소 :" + licen_addr);
				
				$.ajax({
					type : "POST",
					url : "/LicenData.do",
					dataType : "json",
					data : {
						memId : mem_id,
						memName : mem_name,
						memJumin : mem_jumin,
						licenType : licen_type,
						licenNum : licen_num,
						licenIssueDate : licen_issuedate,
						licenLimitDate : licen_limitdate,
						licenAddr : licen_addr
					},

					success : function(data) {
						alert("면허정보 입력 성공");
					},
					error : function(e) {
						console.log("------error------");
						console.log(e.responseText);
					}
				});
			} else {
				alert("필수 항목 에러");
				return;
			}
		});
		
		$("#btn_modifyData").click(
				function() {
					//모든값이 채워져있을때만 (true) 발동하게 변경. false면 alert 발생
					if (checkAllDataInsert() == true) {
						var mem_id = $("#mem_id").val();
						var mem_pw = $("#mem_pw2").val(); //mem_pw2는 비밀번호를 확인한 다음값이기 때문에 2로 값을불러옴
						var mem_name = $("#mem_name").val();
						var mem_jumin = $("#mem_jumin1").val() + $("#mem_jumin2").val();
						var mem_phone = $("#mem_phone1").val() + $("#mem_phone2").val() + $("#mem_phone3").val();
						var mem_addr = $("#homeZipCode").val() + "/" + $("#mem_addr1").val() + "/" + $("#mem_addr2").val();
						var mem_email = $("#mem_email1").val() + "@" + $("#mem_email2").val();
						

						//입력 데이터 확인 코드
						console.log("아이디 : " + mem_id);
						console.log("패스워드 : " + mem_pw);
						console.log("이름  : " + mem_name);
						console.log("주민 : " + mem_jumin);
						console.log("핸드폰 : " + mem_phone);
						console.log("주소 : " + mem_addr);
						console.log("이메일 : " + mem_email);
						
						$.ajax({
							type : "POST",
							url : "/modifyData.do",
							dataType : "json",
							data : {
								memName : mem_name,
								memJumin : mem_jumin,
								memId : mem_id,
								memPw : mem_pw,
								memPhone : mem_phone,
								memAddr : mem_addr,
								memEmail : mem_email,
								licenType : licen_type,
								licenNum : licen_num,
								licenIssueDate : licen_issuedate,
								licenLimitDate : licen_limitdate,
								licenAddr : licen_addr
							},

							success : function(data) {
								alert("회원정보 수정 성공");
							},
							error : function(e) {
								console.log("------error------");
								console.log(e.responseText);
							}
						});
					} else {
						alert("필수 항목을 모두 채워주세요.");
						return;
					}
				});
	</script>

</body>

</html>

<%} %>
<!-- 로그인 세션 끄읕~ -->
