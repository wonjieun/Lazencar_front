<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta charset="UTF-8">

<title>Lazencar | ������ �ִ� ��ǰ�� ī�ξ</title>

<%-- header include --%><jsp:include page="header.jsp" />

<script type="text/javascript" src="./js/lib/jquery-1.9.1.js"></script>

<link type="text/css" rel="stylesheet" media="all" href="/Page/css/main.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/common.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/master.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/calendar.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/calendar.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/calendar.css" />
<link type="text/css" rel="stylesheet" media="all" href="css/calendar.css" />

<style type="text/css">
@charset "UTF-8";

.question-wrap dl .bul_q span{
	padding-left:35px;
	background:url("./images/board/icon_q_off.png") 0 50% no-repeat;
}
.question-wrap .bul_a {
	padding-left:35px;
	background:url("./images/board/icon_a.png") 0 0 no-repeat;
	min-height:23px;
	height:auto !important;
	height:23px;
}
.question-wrap .bul_a * {font-family:'NanumGothic','�������','Malgun Gothic','MGothic', sans-serif,"����",Dotum,"����",Gulim !important;font-size:14px !important}
.question-wrap .answer {
	padding:25px 20px;
	background-color:#f6f6f6;
	border-bottom:1px solid #e2e2e2;
}
.question-wrap dl.on,
.question-wrap dl.on a {
	color:#f1c40f;
}

/* ����ã������ ���Խ��� */
.question-list {
	position:relative;
	border-bottom:1px solid #e6e6e6;
}
.question-list a {
	display:block;
	color:#888888;
	padding:12px 60px;
	background:url("./images/board/icon_q_off.png") 20px 50% no-repeat;
}
.question-wrap li .question-list.on a {
	color:#0db14b;
	background:url("./images/board/icon_q.png") 20px 50% no-repeat;
}
.question-wrap .question-list .btn {
	position:absolute;
	right:20px;
	top:20px;
}

.selstyle {
	font-size:13px;
	height:30px;
	padding:5px 8px;
	vertical-align:top;
	border:1px solid #dbd6d4;
}


/* ����¡ */
.paging {margin-top:20px; text-align:center;}
.paging a {
	display:inline-block; 
	color:#3c3c3c; 
	width:26px; 
	height:26px;
	line-height:25px;
}
.paging a:hover {color:#fff; background-color:#f1c40f;}
.paging strong {
	display:inline-block;
	width:26px; 
	height:26px;
	line-height:25px;
	color:#fff; 
	background-color:#f1c40f;
}
.paging img {vertical-align:-9px;}
.paging .page_first:hover,
.paging .page_end:hover {background-color:#fff;}
.paging .page_prev {margin:0 10px 0 -4px;}
.paging .page_next {margin:0 -4px 0 10px;}

.paging .page_prev01 {margin:0 4px 0 0;}
.paging .page_next01 {margin:0 0 0 4px;}

</style>

</head>

<body>

	<!-- Begin #wrap -->

	<div id="wrap">

		<!-- Begin #container -->

		<div id="container">

			<div class="content-wrap">

				<div class="sidebar">
					<!-- ���� �޴� -->



					<h2 class="left-tit">������</h2>

					<ul class="leftMenu">

						<li class="top"><a href="#"><span>1 : 1 ����</span></a></li>

						<li><a href="#"><span>����ã������</span></a></li>

						<li><a href="#" class = 'on'><span>��������</span></a></li>

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
					<!-- contentbox�� ���� -->

        <div class="location">
          <div class="location_in">
            <p><span>������</span>&gt; <strong>����ã������</strong></p>
          </div>
        </div>
        <div class="subtop-content bg_subvisual_02_01">
          <h3 class="subtit">���� ã�� ����</h3>
          <p class="subtxt"><strong>����ī�� �ñ��ϼ���? ����ã�� ������ �̿��ϼ���.</strong><br />������ �ñ��Ͻ� ������ ������ ��Ȯ�ϰ� �ذ��Ͻ� �� �ֽ��ϴ�.</p>
        </div>


		<div class="bodystart">

			<!-- bodystart 	=========================================������ ���氡�� ����!!================================================  -->

					<ul class="question-tab">
						
		<li ><a href="./help_Faq.jsp">BEST 10<!-- (137) --></a></li>
					
							<li ><a href="./help_Faq2.jsp">����/���<!-- (11) --></a></li>
						
							<li ><a href="./help_Faq3.jsp">����/����Ʈ<!-- (16) --></a></li>
						
							<li ><a href="./help_Faq4.jsp">���/����<!-- (23) --></a></li>

							<li class='on last-tab' ><a href="./help_Faq5.jsp">���/�ݳ�<!-- (7) --></a></li>
						
					</ul>
					<script type="text/javascript">
						$(".question-tab li:nth-child(5)").addClass("list-ling01");
						$(".question-tab li:nth-child(6)").addClass("list-ling02");
					</script>

						<script>
						
						    for(var i = 0; i<8; i++) {
							function SirenFunction(i) {
								var objDiv = document.getElementById(i);
								if (objDiv.style.display == "block") {
									objDiv.style.display = "none";
								} else {
									objDiv.style.display = "block";
								}
							  }
						    }
						    
						</script>

						<ul class="question-wrap">
									
							<li>
								<p class="question-list">
									<a href="#" onclick= "SirenFunction('1'); return false;" class="blind_view"> ���� ����� �Ұ����մϴ� </a> 
							</p>
								<div class="answer" style="display:none;" id= "1">
									<p>���� ���� ����� �Ұ����ϴٸ� �ϱ� �ȳ� ������ ���� ��Ź�帳�ϴ�.</p><p>&nbsp;</p><p>&nbsp;</p><p><strong></strong></p><p><strong>1. �������� ������� üũ</strong><br> -&nbsp; �� 21�� �̻� + ���� ��� �� 1�� ���� ȸ������/����� �����մϴ�.</p><p>&nbsp;</p><p><strong>2. �������� ���� �Է� �õ�</strong><br>&nbsp;-&nbsp; ���� �Կ��� ���� �������� ��� ��, �ؽ�Ʈ�� �Ϻ��ϰ� �νĵ��� �ʾ�<br>&nbsp;&nbsp;&nbsp; �������� ����ġ�� ���� ��ϵ��� �ʾ��� �� �ֽ��ϴ�.</p><p>&nbsp;</p><p><strong>3. ���� �������� Ȯ�� �ʿ�</strong><br>&nbsp;-&nbsp; ���� ����/��� �� ����� ���ο� ���� ����� ����� �� �ֽ��ϴ�.<br>&nbsp;&nbsp;&nbsp; ����, ���Ҵ� �� �ߴ� ���� ���� ���� ��� �� �� ��� �� 1�� ��� ��<br>&nbsp;&nbsp;&nbsp; ���� �� �������� ������ �����ϸ� �̿� ��� �Ұ� ��Ȳ �߻� ��<br>&nbsp;&nbsp;&nbsp; �����������(����� ��������), ������������ �ϱ� ���Ϸ� �����Ͻ� �� <br>&nbsp;&nbsp;&nbsp; �����ͷ� �����ֽø� ���� ���� �� ���� ���� ��� ó���� ���� �帮�� �ֽ��ϴ�.</p><p>&nbsp;-&nbsp; �̸��� : greencar@greencar.co.kr <br>&nbsp;-&nbsp; ������ : 080-2000-3000<br>&nbsp;&nbsp;&nbsp; (�������� ���� �߼� �� �ֹι�ȣ �� 6�ڸ��� ����ŷ ó�� �� �ּ���)</p><p>&nbsp;</p><p><strong>4. ���� ���� ���� Ȯ�ο�û</strong><br>&nbsp;-&nbsp; ���� �׸�ī OR ������Ʈ ���� ȸ�� �����̷��� ������ ���<br>&nbsp;&nbsp;&nbsp; ���� ���� ��ȣ�� ����/���� ������ �Ұ����մϴ�.<br>&nbsp;&nbsp;&nbsp; ���� ������ Ȯ���Ͻþ� Ż�� OR ���� �� ����� �����մϴ�</p><p>&nbsp;</p><p>&nbsp;-&nbsp; �� ���� ���� Ȯ���ϱ�<br>&nbsp;&nbsp; https://<a href="http://www.greencar.co.kr/customer/license/openLicenseChkPage.do">www.greencar.co.kr/customer/license/openLicenseChkPage.do</a>&nbsp;</p>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#" onclick= "SirenFunction('2'); return false;" class="blind_view"> ��� ���� ��� �ϳ���? </a>
								</p>
								<div class="answer" style="display:none;" id= "2">
									<div class="bul_a"><p>��� �߻� ��� ������(080-2000-3000)�� ������ �ʿ��մϴ�.</p><p>&nbsp;</p><p>������ȣ �� ��Ÿ �ļյ� �ü��� �ִٸ�</p><p>������ ����ó�� Ȯ�� �� �ֽð� ��� ������ �ʼ� Ȯ����&nbsp;</p><p>�ʿ��ϹǷ� �ϱ� ��θ� ���� ��� ��Ź �帳�ϴ�.</p><p>&nbsp;</p><p><strong>* APP &gt; ������ &nbsp;&gt; ������� ���� &gt; ������� ����, �ϱ� �������</strong></p><p><strong>&nbsp;- ����Ͻ�&nbsp;</strong></p><p><strong>&nbsp;- ������&nbsp;</strong></p><p><strong>&nbsp;- ������</strong></p><p>&nbsp;</p><p>&nbsp;</p><p>��� �߻� �� ��� ��� ó���� �Ϸ�� �� ����&nbsp;</p><p>ȸ�� �ڰ��� �Ͻ� �����Ǹ�, ó���� �Ϸ�� �Ŀ� �ٽ� ȸ������&nbsp;</p><p>�̿��� �����մϴ�.</p><p>&nbsp;</p><p>���� ��� �߻� �� ������ ��������&nbsp;</p><p>����� �����Ͻðų� ������ ���� �ð� ��� ��&nbsp;</p><p>�����Ͻô� ��� ��å���� �� ���濡 ����&nbsp;</p><p>���������� ����� �� ������ ����� �ֽñ� �ٶ��ϴ�.&nbsp;</p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#" onclick= "SirenFunction('3'); return false;" class="blind_view"> ���� ������ ��� �ϳ���? </a>
								</p>
								<div class="answer" style="display:none;" id= "3">
									<div class="bul_a"><p>'����ī��� ������ �뽬���� ���ʿ� ��ġ�ϰ� �ֽ��ϴ�.</p><p>&nbsp;</p><p>����ī�� ��� �Ŀ��� �ݵ��&nbsp;</p><p>���� ��ġ�� �����Ͽ� �ֽñ� �ٶ�� �н�/�ļ� �� ������</p><p>�г�Ƽ�� �ΰ��� �� �ִ� �� ���� ��Ź�帳�ϴ�.</p><p>&nbsp;</p><p><strong>�ݵ�� ȸ�翡�� ������ ������&nbsp;</strong></p><p><strong>��ġ�� ����ī�带 ���� �����Ǿ�� �ϸ�&nbsp;</strong></p><p><strong>�ٸ� ������ ����, ��Ÿ ����� ���� �� �� �����ϴ�.</strong></p><p>&nbsp;</p><p><u><span style="color: rgb(255, 108, 0);"><u>���� �����ͷ� ���� ���� ����&nbsp;</u></span></u></p><p><u><span style="color: rgb(255, 108, 0);"><u>ȸ�� ī��/�������� ������ ������� ȯ�ҵ��� �ʽ��ϴ�.</u></span></u><span style="color: rgb(255, 108, 0);">&nbsp;</span></p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#" onclick= "SirenFunction('4'); return false;" class="blind_view"> ���� ����� �Ұ����մϴ� </a>
								</p>
								<div class="answer" style="display:none;" id= "4">
									<div class="bul_a"><p>�պ����� �����Ͻ� ��� </p><p>�뿩�Ͻ� �׸������� �ݳ����ּž� �մϴ�. </p><p>(�׸���/������ �� ���� ����)</p><p>&nbsp;</p><p>�� ������ �Ҽӵ� �׸���(������)��&nbsp;</p><p>������ȣ ����Ͽ� ���� ������ ������ �׸����� �ƴ� ���,&nbsp;</p><p>�Ϲ� �������� ���ֵǾ� ������ �߻��˴ϴ�.</p><p>&nbsp;</p><p>�̷� ���� ��� �߻�(���� �̵�, ����)��&nbsp;</p><p>�г�Ƽ(������, ���κ��)�� ���� û���ǿ��� ���� ��Ź �帳�ϴ�.&nbsp;</p><p>&nbsp;</p><p><u>�ε����� ��Ȳ���� ������ �׸����� �ݳ��� �Ұ��� ���<br>������(080-2000-3000)���� �����Ͻþ� ��� ��Ź�帮��<br>�����Ͻ� ��ġ�� �׸���ۿ� �����Ͻþ� ���� ����ڰ� <br>���� ��ġ�� Ȯ���ϴµ� ȥ���� ������ ��� ��Ź�帳�ϴ�.</u></p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#" onclick= "SirenFunction('5'); return false;" class="blind_view"> ���� ����� �Ұ����մϴ� </a>
								</p>
								<div class="answer" style="display:none;" id= "5">
									<div class="bul_a"><p>���� ����� ������� ��� ���� ���¿���&nbsp;</p><p>�ݳ� �ð� �������� ���� ���� ������� ���ذ� �߻��� ���&nbsp;</p><p>���� �Ǵ� 30,000���� �߰� �̿�ᰡ ���� �� �� �ֽ��ϴ�.&nbsp;</p><p>&nbsp;</p><p>���� ��� ���� �ڵ�����&nbsp;</p><p>�ٸ� ȸ���� ��� ������ ���� ��� ���� ��� ��û�� �����ϸ�&nbsp;</p><p>��� ���� �ð����� ���� 10�� ������ ����˴ϴ�.&nbsp;</p><p>&nbsp;</p><p>���� �뺸 ���� �ݳ� �ð� ������ ���� �ʰ�&nbsp;</p><p>�̿��� �ϴ� ��� ȸ�簡 ���Ƿ� �ݳ� �ð��� �����Ͽ� �����&nbsp;</p><p>û�� �� �� �ֽ��ϴ�.</p><p>&nbsp;</p><p>&nbsp;</p><p>ī�ξ���� ���� �ݳ��� �ݵ�� ���Ѿ� �� �߿��� ��Ģ �Դϴ�.</p><p>&nbsp;</p><p>�ݳ� ���� �� ���� ���� ȸ����&nbsp;</p><p>���� ����� ��ư� �Ǹ� �̷��� ���÷��ο� ���� ������</p><p>�׸�ī���� ��� ���Ǹ� �����Ͽ��� �մϴ�.</p><p>&nbsp;</p><p>�� �������� ���� ����, �ý� ���� ��ۼ��� ���� �����&nbsp;</p><p>�߻��ϰ� �Ǹ� ȸ�� ���� ������ ���� ������ �ƴ� ���� ȸ������&nbsp;</p><p>���� ������ ���� �ȳ��帳�ϴ�.</p><p>&nbsp;</p><p>�̷��� ���� ��Ȳ�� ���ϱ� ����&nbsp;</p><p>�ϱ� ������ �����Ͻþ� �̿� ��Ź �帳�ϴ�.</p><p>&nbsp;</p><p>1. ���� ���� �� ����ð��� ����Ͽ� ����� �ð����� ����&nbsp;</p><p>&nbsp; &nbsp; �����ð��� ��Ÿ �δ�ð���&nbsp;</p><p>&nbsp; &nbsp; ��� �����ؼ� 30��~1�ð� �����Ӱ� �����Ͻñ⸦ ��õ �մϴ�.</p><p>&nbsp;</p><p>2. ���ÿ� ���������� ���</p><p>&nbsp; &nbsp; ������ Ư���� ���� ���� ��ġ Ȯ�� �ð��� �ҿ� �� �� ������</p><p>&nbsp; &nbsp; ���/���� ���� �ð��� �ٸ� �� �ֱ� ������ ����� �ð���&nbsp;</p><p>&nbsp; &nbsp; �δ� ���� �����մϴ�.&nbsp;</p><p>&nbsp;</p><p>���� ���� �߿� ���� ���� �ð�����&nbsp;</p><p>�ݳ� �Ұ��� �� ����Ʈ������ ������ �����Ͻðų�&nbsp;</p><p>������(080-2000-3000)�� ���� ���� �ð��� ���� �� �ּ���.&nbsp;</p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#" onclick= "SirenFunction('6'); return false;" class="blind_view"> ���� ����� �Ұ����մϴ� </a>
								</p>
								<div class="answer" style="display:none;" id= "6">
									<div class="bul_a"><p><strong>1. �׸��� �ݳ� ��ġ�� ���� ����</strong></p><p><strong><br></strong></p><p><strong>2. �õ� OFF (�̵�/ �ǳ���/ â�� / ����� ����Ȯ��)</strong>&nbsp;</p><p>�� �̵�,�ǳ��� ON ���·� ���͸� ���� / â���� ���� ��&nbsp;</p><p>&nbsp; &nbsp; ���ԵǾ� ���� �ʿ� �� �г�Ƽ �ݾ� �߰� �˴ϴ�.&nbsp;</p><p>�� �������� ��� �������� ��ġ�Ǿ� �ִ� �ϼ� �����⸦</p><p>&nbsp; &nbsp; �������ּž� ���� �ݳ��� ���� �մϴ�.</p><p>&nbsp;</p><p><strong>3. ���ο�ǰ �� ������ ����</strong></p><p><strong><br></strong></p><p>4. ���� ���� �� ���� �ۿ��� ȸ��ī�� �Ǵ�&nbsp;</p><p>&nbsp; &nbsp; APP ����ƮŰ(�ݳ��ϱ�)�� �̿��Ͽ� ���ó��</p><p>&nbsp;</p><p>5. �ݳ�ó�� �� 1~2�� ���� �ݳ�ó�� �Ϸ� ���� ���Ż��� Ȯ��</p><p>&nbsp;</p><p>�� ���� �� �Ѱ����� ó������ �ʾ�&nbsp;</p><p>�ݳ��� �����Ǵ� ��� �ݳ����� ���ڰ� �߼۵Ǹ� �ȳ��� ����&nbsp;</p><p>�ٽ� �ѹ� �ݳ�ó���� �� �ֽø� �˴ϴ�.&nbsp;</p><p>&nbsp;</p><p>�ݳ����� �� �뿩���+�г�Ƽ��&nbsp;</p><p>�߰��� �߻��ǿ��� �����߻� ��� �����ͷ� �����ֽñ� �ٶ��ϴ�. &nbsp;</p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#" onclick= "SirenFunction('7'); return false;" class="blind_view"> ���� ����� �Ұ����մϴ� </a>
								</p>
								<div class="answer" style="display:none;" id= "7">
									<div class="bul_a"><p>�׸�ī�� ���������� ������������ ���ԵǾ� ������&nbsp;</p><p>2016�� 7�� �����å ���� ����� �Բ� </p><p>ȸ���Բ��� ���� �� ������ ��å�� 30/70������ ���� </p><p>����Ḧ ���� �ΰ��Ͽ� �����մϴ�.</p><p>&nbsp;</p><p><strong>���� ���� ��å������?</strong></p><p>���� ���� �׼��� ������� ���Ǵ� ���������� 30����/70����</p><p>(���� �ܰ迡�� �ڱ� �δ�ݾ� ����)�� ���� ��</p><p>���� ���ؿ� ���� å���� ���� �κ� ��ȣ���� �� �ִ� ���� �Դϴ�.</p><p>&nbsp;</p><p><strong>���� ���� ��å ���� ���� ��Ȳ��?</strong></p><p>1) ����� �� ���ݿ�����(���� �� ���)�� �ƴ� ��3����&nbsp;</p><p>&nbsp; &nbsp; �������� �߻��� ���(���ݿ����� �ܵ����� ����)</p><p>2) ��� �߻� �̽Ű�, �����Ű�, ������ �ļ� ������ ���</p><p>3) ����/�ҹ� �๰ ���� ��&nbsp;</p><p>4) 1�� ���� �̻��� ���� ������ �ܿ� ���� ��������&nbsp;</p><p>5) ��� �߻� ��� �̽Ű�</p><p>&nbsp;</p><p><u>���� ���� ��Ȳ�� ��� ���� ��å������&nbsp;</u></p><p><u>���� ������ �� ������ �Ǽ����� ���� ���� ������ ����, </u></p><p><u>������ġ �� ���� �̿����� ��ġ�� �̷�� ���ϴ�.</u></p><p>&nbsp;</p><p>* ���� ��å������ ���� ���&nbsp;</p><p>&nbsp; &nbsp;�� ȿ���� �����ϸ� ȯ�� �� ��ȯ���� �ʽ��ϴ�.&nbsp;</p><p>* ���� ��å������ ���� ������ å�� �ѵ��� ���谡 �����ϴ�.</p><p>* ���س� �繰���� �ս��� ������ ��� �ѵ��� �ʰ� ���� ���</p><p>&nbsp; &nbsp;ȸ���� �ʰ��п� ���Ͽ� ������ å���� ������ ����&nbsp;</p><p>&nbsp; &nbsp;����糪 ����� ������ �����Ͽ� ó�� �� �� �ֽ��ϴ�.&nbsp;</p></div>
								</div>
							</li>
						
							<li>
								<p class="question-list">
									<a href="#" onclick= "SirenFunction('8'); return false;" class="blind_view"> ���� ����� �Ұ����մϴ� </a>
								</p>
								<div class="answer" style="display:none;" id= "8">
									<div class="bul_a">����ī�� ����� �Ұ����� ��� �ϱ� ������ Ȯ�� ��Ź�帮��<div>������ ���� ��� ������(080-2000-3000)����&nbsp;</div><div>�����ֽø� ������ Ȯ���Ͽ� ����帱 �� �ֵ��� �ϰڽ��ϴ�.</div><div><br></div><div>* ����/�н�ī�� ���� Ȯ��</div><div>* �ѵ�/�ܰ���� ���� Ȯ��</div><div>* �ٸ� ī��� ��� �õ� �� �������� �߻�����</div><div><br></div><div>2014�� 11�� 26�� ����&nbsp;</div><div>�������� ��ȭ�� ���� ���� �� ���� ������ �����ϰ� �ֽ��ϴ�.</div><div>&nbsp;</div><div>2016�� 11�� ���� ���ǵ��� ������ ���� �����ڿ�</div><div>������ ���Ƿ� �� ���� ī��(�ſ�/üũ)�� ����� �����մϴ�.</div><div><br></div><div>- ������ ����� Ÿ�� ���� ī��� ��밡��</div><div>- ����ȸ���� ����� ī�� ��ϰ��� (������ ����� ��Ϲ�ȣ ����)</div><div><br></div><div>���ŷο�ð����� ȸ������&nbsp;</div><div>�ڻ�� ������ ��ȣ�ϱ� �����̴� ���� ��Ź�帳�ϴ�.&nbsp;</div><div><br></div><div>����ī�� ����� ���̽� �������� �����ϴ�&nbsp;</div><div>������ ���� �ý������� ��ǰ� ������ �ִ� 7������&nbsp;</div><div>��� �����մϴ�.</div><div><br></div><div>- ī���ȣ&nbsp;</div><div>- ��ȿ�Ⱓ&nbsp;</div><div>- ī�� �������� �ֹι�ȣ �� 7�ڸ�(���� �������+����)</div><div><br></div>���� ���� ���� �̷� �� ���������� ����� �����մϴ�.</div>
								</div>
							</li>		
					</ul>
			</div>		<!-- // end contentBox -->

		</div>	<!-- // End #content-wrap -->

	</div>	<!-- // End #container -->

<%-- footer include --%><jsp:include page="footer.jsp" />

	</div>
	
	</div>

	<!-- // End #wrap -->



</body>

</html>


