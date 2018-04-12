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



		<!-- Begin #header -->

		<jsp:include page="header.jsp" />

		<!-- // End #header -->



		<!-- Begin #container -->

		<div id="container">

			<div class="content-wrap">

				<jsp:include page="mypage_sidebar.jsp" />

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