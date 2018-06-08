<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>
</head>

<link type="text/css" rel="stylesheet" href="/Page/css/main.css" >
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/common.css?v=201802">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/master.css?v=180322">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/calendar.css">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/unit.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
// 로그인, 회원가입 -> 로그아웃, 마이페이지
function login_menu() {
// 	alert('${sessionScope.id}');
// 	alert('${sessionScope.token}');
	var id = '${sessionScope.id}';
	var token = '${sessionScope.token}';
// 	alert(id);
// 	alert(token);
	if ( (id===null || id==="") && (token===null || token==="") ) {
		$("#logout").hide();
		$("#sns_logout").hide();
		$("#mypage").hide();
	} else if(token) { 
		$("#logout").hide();
		$("#signup").hide();
		$("#login").hide();
	} else {
		$("#sns_logout").hide();
		$("#signup").hide();
		$("#login").hide();
	}
	
}

$(document).ready(function() {
	login_menu();
});
</script>

<body>

<div id="header" class="sub">
	<div class="hgroup">
		<div class="inbox">
			<h1 class="logo">
				<a href="/main.do"><span>라젠카</span></a>
			</h1>

      <div class="nvalinks">
        <a href="/login/login.do" id="login">로그인</a>
        <a href="/signUp.do" id="signup">회원가입</a>
        <a href="/login/logout.do" id="logout">로그아웃</a>
        <!-- 네이버 로그아웃 -->
   			<a href="/login/logout.do" id="sns_logout">로그아웃</a>
   			<script type="text/javascript">
   			$("#logout").click(function() {
					location.href="http://nid.naver.com/nidlogin.logout";
				});
   			</script>
   			
   		<a href="/Page/reservationCheck.jsp" id="mypage">마이페이지</a>
      <a href="/reservation/reservation.do" class="nvalinks-rev">라젠카 예약</a>

      </div>
			<nav id="topMenu" > 
				<ul> 
				<li class="topMenuLi"> 
					<a class="menuLink" href="#">Lazencar 소개</a> 
					<ul class="submenu"> 
					<li><a href="/Page/guide_Introduction.jsp" class="submenuLink longLink">Lazencar란?</a></li> 
					<li><a href="/Page/guide_Use.jsp" class="submenuLink longLink">이용안내</a></li> 
					<li><a href="/Page/guide_Charge.jsp" class="submenuLink longLink">요금안내</a></li> 
					<li><a href="/Page/guide_Road.jsp" class="submenuLink longLink">위치</a></li> 
					</ul> 
				</li>
						
				<li class="topMenuLi"> 
				<a class="menuLink" href="#">서비스/혜택</a> 
					<ul class="submenu"> 
					<li><a href="/Page/promotion.jsp" class="submenuLink longLink">특가상품</a></li> 
					<li><a href="/Page/coupon.do" class="submenuLink longLink">쿠폰받기</a></li> 
					<li><a href="/Page/review_Board_List.do" class="submenuLink longLink">후기</a></li> 
					</ul> 
				</li>
							
				<li class="topMenuLi"> 
				<a class="menuLink" href="#">고객센터</a> 
					<ul class="submenu"> 
					<li><a href="/Page/help_Qna.jsp" class="submenuLink longLink">1:1 문의</a></li> 
					<li><a href="/Page/help_Faq.jsp" class="submenuLink longLink">자주찾는 질문</a></li> 
					<li><a href="/service/list.do" class="submenuLink longLink">공지사항</a></li> 
					</ul> 
				</li>
				</ul> 
			</nav>
		</div>
	</div>
</div>
