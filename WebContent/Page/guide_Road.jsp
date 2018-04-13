<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%-- header include --%><jsp:include page="header.jsp" />
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

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

						<li class="top"><a href="http://localhost:8082/Page/p02_Lazencar_Guide.html"  ><span>라젠카란?</span></a></li>

						<li><a href="http://localhost:8082/Page/p03_Use_Guide_01.html"><span>이용안내</span></a></li>

						<li><a href="#"><span>요금안내</span></a></li>

						<li><a href="#" class = 'on' ><span>찾아오시는길</span></a></li>

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

					<div class="location">
						<!-- 상단에 빈영역을 주고있다.. -->

						<div class="location_in">

							<p>
								<span>라젠카 소개</span>&gt; <strong>요금안내</strong>
							</p>

						</div>

					</div>

					<div class="subtop-content bg_subvisual_02_01">
						<!--  -->

						<h3 class="subtit">찾아오시는 길</h3>

						<p class="subtxt">
							<strong>30분도 대여 가능한 경제적인 라젠카,</strong><br />
							지금 당장 찾아오세요!
						</p>

					</div>

					<div class="bodystart">

						<!-- bodystart 	=========================================컨텐츠 변경가능 영역!!================================================  -->

						<div class="charges-wrap">

							<h4>라젠카 찾아오시는 길</h4> <br>

							<script type="text/javascript"
								src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=whIYcYEkfVwjsGdgJ1bP&submodules=geocoder"></script>

    <div id="map" style="width:100%;height:300px;"></div>
    <script>
      var map = new naver.maps.Map('map');
      var myaddress = '서울특별시 강남구 테헤란로 14길 6';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
          if (status !== naver.maps.Service.Status.OK) {
              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
          }
          var result = response.result;
          
          // 검색 결과 갯수: result.total
          // 첫번째 결과 결과 주소: result.items[0].address
          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
          
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          
          map.setCenter(myaddr); // 검색된 좌표로 지도 이동
          
          // 마커 표시
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
          
          // 마커 클릭 이벤트 처리
          naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
          });
          
          // 마크 클릭시 인포윈도우 오픈
          var infowindow = new naver.maps.InfoWindow({
              content: '<h4> ★ 라젠카 ★</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
          });
          
      });
      </script>
                        <br>
      
					        <h3 class="subtit2">도보로 오시는길</h3>

							<p class="subtxt">
								<strong>중동역 2번 출구에서 </strong> 앞으로 500M 걸어오시면 됩니다 ㅎㅎ
							</p>
							
							<br>
							
				            <h3 class="subtit2">버스로 오시는길</h3>

							<p class="subtxt">
								<strong> 5번 버스에서 내리셔서 </strong> 2분정도 걸으시면 됩니다 ㅎㅎ
							</p>

						</div>
						<!-- charges-wrap -->

						<!-- // bodyend -->

					</div>

				</div>
				<!-- // end contentBox -->

			</div>

		</div>

		<!-- // End #container -->
<%-- footer include --%><jsp:include page="footer.jsp" />

	</div>

	<!-- // End #wrap -->



</body>

</html>


