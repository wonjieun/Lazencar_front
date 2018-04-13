<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<%-- header include --%><jsp:include page="header.jsp" />

<link type="text/css" rel="stylesheet" media="all" href="/Page/css/common.css?v=201802">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/master.css?v=180322">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/calendar.css">

<script type="text/javascript"
 src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

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

legend, caption, .hidden {
	width: 0;
	height: 0;
	font-size: 0;
	line-height: 0;
	overflow: hidden;
	visibility: hidden;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	font-size: 1em;
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
	background: url('/Page/images/common/logo.png') no-repeat 0 0;
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
	background: url('/Page/images/main/bg_dot.png') no-repeat 6px center;
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
	background: url('/Page/images/main/bg_dot02.png') no-repeat 6px center;
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
	background: url(/Page/images/icons/left_menu_off.gif) no-repeat right center
}

.leftMenu li a:hover span {
	background: url(/Page/images/icons/left_menu_on.png) no-repeat right center;
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
	background: url('/Page/images/common/icon_sns.png') no-repeat;
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
	background: url(/Page/images/icons/home.gif) no-repeat 0 3px;
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
	background: url(/Page/images/common/bg_subtit.gif) no-repeat 0 bottom;
	font-weight: bold;
	font-size: 32px;
	color: #3c3c3c
}

.subtit2 {
	padding-bottom: 8px;
	background: url(/Page/images/common/bg_subtit.gif) no-repeat 0 bottom;
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
	background: url('/Page/images/common/icon_sns.png') no-repeat;
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
	background: url('/Page/images/common/bg_bar_footer.gif') no-repeat 8px
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
	background: url("/Page/images/common/blt01.gif") left 6px no-repeat;
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
	background: url("/Page/images/common/blt04.gif") left 6px no-repeat;
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

/* 게시판 리스트 */
.boardList {
	border-top: 2px solid #9e9890;
	margin-top: 40px;
}

.boardList tr th {
	color: #fff;
	font-size: 13px;
	border-bottom: 1px solid #9e9890;
	background-color: #b7b0a7;
	padding: 10px 15px;
}

.boardList tr td {
	font-size: 13px;
	padding: 12px 15px;
	text-align: center;
	border-bottom: 1px solid #e2e2e2;
	word-break: break-all;
}

.boardList tr td.txt_l {
	text-align: left;
}

.boardList tr td a {
	font-size: 13px;
}

.boardList tr td a:hover {
	text-decoration: underline;
	font-weight: bold;
}

.boardList tr td .boardnew {
	display: inline-block;
	vertical-align: top;
	margin-left: 8px;
	background: url(./Page/images/board/board_new.gif) no-repeat 0 0;
	font-size: 0;
	width: 13px;
	height: 17px;
	text-indent: -800000px;
}

.boardnew {
	display: inline-block;
	vertical-align: top;
	margin-left: 8px;
	background: url(./Page/images/board/board_new.gif) no-repeat 0 0;
	font-size: 0;
	width: 13px;
	height: 17px;
	text-indent: -800000px;
}

.boardList.type02 tr th {
	border-left: 1px solid #dbdbdb;
	text-align: center;
}

.boardList.type02 tr td {
	border-left: 1px solid #dbdbdb;
}

.boardList.type02 tr th:first-child {
	border-left: none;
}

.boardList.type02 tr td:first-child {
	border-left: none;
}

.boardList01 {
	table-layout: fixed;
	border-top: 2px solid #4d4c4c;
	margin-top: 40px;
}

.boardList01 tr th {
	padding: 10px 5px;
	border-bottom: 1px solid #dbdbdb;
	background-color: #f3f3f3;
	font-size: 14px;
	color: #333333;
}

.boardList01 tr td {
	padding: 5px 5px;
	border-bottom: 1px solid #dbdbdb;
	line-height: 1.4;
	text-align: center;
	font-size: 13px;
}

.boardList01 tr td .state {
	color: #f1c40f;
}

.boardList02 {
	table-layout: fixed;
	border-top: 2px solid #9e9890;
	margin-top: 0;
}

.boardList02 tr th {
	padding: 14px 5px 10px 5px;
	border-bottom: 1px solid #9e9890;
	background-color: #b7b0a7;
	font-size: 14px;
	color: #fff;
	letter-spacing: -1px;
}

.boardList02 tr td {
	padding: 14px 5px 10px 5px;
	border-bottom: 1px solid #e2e2e2;
	line-height: 1.4;
	text-align: center;
	font-size: 13px;
	letter-spacing: -1px;
	vertical-align: top;
	line-height: 1.4;
}

.boardList02 tr td .state {
	color: #f1c40f;
}

.boardList02 tr td.td_txt01 {
	text-align: left;
	padding-left: 20px;
}

.boardList02 tr td.td_txt01 a {
	overflow: hidden;
	display: inline-block;
	max-width: 500px;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.boardList02 tr td.td_txt02 {
	text-align: left;
	padding-left: 20px;
}

.boardList02 tr td.td_txt02 a {
	overflow: hidden;
	display: inline-block;
	max-width: 330px;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.boardList02 tr td.td_inquiry {
	color: #333333;
	text-align: center;
}

.boardList02 tr td.td_txt03 {
	text-align: left;
	padding-left: 55px;
}

.boardList02 tr td.td_txt03 a {
	overflow: hidden;
	display: inline-block;
	max-width: 315px;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.boardList02 tr td .new {
	display: inline-block;
	margin: 1px 0 0 4px;
	vertical-align: top;
	font-size: 0;
	line-height: 0;
}

.boardList03 {
	table-layout: fixed;
	border-top: 2px solid #9e9890;
}

.boardList03 tr th {
	border-bottom: 1px solid #9e9890;
	padding: 13px 0;
	font-size: 14px;
	line-height: 1.2;
	color: #fff;
	background-color: #b7b0a7;
}

.boardList03 tr td {
	border-bottom: 1px solid #e2e2e2;
	padding: 16px 0;
	text-align: center;
}

.boardList03 tr td.td_left {
	text-align: left;
	font-size: 13px;
	letter-spacing: -1px;
	padding-left: 10px;
}

.boardList03 tr td.td_left strong {
	line-height: 1.2;
}

.boardList03 tr td.td_left .day {
	margin-top: 5px;
	line-height: 1.2;
}

.boardList03 tr td.td_btn a {
	display: block;
	margin-bottom: 4px;
}

.boardList03 tr td.td_btn.td_btn_detail a {
	display: block;
	margin-bottom: 0;
}

.boardList03 tr td.td_cmt {
	border-bottom: none;
}

.boardList03 tr td .pic {
	display: inline-block;
	width: 128px;
	border: 1px solid #e2e2e2;
}

.boardList03 tr td .pic img {
	width: 128px;
	height: 88px;
}

.boardList03 tr td .blt-green {
	display: block;
	margin-top: 10px;
	padding-left: 9px;
	font-size: 12px;
	background: url("/Page/images/reserv/blt_green.gif") 0 7px no-repeat;
}

.boardList04 {
	table-layout: fixed;
	border-top: 2px solid #9e9890;
	margin-top: 10px;
	font-size: 14px;
}
/* 2017 01 09 wsg css */
.boardList04 tr th {
	padding: 15px 0;
	border-right: 1px solid #9e9890;
	border-bottom: 1px solid #9e9890;
	background-color: #b7b0a7;
	text-align: center;
	letter-spacing: -1px;
	color: #fff;
}

.boardList04 tr th.th_last {
	border-right: none;
}

.boardList04 tr td {
	padding: 15px 10px;
	border-right: 1px solid #e2e2e2;
	border-bottom: 1px solid #e2e2e2;
	text-align: center;
	letter-spacing: -1px;
}

.boardList04 tr td.td_last {
	border-right: none;
}

.boardList04.type02 tbody tr th {
	padding: 15px 10px;
	background: none;
	border-right: 1px solid #e2e2e2;
	border-bottom: 1px solid #e2e2e2;
	text-align: center;
	letter-spacing: -1px;
	color: #767676
}

.boardList05 {
	table-layout: fixed;
	border-top: 2px solid #4d4c4c;
	margin-top: 35px;
	font-size: 14px;
}
/* 2017 01 09 wsg css */
.boardList05 tr th {
	padding: 15px 0;
	border-bottom: 1px solid #e2e2e2;
	background-color: #f3f3f3;
	text-align: center;
	letter-spacing: -1px;
}
/* 2017 01 09 wsg css */
.boardList05 tr td {
	padding: 0;
	border-bottom: 1px solid #e2e2e2;
	text-align: left;
	letter-spacing: -1px;
}

.boardList05 tr td.td_left {
	padding: 15px 0 15px 60px;
}

.boardList06 {
	table-layout: fixed;
	border-top: 2px solid #9e9890;
}

.boardList06.top_mr01 {
	margin-top: 15px;
}

.boardList06 tr th {
	padding: 15px 0;
	border-bottom: 1px solid #9e9890;
	background-color: #b7b0a7;
	font-size: 14px;
	color: #fff;
	letter-spacing: -1px;
}

.boardList06 tr td {
	padding: 15px 0;
	border-bottom: 1px solid #e2e2e2;
	line-height: 1.4;
	text-align: center;
	font-size: 13px;
	letter-spacing: -1px;
	line-height: 1.4;
}

.boardList06 tr td.td_txt01 {
	text-align: left;
	padding-left: 55px;
	font-size: 14px;
}

.boardList06 tr td.td_txt01 a {
	overflow: hidden;
	display: inline-block;
}

.boardList06 tr td.td_txt01 b {
	display: inline-block;
	margin-bottom: 6px;
	font-size: 16px;
	color: #3c3c3c;
}

.boardList06 tr td.td_txt02 {
	font-weight: bold;
}

.boardList06 tr td.td_btn a {
	display: inline-block;
	margin-right: 4px;
	vertical-align: top;
}

.boardList06 tr td.td_btn .blt_default {
	display: inline-block;
	margin-right: 4px;
	vertical-align: top;
	width: 33px;
	margin-top: 2px;
	padding-left: 11px;
	background: url('/Page/images/common/blt10.gif') left 6px no-repeat;
	font-weight: bold;
}

.boardList06 tr td .day {
	display: block;
	margin-top: 15px;
}

/* 추가 (2015-12-14) */
.boardList07 {
	margin-top: 12px;
	table-layout: fixed;
	border-top: 2px solid #4d4c4c;
}

.boardList07.mgt0 {
	margin-top: 0;
}

.boardList07 th {
	padding-left: 20px;
	border-bottom: 1px solid #dbdbdb;
	font-size: 14px;
	font-weight: bold;
	text-align: left;
	line-height: 1.2;
	color: #333333;
	background-color: #f3f3f3;
	box-sizing: border-box;
}

.boardList07 td {
	height: 50px;
	padding: 11px 20px;
	border-bottom: 1px solid #dbdbdb;
	font-size: 13px;
	text-align: left;
	box-sizing: border-box;
}

.boardList07.input td {
	height: 40px;
	padding: 6px 20px;
}

.boardList07 td .zip_code {
	display: inline-block;
	padding-right: 15px;
}

.boardList07 td .wrap_chk {
	padding-top: 5px;
	color: #999;
}

.boardList07 td .wrap_chk li {
	padding-top: 3px;
}

.boardList07 td .ipttxt {
	display: inline-block;
	padding: 0 2px 0 4px;
	line-height: 27px;
}

.boardList07 .imp {
	color: #ff5656;
}

.boardList07 .txtinp {
	display: inline-block;
	line-height: 27px;
}

.boardList07 .fr {
	float: right;
}

.boardList08 {
	margin-top: 12px;
	table-layout: fixed;
	border-top: 2px solid #4d4c4c;
	border-bottom: 1px solid #dbdbdb;
}

.boardList08 th {
	height: 40px;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	border-bottom: 1px solid #dbdbdb;
	color: #333;
	background-color: #f3f3f3;
	box-sizing: border-box;
}

.boardList08 td {
	height: 30px;
	font-size: 13px;
	text-align: center;
	line-height: 30px;
	box-sizing: border-box;
}

.sym {
	display: inline-block;
	background: url(/Page/images/board/bg_sym.gif) no-repeat 0 0;
	padding-left: 15px;
	margin-left: 3px;
}

*:first-child+html .sym {
	background-position: 0 1px;
}

.sym strong {
	display: block;
	font-size: 0;
	width: 0;
	height: 0;
	overflow: hidden;
}

.sym .numbox {
	display: inline-block;
	background: url(/Page/images/board/bg_sym_02.gif) no-repeat right 0;
	padding: 0 5px 0 1px;
	color: #fff;
	font-size: 11px;
	font-family: verdana;
	letter-spacing: -1px;
}

/* 페이징 */
.paging {
	margin-top: 20px;
	text-align: center;
}

.paging a {
	display: inline-block;
	color: #3c3c3c;
	width: 26px;
	height: 26px;
	line-height: 25px;
}

.paging a:hover {
	color: #fff;
	background-color: #f1c40f;
}

.paging strong {
	display: inline-block;
	width: 26px;
	height: 26px;
	line-height: 25px;
	color: #fff;
	background-color: #f1c40f;
}

.paging img {
	vertical-align: -9px;
}

.paging .page_first:hover, .paging .page_end:hover {
	background-color: #fff;
}

.paging .page_prev {
	margin: 0 10px 0 -4px;
}

.paging .page_next {
	margin: 0 -4px 0 10px;
}

.paging .page_prev01 {
	margin: 0 4px 0 0;
}

.paging .page_next01 {
	margin: 0 0 0 4px;
}

/* Form 검색 */
.form-searchbox {
	position: relative;
	background-color: #f6f6f6;
	border: 1px solid #e2e2e2;
	height: 90px;
	margin-top: 40px;
}

.form-searchbox h4 {
	position: absolute;
	top: 20px;
	left: 20px;
}

.form-search-01 {
	position: absolute;
	top: 30px;
	left: 150px;
}

.form-search-02 {
	position: absolute;
	top: 30px;
	left: 220px;
}

.form-search-03 {
	position: absolute;
	top: 30px;
	right: 20px;
}

.selstyle {
	font-size: 13px;
	height: 30px;
	padding: 5px 8px;
	vertical-align: top;
	border: 1px solid #dbd6d4;
}

.inputTxt {
	border: 1px solid #dbd6d4;
	height: 28px;
	line-height: 28px;
	font-size: 13px;
	padding: 0 10px;
	color: #666;
}

.form-searchbox .inputTxt {
	width: 400px;
}

.inputTxt02 {
	border: 1px solid #d9d9d9;
	height: 25px;
	line-height: 25px;
	font-size: 13px;
	padding: 0 8px;
	color: #767676;
}

.inputTxt02.w193 {
	width: 193px;
}

.inputTxt02.w560 {
	width: 560px;
}

/* Button */
.button-type-01 {
	text-align: right;
	margin-top: 20px;
}

.button-type-02 {
	text-align: center;
	margin-top: 30px;
}

.button-type-02.btn-gap input, .button-type-02.btn-gap a {
	margin-right: 5px;
}

.button-type-03 {
	text-align: center;
	margin-top: 40px
}

.userphoto {
	margin-left: 10px;
}

.userphoto span {
	
}

.userphoto span img {
	border: 1px solid #e1e1e1;
}

.userphoto strong {
	font-size: 13px;
	margin-left: 10px;
	vertical-align: -10px;
	font-size: 13px;
}

.board_sym_num {
	text-align: right;
	padding-right: 15px;
}

.board_sym_num span {
	display: inline-block;
	background: url(/Page/images/FNQ/ico_heart.gif) no-repeat 0 center;
	font-weight: bold;
	padding-left: 12px;
	font-size: 13px;
	margin-right: 5px;
}

.board_sym_num strong {
	display: inline-block;
	background: url(/Page/images/FNQ/txt_bar.gif) no-repeat 0 center;
	padding-left: 10px;
	font-size: 13px;
	color: #7b5dfd;
}

.txtarea {
	border-color: #d9d9d9;
	padding: 10px;
	color: #767676;
	font-size: 13px;
	line-height: 19px;
	height: 250px;
}

.form_info {
	background: url(/Page/images/icons/ico_form_info.gif) no-repeat 0 2px;
	margin-top: 10px;
	font-size: 13px;
	padding-left: 19px;
	margin-left: 12px;
}

.pop_location img {
	vertical-align: middle;
}

.pop_location input {
	width: 470px;
	vertical-align: middle;
}

.greenzon-stit {
	padding-right: 20px;
}

.greenzon-stit input {
	width: 100%;
}

.board-photobox:after {
	content: "";
	display: block;
	clear: both;
}

.photo_tit {
	float: left;
	max-width: 100%;
	overflow: hidden;
	padding-right: 10px;
}

.photo_txt {
	
}

.photo_txt a {
	display: block;
	padding-top: 5px;
}

.photo_txt p {
	margin-top: 6px;
}

.btntype01 {
	display: inline-block;
	margin-left: 5px;
	vertical-align: top;
}

.btntype02 {
	display: inline-block;
	margin-left: 2px;
	vertical-align: top;
}

.input_btn01 {
	margin-left: 5px;
}

.btn_center01 {
	margin-top: 20px;
	text-align: center;
}

.btn_center01.top_mr01 {
	margin-top: 40px;
}

.btn_center01 .left_push {
	margin-left: 8px;
}

.btn_right01 {
	margin-top: 20px;
	text-align: right;
	margin-top: 20px;
	padding-right: 20px;
}

.btn_right01 a {
	display: inline-block;
	margin-left: 5px;
}

.btn_center {
	text-align: center;
	margin-top: 20px;
}

.selstyle {
	font-size: 13px;
	height: 30px;
	padding: 5px 8px;
	vertical-align: top;
	border: 1px solid #dbd6d4;
}
</style>

<script type="text/javascript">

</script>


</head>
<body>
	<!-- Begin #wrap -->

	<div id="wrap">

		<div class="top_banner join" style="display: none;">
			<!-- // free 클래스 삭제 (2015-12-30) -->

			<div class="cont">

				<a href="https://www.greencar.co.kr/member/index.jsp"
					target="_blank"><img
					src="/Page/images/common/top_banner_160825.gif"
					alt="신규가입시 3시간 무료쿠폰 전원증정" /></a>


				<p class="close">
					<a href="javascript:void(0)"><img
						src="/Page/images/common/btn_close.png" alt="닫기" /></a>
				</p>

			</div>

		</div>

		<!-- [e]top_banner -->




		<!-- Begin #container -->

		<div id="container">
			<div class="content-wrap">
				<div class="sidebar">
					<!-- 왼쪽 메뉴 -->
					<h2 class="left-tit">고객센터</h2>
					<ul class="leftMenu">
						<li class="top"><a href="#"><span>1:1 문의</span></a></li>
						<li><a href="#"><span>자주찾는질문</span></a></li>
						<li><a href="/service/list.do" class='on'><span>공지사항</span></a></li>

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
							<p>
								<span>고객센터</span>&gt; <strong>공지사항</strong>
							</p>
						</div>
					</div>
					<div class="subtop-content bg_subvisual_02_01">
						<h3 class="subtit">공지사항</h3>
						<p class="subtxt">
							<strong>아는 것이 힘! 라젠카 공지/뉴스정보를 확인하세요!</strong><br/>
							라젠카의 다양한 상품 및 할인정보, 공지사항을 확인하실 수 있습니다.
						</p>

					</div>


					<div class="bodystart">

						<!-- 공지사항 검색 -->
						<form id="frmSearch" name="frmSearch" method="get" action="/service/list.do">
							<div class="form-searchbox">
								<h4><img src="/Page/images/board/txt_tit_search.gif" alt="검색" /></h4>
								
								<!-- 검색 카테고리 -->
								<div class="form-search-01">
									<select id="searchItem" name="searchItem" class="selstyle">
										<option value="ALL">전체</option>
										<option value="TITLE">제목</option>
										<option value="CONT">내용</option>
									</select>
								</div>
								
								<!-- 검색어 입력 -->
								<div class="form-search-02">
									<input id="searchWord" name="searchWord" type="text" class="inputTxt" value="" />
								</div>
								
								<!-- 검색 버튼 -->
								<div class="form-search-03">
									<input type="image" src="/Page/images/board/btn_form_search.gif"
										alt="검색" title="검색" />
								</div>
							</div>
						</form>
						
						<table summary="공지사항에 대한 번호 제목 등록일 리스트" class="boardList notice-list">
							<caption></caption>
							<colgroup>
								<col width="70" />
								<col width="" />
								<col width="120" />
							</colgroup>
							
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">등록일</th>
								</tr>
							</thead>
							
							<tbody>
							
<c:forEach items="${list }" var="i">
	<tr>
		<td>${i.notNum }</td>
		<td class="txt_l">
<%-- 			<a href="/service/list.do?searchItem=${i.searchItem }&searchWord=${i.searchWord }&x=0&y=0"> --%>
			<a href="/service/notice.do?num=${i.notNum }">
				${i.notTitle }</a>
		</td>
		<td>${i.notDate }</td>
	</tr>
</c:forEach>

							</tbody>
						</table>

						<div class="paging">
							<a href="./list.do?searchItem=&amp;searchWord=&amp;gotoPage=1" class="page_prev">
							<img src="/Page/images/board/page_prev.gif"	alt="이전" /></a>
							<strong>1</strong>
							<a href="./list.do?searchItem=&amp;searchWord=&amp;gotoPage=2">2</a>
							<a href="./list.do?searchItem=&amp;searchWord=&amp;gotoPage=3">3</a>
							<a href="./list.do?searchItem=&amp;searchWord=&amp;gotoPage=2" class="page_next">
							<img src="/Page/images/board/page_next.gif" alt="다음" /></a>
						</div>
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
									src="/Page/images/common/img_partner_seoul.gif" alt="공유서울 나눔카 예약하기" /></a></li>

							<li><a
								href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D03"><img
									src="/Page/images/common/img_partner_suwon.gif"
									alt="휴먼시티 수원 라젠카 예약하기" /></a></li>

							<li><a
								href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D02"><img
									src="/Page/images/common/img_partner_incheon.gif"
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

							<img src="/Page/images/common/img_emblem_brandpower.jpg"
								alt="2016년 한국산업의 브랜드파워 1위" /> <img
								src="/Page/images/common/img_emblem_brandstar.jpg"
								alt="2016년 대한민국 브랜드스타" /> <img
								src="/Page/images/common/img_emblem_award.jpg"
								alt="모바일 어워드 코리아 2016" /> <img
								src="/Page/images/common/img_emblem_kspbi.jpg" alt="KS PBI" />

						</div>

					</div>

				</div>

			</div>

			<!-- // End #footer -->

		</div>

		<!-- // End #wrap -->
</body>

</html>


