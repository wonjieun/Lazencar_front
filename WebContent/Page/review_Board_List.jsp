<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="dto.Review"%>
<%@ page import="dao.ReviewDaoImpl"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- header include --%><jsp:include page="header.jsp" />

<%
   String id = "";

   id = (String)session.getAttribute("id");


%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

<link type="text/css" rel="stylesheet" media="all" href="/Page/css/main.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/common.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/master.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/calendar.css" />

<link type="text/css" rel="stylesheet" href="/js/lib/magnific-popup.css" />

<title>라젠카란 &lt; 라젠카 소개</title>

</head>

<body>

	<!-- Begin #wrap -->

	<div id="wrap">
		
		<!-- Begin #container -->

		<div id="container">

			<div class="content-wrap">

				<div class="sidebar">
					<!-- 왼쪽 메뉴 -->

					<h2 class="left-tit">라젠카 소개</h2>

					<ul class="leftMenu">

						<li class="top"><a href="#" class='on'><span>라젠카란?</span></a></li>

						<li><a
							href="http://localhost:8082/Page/p03_Use_Guide_01.html"><span>이용안내</span></a></li>

						<li><a href="#"><span>요금안내</span></a></li>

						<li><a href="http://localhost:8082/Page/p05_Road_Guide.html"><span>찾아오시는길</span></a></li>

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


