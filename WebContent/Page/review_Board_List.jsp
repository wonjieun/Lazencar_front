<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="dto.Review"%>
<%@ page import="dao.ReviewDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
   String id = "";

   id = (String)session.getAttribute("id");


%>
<html>

<head>

<meta charset="UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>
<link type="text/css" rel="stylesheet" media="all"
	href="/Page/css/main.css">
<link type="text/css" rel="stylesheet" media="all"
	href="/Page/css/layout_01.css">
<link type="text/css" rel="stylesheet" media="all"
	href="/Page/css/mypage_ex3.css">

<link type="text/css" rel="stylesheet" media="all"
	href="/Page/css/common.css?v=201802">
<link type="text/css" rel="stylesheet" media="all"
	href="/Page/css/master.css?v=180322">
<link type="text/css" rel="stylesheet" media="all"
	href="/Page/css/calendar.css">
<link type="text/css" rel="stylesheet" href="/js/lib/magnific-popup.css" />

<title>라젠카란 &lt; 라젠카 소개</title>

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

						<li><a href="#"><span>쿠폰받기</span></a></li>

						<li><a href="#" class = 'on'><span>후기</span></a></li>

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
					<div class="location">
						<div class="location_in">
							<p>
								<span>고객센터</span>&gt; <strong>그린존신청</strong>
							</p>
						</div>
					</div>
					<div class="subtop-content bg_subvisual_01_03">
						<h3 class="subtit">후기</h3>
						<p class="subtxt">
							<strong>합리적인 소비와 환경보호를 실천하는 신개념 차량 공유서비스 </strong> <br />여러분들의 소중한 사용 후기를 올려주세요!
						</p>
					</div>
					<div class="bodystart">
						<!-- bodystart -->

						<table summary="신청장소,작성자,등록일,조회수" class="boardList">
							<caption>후기후기</caption>
							<colgroup>
								<col width="70" />
								<col width="" />
								<col width="100" />
								<col width="105" />
								<col width="70" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">등록일</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" begin="0" end="${paging.listCount }" var="i">
									<tr>
										<td>${i.rev_num }</td>
										<td><a href="review_Board_View.jsp?rev_num=${i.rev_num }">${i.rev_title }</a></td>
										<td>${i.rev_userId }</td>
										<td>${i.rev_date }</td>
										<td>${i.rev_hit }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<span style="float: right"> <a href="review_Board_Write.jsp"><img src="images/button/btn_review_regist.png" alt="글쓰기" /></a> </span>

						<jsp:include page="/Page/paging.jsp" />

						<!-- // bodyend -->
					</div>
				</div>
				<!-- // end contentBox -->
			</div>
		</div>
		<!-- // End #container -->

		<!-- Begin #footer -->

<%-- footer include --%><jsp:include page="footer.jsp" />

	</div>

	<!-- // End #wrap -->



</body>

</html>


