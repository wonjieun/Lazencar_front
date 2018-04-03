<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

<link type="text/css" rel="stylesheet" href="/Page/css/main.css" >
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.4/TweenMax.min.js"></script>
<script src="./js/main.js"></script>

<script type="text/javascript">
   //현재 서버 시간

   var curYear = "2018"; //현재 년

   var curMonth = "3"; //현재 월

   var curDay = "6"; //현재 일

   var curHour = "18"; //현재 시간

   var curMinute = "21"; //현재 분

   var ___isLogin___ = "false"; //로그인 여부

   var __ciYn__ = "";

   var _globalFullContextSSL = "https://www.greencar.co.kr";

   var ___isCorpChk___ = "";

   var _ssoDomain = 'member.lpoint.com';

   var _joinReturnUrl = 'https://www.greencar.co.kr/login/';

   var _fullImgHostAddr = '';

   var _birth = "";
</script>

</head>

<body>

   <!-- Begin #wrap -->

   <div id="wrap">

      <div class="top_banner join" style="display: none;">
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

      <div id="header" class="sub">

         <div class="hgroup">

            <div class="inbox">

               <h1 class="logo">
                  <a href="http://www.greencar.co.kr/"><span>라젠카</span></a>
               </h1>

               <div class="nvalinks">

                  <a href="javascript:void(0);" onclick="openLapComLogin();">로그인</a>

                  <a href="https://www.greencar.co.kr/member/index.jsp">회원가입</a> <a
                     class="nvalinks-rev"
                     href="https://www.greencar.co.kr/reserve/index.do">라젠카 예약하기</a>

               </div>
      <nav id="topMenu" > 
         <ul> 
                  <li class="topMenuLi"> 
            <a class="menuLink" href="#">LaZencar 소개</a> 
            <ul class="submenu"> 
               <li><a href="#" class="submenuLink longLink">Lazencar란?</a></li> 
               <li><a href="#" class="submenuLink longLink">이용안내</a></li> 
               <li><a href="#" class="submenuLink longLink">요금안내</a></li> 
               <li><a href="#" class="submenuLink longLink">위치</a></li> 
            </ul> 
               </li>
               
                        <li class="topMenuLi"> 
            <a class="menuLink" href="#">서비스/혜택</a> 
            <ul class="submenu"> 
               <li><a href="#" class="submenuLink longLink">특가상품</a></li> 
               <li><a href="#" class="submenuLink longLink">쿠폰받기</a></li> 
               <li><a href="#" class="submenuLink longLink">후기</a></li> 
            </ul> 
               </li>
            
                     <li class="topMenuLi"> 
            <a class="menuLink" href="#">고객센터</a> 
            <ul class="submenu"> 
               <li><a href="#" class="submenuLink longLink">1:1 문의</a></li> 
               <li><a href="#" class="submenuLink longLink">자주찾는 질문</a></li> 
               <li><a href="#" class="submenuLink longLink">공지사항</a></li> 
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
							<li><img src="./images/img_01/car_01.jpg" alt="" /></li>
							<li><img src="./images/img_01/car_02.jpg" alt="" /></li>
							<li><img src="./images/img_01/car_03.jpg" alt="" /></li>
							<li><img src="./images/img_01/car_04.jpg" alt="" /></li>
							<li><img src="./images/img_01/car_05.jpg" alt="" /></li>
							<li><img src="./images/img_01/car_06.jpg" alt="" /></li>
							<li><img src="./images/img_01/car_07.jpg" alt="" /></li>
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
                        src="./images/common/img_partner_seoul.gif" alt="공유서울 나눔카 예약하기" /></a></li>

                  <li><a
                     href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D03"><img
                        src="./images/common/img_partner_suwon.gif"
                        alt="휴먼시티 수원 라젠카 예약하기" /></a></li>

                  <li><a
                     href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D02"><img
                        src="./images/common/img_partner_incheon.gif"
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

                  <img src="./images/common/img_emblem_brandpower.jpg"
                     alt="2016년 한국산업의 브랜드파워 1위" /> <img
                     src="./images/common/img_emblem_brandstar.jpg"
                     alt="2016년 대한민국 브랜드스타" /> <img
                     src="./images/common/img_emblem_award.jpg" alt="모바일 어워드 코리아 2016" />

                  <img src="./images/common/img_emblem_kspbi.jpg" alt="KS PBI" />

               </div>

            </div>

			</div>

		</div>

		<!-- // End #footer -->

<!--아름 →  script 작성 -->
<script type="text/javascript">
(function(){
	
	var current = 0;
	var max = 0;
	var container;
	var xml;
	var interval;
	var xml;
	var amimateTarget = null;
	var iWidth;
	var iHeight;
	
	function init() {
		container = jQuery(".slide ul");
		max = container.children().length;
		
		events();
		
		interval = setInterval(next, 3000);
		
		config_load();
	}
	function config_load() {
		var obj = {};
		//obj.url = "/xml/images.xml"
		obj.dataType = "text";
		obj.type = "get";
		obj.success = loadComplete;
		obj.fail = loadFail;
		jQuery.ajax(obj);
	}
	function loadComplete($arg1, $arg2) {
		if($arg2 == "success") {
			var data = jQuery.parseXML($arg1);
			xml = jQuery(data);
			
			setting();
		}
	}
	function loadFail($arg1, $arg2, $arg3) {
		console.log([$arg1, $arg2, $arg3]);
	}
	function setting() {
		var li = "";
		xml.find("images").find("item").each(function(i) {
			var self = jQuery(this);
			li += '<li><img src="'+self.find("src").text()+'" alt="" /></li>';
		})
		
		iWidth = xml.find("config").find("width").text();
		iHeight = xml.find("config").find("height").text();
		
		jQuery(".slide").css("width", iWidth+"px");
		jQuery(".slide").css("height", iHeight+"px");
		
		container.append(li);
		max = container.children().length;
		container.css("margin-left", "-1538px");
		container.prepend(container.children()[max-1]);
		
		events();
		
		interval = setInterval(next, 3000);
	}
	
	function events() {
		jQuery("button.prev").on("click", prev);
		jQuery("button.next").on("click", next);
		
		jQuery(window).on("keydown", keydown);
	}
	
	function prev(e) {
		current--;
		if( current < 0 ) current = max-1;
		animate("prev");
	}
	function next(e) {
		current++;
		if( current > max-1 ) current = 0;
		animate("next");
		
	}	
	function animate($direction) {
		/*var moveX = current * 600;
		TweenMax.to(container, 0.8, {marginLeft:-moveX, ease:Expo.easeOut});
		
		//timer
		clearInterval(interval);
		interval = setInterval(next, 3000); */
		
		if(amimateTarget != null) {
			TweenMax.killTweensOf(amimateTarget);
			amimateTarget.css("margin-left", "0");
		}
		if($direction == "next") {
			jQuery(container.children()[1]).css("margin-left", iWidth+"px");
			container.append(container.children()[0]);
			
		} else if ($direction == "prev" ){
			container.prepend(container.children()[max-1]);
			jQuery(container.children()[0]).css("margin-left", (-iWidth)+"px");
		} 
		amimateTarget = jQuery(container.children()[0]);
		TweenMax.to(amimateTarget, 0.8, {marginLeft:0, ease:Expo.easeOut});
		
	}
	function keydown(e) {
		
		if(e.which == 39 /*right*/) {
			next();
		} else if(e.which == 37 /*left*/) {
			prev();
		}
	}
	
	jQuery(document).ready(init);

})();
</script>
</body>

</html>