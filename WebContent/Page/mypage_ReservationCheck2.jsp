<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	if (session.getAttribute("id") == null) {
		response.sendRedirect("login.jsp");
	} else {
		String id = session.getAttribute("id").toString();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>


<script type="text/javascript" src="./js/lib/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<title>요금안내 &lt; 라젠카 소개</title>

</head>
<%-- header include --%><jsp:include page="header.jsp" />
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



		<div id="container">

			<div class="content-wrap">







				<div class="sidebar">
					<!-- 왼쪽 메뉴 -->



					<h2 class="left-tit">마이 페이지</h2>

					<ul class="leftMenu">

						<li class="top"><a href="/Page/mypage_ReservationCheck.jsp"
							class='on'><span>예약확인</span></a></li>

						<li><a href="/Page/mypage_PersonalDataManage.jsp"><span>개인정보
									관리</span></a></li>

						<li><a href="/Page/mypage_CouponCheck.jsp"><span>쿠폰</span></a></li>

						<li><a href="/mypage_Qna.do"><span>1:1문의</span></a></li>

						<li><a href="/Page/mypage_DeleteAccount.jsp"><span>회원탈퇴</span></a></li>

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



					<div class="subtop-content">
						<h3 class="subtit">예약 확인</h3>
					</div>
					<h6 style="font-size: 1.5em;">예약 내역</h6>
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
												<th scope="col" width="198" style="border-right: 1px solid;">예약차종</th>
												<th scope="col" width="198" style="border-right: 1px solid;">차량대여시작일</th>
												<th scope="col" width="198" style="border-right: 1px solid;">차량반납일</th>
												<th scope="col" width="118">취소</th>
											</tr>
										</thead>
										<tbody class="checkTblBd">
											<c:forEach items="${resList }" begin="0" end="${resTotal }"
												var="i" varStatus="status">
												<tr style="border-bottom: 1px solid #e9e9e9;">
													<c:choose>
														<c:when test="${fn:length(i.resStart)>11 }">
															<%-- 												<input id="resNum" type="hidden" value="${i.resNum }"/> --%>
															<td scope="row" style="border-right: 1px solid #e9e9e9;">${status.count }</td>
															<td scope="row" style="border-left: 1px solid #e9e9e9;">${i.carName }</td>
															<%-- ${i.carNum } --%>
															<td scope="row" style="border-left: 1px solid #e9e9e9;"><c:out
																	value="${fn:substring(i.resStart,0,10) }" /></td>
															<td scope="row" style="border-left: 1px solid #e9e9e9;"><c:out
																	value="${fn:substring(i.resEnd,0,10) }" /></td>
															<td scope="row" style="border-left: 1px solid #e9e9e9;">
																<span> <a href="#" id="btn_listDown"
																	class="btnR01"
																	onclick="showDetail('hiddenTr_${status.count}');">상세보기</a>
																	<a href="#" id="cancleReserv" class="btnR01"
																	onclick="deleteReserv(${i.resNum});">취소</a>
															</span>
															</td>
														</c:when>
													</c:choose>
												</tr>
												<tr class="hiddenTr checkTblHd"
													id="hiddenTr_${status.count }_1"
													style="display: none; border-bottom: 1px solid #e9e9e9;">
													<th scope="col" width="36"
														style="border-right: 1px solid; background: #ffff;"></th>
													<th scope="col" width="198"
														style="border-right: 1px solid; background: #e2e2e2;">차량번호</th>
													<th scope="col" width="198"
														style="border-right: 1px solid; background: #e2e2e2;">자차손해</th>
													<th scope="col" width="198"
														style="border-right: 1px solid; background: #e2e2e2;">차량옵션</th>
													<th scope="col" width="198"
														style="border-right: 1px solid; background: #e2e2e2;"></th>
												</tr>
												<tr class="hiddenTr" id="hiddenTr_${status.count }_1_1"
													style="display: none; border-bottom: 1px solid #e9e9e9;">
													<td scope="row"
														style="border-right: 1px solid #e9e9e9; background: #ffff;"></td>
													<td scope="row" style="border-left: 1px solid #e9e9e9;">${i.carNum }</td>
													<td scope="row" style="border-left: 1px solid #e9e9e9;">${i.carDemage }</td>
													<td scope="row" style="border-left: 1px solid #e9e9e9;">${i.optionList }</td>
													<td scope="row" style="border-left: 1px solid #e9e9e9;"></td>
												</tr>
												<tr class="hiddenTr checkTblHd"
													id="hiddenTr_${status.count }_2"
													style="display: none; border-bottom: 1px solid #e9e9e9;">
													<th scope="col" width="36"
														style="border-right: 1px solid; background: #ffff;"></th>
													<th scope="col" width="198"
														style="border-right: 1px solid; background: #e2e2e2;">쿠폰번호</th>
													<th scope="col" width="198"
														style="border-right: 1px solid; background: #e2e2e2;">총금액</th>
													<th scope="col" width="198"
														style="border-right: 1px solid; background: #e2e2e2;">실결재금액</th>
													<th scope="col" width="198"
														style="border-right: 1px solid; background: #e2e2e2;"></th>
												</tr>
												<tr class="hiddenTr" id="hiddenTr_${status.count }_2_1"
													style="display: none; border-bottom: 1px solid #e9e9e9;">
													<td scope="row"
														style="border-right: 1px solid #e9e9e9; background: #ffff;"></td>
													<td scope="row" style="border-left: 1px solid #e9e9e9;">${i.couNum }</td>
													<td scope="row" style="border-left: 1px solid #e9e9e9;">${i.normalPrice }</td>
													<td scope="row" style="border-left: 1px solid #e9e9e9;">${i.dcPrice }</td>
													<td scope="row" style="border-left: 1px solid #e9e9e9;"></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!--// E:table -->
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
		</div>
		<!-- // End #footer -->

	</div>

	<!-- // End #wrap -->


	<!-- 	select text input 스크립트  start -->
	<script type="text/javascript">
	function deleteReserv(resNum){
		var answer=confirm("예약을 취소하시겠습니까?");
		if(answer){
			$(document).ready(function(){
				var resnum = resNum;
				var $form = $("<form>").attr("action","/deleteReserv.do").attr("method", "post");
				$("<input>").attr("type", "hidden").attr(
						"name", "resNum").attr(
						"value", resnum).appendTo(
						$form);
				$form.appendTo($(document.body));
				$form.submit();
			});
		}
	}
	
	//리스트 하단에 추가로 출력해주기 위해서 토글 함수 생성
	   function showDetail(id){
	        obj = document.getElementById(id+"_1");
	        obj2 = document.getElementById(id+"_1_1");
	        obj3 = document.getElementById(id+"_2");
	        obj4 = document.getElementById(id+"_2_1");
	        if(obj.style.display == "none"){
	           obj.style.display = "table-row";
	           obj2.style.display= "table-row";
	           obj3.style.display= "table-row";
	           obj4.style.display= "table-row";
	        }else{
	           obj.style.display="none";
	           obj2.style.display= "none";
	           obj3.style.display= "none";
	           obj4.style.display= "none";
	           
	        }
	   }
	
 	</script>
	<!-- 	select text input 스크립트  end -->

</body>


</html>
<%
	}
%>