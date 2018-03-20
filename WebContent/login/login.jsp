<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
* {
	font-family:
		'NanumBarunGothic', 'Nanum Gothic', Dotum, sans-serif;
	font-size: 13px;
	color: #6d6e72;
}

#login {
	padding-bottom: 55px;
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
	width: 796px;
	float: right;
	padding-top: 55px;
	min-height: 600px;  
}

.subject {
	overflow: auto;
}

.subject span {
	float: left;
	font-size: 25px;
	font-weight: bold;
	color: black;
	font-family:
		'NanumBarunGothic', 'Nanum Gothic', '돋움', Dotum, sans-serif;
	letter-spacing: -2px;
	padding: 17px 0;
}

/*
.login_title {
	line-height: 17px;
	color: #737373;
	padding: 20px 0 10px;
}
*/
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
	padding: 23px 0;
	border-top: 1px solid #ececec;
	color: #6e6e6e;
	overflow: hidden;
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
#alert_id {
	display: inline-block;
	word-spacing: -1px;
	padding-left: 60px;
	color: red;
	font-size: 11px;
	line-height: 2;
	clear: both;
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

</head>
<body>

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
				<input type="text" id="id" name="id" onkeypress="f_login();" />
				<br>
				<span>비밀번호</span>
				<input type="password" id="password"
						name="password" onkeypress="f_login();" />
			</div>
			
			<a href="javascript:fnLogin();" id="login_confirm">로그인</a>
<!-- 			<button>로그인</button> -->
			
			<div>
			<a href="javascrpt:void(0);" id="findLayer">아이디/비밀번호 찾기</a>
			</div>
			
			<div style="border-bottom: 1px solid #ececec;">
			<span id="alert_id">아이디 또는 비밀번호를 잘못 입력하였습니다.</span>
			</div>
			
		</div>
	</div>
</div>
<span id="login_sns">▶ SNS계정 로그인</span><br>

<a href="javascript:void(0);" onclick="doLapSNSLogin('FB');">
	<img src="/image/facebook.PNG" alt="" />
</a>
</div>
</div>
</div>
</div>


</body>
</html>