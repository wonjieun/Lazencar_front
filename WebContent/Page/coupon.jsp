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

<title>Lazencar | ������ �ִ� ��ǰ�� ī�ξ</title>



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

    
    	alert("������ �߱޵Ǿ����ϴ�");
       
    }
    
</script>

</head>

<body>


	<!-- Begin #wrap -->

	<div id="wrap">

<!-- ���� #header -->

<div id="header" class="sub">
	<div class="hgroup">
		<div class="inbox">
			<h1 class="logo">
				<a href="/main.do"><span>����ī</span></a>
			</h1>

               <div class="nvalinks">
                  <a href="/login/login.do" id="login">�α���</a>
                  <a href="/signUp.do" id="signup">ȸ������</a>
                  <a href="/login/logout.do" id="logout">�α׾ƿ�</a>
                  <!-- ���̹� �α׾ƿ� -->
            			<a href="/login/logout.do" id="sns_logout">�α׾ƿ�</a>
            			
            			<script type="text/javascript">
            			$("#logout").click(function() {
						//								console.log(token);
										location.href="http://nid.naver.com/nidlogin.logout";
									});
            			 	</script>
            			
            			<a href="/Page/reservationCheck.jsp" id="mypage">����������</a>
                  <a href="/reservation/reservation.do" class="nvalinks-rev">����ī ����</a>

               </div>
<nav id="topMenu" > 
	<ul> 
		<li class="topMenuLi"> 
	<a class="menuLink" href="#">Lazencar �Ұ�</a> 
			<ul class="submenu"> 
		<li><a href="/Page/guide_Introduction.jsp" class="submenuLink longLink">Lazencar��?</a></li> 
		<li><a href="/Page/guide_Use.jsp" class="submenuLink longLink">�̿�ȳ�</a></li> 
		<li><a href="/Page/guide_Charge.jsp" class="submenuLink longLink">��ݾȳ�</a></li> 
		<li><a href="/Page/guide_Road.jsp" class="submenuLink longLink">��ġ</a></li> 
			</ul> 
		</li>
			
		<li class="topMenuLi"> 
	<a class="menuLink" href="#">����/����</a> 
			<ul class="submenu"> 
		<li><a href="/Page/promotion.jsp" class="submenuLink longLink">Ư����ǰ</a></li> 
		<li><a href="/Page/coupon.do" class="submenuLink longLink">�����ޱ�</a></li> 
		<li><a href="/Page/review_Board_List.do" class="submenuLink longLink">�ı�</a></li> 
			</ul> 
		</li>
				
		<li class="topMenuLi"> 
	<a class="menuLink" href="#">������</a> 
			<ul class="submenu"> 
		<li><a href="/Page/help_Qna.jsp" class="submenuLink longLink">1:1 ����</a></li> 
		<li><a href="/Page/help_Faq.jsp" class="submenuLink longLink">����ã�� ����</a></li> 
		<li><a href="/service/list.do" class="submenuLink longLink">��������</a></li> 
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
					<!-- ���� �޴� -->



					<h2 class="left-tit">���� / ����</h2>

					<ul class="leftMenu">

						<li class="top"><a href="#"><span>Ư����ǰ</span></a></li>

						<li><a href="#" class='on'><span>�����ޱ�</span></a></li>

						<li><a href="#"><span>�ı�</span></a></li>

						<!-- 					class = 'on'	���� �������� ��Ÿ���� on ����ϴ� �� -->

					</ul>



					<div class="side_sns">

						<span class="tit">SNS<em></em></span> <a class="facebook"
							href="https://www.facebook.com/greencarkorea" target="_blank">����ī
							���̽���</a> <a class="blog" href="http://blog.naver.com/greencar_co"
							target="_blank">����ī ��α�</a> <a class="instagram"
							href="https://www.instagram.com/greencar_kr" target="_blank">����ī
							�ν�Ÿ�׷�</a>

					</div>

					<div class="side_cscenter">

						<span class="tit">������</span> <span class="tel">010-9550-0167</span>

					</div>

				</div>

				<div class="contentbox">
					<!-- contentbox�� ���� -->


					<div class="location">
						<div class="location_in">
							<p>
								<span>���� / ����</span>&gt; <strong>�����ޱ�</strong>
							</p>
						</div>
					</div>
					<div class="subtop-content bg_subvisual_02_01">
						<h3 class="subtit">�����ޱ�</h3>
						<p class="subtxt">
							<strong>����ī ȸ���̶�� ������ �ٿ���� �� �ִ� �����̾�Ƽ ���� ����~!</strong><br />�ϻ���
							����, ����ī�� ���������� ����������.
						</p>
					</div>


					<div class="bodystart">

						<!-- bodystart 	=========================================������ ���氡�� ����!!================================================  -->

						<div class="coupon-wrap">
						
						<c:forEach items="${list }"  begin="0" end="3" var="i" step="1" varStatus="listNumber">
							<div class="coupon-con coupon-con-gap">
								<!-- ������ -->
								<ul class="coupon-down">
									<li><span><img
											src="/upload/${i.couponImg }" alt=""
											width="335" height="140" /></span> <span class="eventImg-txt"><img
											src="./images/coupon/icon_event_ing.png" alt="����" /></span></li>
																		<!-- �ٿ�ε� ���� -->
									<li class="down"><a id = "down" onclick="down()" href="#">
									<img src="./images/coupon/btn_down.gif" alt="�ٿ�ε�" /></a></li>
								</ul>
								<ul class="coupon-info">
									<li><span class="title"><img
											src="./images/coupon/btn_coupon_name.gif" alt="������" /></span> <strong
										class="txt">${i.name }</strong></li>
									<li><span class="title"><img
											src="./images/coupon/btn_coupon_date.gif" alt="��û�Ⱓ" /></span> <span
										class="txt">${i.startDate }~${i.endDate}</span></li>
									<li><span class="title"><img
											src="./images/coupon/btn_coupon_use.gif" alt="�������" /></span> <span
										class="txt">${i.ageConst } �� �̻�/${i.carConst }��������/${i.timeConst } �ð� �̻�</span></li>
								</ul>
							</div>
							
							<input type = "hidden" value = "${i.no }" id = "cou_num_${listNumber.count }"/>
							</c:forEach>
							
<%-- 							<c:forEach items="${list }"  begin="1" end="3" var="i" step="2" varStatus="listNumber"> --%>

<!-- 							<div class="coupon-con"> -->
<!-- 								������ -->
<!-- 								<ul class="coupon-down"> -->
<!-- 									<li><span><img -->
<%-- 											src="/upload/${i.couponImg }" alt="" --%>
<!-- 											width="335" height="140" /></span> <span class="eventImg-txt"><img -->
<!-- 											src="./images/coupon/icon_event_ing.png" alt="����" /></span></li> -->
<!-- 									�ٿ�ε� ���� -->
<!-- 									<li class="down"><a -->
<!-- 										href="javascript:couponView('2KJdS9pt4cH7i7RarHeQlA==','8383');"><img -->
<!-- 											src="./images/coupon/btn_down.gif" alt="�ٿ�ε�" /></a></li> -->
<!-- 								</ul> -->
<!-- 								<ul class="coupon-info"> -->
<!-- 									<li><span class="title"><img -->
<!-- 											src="./images/coupon/btn_coupon_name.gif" alt="������" /></span> <strong -->
<%-- 										class="txt">${i.name }</strong></li> --%>
<!-- 									<li><span class="title"><img -->
<!-- 											src="./images/coupon/btn_coupon_date.gif" alt="��û�Ⱓ" /></span> <span -->
<%-- 										class="txt">${i.startDate }~${i.endDate}</span></li> --%>
<!-- 									<li><span class="title"><img -->
<!-- 											src="./images/coupon/btn_coupon_use.gif" alt="�������" /></span> <span -->
<%-- 										class="txt">${i.ageConst } �� �̻�/${i.carConst }��������/${i.timeConst } �ð� �̻�</span></li> --%>
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


