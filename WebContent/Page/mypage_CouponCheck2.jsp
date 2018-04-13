<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
		if(session.getAttribute("id") == null){
			response.sendRedirect("login.jsp");
		}else{
			String id = session.getAttribute("id").toString();
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link type="text/css" rel="stylesheet" media="all" href="/Page/css/mypage_ex2.css">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/main.css">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/layout_01.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>



<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<title>요금안내 &lt; 라젠카 소개</title>

</head>

<body>


	<!-- Begin #wrap -->

	<div id="wrap">

		

		<!-- [e]top_banner -->


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



					<h2 class="left-tit">마이 페이지</h2>

					<ul class="leftMenu">

						<li class="top"><a href="/Page/mypage_ReservationCheck.jsp"><span>예약확인</span></a></li>

						<li><a href="/Page/mypage_PersonalDataManage.jsp"><span>개인정보 관리</span></a></li>

						<li><a href="/Page/mypage_CouponCheck.jsp"><span>쿠폰</span></a></li>

						<li><a href="/mypage_Qna.do"><span>1:1문의</span></a></li>

						<li><a href="/Page/mypage_DeleteAccount.jsp" class='on'><span>회원탈퇴</span></a></li>

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
						<h3 class="subtit">쿠폰</h3>
					</div>
					<h6 style="font-size: 1.5em;">쿠폰 보유 현황</h6>
				<div class="bodystart">

					<!-- bodystart 	=========================================컨텐츠 변경가능 영역!!================================================  -->

					<div class="charges-wrap">

						<div class="section02">
							<!-- S:table //-->

							<div class="tbl01">

								<table
									style="border-bottom: 1px solid; border-collapse: collapse;">
									<thead style="height: 500px;">
										<tr class="checkTblHd">
											<th scope="col" width="36" style="border-right: 1px solid;"></th>
											<th scope="col" width="360" style="border-right: 1px solid;">쿠폰</th>
											<th scope="col" width="236" style="border-right: 1px solid;">사용조건</th>
											<th scope="col" width="118">유효기간</th>
										</tr>
									</thead>

									<tbody class="checkTblBd">
										<c:forEach items="${couList }" begin="0" end="${couTotal }"
											var="i" varStatus="status">
											<tr style="border-bottom: 1px solid #e9e9e9;">
												<c:choose>
													<c:when test="${fn:length(i.startDate)>11}">
														<td id="cou_num" style="border-right: 1px solid #e9e9e9;">${status.count}
														</td>
														<td id="cou_const" style="border-left: 1px solid #e9e9e9;">${i.name}</td>
														<td id="cou_start" style="border-left: 1px solid #e9e9e9;">${i.carConst}</td>
														<td id="cou_end" style="border-left: 1px solid #e9e9e9;"><c:out
																value="${fn:substring(i.startDate,0,10)}" /> ~ <c:out
																value="${fn:substring(i.endDate,0,10)}" /></td>
													</c:when>
												</c:choose>
											</tr>
										</c:forEach>

									</tbody>

								</table>
							</div>
						</div>


					</div>

				</div>
					<!-- // bodyend -->
				</div>
				<!-- // end contentBox -->

			</div>
			<!-- // End #content-wrap -->


			<!-- // End #container -->


			<!-- Begin #footer -->

			<jsp:include page="footer.jsp" />
		</div>
		<!-- // End #footer -->

	</div>

	<!-- // End #wrap -->


	<!-- 	select text input 스크립트  start -->
	
	<!-- 	select text input 스크립트  end -->

</body>

</html>


<%}%>