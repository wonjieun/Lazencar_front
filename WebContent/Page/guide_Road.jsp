<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%-- header include --%><jsp:include page="header.jsp" />
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Lazencar | ������ �ִ� ��ǰ�� ī�ξ</title>

</head>

<body>


	<!-- Begin #wrap -->

	<div id="wrap">

		<!-- Begin #container -->

		<div id="container">

			<div class="content-wrap">

				<div class="sidebar">
					<!-- ���� �޴� -->



					<h2 class="left-tit">����ī �Ұ�</h2>

					<ul class="leftMenu">

						<li class="top"><a href="http://localhost:8082/Page/p02_Lazencar_Guide.html"  ><span>����ī��?</span></a></li>

						<li><a href="http://localhost:8082/Page/p03_Use_Guide_01.html"><span>�̿�ȳ�</span></a></li>

						<li><a href="#"><span>��ݾȳ�</span></a></li>

						<li><a href="#" class = 'on' ><span>ã�ƿ��ô±�</span></a></li>

					</ul>



					<div class="side_sns">

						<span class="tit">SNS<em></em></span> <a class="facebook"
							href="https://www.facebook.com/greencarkorea" target="_blank">����ī
							���̽���</a> <a class="blog" href="http://blog.naver.com/greencar_co"
							target="_blank">����ī ��α�</a> <a class="instagram"
							href="https://www.instagram.com/greencar_kr" target="_blank">����ī
							�ν�Ÿ�׷�</a>

					</div>

					<div class="side_cscenter">

						<span class="tit">������</span> <span class="tel">010-9550-0167</span>

					</div>

				</div>

				<div class="contentbox">
					<!-- contentbox�� ���� -->

					<div class="location">
						<!-- ��ܿ� �󿵿��� �ְ��ִ�.. -->

						<div class="location_in">

							<p>
								<span>����ī �Ұ�</span>&gt; <strong>��ݾȳ�</strong>
							</p>

						</div>

					</div>

					<div class="subtop-content bg_subvisual_02_01">
						<!--  -->

						<h3 class="subtit">ã�ƿ��ô� ��</h3>

						<p class="subtxt">
							<strong>30�е� �뿩 ������ �������� ����ī,</strong><br />
							���� ���� ã�ƿ�����!
						</p>

					</div>

					<div class="bodystart">

						<!-- bodystart 	=========================================������ ���氡�� ����!!================================================  -->

						<div class="charges-wrap">

							<h4>����ī ã�ƿ��ô� ��</h4> <br>

							<script type="text/javascript"
								src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=whIYcYEkfVwjsGdgJ1bP&submodules=geocoder"></script>

    <div id="map" style="width:100%;height:300px;"></div>
    <script>
      var map = new naver.maps.Map('map');
      var myaddress = '����Ư���� ������ ������� 14�� 6';// ���θ� �ּҳ� ���� �ּҸ� ���� (�ǹ��� �Ұ�!!!!)
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
          if (status !== naver.maps.Service.Status.OK) {
              return alert(myaddress + '�� �˻� ����� ���ų� ��Ÿ ��Ʈ��ũ ����');
          }
          var result = response.result;
          
          // �˻� ��� ����: result.total
          // ù��° ��� ��� �ּ�: result.items[0].address
          // ù��° �˻� ��� ��ǥ: result.items[0].point.y, result.items[0].point.x
          
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          
          map.setCenter(myaddr); // �˻��� ��ǥ�� ���� �̵�
          
          // ��Ŀ ǥ��
          var marker = new naver.maps.Marker({
            position: myaddr,
            map: map
          });
          
          // ��Ŀ Ŭ�� �̺�Ʈ ó��
          naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
                infowindow.close();
            } else {
                infowindow.open(map, marker);
            }
          });
          
          // ��ũ Ŭ���� ���������� ����
          var infowindow = new naver.maps.InfoWindow({
              content: '<h4> �� ����ī ��</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
          });
          
      });
      </script>
                        <br>
      
					        <h3 class="subtit2">������ ���ô±�</h3>

							<p class="subtxt">
								<strong>�ߵ��� 2�� �ⱸ���� </strong> ������ 500M �ɾ���ø� �˴ϴ� ����
							</p>
							
							<br>
							
				            <h3 class="subtit2">������ ���ô±�</h3>

							<p class="subtxt">
								<strong> 5�� �������� �����ż� </strong> 2������ �����ø� �˴ϴ� ����
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


