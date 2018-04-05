<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>

<style type="text/css">

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
}

 /* 한 메뉴당 하위메뉴 하나만*/
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

#content_sub {
	font-family: 'NanumBarunGothic', 'Nanum Gothic', Dotum, sans-serif;
	font-size: 13px;
	color: #6d6e72;
}

#login {
	padding-bottom: 10px;
}

#content_sub {
	width: 100%;
	margin: 0 auto;
	background: #fff;
	position: relative;
	margin-top: 40px;
}

#content_sub_wrap {
	width: 1060px;
	margin: 0 auto;
	overflow: hidden;
}

#content_right {
	width: 730px;
	float: right;
	padding-top: 150px;
}

.subject {
	overflow: auto;
}

.subject span {
	float: left;
	font-size: 25px;
	font-weight: bold;
	color: black;
	font-family: 'NanumBarunGothic', 'Nanum Gothic', '돋움', Dotum, sans-serif;
	letter-spacing: -2px;
	padding: 17px 0;
}

.login_title span {
	display: block;
	color: black;
	font-size: 20px;
	margin-bottom: 5px;
}

/*
.login {
	border-top: 2px solid #574528;
	border-bottom: 1px solid #574528;
	padding: 40px 0;
	overflow: hidden;
}
*/

/* 로그인 전체 폼(title 아래) */
.login_frm {
	/* 	float: left; */
	width: 410px;
}

.login_frm_detail {
	padding: 23px 0 17px;
	margin: 0 0 20px; border-top : 1px solid #ececec;
	border-bottom: 1px solid #ececec;
	color: #6e6e6e;
	overflow: hidden;
	border-top: 1px solid #ececec;
}

/* 아이디, 비밀번호 */
.login_frm_detail .left span {
	display: inline-block;
	line-height: 29px;
	padding-bottom: 10px;
}

/* 아이디, 비밀번호 입력 칸 */
.login_frm_detail .left input {
	border: 1px solid #ececec;
	height: 27px;
	line-height: 27px;
	padding-left: 10px;
	width: 212px;
	float: right;
}

/* 로그인 */
#login_confirm {
	float: right;
	height: 70px;
	line-height: 70px;
	width: 115px;
	text-align: center;
	color: #fff;
	font-size: 14px;
	background: #fa9e3f;
}

/*
.login_frm_detail a {
	float: right;
	height: 63px;
	line-height: 63px;
	width: 100px;
	text-align: center;
	color: #fff;
	font-size: 14px;
	background: #fa9e3f;
}
*/

/* 로그인, 아이디/비밀번호 찾기 */
a {
	TEXT-DECORATION: none;
}

/* 로그인 에러 */
#alert_id, #alert_pw, #alert_login {
	display: none;
/* 	display: inline-block; */
	word-spacing: -1px;
	padding-left: 60px;
	padding-bottom: 0; color : red;
	font-size: 11px;
	line-height: 2;
	clear: both;
	color: red;
}

#findLayer {
	float: right;
	display: inline-block;
	word-spacing: -1px;
	font-size: 12px;
	padding-top: 4px;
}

#login_sns {
	font-weight: bold;
	color: #fa9e3f;
	font-size: 14px;
	word-spacing: -1px;
}
</style>

<script type="text/javascript"
 src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

function f_login() {
	if (event.keyCode != 13) {
		return false;
	} else {
		fnLogin();
	}
}
	
/* KH정보교육원 로그인 화면 / 로그인 버튼 관련 기능
	function fnLogin() {
		var member_flag1 = $('input[name=member_flag]:checked').val();

		if (f_validate()) {
			var params = {
				id : $('#id').val(),
				password : $('#password').val(),
				member_flag	: $('input[name=member_flag]:checked').val()
			};
			$.ajax({
				url : '/login/loginCheck.kh',
				dataType : 'json',
				type : 'post',
				data : params,
				success : function(data, textStatus) {
					if (data['result'] == '2') {
						if (member_flag1 == 'T') {
							location.href = "/login/mypage.kh";
						} else {
							location.href = "/main/main.kh";
						}
					} else if (data['result'] == '3') {
						$("#alert_flag").css("display", "block");
					} else if (data['result'] == '4') {
						alert("이미 접속한 아이디입니다.");
					} else {
						$("#alert_idpw").css("display", "block");
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('오류가 발생했습니다\n[' + textStatus + ']\n' + errorThrown);
				}
			});
		}
	}
*/

/* 아이디, 비밀번호 입력하지 않고 로그인 버튼 눌렀을 때 */
function f_validate() {
	$(".join_hidden").hide();
	
	var id = $("#id").val();
	var pw = $("#password").val();

	if ( id==null || id=="") {
		$("#alert_id").css("display", "inline-block");
		document.getElementById("id").focus();
		return false;
	}

	if ( pw==null || pw=="") {
		$("#alert_pw").css("display", "inline-block");
		document.getElementById("password").focus();
		return false;
	}
	
	return true;
}


// 아이디, 비밀번호 확인
$(document).ready( function() {
	
	$("#login_confirm").click( function() {

		if( f_validate() ) {
		
			var id = $("#id").val();
			var pw = $("#password").val();
			var params = {
				id : $('#id').val(),	
				password : $('#password').val()
			};
			
			$.ajax({
				type: "POST"
				, url: "/login/login.do"
				, data: {
						memId:id,
						memPw:pw
					}
				, dataType: "json"
				, success: function( data ) {
					var check = data.check;
					var gubn = data.gubn;
					if( check ) {
// 					alert("로그인 성공");
						// 관리자
						if( gubn===0 ) {
							location.href="/Manage_Page/home.jsp";
						}
						// 고객
						if( gubn===1 ) {
							location.href="/Page/main.jsp";
						}
<%-- 						console.log('<%=request.getSession().getAttribute("id")%>'); --%>
// 						console.log("JS ID : ${sessionScope.id};")
					} else {
// 					alert("로그인 실패");
						$("#alert_login").css("display", "inline-block");
						document.getElementById("id").focus();
					}
					
				}
				, error: function(e) {
					console.log("----- error -----");
					console.log(e.responseText);
				}
			});
		}
	});
});
</script>

<title>로그인</title>

</head>

<body>
	<!-- Begin #wrap -->
	<div id="wrap">
		<div class="top_banner join" style="display: none;">
			
			<div class="cont">

				<a href="https://www.greencar.co.kr/member/index.jsp"
					target="_blank"><img
					src="/Page/images/common/top_banner_160825.gif"
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

<div id="content_sub" onmouseover="fnPrevDept();">
<div id="content_sub_wrap">
<div id="content_right">

	<div class="subject">
		<span>로그인</span>
	</div>

	<div id="login">
	<div class="login_frm">
	<div class="login_frm_detail">
		<div class="left">

			<div style="float: left; width: 285px; height: 70px;">
				<span>아이디</span>
				<input type="text" id="id" name="id" onkeypress="f_login();" /><br>
				<span>비밀번호</span>
				<input type="password" id="password" name="password" onkeypress="f_login();" />
			</div>
<!-- ***더 좋은 방법을 생각해보자 -->
			<a href="javascript:void(0);" id="login_confirm">로그인</a>

			<div>
				<div>
					<a href="/login/findId.do" id="findLayer">아이디/비밀번호 찾기</a>
				</div>
				<div>
					<span class="join_hidden" id="alert_id">아이디를 입력하세요.</span>
					<span class="join_hidden" id="alert_pw">비밀번호를 입력하세요.</span>
					<span class="join_hidden" id="alert_login">아이디 또는 비밀번호를 잘못 입력하였습니다.</span>
				</div>

			</div>
		</div>
		</div>
		</div>
	</div>
	
	<span id="login_sns">▶ SNS계정 로그인</span><br>
	
	<div style="padding-top: 5px;">
		<a href="javascript:void(0);">
		<img src="/Page/images/login/facebook.PNG" alt="" />
		</a>
		<a href="javascript:void(0);">
		<img src="/Page/images/login/kakao.PNG" alt="" />
		</a> <br>
		<a href="javascript:void(0);">
		<img src="/Page/images/login/naver.PNG" alt="" />
		</a>
	</div>
</div>
</div>
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
			<!-- // End #footer -->
		</div>
		<!-- // End #wrap -->
</body>

</html>