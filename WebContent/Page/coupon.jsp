<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<%@ page import="dto.Coupon"%>
<%@ page import="dao.adminDao.CouponListDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import = "dto.Review" %>
<%@ page import = "dao.ReviewDaoImpl" %>
<%@ page import = "java.util.*, java.text.*"  %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>


<html>

<head>

<meta charset="UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>



<script type="text/javascript" src="./js/lib/jquery-1.9.1.js"></script>
<link type="text/css" rel="stylesheet" media="all"
	href="/Page/css/main.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/common.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/master.css" />
<link type="text/css" rel="stylesheet" media="all"
	href="css/calendar.css" />


<%-- header include --%><jsp:include page="header.jsp" />

<script type="text/javascript">
    
    
    function down(){

    
    	alert("쿠폰이 발급되었습니다");
       
    }
    
</script>

</head>

<body>


	<!-- Begin #wrap -->

	<div id="wrap">

<!-- 시작 #header -->

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
						//								console.log(token);
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

		<!-- Begin #container -->

		<div id="container">

			<div class="content-wrap">

				<div class="sidebar">
					<!-- 왼쪽 메뉴 -->



					<h2 class="left-tit">서비스 / 혜택</h2>

					<ul class="leftMenu">

						<li class="top"><a href="#"><span>특가상품</span></a></li>

						<li><a href="#" class='on'><span>쿠폰받기</span></a></li>

						<li><a href="#"><span>후기</span></a></li>

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
								<span>서비스 / 혜택</span>&gt; <strong>쿠폰받기</strong>
							</p>
						</div>
					</div>
					<div class="subtop-content bg_subvisual_02_01">
						<h3 class="subtit">쿠폰받기</h3>
						<p class="subtxt">
							<strong>라젠카 회원이라면 누구나 다운받을 수 있는 버라이어티 할인 쿠폰~!</strong><br />일상의
							충전, 라젠카의 할인혜택을 누려보세요.
						</p>
					</div>


					<div class="bodystart">

						<!-- bodystart 	=========================================컨텐츠 변경가능 영역!!================================================  -->

						<div class="coupon-wrap">
						
						<c:forEach items="${list }"  begin="0" end="3" var="i" step="1" varStatus="listNumber">
							<div class="coupon-con coupon-con-gap">
								<!-- 진행중 -->
								<ul class="coupon-down">
									<li><span><img
											src="/upload/${i.couponImg }" alt=""
											width="335" height="140" /></span> <span class="eventImg-txt"><img
											src="./images/coupon/icon_event_ing.png" alt="진행" /></span></li>
																		<!-- 다운로드 가능 -->
									<li class="down"><a id = "down" onclick="down()" href="#">
									<img src="./images/coupon/btn_down.gif" alt="다운로드" /></a></li>
								</ul>
								<ul class="coupon-info">
									<li><span class="title"><img
											src="./images/coupon/btn_coupon_name.gif" alt="쿠폰명" /></span> <strong
										class="txt">${i.name }</strong></li>
									<li><span class="title"><img
											src="./images/coupon/btn_coupon_date.gif" alt="신청기간" /></span> <span
										class="txt">${i.startDate }~${i.endDate}</span></li>
									<li><span class="title"><img
											src="./images/coupon/btn_coupon_use.gif" alt="사용조건" /></span> <span
										class="txt">${i.ageConst } 세 이상/${i.carConst }차종제한/${i.timeConst } 시간 이상</span></li>
								</ul>
							</div>
							
							<input type = "hidden" value = "${i.no }" id = "cou_num_${listNumber.count }"/>
							</c:forEach>
							
<%-- 							<c:forEach items="${list }"  begin="1" end="3" var="i" step="2" varStatus="listNumber"> --%>

<!-- 							<div class="coupon-con"> -->
<!-- 								진행중 -->
<!-- 								<ul class="coupon-down"> -->
<!-- 									<li><span><img -->
<%-- 											src="/upload/${i.couponImg }" alt="" --%>
<!-- 											width="335" height="140" /></span> <span class="eventImg-txt"><img -->
<!-- 											src="./images/coupon/icon_event_ing.png" alt="진행" /></span></li> -->
<!-- 									다운로드 가능 -->
<!-- 									<li class="down"><a -->
<!-- 										href="javascript:couponView('2KJdS9pt4cH7i7RarHeQlA==','8383');"><img -->
<!-- 											src="./images/coupon/btn_down.gif" alt="다운로드" /></a></li> -->
<!-- 								</ul> -->
<!-- 								<ul class="coupon-info"> -->
<!-- 									<li><span class="title"><img -->
<!-- 											src="./images/coupon/btn_coupon_name.gif" alt="쿠폰명" /></span> <strong -->
<%-- 										class="txt">${i.name }</strong></li> --%>
<!-- 									<li><span class="title"><img -->
<!-- 											src="./images/coupon/btn_coupon_date.gif" alt="신청기간" /></span> <span -->
<%-- 										class="txt">${i.startDate }~${i.endDate}</span></li> --%>
<!-- 									<li><span class="title"><img -->
<!-- 											src="./images/coupon/btn_coupon_use.gif" alt="사용조건" /></span> <span -->
<%-- 										class="txt">${i.ageConst } 세 이상/${i.carConst }차종제한/${i.timeConst } 시간 이상</span></li> --%>
<!-- 								</ul> -->
<!-- 							</div> -->
							
<%-- 							</c:forEach> --%>
							
						</div>
						<!-- coupon-wrap -->

					</div>
					<!-- // bodyend -->
				</div>
				<!-- // end contentBox -->

			</div>
			<!-- // End #content-wrap -->

		</div>
		<!-- // End #container -->


		<%-- footer include --%><jsp:include page="footer.jsp" />

	</div>

	<!-- // End #wrap -->

</body>

</html>


