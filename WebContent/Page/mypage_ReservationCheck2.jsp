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
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/main.css">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/layout_01.css">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/mypage_ex3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>


<script type="text/javascript" src="./js/lib/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>


<title>요금안내 &lt; 라젠카 소개</title>

</head>
	<jsp:include page="header.jsp" />
<body>


	<!-- Begin #wrap -->

	<div id="wrap">

		

		<div id="container">

			<div class="content-wrap">

				<jsp:include page="mypage_sidebar.jsp" />

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
										<c:forEach items="${resList }" begin="0" end="${resTotal }" var="i" varStatus="status">
											<tr style="border-bottom: 1px solid #e9e9e9;">
											<c:choose>
											<c:when test="${fn:length(i.resStart)>11 }">
<%-- 												<input id="resNum" type="hidden" value="${i.resNum }"/> --%>
												<td scope="row" style="border-right: 1px solid #e9e9e9;">${status.count }</td>
												<td scope="row" style="border-left: 1px solid #e9e9e9;">${i.carName }</td>	<%-- ${i.carNum } --%>
												<td scope="row" style="border-left: 1px solid #e9e9e9;"><c:out value="${fn:substring(i.resStart,0,10) }"/></td>
												<td scope="row" style="border-left: 1px solid #e9e9e9;"><c:out value="${fn:substring(i.resEnd,0,10) }"/></td>
												<td scope="row" style="border-left: 1px solid #e9e9e9;">
													<span>
													<a href="#" id="btn_listDown" class="btnR01" onclick="showDetail('hiddenTr_${status.count}');">상세보기</a>
													<a href="#" id="cancleReserv" class="btnR01" onclick="deleteReserv(${i.resNum});">취소</a>
													</span>
												</td>
												</c:when>
												</c:choose>
											</tr>
											<tr class="hiddenTr checkTblHd" id="hiddenTr_${status.count }_1" style="display: none; border-bottom: 1px solid #e9e9e9;">
											<th scope="col" width="36" style="border-right: 1px solid; background: #ffff;"></th>
												<th scope="col" width="198" style="border-right: 1px solid;  background: #e2e2e2;">차량번호</th>
												<th scope="col" width="198" style="border-right: 1px solid;  background: #e2e2e2;">자차손해</th>
												<th scope="col" width="198" style="border-right: 1px solid;  background: #e2e2e2;">차량옵션</th>
												<th scope="col" width="198" style="border-right: 1px solid;  background: #e2e2e2;"></th>
											</tr>
											<tr class="hiddenTr" id="hiddenTr_${status.count }_1_1" style="display: none; border-bottom: 1px solid #e9e9e9;">
												<td scope="row" style="border-right: 1px solid #e9e9e9; background: #ffff;"></td>
												<td scope="row" style="border-left: 1px solid #e9e9e9;">${i.carNum }</td>
												<td scope="row" style="border-left: 1px solid #e9e9e9;">${i.carDemage }</td>
												<td scope="row" style="border-left: 1px solid #e9e9e9;">${i.optionList }</td>
												<td scope="row" style="border-left: 1px solid #e9e9e9;"></td>
											</tr>
											<tr class="hiddenTr checkTblHd" id="hiddenTr_${status.count }_2" style="display: none; border-bottom: 1px solid #e9e9e9;">
											<th scope="col" width="36" style="border-right: 1px solid; background: #ffff;"></th>
												<th scope="col" width="198" style="border-right: 1px solid;  background: #e2e2e2;">쿠폰번호</th>
												<th scope="col" width="198" style="border-right: 1px solid;  background: #e2e2e2;">총금액</th>
												<th scope="col" width="198" style="border-right: 1px solid;  background: #e2e2e2;">실결재금액</th>
												<th scope="col" width="198" style="border-right: 1px solid;  background: #e2e2e2;"></th>
											</tr>
											<tr class="hiddenTr" id="hiddenTr_${status.count }_2_1" style="display: none; border-bottom: 1px solid #e9e9e9;">
												<td scope="row" style="border-right: 1px solid #e9e9e9; background: #ffff;"></td>
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