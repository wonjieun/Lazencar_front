<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "dto.Review" %>
<%@ page import = "dao.ReviewDaoImpl" %>
<%-- header include --%><jsp:include page="header.jsp" />

<%

	String now_id = null;
	if (session.getAttribute("id") != null) {

		now_id = (String) session.getAttribute("id");
	}
	
	// 예외처리 현재 아이디값 안들어와있을때

	if (now_id == null) {

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인부터 해주세요!')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
    }

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

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<link type="text/css" rel="stylesheet" href="/js/lib/magnific-popup.css"/>

<script type = "text/javascript" >

$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "rev_content",
        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
        }
    });
     
    //전송버튼 클릭이벤트
    
    $("#save").click(function(){
    	
        //id가 rev_content인 textarea에 에디터에서 대입
        editor_object.getById["rev_content"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    })
})
</script>

<!-- <link type="text/css" rel="stylesheet" media="all" -->
<!-- 	href="./css/master.css" /> -->

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
						<p><span>고객센터</span>&gt; <strong>그린존신청</strong></p>
					</div>
				</div>
				<div class="subtop-content bg_subvisual_01_03">
					<h3 class="subtit">후기 작성</h3>
					<p class="subtxt"><strong>합리적인 소비와 환경보호를 실천하는 신개념 차량 공유서비스</strong> <br/>여러분들의 소중한 사용 후기를 올려주세요!</p>
				</div>
				<div class="bodystart">
<!-- bodystart -->
                    <form action="review_Write_Action.jsp" method="post" id="frm">
                             
					<table summary="신청장소 선택, 등록" class="boardView-02">
						<caption> 후기 작성 </caption>
						<colgroup>
							<col width="150" />
							<col width="" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">카테고리 정하기</th>
						<td class="q-select">
								
									<select name="h-qnaType" id="qnaType">
										
									<option value="06CtGRc/iWnD/mHWn2u7xw==" >흡연신고</option>
										
									<option value="oXTZ14vP4A7iA+dtYSy1mg==" >예약/결제문의</option>
												
									<option value="0Ie0A8qTBqiUq4tOAMavOQ==" >서비스 버그신고</option>
															
									</select>
								</td>
							</tr>
							<tr>
								<tr class="common top">								
							
								<th scope="row"><label for="qnaType">제목</label></th>
								<td>
									<div class="pop_location">
									 
										<input type="text" name="rev_title"  id="rev_title" class="inputTxt02" />
                                       
									</div>
								</td>
							      
							</tr>
				
							<tr>
								<td colspan="2" class="contentView">
	
                                   <textarea name="rev_content" id="rev_content" rows="10" cols="100" style="width:738px; height:412px;">

                                   </textarea>
    
                                   <input type="button" id="save" value="글쓰기" />
  			
								</td>
							</tr>
						</tbody>
					</table>
					
					 </form>
<!-- // bodyend -->
				</div>
			</div> <!-- // end contentBox -->
		</div>
	</div>
	<!-- // End #container -->

	<!-- Begin #footer -->

	</div>

	<!-- // End #wrap -->



</body>

</html>


