<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

<link type="text/css" rel="stylesheet" href="/Page/css/main.css" >
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/common.css?v=201802">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/master.css?v=180322">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/calendar.css">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/unit.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.4/TweenMax.min.js"></script>
<script src="/Page/js/main.js"></script>

<script type="text/javascript">
// 로그인, 회원가입 -> 로그아웃, 마이페이지
function login_menu() {
// 	alert('${sessionScope.id}');
// 	alert('${sessionScope.token}');
	var id = '${sessionScope.id}';
	var token = '${sessionScope.token}';
// 	alert(id);
// 	alert(token);
	
	if ( (id===null || id==="") && (token===null || token==="") ) {
		$("#logout").hide();
		$("#sns_logout").hide();
		$("#mypage").hide();
	} else if(token) { 
		$("#logout").hide();
		$("#signup").hide();
		$("#login").hide();
	} else {
		$("#sns_logout").hide();
		$("#signup").hide();
		$("#login").hide();
	}
	
}

$(document).ready(function() {
	login_menu();
});

</script>

</head>

<body>
<!-- Begin #wrap -->
<div id="wrap">
<!-- Begin #header -->
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
// 										console.log(token);
							location.href="http://nid.naver.com/nidlogin.logout";
						});
            </script>
      			
      			<a href="/Page/mypage_ReservationCheck.jsp" id="mypage">마이페이지</a>
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

<!-- // End #header -->


				<div class="slide">
						<ul>
							<li><img src="/Page/images/img_01/car_01.jpg" alt="" /></li>
							<li><img src="/Page/images/img_01/car_02.jpg" alt="" /></li>
							<li><img src="/Page/images/img_01/car_03.jpg" alt="" /></li>
							<li><img src="/Page/images/img_01/car_04.jpg" alt="" /></li>
							<li><img src="/Page/images/img_01/car_05.jpg" alt="" /></li>
							<li><img src="/Page/images/img_01/car_06.jpg" alt="" /></li>
							<li><img src="/Page/images/img_01/car_07.jpg" alt="" /></li>
						</ul>
				</div>

		</div>

		<!-- // End #container -->

		

	</div>

	<!-- // End #wrap -->


<!-- Begin #footer -->

      <div id="footer">

         <div class="footer_box01">

            <div class="footer_inner">

               <ul class="footer_family">

                  <li><a
                     href="https://www.lotterentacar.net/kor/info/sinchajangCall.do?mnCd=MK0501"
                     target="_blank">장기렌터카</a></li>

                  <li><a
                     href="https://www.lotterentacar.net/kor/short/shortSubmain.do"
                     target="_blank">단기렌터카</a></li>

                  <li><a
                     href="https://www.lotterentacar.net/kor/long/usedList.do"
                     target="_blank">중고차렌터카</a></li>

                  <li><a
                     href="https://www.lotteautoauction.net/sell/sellMyCar/greenCarSellMyCar.do"
                     target="_blank">내차팔기</a></li>

                  <li><a href="https://www.lpoint.com/" target="_blank">L.POINT</a></li>

               </ul>

               <ul class="footer_partner">

                  <li><a
                     href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D01&seoul=Y"><img
                        src="/Page/images/common/img_partner_seoul.gif" alt="공유서울 나눔카 예약하기" /></a></li>

                  <li><a
                     href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D03"><img
                        src="/Page/images/common/img_partner_suwon.gif"
                        alt="휴먼시티 수원 라젠카 예약하기" /></a></li>

                  <li><a
                     href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D02"><img
                        src="/Page/images/common/img_partner_incheon.gif"
                        alt="인천광역시 라젠카 예약하기" /></a></li>

               </ul>

            </div>

         </div>

         <div class="footer_box02">

            <div class="footer_inner">

               <ul class="footer_sns">

                  <li><a class="facebook"
                     href="https://www.facebook.com/greencarkorea" target="_blank">라젠카
                        페이스북</a></li>

                  <li><a class="blog" href="http://blog.naver.com/greencar_co"
                     target="_blank">라젠카 블로그</a></li>

                  <li><a class="instagram"
                     href="https://www.instagram.com/greencar_kr/" target="_blank">라젠카
                        인스타그램</a></li>

               </ul>

               <ul class="footer_links">

                  <li><a href="http://www.greencar.co.kr/service/company/">회사소개</a></li>

                  <li><a href="http://www.greencar.co.kr/alliance/">제휴신청</a></li>

                  <li><a href="http://www.greencar.co.kr/service/useclause/">회원이용약관</a></li>

                  <li><a href="http://www.greencar.co.kr/service/personalinfo/"
                     class="point">개인정보처리방침</a></li>

                  <li><a href="http://www.greencar.co.kr/service/carclause/">자동차대여
                        표준약관</a></li>

                  <li><a href="http://www.greencar.co.kr/service/location/">위치기반
                        서비스 이용약관</a></li>

                  <li><a href="http://www.greencar.co.kr/service/sitemap/">사이트맵</a></li>

               </ul>

               <div class="footer_info">
                  <div class="info">
                     <span>(주) 라젠카</span> <span>사업자등록번호 : 220-87-91595</span> <span>통신판매업신고번호
                        : 제2011-서울강남-01456호</span> <span>대표이사 : 안아름</span>
                  </div>

                  <div class="addr">
                     <span>서울특별시 강남구 테헤란로 14길 6 (남도빌라 4층)</span> <span>TEL :
                        010-9550-0167</span> <span>FAX : 02-9550-0167</span>
                  </div>
                  <span class="copy">Copyright &#169; 2018 LazenCar. All
                     Rights Reserved.</span>
               </div>

               <div class="footer_emblem">
                  <img src="/Page/images/common/img_emblem_brandpower.jpg"
                     alt="2016년 한국산업의 브랜드파워 1위" />
                  <img src="/Page/images/common/img_emblem_brandstar.jpg"
                     alt="2016년 대한민국 브랜드스타" />
                  <img src="/Page/images/common/img_emblem_award.jpg"
                     alt="모바일 어워드 코리아 2016" />
                  <img src="/Page/images/common/img_emblem_kspbi.jpg" alt="KS PBI" />
               </div>

            </div>

			</div>

		</div>

		<!-- // End #footer -->

</body>

</html>