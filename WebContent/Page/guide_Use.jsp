<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Lazencar | ������ �ִ� ��ǰ�� ī�ξ</title>

<style type="text/css">
@charset "UTF-8";

/* ��ü ��Ÿ�� ���� */
#header *, #footer *, .sidebar * 
{
	font-family: 'Noto Sans KR', '�������', 'Malgun Gothic', 'MGothic',
		sans-serif, "����", Dotum, "����", Gulim
}
#wrap 		{	height: 100% }
#container 	{	min-height: 100%; margin: -80px 0 -250px	}

/* Header */
#header {*z-index:1001;position:relative;height:80px}
.hgroup {position:relative;*display:inline-block;*zoom:1;z-index:7000}
.hgroup .inbox {position:relative;width:1080px;height:80px;margin:0 auto;z-index:555}

/* navigation */
.hgroup .logo {position:absolute;top:0;left:10px}
.hgroup .logo a {display:block;width:156px;height:68px;padding-top:12px}
.hgroup .logo a span {display:block;padding-top:48px;background:url('./images/common/logo.png') no-repeat 0 0;font:0/0 dotum;color:transparent}
.nvalinks {position:absolute;top:19px;right:10px}
.nvalinks a {float:left;height:40px;padding-left:13px;background:url('./images/main/bg_dot.png') no-repeat 6px center;font-size:13px;line-height:40px;letter-spacing:-0.05em;color:#fff}
.nvalinks a:first-child {padding-left:0;background:none}
.nvalinks a:hover {text-decoration:underline}
a.nvalinks-rev {margin-left:14px;padding:0 18px;background:none;border:1px solid #fff;-webkit-border-radius:3px;border-radius:3px;font-size:16px;letter-spacing:-0.03em;line-height:38px;-webkit-transition-duration:0.2s;transition-duration:0.2s}
a.nvalinks-rev:hover {background:#f1c40f;border:1px solid #f1c40f;text-decoration:none}
.navigation {overflow:hidden;height:80px;padding-left:197px}
.navigation li {float:left;text-align:center}
.navigation li a {display:block;margin:0 27px;height:80px;line-height:78px;font-size:18px;letter-spacing:-0.03em;color:#fff}
.navi-sublist {display:none;z-index:9000;position:absolute;padding-top:19px}
.navi-sublist.on {display:block}
.navi-sublist li {float:none;text-align:left}
.navi-sublist li a {display:block;width:auto;height:auto;line-height:34px;font-size:16px;color:#3c3c3c;letter-spacing:-0.03em}
.navi-sublist li a:hover {color:#f1c40f}


#header.sub .hgroup {background:#fff;border-bottom:1px solid #eee}
#header.sub .hgroup .inbox {height:79px}
#header.sub .hgroup .logo a span {background-position:0 -58px}
#header.sub .nvalinks a {background:url('./images/main/bg_dot02.png') no-repeat 6px center;color:#636363}
#header.sub .nvalinks a:first-child {padding-left:0;background:none}
#header.sub .nvalinks a:hover {color:#171717}
#header.sub a.nvalinks-rev {background:none;border:1px solid #f1c40f;color:#f1c40f}
#header.sub a.nvalinks-rev:hover {background:#f1c40f;color:#fff}
#header.sub .navigation li a {color:#171717}
#header.sub .navi-sublist li a:hover {color:#f1c40f}
.nav-sub-wrap {overflow:hidden;height:0;z-index:5555;position:absolute;top:0;left:0;width:100%;padding-top:80px;-webkit-transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
-moz-transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
-o-transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1)}
.nav-sub-wrap.on {height:222px;background:#fff;border-bottom:1px solid #e2e2e2}

/*ž�޴�*/
#topMenu { 
height: 40px; 
width: 800px; 
float : left;
margin-left :190px;
margin-top: 25px;
min-width: 500px;
min-height: 40px;
color: black;
} 
#topMenu ul { 
list-style-type: none;
margin: 0px; 
padding: 0px;
}
#topMenu ul li {
background-color: white;
float: left; 
line-height: 20px;
vertical-align: middle;
text-align: center;
position: relative;
margin-left: 30p%;
font-size: 15px;
}
.menuLink, .submenuLink {
text-decoration:none;
display: block;
width: 200px;
color : black;
font-size: 15px;
font-weight: bold;
font-family: "Trebuchet MS", Dotum;
}
.menuLink {
color: black; 
font-size: 1.2em;} 

.topMenuLi:hover .menuLink {
color: white;
background-color: #f1c40f;
} 
.submenuLink {
color: #f1c40f;
background-color: white;
} 
/* �� �� �� �޴� ��Ÿ�� ���� */
.longLink {  width: 200px;} 
.submenu {
position: absolute;
height: 0px;
overflow: hidden;
transition: height .2s; /* height�� ��ȭ ������ �� 0.2�ʰ� ��ȭ �ǵ��� ����(�⺻) */ 
-webkit-transition: height .2s; /* (������ ũ��/���ĸ�) */ 
-moz-transition: height .2s; /* (������ ���̾�����) */ 
-o-transition: height .2s; /* (������ �����) */ 
} 
#topMenu:hover .topMenuLi:hover .submenu {height: 100px;}  		/* �� �޴��� �����޴� �ϳ���*/ 
/* #topMenu:hover .topMenuLi .submenu {height: 180px;}		/*�޴� ��ü ��Ӵٿ� 	��� ��ü ��Ӵٿ��� ���..*/ 
.submenu {background:white;}
.submenuLink:hover {
color: white;
background-color: #f1c40f;
} 

</style>
<%-- header include --%><jsp:include page="header.jsp" />

<link type="text/css" rel="stylesheet" media="all" href="css/common.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/master.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/calendar.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/service.css" />
<link type="text/css" rel="stylesheet" href="/js/lib/magnific-popup.css"/>



<!-- <link type="text/css" rel="stylesheet" media="all" -->
<!-- 	href="./css/master.css" /> -->

<title>��ݾȳ� &lt; ����ī �Ұ�</title>

</head>

<body>


	<!-- Begin #wrap -->

	<div id="wrap">

		<!-- [e]top_banner -->






		<!-- Begin #container -->

		<div id="container">

			<div class="content-wrap">

				<div class="sidebar">
					<!-- ���� �޴� -->



					<h2 class="left-tit">����ī �Ұ�</h2>

					<ul class="leftMenu">

						<li class="top"><a href="#" ><span>����ī��?</span></a></li>

						<li><a href="#" class = 'on' ><span>�̿�ȳ�</span></a></li>

						<li><a href="#"><span>��ݾȳ�</span></a></li>

						<li><a href="#"><span>ã�ƿ��ô±�</span></a></li>

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

				<div class="location">
					<div class="location_in">
						<p><span>���� �ȳ�</span>&gt; <strong>�̿�ȳ�</strong></p>
					</div>
				</div>
				<div class="subtop-content bg_subvisual_01_02">
					<h3 class="subtit">�̿�ȳ�</h3>
					<p class="subtxt"><strong>���Ժ��� �������� �����ϰ� �̿� �� �� �ִ� ����ī</strong><br />�ո����� �ڵ�����Ȱ�� ����! ����ī �̿����� �˷��帳�ϴ�.</p>
				</div>
				<div class="bodystart">
<!-- bodystart -->
			
				<p class="member-subtxt"><strong>���������� Pride! �������� ��Ƽ��!</strong><br />���� ����ڸ� ���� ���, ��Ƽ�� ��õ�� �⺻�Դϴ�.</p>
				<h4 class="stit01">�������� ��Ƽ��</h4>
				<ul class="etiquette-wrap">
					<li class="etiquette01">
						<div class="bg-wrap">
							<div class="txt">
								<p class="point-color02">�������� ����</p>
								<p>��� �� �������� ���� ����  �ܰ��� ���ο� ��������� �ִ��� �� �����ּ���.</p>
								<p>���� �� ��� ���ų� ���ǻ����� ������ ����� �ٷ� ���� ��Ź �帳�ϴ�.</p>
							</div>
						</div>
					</li>
					<li class="etiquette02">
						<div class="bg-wrap">
							<div class="txt">
								<p class="point-color02">������ ����� �ּ���</p>
								<p>��� �� ���μ���ǰ�� �� ì���ֽð� ������� ��� ����ּ���. </p>
							</div>
						</div>
					</li>
					<li class="etiquette03">
						<div class="bg-wrap">
							<div class="txt">
								<p class="point-color02">�ݿ�</p>
								<p>����ī�� ��� ������ ����  ��������Ǿ� �ֽ��ϴ�. </p>
								<p>���������� �ݵ�� �ݿ� ��Ź�帳�ϴ�.</p>
								<p>�� �� �г�Ƽ 30���� �ΰ��Ǹ� ȸ�� �ڰ��� ���������� ��Ż�˴ϴ�.</p>
							</div>
						</div>
					</li>
					<li class="etiquette04">
						<div class="bg-wrap">
							<div class="txt">
								<p class="point-color02">���������ʼ�</p>
								<p>�⸧�� �׻� ��� �� ������  �ֽð� ������ �ʿ��Ͻø� <br />���� �� ��ġ�� ����ī�带 ����� �ּ���. </p>
								<p>����ī��� ����ī�� �δ��ϴ� ī���Դϴ�.</p>
							</div>
						</div>
					</li>
					<li class="etiquette05">
						<div class="bg-wrap">
							<div class="txt">
								<p class="point-color02">�����ݳ��ð� �ؼ�</p>
								<p>�����ݳ� �г�Ƽ�� �ּ� 3�������� �����մϴ�. </p>
								<p>���� ���� ������ ���� ��� ������ �Ұ��� �մϴ�. </p>
							</div>
						</div>
					</li>
					<li class="etiquette06 line-none">
						<div class="bg-wrap">
							<div class="txt">
								<p class="point-color02">�ֿϵ����� ĳ����ȿ� </p>
								<p>����ϴ� �ֿϵ����� �ݵ�� ĳ��� �־� ž�º�Ź �帳�ϴ�. </p>
							</div>
						</div>
					</li>
				</ul>

<!-- // bodyend -->
				</div>

			</div> <!-- // end contentBox -->
			
		</div>
		
	</div>
		<div id="footer">

			<div class="footer_box01">

				<div class="footer_inner">

					<ul class="footer_family">

						<li><a
							href="https://www.lotterentacar.net/kor/info/sinchajangCall.do?mnCd=MK0501"
							target="_blank">��ⷻ��ī</a></li>

						<li><a
							href="https://www.lotterentacar.net/kor/short/shortSubmain.do"
							target="_blank">�ܱⷻ��ī</a></li>

						<li><a
							href="https://www.lotterentacar.net/kor/long/usedList.do"
							target="_blank">�߰�������ī</a></li>

						<li><a
							href="https://www.lotteautoauction.net/sell/sellMyCar/greenCarSellMyCar.do"
							target="_blank">�����ȱ�</a></li>

						<li><a href="https://www.lpoint.com/" target="_blank">L.POINT</a></li>

					</ul>

					<ul class="footer_partner">

						<li><a
							href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D01&seoul=Y"><img
								src="./images/common/img_partner_seoul.gif" alt="�������� ����ī �����ϱ�" /></a></li>

						<li><a
							href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D03"><img
								src="./images/common/img_partner_suwon.gif"
								alt="�޸ս�Ƽ ���� ����ī �����ϱ�" /></a></li>

						<li><a
							href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D02"><img
								src="./images/common/img_partner_incheon.gif"
								alt="��õ������ ����ī �����ϱ�" /></a></li>

					</ul>

				</div>

			</div>

			<div class="footer_box02">

				<div class="footer_inner">

					<ul class="footer_sns">

						<li><a class="facebook"
							href="https://www.facebook.com/greencarkorea" target="_blank">����ī
								���̽���</a></li>

						<li><a class="blog" href="http://blog.naver.com/greencar_co"
							target="_blank">����ī ��α�</a></li>

						<li><a class="instagram"
							href="https://www.instagram.com/greencar_kr/" target="_blank">����ī
								�ν�Ÿ�׷�</a></li>

					</ul>

					<ul class="footer_links">

						<li><a href="http://www.greencar.co.kr/service/company/">ȸ��Ұ�</a></li>

						<li><a href="http://www.greencar.co.kr/alliance/">���޽�û</a></li>

						<li><a href="http://www.greencar.co.kr/service/useclause/">ȸ���̿���</a></li>

						<li><a href="http://www.greencar.co.kr/service/personalinfo/"
							class="point">��������ó����ħ</a></li>

						<li><a href="http://www.greencar.co.kr/service/carclause/">�ڵ����뿩
								ǥ�ؾ��</a></li>

						<li><a href="http://www.greencar.co.kr/service/location/">��ġ���
								���� �̿���</a></li>

						<li><a href="http://www.greencar.co.kr/service/sitemap/">����Ʈ��</a></li>

					</ul>

					<div class="footer_info">

						<div class="info">

							<span>(��) ����ī</span> <span>����ڵ�Ϲ�ȣ : 220-87-91595</span> <span>����Ǹž��Ű��ȣ
								: ��2011-���ﰭ��-01456ȣ</span> <span>��ǥ�̻� : �ȾƸ�</span>

						</div>

						<div class="addr">

							<span>����Ư���� ������ ������� 14�� 6 (�������� 4��)</span> <span>TEL :
								010-9550-0167</span> <span>FAX : 02-9550-0167</span>

						</div>

						<span class="copy">Copyright &#169; 2018 LazenCar. All
							Rights Reserved.</span>

					</div>

					<div class="footer_emblem">

						<img src="./images/common/img_emblem_brandpower.jpg"
							alt="2016�� �ѱ������ �귣���Ŀ� 1��" /> <img
							src="./images/common/img_emblem_brandstar.jpg"
							alt="2016�� ���ѹα� �귣�彺Ÿ" /> <img
							src="./images/common/img_emblem_award.jpg" alt="����� ����� �ڸ��� 2016" />

						<img src="./images/common/img_emblem_kspbi.jpg" alt="KS PBI" />

					</div>

				</div>

			</div>

		</div>

		<!-- // End #footer -->

	</div>

	<!-- // End #wrap -->



</body>

</html>


