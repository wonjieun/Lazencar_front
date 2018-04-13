<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberModifyDataDao"%>
<%@ page import="dao.MemberModifyDataDaoImpl"%>
<%@ page import="dto.Member"%>
<%
	if (session.getAttribute("id") == null) {
		response.sendRedirect("login.jsp");
	} else {
		String id = session.getAttribute("id").toString();
		MemberModifyDataDao dao = new MemberModifyDataDaoImpl();
		Member mem = dao.getMemData(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" media="all"
	href="/Page/css/main.css">
<link type="text/css" rel="stylesheet" media="all"
	href="/Page/css/layout_01.css">
<link type="text/css" rel="stylesheet" media="all"
	href="/Page/css/mypage_ex4.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>



<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<script type="text/javascript" src="./js/lib/jquery-1.9.1.js"></script>



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



					<div class="subtop-content bg_subvisual_02_01">
						<h3 class="subtit">회원 탈퇴</h3>
						<p class="subtxt"></p>
					</div>
					<h6 style="font-size: 1.5em; color: #767676">회원 탈퇴 확인</h6>

					<div class="bodystart">

						<!-- bodystart 	=========================================컨텐츠 변경가능 영역!!================================================  -->

						<div class="charges-wrap">

							<div class="section02">
								<!-- S:table //-->

								<p>탈퇴 확인을 위해 귀하의 비밀번호를 입력하여 주십시오.</p>
								<div>
									<input type="hidden" id="mem_id" name="mem_id"
										value="<%=mem.getMemId()%>"></input> <input type="password"
										id="mem_pw" name="mem_pw"></input>
								</div>
								<!--// E:table -->
							</div>

							<div class="btnArea02">
								<a href="javascript:void(0);" onclick="btn_delete;"
									id="btn_delete" class="btnP01">탈퇴하기</a>
							</div>
						</div>
						<!-- charges-wrap -->

					</div>
					<!-- // bodyend -->
				</div>
				<!-- // end contentBox -->

			</div>
			<!-- // End #content-wrap -->


			<!-- // End #container -->


			<!-- Begin #footer -->

			<jsp:include page="footer.jsp" />
			<!-- // End #footer -->
		</div>
	</div>

	<!-- // End #wrap -->


	<!-- 	select text input 스크립트  start -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		function checkValue() {
			if ($("#checkPw").val() == "") {
				return false;
			} else {
				return true;
			}
		}

		$("#btn_delete").click(function() {
			var mem_id = $("#mem_id").val();
			var mem_pw = $("#mem_pw").val();
			if (checkValue() == true) {
				var answer = confirm("정말 탈퇴하시겠습니까")
				if (answer) {
					$.ajax({
						type : "POST",
						url : "/delete.do",
						dataType : "json",
						data : {
							memId : mem_id,
							memPw : mem_pw
						},

						success : function(data) {
							var check = data.check;
							console.log(check);

							if (check) {

								$.ajax({

									type : "POST",
									url : "/sessionClose.do",

									success : function(data) {
										console.log("넘어가나");
									},
									error : function(e) {
										console.log("에러");
									}
								});
	<%-- 						<%session.invalidate();%>//세션 종료 --%>
		alert("회원 삭제 성공");
								location.href = "/Page/main.jsp"; //메인페이지로 되돌아감

							} else {
								alert("비밀번호 불일치")
							}
						},
						error : function(e) {
							console.log("------error------");
							console.log(e.responseText);
						}
					});
				}
			} else {
				alert("비밀번호를 입력해주세요");
				return;
			}
		});
	</script>
	<!-- 	select text input 스크립트  end -->

</body>

</html>
<%
	}
%>