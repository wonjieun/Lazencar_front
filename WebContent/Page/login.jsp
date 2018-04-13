<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>

<link type="text/css" rel="stylesheet" href="/Page/css/login.css" >
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/common.css?v=201802">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/master.css?v=180322">
<link type="text/css" rel="stylesheet" media="all" href="/Page/css/calendar.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 네이버 로그인 -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="/Page/js/naverLogin_implicit-1.0.2-min.js"></script>  
<!-- 카카오 로그인 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 구글 로그인 -->
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>

<script type="text/javascript">
//<![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('77a0e108a3b9e6e97babced59f50bbef');
// 카카오 로그인 버튼을 생성합니다.
function loginWithKakao() {
// 		    토큰꺼내기	authObj.access_token
// 		    	alert("access token : " + Kakao.Auth.getAccessToken());
 	if(Kakao.Auth.getAccessToken()==null) {
 		Kakao.Auth.loginForm({
 			success : function(authObj) {
 				console.log(JSON.stringify(authObj));
 				alert(authObj.access_token);
//  				location.href="/main.do";
 				var id = profile.getId();
     	  var pw = -1;
     	  var email = profile.getEmail();
     		var token = authObj.access_token;
     		
     		$.ajax({
     			type: "POST"
     			, url: "/login/login.do"
     			, data: {
     					memId:id,
     					memPw:pw,
     					memEmail:email
     				}
     			, dataType: "json"
     			, success: function( data ) {
     				var check = data.check;
     				token = data.token;
     				
     				if( check ) {
     					location.href="/main.do";
     				}
     			}
     			, error: function(e) {
     				console.log("----- error -----");
     				console.log(e.responseText);
     			}
     		});


 			},
 			fail: function(err) {
 				alert(JSON.stringify(err));
 			}
 		});
 	}
// 		      // 로그인 창을 띄웁니다.
// 		      Kakao.Auth.login({
// 		        success: function(authObj) {
// 		          alert(JSON.stringify(authObj));
// 		          alert(authObj.access_token);
// 							location.href="/main.do";
// 		        },
// 		        fail: function(err) {
// 		          alert(JSON.stringify(err));
// 		        }
// 		      });
};
//]]>


//<![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
// Kakao.init('77a0e108a3b9e6e97babced59f50bbef');
function logoutWithKakao() {
  Kakao.Auth.logout(function() {
// 	  location.href="/main.do";
  });
};
//]]>

var googleUser = {};
var startApp = function() {
  gapi.load('auth2', function(){
    // Retrieve the singleton for the GoogleAuth library and set up the client.
    auth2 = gapi.auth2.init({
      client_id: '954086829005-q063rn2ulo7c1065kda9uf2d7jtoo8dd.apps.googleusercontent.com',
      cookiepolicy: 'single_host_origin'
// 			fetch_basic_profile: false,
//     	scope: 'profile'
      // Request scopes in addition to 'profile' and 'email'
      //scope: 'additional_scope'
    });
    attachSignin(document.getElementById('customBtn'));
  });
};

function attachSignin(element) {
  console.log(element.id);
  auth2.attachClickHandler(element, {},
      function(googleUser) {
        document.getElementById('name').innerText = "Signed in: " +
            googleUser.getBasicProfile().getName();
        
        if (auth2.isSignedIn.get()) {
        	  var profile = auth2.currentUser.get().getBasicProfile();
        	  console.log('ID: ' + profile.getId());
        	  console.log('Full Name: ' + profile.getName());
        	  console.log('Given Name: ' + profile.getGivenName());
        	  console.log('Family Name: ' + profile.getFamilyName());
        	  console.log('Image URL: ' + profile.getImageUrl());
        	  console.log('Email: ' + profile.getEmail());
        	  
        	  var id = profile.getId();
        	  var pw = -1;
        	  var email = profile.getEmail();
        		
        		$.ajax({
        			type: "POST"
        			, url: "/login/login.do"
        			, data: {
        					memId:id,
        					memPw:pw,
        					memEmail:email
        				}
        			, dataType: "json"
        			, success: function( data ) {
        				var check = data.check;
        				token = data.token;
        				
        				if( check ) {
        					location.href="/main.do";
        				}
        			}
        			, error: function(e) {
        				console.log("----- error -----");
        				console.log(e.responseText);
        			}
        		});
        		
        }
//         location.href = "/main.do";
      }, function(error) {
//         alert(JSON.stringify(error, undefined, 2));
      });
}

var revokeAllScopes = function() {
	  auth2.disconnect();
}


/* 아이디, 비밀번호 입력하지 않고 로그인 버튼 눌렀을 때 */
function f_validate() {
	$(".join_hidden").hide();
	
	var id = $("#id").val();
	var pw = $("#password").val();

	if ( id==null || id=="") {
		$("#alert_id").css("display", "inline-block");
		document.getElementById("id").focus();
		return false;
	}

	if ( pw==null || pw=="") {
		$("#alert_pw").css("display", "inline-block");
		document.getElementById("password").focus();
		return false;
	}
	
	return true;
}

var token;
// 아이디, 비밀번호 확인
$(document).ready( function() {
	
		$("#login_confirm").click( function() {
			
			console.log(f_validate());
			if( f_validate() ) {
				var id = $("#id").val();
				if(id===null || id==="") {
					id = profile.getId();
				}
				var pw = $("#password").val();
				var params = {
					id : $('#id').val(),	
					password : $('#password').val()
				};
				
				$.ajax({
					type: "POST"
					, url: "/login/login.do"
					, data: {
							memId:id,
							memPw:pw
						}
					, dataType: "json"
					, success: function( data ) {
						var check = data.check;
						var gubn = data.gubn;
						token = data.token;
						
						if( check ) {
	// 					alert("로그인 성공");
							// 관리자
							if( gubn===0 ) {
								location.href="/admin/memberManage.do";
							}
							// 고객
							if( gubn===1 ) {
								location.href="/main.do";
							}
						} else {
	// 					alert("로그인 실패");
							$("#alert_login").css("display", "inline-block");
							document.getElementById("id").focus();
						}
						
					}
					, error: function(e) {
						console.log("----- error -----");
						console.log(e.responseText);
					}
				});
			}
		});
});


/*
function f_login() {
	if (event.keyCode != 13) {
		return false;
	} else {
		fnLogin();
	}
}
	
 KH정보교육원 로그인 화면 / 로그인 버튼 관련 기능
	function fnLogin() {
		var member_flag1 = $('input[name=member_flag]:checked').val();

		if (f_validate()) {
			var params = {
				id : $('#id').val(),
				password : $('#password').val(),
				member_flag	: $('input[name=member_flag]:checked').val()
			};
			$.ajax({
				url : '/login/loginCheck.kh',
				dataType : 'json',
				type : 'post',
				data : params,
				success : function(data, textStatus) {
					if (data['result'] == '2') {
						if (member_flag1 == 'T') {
							location.href = "/login/mypage.kh";
						} else {
							location.href = "/main/main.kh";
						}
					} else if (data['result'] == '3') {
						$("#alert_flag").css("display", "block");
					} else if (data['result'] == '4') {
						alert("이미 접속한 아이디입니다.");
					} else {
						$("#alert_idpw").css("display", "block");
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('오류가 발생했습니다\n[' + textStatus + ']\n' + errorThrown);
				}
			});
		}
	}
*/

/*	
	$("#naver_id_login").click( function() {
		// 로그인 성공
		location.href="/Page/main.jsp";
	});
*/	

// function logout() {
// 	$("body").append("<iframe id='logoutIframe' style='display: none;'></iframe>");
//   $("#logout").attr("src", "http://nid.naver.com/nidlogin.logout");
  // 로그아웃 처리
//   $("#naver_id_login").show();
//   $("#naver_id_logout").hide();
// }

// 	$("#logout").click(function() {
// 		console.log(token);
// 		location.href="https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=vL_aDS4Z9bTr4P8i4TKj&client_secret=o_DYWMfCmK&access_token="+token+"&service_provider=NAVER";
// 			console.log("logout");
// 			naver_id_login.logout();
// 			location.reload();
// 	});
// });


</script>

</head>
<body>
<div id="wrap">
<!-- Begin #header -->
<div id="header" class="sub">
	<div class="hgroup">
		<div class="inbox">
			<h1 class="logo"><a href="/main.do"><span>라젠카</span></a></h1>

			<div class="nvalinks">
				<a href="/login/login.do">로그인</a>
				<a href="/signUp.do">회원가입</a>
				<a class="nvalinks-rev" href="#">라젠카 예약</a>
			</div>
			
			<nav id="topMenu">
			<ul>
				<li class="topMenuLi">
				<a href="#" class="menuLink">Lazencar 소개</a>
					<ul class="submenu">
						<li><a href="#" class="submenuLink longLink">Lazencar란?</a></li>
						<li><a href="#" class="submenuLink longLink">이용안내</a></li>
						<li><a href="#" class="submenuLink longLink">요금안내</a></li>
						<li><a href="#" class="submenuLink longLink">위치</a></li>
					</ul></li>

				<li class="topMenuLi">
				<a href="#" class="menuLink">서비스/혜택</a>
					<ul class="submenu">
						<li><a href="#" class="submenuLink longLink">특가상품</a></li>
						<li><a href="#" class="submenuLink longLink">쿠폰받기</a></li>
						<li><a href="#" class="submenuLink longLink">후기</a></li>
					</ul></li>

				<li class="topMenuLi">
				<a href="#" class="menuLink">고객센터</a>
					<ul class="submenu">
						<li><a href="#" class="submenuLink longLink">1:1 문의</a></li>
						<li><a href="#" class="submenuLink longLink">자주 찾는 질문</a></li>
						<li><a href="/service/list.do" class="submenuLink longLink">공지사항</a></li>
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
<div id="content_sub">
<div id="content_sub_wrap">
<div id="content_right">

	<div class="subject"><span>로그인</span></div>
	<div id="login">
	<div class="login_frm">
	<div class="login_frm_detail">
		<div class="left">
		<div style="float: left; width: 285px; height: 70px;">
			<span>아이디</span>
			<input type="text" id="id" name="id" onkeypress="f_login();" /><br>
			
			<span>비밀번호</span>
			<input type="password" id="password" name="password" onkeypress="f_login();" />
		</div>
		
		<a href="javascript:void(0);" id="login_confirm">로그인</a>

		<div>
			<div>
				<a href="/login/findId.do" id="findLayer">아이디/비밀번호 찾기</a>
			</div>
			<div>
				<span class="join_hidden" id="alert_id">아이디를 입력하세요.</span>
				<span class="join_hidden" id="alert_pw">비밀번호를 입력하세요.</span>
				<span class="join_hidden" id="alert_login">아이디 또는 비밀번호를 잘못 입력하였습니다.</span>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>

	<span id="login_sns">▶ SNS계정 로그인</span><br>
	<div style="padding-top: 5px;">
		
		<!-- 네이버아이디로 로그인 -->
		<div id="naver_id_login">
		<img src="/Page/images/login/naver.PNG" alt="" /></div>
		<script type="text/javascript">
		  	var naver_id_login = new naver_id_login(
			  			"vL_aDS4Z9bTr4P8i4TKj"
			  			, "http://localhost:8092/Api/Member/callback.html");
		//   			, "http://localhost:8092/login/loginResult.do");
		  	var state = naver_id_login.getUniqState();
		    naver_id_login.setButton("white", 2,40);
		  	naver_id_login.setDomain("http://localhost:8092");
		  	naver_id_login.setState(state);
		  	naver_id_login.setPopup();
		  	naver_id_login.init_naver_id_login();
		</script>
		<!-- 	  <div id="naver_id_logout" style="display: none;"> -->
		<!--     <a href="#" onclick="logout();">로그아웃</a></div> -->
		<a href="http://nid.naver.com/nidlogin.logout" onclick="logout();"
			id="logout_naver">naver logout<br/></a>
		<!-- 		<a href="#" id="logout">sns 로그아웃</a> -->
		
		
		<!-- 카카오아이디로 로그인 -->
		<a id="custom-login-btn" href="javascript:loginWithKakao()">
		<img src="/Page/images/login/kakao.png" alt="" /><br/></a>
		<script type='text/javascript'>
		</script>
		
		<a href="javascript:logoutWithKakao()"
			id="logout_kakao">kakao logout</a>
		<script type='text/javascript'>
		</script>
		
		<!-- 구글아이디로 로그인 -->
		<!-- In the callback, you would hide the gSignInWrapper element on a
		successful sign in -->
		<div id="gSignInWrapper">
		  <div id="customBtn" class="customGPlusSignIn">
		    <span class="icon"></span>
		    <span class="buttonText">Google</span>
		  </div>
		</div>
		<div id="name"></div>
		<script>startApp();</script>
		
		<a href="#" onclick="signOut();">google logout</a>
		<script>
<<<<<<< HEAD
		$(document).ready(function(){
			$("#logout").click(function(){
				var token = 'AAAAOnK1n/KtSh6PiPz/lNNHmkNKfyHWEeJuIMAOVaKBYnl59c7RjbEy/wAEcotpswFxcP0IxZPw1OPFfljPXABGw74=';
				console.log(token);
				location.href="https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=vL_aDS4Z9bTr4P8i4TKj&client_secret=o_DYWMfCmK&access_token="+token+"&service_provider=NAVER";
// 				console.log("logout");t
// 				naver_id_login.logout();
// 				location.reload();
			});
		});
=======
		  function signOut() {
		    var auth2 = gapi.auth2.getAuthInstance();
		    auth2.signOut().then(function () {
		      console.log('User signed out.');
		    });
		  }
>>>>>>> 0eebd169674036b60aa12109b38d5bd820aabb65
		</script>
	</div>
	
</div>
</div>
</div>
</div>
<!-- // End #container -->
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
					href="https://www.facebook.com/greencarkorea" target="_blank">
					라젠카 페이스북</a></li>
				<li><a class="blog"
					href="http://blog.naver.com/greencar_co" target="_blank">
					라젠카 블로그</a></li>
				<li><a class="instagram"
					href="https://www.instagram.com/greencar_kr/" target="_blank">
					라젠카 인스타그램</a></li>
			</ul>

			<ul class="footer_links">
				<li><a href="http://www.greencar.co.kr/service/company/">회사소개</a></li>
				<li><a href="http://www.greencar.co.kr/alliance/">제휴신청</a></li>
				<li><a href="http://www.greencar.co.kr/service/useclause/">회원이용약관</a></li>
				<li><a href="http://www.greencar.co.kr/service/personalinfo/"
					class="point">개인정보처리방침</a></li>
				<li><a href="http://www.greencar.co.kr/service/carclause/">
					자동차대여 표준약관</a></li>
				<li><a href="http://www.greencar.co.kr/service/location/">
					위치기반	서비스 이용약관</a></li>
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
					alt="2016년 한국산업의 브랜드파워 1위" /> <img
					src="/Page/images/common/img_emblem_brandstar.jpg"
					alt="2016년 대한민국 브랜드스타" /> <img
					src="/Page/images/common/img_emblem_award.jpg"
					alt="모바일 어워드 코리아 2016" /> <img
					src="/Page/images/common/img_emblem_kspbi.jpg" alt="KS PBI" />
			</div>
		</div>
	</div>
</div>
<!-- // End #footer -->
</div>
<!-- // End #wrap -->
</body>

</html>