<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�����ޱ�</title>

<link type="text/css" rel="stylesheet" href="/Page/css/main.css" >
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/common.css?v=201802">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/master.css?v=180322">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/calendar.css">
<script type="text/javascript"	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">

function alertMsg(){
	alert("������ �޾ҽ��ϴ�");
}


// 	$(document).ready(function(){
// 		$("#down1").onclick(function(){
// 			alert("������ �޾ҽ��ϴ�");
// 		});
		
// 		$("#down2").onclick(function(){
// 			alert("������ �޾ҽ��ϴ�");
// 		});
		
// 		$("#down3").onclick(function(){
// 			alert("������ �޾ҽ��ϴ�");
// 		});
		
// 	});	
</script>
</head>
<body>
<div id="wrap">
<!-- Begin #header -->
<div id="header" class="sub">
	<div class="hgroup">
		<div class="inbox">
			<h1 class="logo"><a href="/main.do"><span>����ī</span></a></h1>

			<div class="nvalinks">
				<a href="/login/login.do">�α���</a>
				<a href="/signUp.do">ȸ������</a>
				<a class="nvalinks-rev" href="#">����ī ����</a>
			</div>
			
			<nav id="topMenu">
			<ul>
				<li class="topMenuLi">
				<a href="#" class="menuLink">Lazencar �Ұ�</a>
					<ul class="submenu">
						<li><a href="#" class="submenuLink longLink">Lazencar��?</a></li>
						<li><a href="#" class="submenuLink longLink">�̿�ȳ�</a></li>
						<li><a href="#" class="submenuLink longLink">��ݾȳ�</a></li>
						<li><a href="#" class="submenuLink longLink">��ġ</a></li>
					</ul></li>

				<li class="topMenuLi">
				<a href="#" class="menuLink">����/����</a>
					<ul class="submenu">
						<li><a href="#" class="submenuLink longLink">Ư����ǰ</a></li>
						<li><a href="#" class="submenuLink longLink">�����ޱ�</a></li>
						<li><a href="#" class="submenuLink longLink">�ı�</a></li>
					</ul></li>

				<li class="topMenuLi">
				<a href="#" class="menuLink">������</a>
					<ul class="submenu">
						<li><a href="#" class="submenuLink longLink">1:1 ����</a></li>
						<li><a href="#" class="submenuLink longLink">���� ã�� ����</a></li>
						<li><a href="/service/list.do" class="submenuLink longLink">��������</a></li>
					</ul></li>
			</ul>
			</nav>
		</div>
	</div>
</div>
<!-- // End #header -->



<!-- Begin #container -->
<div id="container">
<div class="content-wrap">

<div class="sidebar">
	<h2 class="left-tit">���� / ����</h2>
	<ul class="leftMenu">
		<li class="top"><a href="#"><span>Ư����ǰ</span></a></li>
		<li><a href="/coupon.do"><span>�����ޱ�</span></a></li>
		<li><a href="/Page/review_Board_List.do" class='on'><span>�ı�</span></a></li>
<!-- 					class = 'on'	���� �������� ��Ÿ���� on ����ϴ� �� -->
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
    <p><span>���� / ����</span>&gt; <strong>�����ޱ�</strong></p>
  </div>
</div>
<div class="subtop-content bg_subvisual_02_01">
  <h3 class="subtit">�����ޱ�</h3>
  <p class="subtxt">
  <strong>����ī ȸ���̶�� ������ �ٿ���� �� �ִ� �����̾�Ƽ ���� ����~!</strong><br/>
 					�ϻ��� ����, ����ī�� ���������� ����������.</p>
</div>

<div class="bodystart">
	<div class="coupon-wrap">
		<div class="coupon-con coupon-con-gap">
			<!-- ������ -->
			<ul class="coupon-down">
				<li>
					<span><img src="/Page/images/coupon/nightcoupon_02115.png" alt="" width="335" height="140" /></span>
					<span class="eventImg-txt"><img src="/Page/images/coupon/icon_event_ing.png" alt="����" /></span>
				</li>
<!-- 			<li class="num"><span>5331</span>����</li> -->
				<!-- �ٿ�ε� ���� -->
				<li class="down"><a href="javascript:couponView('2KJdS9pt4cH7i7RarHeQlA==','8383');" onclick="alertMsg()">
				<img  src="./images/coupon/btn_down.gif" alt="�ٿ�ε�" /></a></li>
			</ul>
			<ul class="coupon-info">
				<li><span class="title"><img
						src="/Page/images/coupon/btn_coupon_name.gif" alt="������" /></span> <strong
					class="txt">�ɾ� 10�ð� 10,000��!(3/21)</strong></li>
				<li><span class="title"><img
						src="/Page/images/coupon/btn_coupon_date.gif" alt="��û�Ⱓ" /></span> <span
					class="txt">2018-03-21~2018-03-21</span></li>
				<li><span class="title"><img
						src="/Page/images/coupon/btn_coupon_use.gif" alt="�������" /></span> <span
					class="txt">���� ���/��������/�̿밡�ɽð�����</span></li>
			</ul>
		</div>	
		<div class="coupon-con">
			<!-- ������ -->
			<ul class="coupon-down">
				<li>
					<span><img src="/Page/images/coupon/coupon-03.png" alt="" width="335" height="140" /></span>
					<span class="eventImg-txt"><img src="/Page/images/coupon/icon_event_ing.png" alt="����" /></span>
				</li>
						<!-- �ٿ�ε� ���� -->
				<li class="down"><a href="javascript:couponView('86k0hhtfhz0O/7w+/IdrFg==','8372');" onclick="alertMsg()">
				<img src="./images/coupon/btn_down.gif" alt="�ٿ�ε�" /></a></li>
			</ul>
			<ul class="coupon-info">
				<li><span class="title"><img
						src="./images/coupon/btn_coupon_name.gif" alt="������" /></span> <strong
					class="txt">[���� Ʈ������ũ] ������ 60% ����!</strong></li>
				<li><span class="title"><img
						src="./images/coupon/btn_coupon_date.gif" alt="��û�Ⱓ" /></span> <span
					class="txt">2018-03-21~2018-03-21</span></li>
				<li><span class="title"><img
						src="./images/coupon/btn_coupon_use.gif" alt="�������" /></span> <span
					class="txt">���� ���/3�ð��̻�/��������</span></li>
			</ul>
		</div>
		
		<div class="coupon-con coupon-con-gap">	
			<!-- ������ -->
			<ul class="coupon-down">			
				<li>
					<span><img src="/Page/images/coupon/coupon_web7.png" alt="" width="335" height="140" /></span>
					<span class="eventImg-txt"><img src="/Page/images/coupon/icon_event_ing.png" alt="����" /></span>
				</li>
				<!-- �ٿ�ε� ���� -->
				<li class="down">
					<a href="javascript:couponView('k/2q2jlEykZVjl3LF2+wTA==','8385');" onclick="alertMsg()">
					<img src="./images/coupon/btn_down.gif" alt="�ٿ�ε�" /></a></li>
			</ul>
			
			<ul class="coupon-info">
				<li><span class="title"><img
						src="./images/coupon/btn_coupon_name.gif" alt="������" /></span> <strong
					class="txt">[50%����]��ū �ݰ�����</strong></li>
					
				<li><span class="title"><img
						src="./images/coupon/btn_coupon_date.gif" alt="��û�Ⱓ" /></span> <span
					class="txt">2018-03-19~2018-03-24</span></li>
					
				<li><span class="title"><img
						src="./images/coupon/btn_coupon_use.gif" alt="�������" /></span> <span
					class="txt">���� �ָ� ���/50�ð��̻�/�׸�������/��������/�̿밡�ɽð�����</span></li>
			</ul>
			
		</div>
	</div><!-- // End .coupon-wrap -->
</div><!-- // End .bodystart -->

</div>
</div>
</div><!-- // End #container -->


<!-- Begin #footer -->
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
						src="/Page/images/common/img_partner_seoul.gif" alt="�������� ����ī �����ϱ�" /></a></li>

				<li><a
					href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D03"><img
						src="/Page/images/common/img_partner_suwon.gif"
						alt="�޸ս�Ƽ ���� ����ī �����ϱ�" /></a></li>

				<li><a
					href="https://www.greencar.co.kr/reserve/index.do?gbn=R01&tp=D02"><img
						src="/Page/images/common/img_partner_incheon.gif"
						alt="��õ������ ����ī �����ϱ�" /></a></li>

			</ul>
		</div>
	</div>

	<div class="footer_box02">
		<div class="footer_inner">
			<ul class="footer_sns">
				<li><a class="facebook"
					href="https://www.facebook.com/greencarkorea" target="_blank">
					����ī ���̽���</a></li>
				<li><a class="blog"
					href="http://blog.naver.com/greencar_co" target="_blank">
					����ī ��α�</a></li>
				<li><a class="instagram"
					href="https://www.instagram.com/greencar_kr/" target="_blank">
					����ī �ν�Ÿ�׷�</a></li>
			</ul>

			<ul class="footer_links">
				<li><a href="http://www.greencar.co.kr/service/company/">ȸ��Ұ�</a></li>
				<li><a href="http://www.greencar.co.kr/alliance/">���޽�û</a></li>
				<li><a href="http://www.greencar.co.kr/service/useclause/">ȸ���̿���</a></li>
				<li><a href="http://www.greencar.co.kr/service/personalinfo/"
					class="point">��������ó����ħ</a></li>
				<li><a href="http://www.greencar.co.kr/service/carclause/">
					�ڵ����뿩 ǥ�ؾ��</a></li>
				<li><a href="http://www.greencar.co.kr/service/location/">
					��ġ���	���� �̿���</a></li>
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
				<img src="/Page/images/common/img_emblem_brandpower.jpg"
					alt="2016�� �ѱ������ �귣���Ŀ� 1��" /> <img
					src="/Page/images/common/img_emblem_brandstar.jpg"
					alt="2016�� ���ѹα� �귣�彺Ÿ" /> <img
					src="/Page/images/common/img_emblem_award.jpg"
					alt="����� ����� �ڸ��� 2016" /> <img
					src="/Page/images/common/img_emblem_kspbi.jpg" alt="KS PBI" />
			</div>
		</div>
	</div>
</div>
<!-- // End #footer -->
</div><!-- // End #wrap -->
</body>
</html>