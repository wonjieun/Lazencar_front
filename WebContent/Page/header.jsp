<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
		if(session.getAttribute("id") == null){
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>
</head>

<%-- style 시작 --%>
<link type="text/css" rel="stylesheet" media="all" href="./css/main.css" />
<%-- style 끝 --%>

<body>
<!-- 시작 #header -->

<div id="header" class="sub">
	<div class="hgroup">
		<div class="inbox">
			<h1 class="logo">
				<a href="/Page/main.jsp"><span>라젠카</span></a>
			</h1>

<div class="nvalinks">
	<a href="javascript:void(0);" onclick="openLapComLogin();">로그인</a>
	<a href="/Page/signUp.jsp">회원가입</a> 
	<a  class="nvalinks-rev"
		href="">라젠카 예약하기</a>
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
<%
		}
		else{
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>
</head>

<%-- style 시작 --%>
<link type="text/css" rel="stylesheet" media="all" href="./css/main.css" />
<%-- style 끝 --%>

<body>
<!-- 시작 #header -->

<div id="header" class="sub">
	<div class="hgroup">
		<div class="inbox">
			<h1 class="logo">
				<a href="/Page/main.jsp"><span>라젠카</span></a>
			</h1>

<div class="nvalinks">
	<a href="/login/logout.do" onclick="openLapComLogin();">로그아웃</a>
	<a href="/Page/mypage_PersonalDataManage.jsp">마이페이지</a> 
	<a  class="nvalinks-rev"
		href="">라젠카 예약하기</a>
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
		
		<!-- // 끝 #header -->
		<%}%>