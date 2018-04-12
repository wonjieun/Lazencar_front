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



		<!-- Begin #header -->

		<jsp:include page="header.jsp" />

		<!-- // End #header -->



		<!-- Begin #container -->

		<div id="container">

			<div class="content-wrap">

				<div class="sidebar">
					<!-- 왼쪽 메뉴 -->



					<jsp:include page="mypage_sidebar.jsp" />

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