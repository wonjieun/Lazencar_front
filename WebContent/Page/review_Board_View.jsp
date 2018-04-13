<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%@ page import = "dao.ReviewDaoImpl" %>
<%@ page import = "dto.Review" %>
<%@ page import = "java.io.PrintWriter" %>
<%-- header include --%><jsp:include page="header.jsp" />

<%

   int rev_num = 0;
   if (request.getParameter("rev_num") != null) {
	   
	   rev_num = Integer.parseInt(request.getParameter("rev_num"));
	   
   }
   
   if (rev_num == 0) {
	   
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('삭제되었거나 유효하지 않은 글입니다')");
	   script.println("location.href = 'review_Board_List'");
	   script.println("</script>");
   }
	  
   ReviewDaoImpl revDao = new ReviewDaoImpl();
   Review rev = new ReviewDaoImpl().getReview(rev_num);
   revDao.Hit(rev_num);
   Review next = new ReviewDaoImpl().getReview(revDao.getNext(rev_num));
   Review prev = new ReviewDaoImpl().getReview(revDao.getPrev(rev_num));

   
   
//    if (rev.getRev_avail() == 0) {
	   
// 	   PrintWriter script = response.getWriter();
// 	   script.println("<script>");
// 	   script.println("alert('삭제되었거나 유효하지 않은 글입니다')");
// 	   script.println("location.href = 'review_Board_List'");
// 	   script.println("</script>");
	   
//    }

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

<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<link type="text/css" rel="stylesheet" href="/js/lib/magnific-popup.css" />

<!-- <link type="text/css" rel="stylesheet" media="all" -->
<!-- 	href="./css/master.css" /> -->

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
							<strong>합리적인 소비와 환경보호를 실천하는 신개념 차량 공유서비스</strong> <br />
							여러분들의 소중한 사용 후기를 올려주세요!
						</p>
					</div>
					<div class="bodystart">
						<!-- bodystart -->
						<table summary="그린존 신청 상세화면" class="boardView">
							<caption>그린존 신청 상세화면</caption>
							<colgroup>
								<col width="600" />
								<col width="150" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><%= rev.getRev_title() %></th>
									<th scope="col" class="txt_r"><%= rev.getRev_date() %></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="col_padding">
										<div class="userphoto">
<!-- 											<span><img src="/images/mypage/user_none.gif" alt="프로필 사진" width="38" height="38" /></span>  -->
											
											<strong><%= rev.getRev_userId() %></strong>
											
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="board-contview">

											<div id="map_canvas" class="networkCompany"
												style="height: 400px; display: none; border: 1px solid black;"></div>
												
											<div class="txt-wrap">
											<%= rev.getRev_content() %>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="board-btn-wrap">
						
						<a href="review_Board_Update.jsp?rev_num=<%= rev_num %>"><img src="images/button/btn_review_update.png" alt="수정" /></a> </span>
						
					    <a href="review_Delete_Action.jsp?rev_num=<%= rev_num %>"><img src="images/button/btn_review_delete.jpg" alt="삭제" /></a> </span>
						
				        <a href="./review_Board_List.do"><img src="images/button/btn_review_list.png" alt="목록" /></a> </span>

						</div>
						<table summary="이전글, 다음글 목록" class="board-pagelist">
							<caption>이전글, 다음글 목록</caption>
							<colgroup>
								<col width="100" />
								<col width="" />
								<col width="90" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="next"><div>다음글</div></th>
                                    <% if (next == null){ %>
                                    	
                                    	<td> 다음 글이 없습니다</td>
                                    <%}%>
                                    
                                    <% if (next != null){ %>
                                    	
                                    <td><a href="review_Board_View.jsp?rev_num=<%= next.getRev_num() %>"><%= next.getRev_title() %></a></td>

                                    <%}%>
									<td></td>
								</tr>
								<tr>
									<th scope="row" class="prev"><div>이전글</div></th>
                                    <% if (prev == null){ %>
                                    	
                                    	<td> 현재 글이 첫번째 글 입니다 </td>
                                    <%}%>
                                    
                                    <% if (prev != null){ %>
                                    	
                                    <td><a href="review_Board_View.jsp?rev_num=<%= prev.getRev_num() %>"><%= prev.getRev_title() %></a></td>

                                    <%}%>
									<td></td>

								</tr>
							</tbody>
						</table>
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


