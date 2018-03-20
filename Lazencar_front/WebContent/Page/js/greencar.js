/**
 * greencar 전체 global 한 기능 구현. UI 및 처리 인터페이스
 */

/***************************************************************************
 * 
 * 레이어 로그인 관련.
 * 
 ***************************************************************************/
$(document).ready(function(){
	
	$( '.noautocomplete' ).noautocomplete();
	
	$.simpleBlock({
	    id: 'lapComLogin', // 스크립트 태그로 정의된 컨텐츠 스크립트 태그의 아이디
	    closeSelector: '.login-wrap .top a', // 닫기버튼 셀렉터명 ( 아이디, 클래스 등등.. ), 직접 이벤트 연결시에는 호출시에 넣지 않아도 됨.
	    //backgroundCssText: 'url(/web/images/popup/bg_fix.png) 0 0 repeat', // 블럭되는 배경의 스타일
	    //backgroundClassName: '', // 블럭되는 배경의 클래스명, 위의 스타일과 중복사용시 스타일 우선적용.
	    zIndex: 9900, // 블럭의 z-index이며, 컨텐츠의 경우에는 1이 더하여진다.
	    opened: false, // 객체 생성시에 팝업을 띄울지 결정. 기본값은 false
	    onOpen: function(){ // 오픈시 반환되는 콜백함수. 사용하지 않을시엔 제거해도됨.
	        //debugConsole( 'return onOpen' );
	    },
	    onClose: function(){ // 닫힐때 호출되는 콜백함수. 사용하지 않을시엔 제거해도됨.
	    	//debugConsole( 'return onClose' );
	    	$("#loginIdCom").val("");
	    	$("#loginPwd").val("");
	    }
	});

});

////////////////////////////////////////////////////////////////
// 2014.10.15 GREENCAR 문자 찾기 이벤트 관련
////////////////////////////////////////////////////////////////
var __eventCookieName = "event201410_01";
$(document).ready(function(){
	try{
		var joinEventCode = getCookie(__eventCookieName);
		if ( joinEventCode != null && joinEventCode != "" && ___isLogin___){
			// 이벤트 참여 처리
			participEvent201410_01(joinEventCode);
		}
	}catch(e){
	//	alert(e);
	}
});

/**
 * 이벤트 요청용 로그인 - event201410_01용으로만 사용.
 * @param code 이벤트 문자 코드.
 * @param bLogin 로그인 여부
 */
function openLapComLoginJoinEvent(code, bLogin){
	
	if ( bLogin ){
		participEvent201410_01(code);
	}else{
		// 이벤트 참여를 위한 코드 정보 쿠키 저장.
		setCookie(__eventCookieName, code);
		// 레이어 오픈
		openLapComLogin();
	}
	
}

/**
 * 이벤트 참여
 */
function participEvent201410_01(code){
	try{
		// 쿠키 초기화.
		setCookie(__eventCookieName, "");
		
		// 폼 전송
		var url = __globalContextPath + "/event/run/event201410_01.do";
		$.ajax({
			type: "POST",
			url: url,
			crossDomain: true,
			data: {
				"chr":code
			},
			dataType: "json",
			success: function (data) {
				// 참여 결과 오픈.
				openViewEventStatus(data.result);
			},

			failure: function (data) {
				alert('Fail');
			}
		});
	}catch(e)
	{
		alert("처리 중 오류가 발생했습니다.");
	}
}

function openViewEventStatus(collectStr){
	
	$.simpleBlock('show', {
		id: 'lapEvent201410_01', // 스크립트 태그로 정의된 컨텐츠 스크립트 태그의 아이디
	    closeSelector: '.layer-cont .top a'
	});
	
	var cnt = 0;
	if ( collectStr.indexOf("G") > -1 ) {
		event201410_01ChangeImg("G");
		cnt++;
	}
	
	if ( collectStr.indexOf("R") > -1 ) {
		event201410_01ChangeImg("R1");
		event201410_01ChangeImg("R2");
		cnt++;
	}
	
	if ( collectStr.indexOf("E") > -1 ) {
		event201410_01ChangeImg("E1");
		event201410_01ChangeImg("E2");
		cnt++;
	}
	
	if ( collectStr.indexOf("N") > -1 ) {
		event201410_01ChangeImg("N");
		cnt++;
	}
	
	if ( collectStr.indexOf("C") > -1 ) {
		event201410_01ChangeImg("C");
		cnt++;
	}
	
	if ( collectStr.indexOf("A") > -1 ) {
		event201410_01ChangeImg("A");
		cnt++;
	}
	
	if ( cnt == 6 ){
		// 성공 처리.
		$(".event201410-01-ing").hide();
		$(".event201410-01-success").show();
	}
}

function event201410_01ChangeImg(objId){
	var src = $("#eventImg" + objId).prop("src");
	src = src.replace("off", "on");
	$("#eventImg" + objId).prop("src", src);
}

////////////////////////////////////////////////////////////////
//2014.10.15 GREENCAR 문자 찾기 이벤트 관련 ---------------- 끝
////////////////////////////////////////////////////////////////

/**
 * 로그인 레이어 오픈
 */
function openLapComLogin( joinUrl ){
	if ( joinUrl === undefined ) {
		$.simpleBlock('show', {
			id: 'lapComLogin', // 스크립트 태그로 정의된 컨텐츠 스크립트 태그의 아이디
			closeSelector: '.login-wrap .top a',
			onOpen: function(){
				$("body").css({"overflow-y" :"hidden"});
				initTextFieldLabel($("#idPwWrap"));
			},
			onClose: function(){
				$("body").css({"overflow-y" :"visible"});
				$("#loginIdCom").val("");
		    	$("#loginPwdCom").val("");
			}
		});
	} else {	// 회원가입 url 변경
		$.simpleBlock('show', {
			id: 'lapComLogin', // 스크립트 태그로 정의된 컨텐츠 스크립트 태그의 아이디
			closeSelector: '.login-wrap .top a',
			onOpen: function(){
				$("body").css({"overflow-y" :"hidden"});
				$(document).find("#joinLink a").attr("href", __globalContextPath + joinUrl );
			},
			onClose: function(){
				$("body").css({"overflow-y" :"visible"});
				$("#loginIdCom").val("");
		    	$("#loginPwdCom").val("");
//				$(document).find("#joinLink a").attr("href", __globalContextPath+'/member' );
			}
		});
	}
}
/**
 * iframe 로그인 처리
 * @param frm 로그인 폼
 * @returns {Boolean}
 */
function doLoginFrame(frm){
	frm.pwdSha1.value = Sha1.hash($("#loginPwdCom").val());
	if( $(frm).find("#comMemType").val() == "lpoint" ){
		frm.pwdMD5.value = MD5($("#loginPwdCom").val());
	}
	//$("#loginPwdCom").val("");
	$("#comLoginIframe").remove();
	$("#lapComLogin").append('<iframe id="comLoginIframe" name="comLoginIframe" src="about:blank" style="display:none;"></iframe>');
	frm.curl.value = location.href.replace("#", "");
	frm.target = "comLoginIframe";
	return true;
}
/**
 * 로그인 처리 요청.
 * @param frm 로그인 폼
 * @returns {Boolean}
 */
function doLapComLogin(frm){
	
	if ( frm.loginId.value == "" ){
		alert("아이디를 입력하세요.");
		frm.loginId.focus();
		return false;
	}
	
	if ( frm.loginPwd.value == "" ){
		alert("비밀번호를 입력하세요.");
		frm.loginPwd.focus();
		return false;
	}
	
	$("#page_preloading_lapLogin").show();
	try{
		// 폼 전송
		var postData = $("#frmComLogin").serializeArray();
		var url = frm.action;
		$.ajax({
			type: "POST",
			url: url,
			crossDomain: true,
			data: postData,
			dataType: "jsonp",
			jsonp: "callback",
			success: function (data) {
				if ( data.result == null ){
					alert("로그인 중 알수 없는 오류가 발생했습니다.");
					$("#page_preloading_lapLogin").hide();
					return false;
				}else if ( data.result != ''){
					alert(data.result);
					$("#page_preloading_lapLogin").hide();
					return false;
				}
				
				$(".popup_bg").hide();
				//미납 체크 메시지
				if ( data.additionalMsg != "" ){
					alert(data.additionalMsg);
					location.href = __globalContextPath + "/mypage/delayAmtList.do";
				}
				else
				{
					if ( data.orderChk >= 1 ){
						if(confirm(data.orderMsg)){
							location.href = __globalContextPath + "/mypage/delayAmtList.do";
						}else{
							location.reload();
						}
					}else{
						location.reload();					
					}
				}
				
			},

			failure: function (data) {
				alert('Fail');
				$("#page_preloading_lapLogin").hide();
			}

		});
	}catch(e)
	{
		alert("처리 중 오류가 발생했습니다.");
		$("#page_preloading_lapLogin").hide();
	}
	
	return false;
}

/**
 * SNS 로그인 처리 요청.
 */
function doLapComSNSLogin( snsGbn ){
	$("#page_preloading_lapLogin").show();
	if ( snsGbn == "FB" ) {
		location.href = __globalContextPath + "/sns/facebook/login.do?snsType=3";
	} else if ( snsGbn == "GG" ) {
		location.href = __globalContextPath + "/sns/gg/login.do?snsType=3";
	} else if ( snsGbn == "NV" ) {
		location.href = __globalContextPath + "/sns/naver/login.do?snsType=3";
	} else if ( snsGbn == "KK" ) {
		location.href = __globalContextPath + "/sns/kakao/login.do?snsType=3";
	} else if ( snsGbn == "TW" ) {
		location.href = __globalContextPath + "/sns/twitter/login.do?snsType=3";
	}
}
//박진수, 2014.08.25, 아이디/비밀번호 찾기 초기화 
function findReset(){
	$("#hp").val("");
	$("#hp1").val("");
	$("#hp2").val("");
	$("#hp3").val("");
	$("#cmmCertHpInput").hide();
	$(".certification_num").hide();
	$("#_certHpNoticeArea").hide();
	$("#_certHpNoticeErrorArea").hide();
	$(".find_box01_1").hide();
	$(".find_box01_2").hide();
	$("#certNum").prop('readonly', false);
	$("#certHp").prop('readonly', false);
	document.frmFindMine.reset();
}
//박진수, 2014.08.25, 아이디 찾기 열기
function openFindId(popupFlag){
	findReset();
	initTextFieldLabel($("#inputWrap"));
	$.simpleBlock( 'hide', false );
	
	if(popupFlag == "T")	{	// 아이디찾기 첫호출
		//headerTxt 변경
		$('#headerTxt4Id').show();
		$('#headerTxt4Pw').hide();
		
		//h1 text 값 변경
		$('#passwordTitle').hide();
		
		//id 찾기 타입 변경
		$('#findType').hide();
		
		//id text box 변경
		$('#loginIdFind').show();
		$('#loginIdFindFromEmail').hide();
		$('#lPointId').hide();
		
		//이용안내 변경
		$('#operationGuide4Id').show();
		$('#operationGuide4Pw').hide();
		
		$.simpleBlock( 'show', {
			id: 'findIdPw',	//컨테이너 아이디 값
				onOpen: function(){ // 닫힐때 호출되는 콜백함수. 사용하지 않을시엔 제거해도됨.
					$('.layer-wrap01 .top a').on('click', function(){
							$('.layer-wrap02 .top a').off('click');
							$.simpleBlock( 'hide', false );
							openLapComLogin();
							
					})
					$("body").css({"overflow-y" :"hidden"});
				},onClose: function(){
					$("body").css({"overflow-y" :"visible"});
				}
		});
		_findIdPwdTabView("#id");	// 2016.01.19 박재영 추가
		
		$("#findIdPw .tabmenu-wrap > li:eq(0)").find("a").attr("onclick", "openFindId('T')");
	} else if (popupFlag == "P") {		//비밀번호 찾기 첫호출
		//headerTxt 변경
		$('#headerTxt4Pw').show();
		$('#headerTxt4Id').hide();
		
		//h1 text 값 변경
		$('#passwordTitle').show();
		$('#idTitle').hide();
		
		//id 찾기 타입 변경
		$('#findType').hide();
		
		//id text box 변경
		$('#lPointId').show();
		$('#loginIdFind').hide();
		$('#loginIdFindFromEmail').hide();
		
		//이용안내 변경
		$('#operationGuide4Id').hide();
		$('#operationGuide4Pw').show();
		
		
		$.simpleBlock( 'show', {
			id: 'findIdPw',	//컨테이너 아이디 값
				onOpen: function(){ // 닫힐때 호출되는 콜백함수. 사용하지 않을시엔 제거해도됨.
					$('.layer-wrap01 .top a').on('click', function(){
							$('.layer-wrap02 .top a').off('click');
							$.simpleBlock( 'hide', false );
							openLapComLogin();
					})
					$("body").css({"overflow-y" :"hidden"});
				}, onClose: function(){
					$("body").css({"overflow-y" :"visible"});
				}
		});
		
		_findIdPwdTabView("#pwd");	// 2016.01.19 박재영 추가
		
		$("#findIdPw .tabmenu-wrap > li:eq(0)").find("a").attr("onclick", "openFindId()");
		
		openFindPw();
		return ;
	} else	{
		if(popupFlag.indexOf("id") > -1){
			/* 타이틀 변경 */
			$("#idTitle").show();
			$("#passwordTitle").hide();
			
			/* header 변경 */
			$("#headerTxt4Id").show();
			$("#headerTxt4Pw").hide();
			
			/* 버튼 타이틀 변경 */
			$("._cmmGroupId").show();
			$("._cmmGroupPwd").hide();
			
			/* 이름&이메일주소 라디오 박스 show */
			$("#findType").show();
			
			/* input box 변경 */
			$("#loginWordFind").show();
			$("#loginIdFind").hide();
			
		}else if(popupFlag.indexOf("pw") > -1){
			/* 타이틀 변경 */
			$("#passwordTitle").show();
			$("#idTitle").hide();
			
			/* header 변경 */
			$("#headerTxt4Pw").show();
			$("#headerTxt4Id").hide();
			
			/* 버튼 타이틀 변경 */
			$("._cmmGroupPwd").show();
			$("._cmmGroupId").hide();
			
			/* 이름&이메일주소 라디오 박스 hide */
			$("#findType").hide();
			
			/* input box 변경 */
			$("#loginIdFind").show();
			$("#loginWordFind").hide();
		}
		if( popupFlag.indexOf("com") > -1 ){
			$.simpleBlock( 'show', {
				id: 'findIdPw',	//컨테이너 아이디 값
				closeSelector: '.layer-wrap01 .top a',
				onOpen: function(){ // 닫힐때 호출되는 콜백함수. 사용하지 않을시엔 제거해도됨.
					$('.layer-wrap01 .top a').on('click', function(){
						$('.layer-wrap02 .top a').off('click');
						$.simpleBlock( 'hide', false );
						openLapComLogin();
					})
					$("body").css({"overflow-y" :"hidden"});
				}, onClose: function(){
					$("body").css({"overflow-y" :"visible"});
				}
			});
		}else{
			$.simpleBlock( 'show', {
				id: 'findIdPw',	//컨테이너 아이디 값
				closeSelector: '.layer-wrap01 .top a',
			});
		}
	}	 

	$("#findIdPw").show();
	$("#loginidDt").hide();
	$("#loginidDd").hide();
	$(".txt_info1").hide();
	$("#findType").val("id");
	$("#findIdPw .tabmenu-wrap > li:eq(0)").addClass("on");
	$("#findIdPw .tabmenu-wrap > li:eq(1)").removeClass("on");

}
//박진수, 2014.08.25, 비밀번호 찾기 열기
function openFindPw(){
	findReset();
	
	$("#findIdPw").show();	
	$("#loginidDt").show();
	$("#loginidDd").show();
	$(".txt_info1").show();
	$("#findType").val("pw");
	$("#findIdPw .tabmenu-wrap > li:eq(0)").removeClass("on");
	$("#findIdPw .tabmenu-wrap > li:eq(1)").addClass("on");
}

/**
 * 그린카 글 공유 인터페이스
 * 필수 페이지 태그
 * <meta name="title" content="" />
 * <meta name="subject" content="" />
 * <meta name="description" content="" />
 * @param sns
 */
function snsShare(sns)
{
	var o;
	var snsset = new Array();
	var enc_tit = $("meta[name=title]").attr("content");
	var enc_sbj = encodeURIComponent($("meta[name=subject]").attr("content"));
	var enc_url = escape(location.href);
	var enc_tag = "";
	var _br  = encodeURIComponent('\r\n');
	enc_sbj = enc_sbj.replace("/\s/g", "+");
	
	if ( sns == "copy" ){
		copy(location.href);
		return;
	}
	switch(sns)
    {
        case 'f':
            o = {
                method:'popup',
                url:'http://www.facebook.com/sharer/sharer.php?u=' + enc_url
            };
            break;
        case 't':
            o = {
                method:'popup',
                url:'http://twitter.com/intent/tweet?text=' + enc_sbj + '&url=' + enc_url
            };
            break;
        case 'me2day':
            o = {
                method:'popup',
                url:'http://me2day.net/posts/new?new_post[body]=' + enc_sbj + _br + enc_url + '&new_post[tags]=epiloum'
            };
            break;
        case 'kakaotalk':
            o = {
                method:'web2app',
                param:'sendurl?msg=' + enc_sbj + '&url=' + enc_url + '&type=link&apiver=2.0.1&appver=2.0&appid=dev.epiloum.net&appname=' + encodeURIComponent('GreenCar'),
                a_store:'itms-apps://itunes.apple.com/app/id362057947?mt=8',
                g_store:'market://details?id=com.kakao.talk',
                a_proto:'kakaolink://',
                g_proto:'scheme=kakaolink;package=com.kakao.talk'
            };
            break;
        case 'kakaostory':
            o = {
                method:'web2app',
                param:'posting?post=' + enc_sbj + _br + enc_url + '&apiver=1.0&appver=2.0&appid=dev.epiloum.net&appname=' + encodeURIComponent('GreenCar'),
                a_store:'itms-apps://itunes.apple.com/app/id486244601?mt=8',
                g_store:'market://details?id=com.kakao.story',
                a_proto:'storylink://',
                g_proto:'scheme=kakaolink;package=com.kakao.story'
            };
            break;
        case 'naverBand':
            o = {
                method:'web2app',
                param:'create/post?text=' + enc_sbj + _br + enc_url,
                a_store:'itms-apps://itunes.apple.com/app/id542613198?mt=8',
                g_store:'market://details?id=com.nhn.android.band',
                a_proto:'bandapp://',
                g_proto:'scheme=bandapp;package=com.nhn.android.band'
            };
            break;
        case 'nb':
            o = {
                method:'blank',
                url:'http://bookmark.naver.com/post?ns=1&title=' + enc_sbj + '&url=' + enc_url
            };
            break;
        case 'gg':
            o = {
                method:'popup',
                url:'https://plus.google.com/share?url=' + enc_url 
            };
            break;
        default:
            alert('지원하지 않는 SNS입니다.');
            return false;
    }
 
    switch(o.method)
    {
        case 'popup':
            window.open(o.url);
            break;
        case 'blank':
            location.href = o.url;
            break;
        case 'web2app':
            if(navigator.userAgent.match(/android/i))
            {
                // Android
                setTimeout(function(){ location.href = 'intent://' + o.param + '#Intent;' + o.g_proto + ';end'}, 100);
            }
            else if(navigator.userAgent.match(/(iphone)|(ipod)|(ipad)/i))
            {
                // Apple
                setTimeout(function(){ location.href = o.a_store; }, 200);          
                setTimeout(function(){ location.href = o.a_proto + o.param }, 100);
            }
            else
            {
                alert('이 기능은 모바일에서만 사용할 수 있습니다.');
            }
            break;
    }
}
/**
 * URL 복사
 * @param URL
 */
function copy(URL) {
	var IE = (document.all) ? true : false;
	if (IE) {
		window.clipboardData.setData('Text', URL);
		alert('주소가 복사되었습니다.');
	} else {
		temp = prompt("Ctrl+C를 눌러 클립보드로 복사하세요", URL);
	}
}
/**
 * 계정 전환.
 */
function doChangeLogin(){
	try{
		var url = _globalFullContextSSL + "/member/change/doChangeAccount.do";
		$.ajax({
			type: "POST",
			url: url,
			dataType: "jsonp",
			jsonp: "callback",
			success: function (data) {
				if ( data == null ){
					alert("계정 전환 중 알수 없는 오류가 발생했습니다.");
					return;
				}else if ( data.result != ''){
					alert(data.result);
					return;
				}
				
				location.reload();
			},

			failure: function (data) {
			}

		});
	}catch(e)
	{
		alert("처리 중 오류가 발생했습니다.");
	}
}

function alertChangeLogin(){
	var bConfirm = confirm("현재 법인아이디만 등록되어있습니다.\n개인ID를 등록해주세요.");
	var rurl = escape(location.href);
	var url = _globalFullContextSSL + "/member/change/changeLogin.do?rurl=" + rurl;
	if ( !bConfirm ){
		return;
	}
	
	location.href = url;
}

function MD5(sMessage) {
	 function RotateLeft(lValue, iShiftBits) {
	  return (lValue<<iShiftBits) | (lValue>>>(32-iShiftBits));
	 }
	 function AddUnsigned(lX,lY) {
	  var lX4,lY4,lX8,lY8,lResult;
	  lX8 = (lX & 0x80000000);
	  lY8 = (lY & 0x80000000);
	  lX4 = (lX & 0x40000000);
	  lY4 = (lY & 0x40000000);
	  lResult = (lX & 0x3FFFFFFF)+(lY & 0x3FFFFFFF);
	  if(lX4 & lY4)
	   return (lResult ^ 0x80000000 ^ lX8 ^ lY8);
	  if (lX4 | lY4) {
	   if (lResult & 0x40000000)
	    return (lResult ^ 0xC0000000 ^ lX8 ^ lY8);
	   else
	    return (lResult ^ 0x40000000 ^ lX8 ^ lY8);
	  }
	  else
	   return (lResult ^ lX8 ^ lY8);
	  }
	  
	 function F(x,y,z) {
	  return (x & y) | ((~x) & z);
	 }
	 function G(x,y,z) {
	  return (x & z) | (y & (~z));
	 }
	 function H(x,y,z) {
	  return (x ^ y ^ z);
	 }
	 function I(x,y,z) {
	  return (y ^ (x | (~z)));
	 }
	 function FF(a,b,c,d,x,s,ac) {
	  a = AddUnsigned(a, AddUnsigned(AddUnsigned(F(b, c, d), x), ac));
	  return AddUnsigned(RotateLeft(a, s), b);
	 }
	 function GG(a,b,c,d,x,s,ac) {
	  a = AddUnsigned(a, AddUnsigned(AddUnsigned(G(b, c, d), x), ac));
	  return AddUnsigned(RotateLeft(a, s), b);
	 }
	 function HH(a,b,c,d,x,s,ac) {
	  a = AddUnsigned(a, AddUnsigned(AddUnsigned(H(b, c, d), x), ac));
	  return AddUnsigned(RotateLeft(a, s), b);
	 }
	 function II(a,b,c,d,x,s,ac) {
	  a = AddUnsigned(a, AddUnsigned(AddUnsigned(I(b, c, d), x), ac));
	  return AddUnsigned(RotateLeft(a, s), b);
	 }
	 function ConvertToWordArray(sMessage) {
	  var lWordCount;
	  var lMessageLength = sMessage.length;
	  var lNumberOfWords_temp1=lMessageLength + 8;
	  var lNumberOfWords_temp2=(lNumberOfWords_temp1-(lNumberOfWords_temp1 % 64))/64;
	  var lNumberOfWords = (lNumberOfWords_temp2+1)*16;
	  var lWordArray = Array(lNumberOfWords-1);
	  var lBytePosition = 0;
	  var lByteCount = 0;
	  while ( lByteCount < lMessageLength ) {
	   lWordCount = (lByteCount-(lByteCount % 4))/4;
	   lBytePosition = (lByteCount % 4)*8;
	   lWordArray[lWordCount] = (lWordArray[lWordCount] | (sMessage.charCodeAt(lByteCount)<<lBytePosition));
	   lByteCount++;
	  }
	  lWordCount = (lByteCount-(lByteCount % 4))/4;
	  lBytePosition = (lByteCount % 4)*8;
	  lWordArray[lWordCount] = lWordArray[lWordCount] | (0x80<<lBytePosition);
	  lWordArray[lNumberOfWords-2] = lMessageLength<<3;
	  lWordArray[lNumberOfWords-1] = lMessageLength>>>29;
	  return lWordArray;
	 }
	 function WordToHex(lValue) {
	  var WordToHexValue="",WordToHexValue_temp="",lByte,lCount;
	  for (lCount=0; lCount<=3; lCount++) {
	   lByte = (lValue>>>(lCount*8)) & 255;
	   WordToHexValue_temp = "0" + lByte.toString(16);
	   WordToHexValue = WordToHexValue + WordToHexValue_temp.substr(WordToHexValue_temp.length-2,2);
	  }
	  return WordToHexValue;
	 }
	 var x = Array();
	 var k,AA,BB,CC,DD,a,b,c,d;
	 var S11=7, S12=12, S13=17, S14=22;
	 var S21=5, S22=9 , S23=14, S24=20;
	 var S31=4, S32=11, S33=16, S34=23;
	 var S41=6, S42=10, S43=15, S44=21;
	 // Steps 1 and 2.  Append padding bits and length and convert to words
	 x = ConvertToWordArray(sMessage);
	 // Step 3.  Initialise
	 a = 0x67452301; b = 0xEFCDAB89; c = 0x98BADCFE; d = 0x10325476;
	 // Step 4.  Process the message in 16-word blocks
	 for (k=0;k<x.length;k+=16) {
	  AA=a; BB=b; CC=c; DD=d;
	  a = FF(a,b,c,d,x[k+0], S11,0xD76AA478);
	  d = FF(d,a,b,c,x[k+1], S12,0xE8C7B756);
	  c = FF(c,d,a,b,x[k+2], S13,0x242070DB);
	  b = FF(b,c,d,a,x[k+3], S14,0xC1BDCEEE);
	  a = FF(a,b,c,d,x[k+4], S11,0xF57C0FAF);
	  d = FF(d,a,b,c,x[k+5], S12,0x4787C62A);
	  c = FF(c,d,a,b,x[k+6], S13,0xA8304613);
	  b = FF(b,c,d,a,x[k+7], S14,0xFD469501);
	  a = FF(a,b,c,d,x[k+8], S11,0x698098D8);
	  d = FF(d,a,b,c,x[k+9], S12,0x8B44F7AF);
	  c = FF(c,d,a,b,x[k+10],S13,0xFFFF5BB1);
	  b = FF(b,c,d,a,x[k+11],S14,0x895CD7BE);
	  a = FF(a,b,c,d,x[k+12],S11,0x6B901122);
	  d = FF(d,a,b,c,x[k+13],S12,0xFD987193);
	  c = FF(c,d,a,b,x[k+14],S13,0xA679438E);
	  b = FF(b,c,d,a,x[k+15],S14,0x49B40821);
	  a = GG(a,b,c,d,x[k+1], S21,0xF61E2562);
	  d = GG(d,a,b,c,x[k+6], S22,0xC040B340);
	  c = GG(c,d,a,b,x[k+11],S23,0x265E5A51);
	  b = GG(b,c,d,a,x[k+0], S24,0xE9B6C7AA);
	  a = GG(a,b,c,d,x[k+5], S21,0xD62F105D);
	  d = GG(d,a,b,c,x[k+10],S22,0x2441453);
	  c = GG(c,d,a,b,x[k+15],S23,0xD8A1E681);
	  b = GG(b,c,d,a,x[k+4], S24,0xE7D3FBC8);
	  a = GG(a,b,c,d,x[k+9], S21,0x21E1CDE6);
	  d = GG(d,a,b,c,x[k+14],S22,0xC33707D6);
	  c = GG(c,d,a,b,x[k+3], S23,0xF4D50D87);
	  b = GG(b,c,d,a,x[k+8], S24,0x455A14ED);
	  a = GG(a,b,c,d,x[k+13],S21,0xA9E3E905);
	  d = GG(d,a,b,c,x[k+2], S22,0xFCEFA3F8);
	  c = GG(c,d,a,b,x[k+7], S23,0x676F02D9);
	  b = GG(b,c,d,a,x[k+12],S24,0x8D2A4C8A);
	  a = HH(a,b,c,d,x[k+5], S31,0xFFFA3942);
	  d = HH(d,a,b,c,x[k+8], S32,0x8771F681);
	  c = HH(c,d,a,b,x[k+11],S33,0x6D9D6122);
	  b = HH(b,c,d,a,x[k+14],S34,0xFDE5380C);
	  a = HH(a,b,c,d,x[k+1], S31,0xA4BEEA44);
	  d = HH(d,a,b,c,x[k+4], S32,0x4BDECFA9);
	  c = HH(c,d,a,b,x[k+7], S33,0xF6BB4B60);
	  b = HH(b,c,d,a,x[k+10],S34,0xBEBFBC70);
	  a = HH(a,b,c,d,x[k+13],S31,0x289B7EC6);
	  d = HH(d,a,b,c,x[k+0], S32,0xEAA127FA);
	  c = HH(c,d,a,b,x[k+3], S33,0xD4EF3085);
	  b = HH(b,c,d,a,x[k+6], S34,0x4881D05);
	  a = HH(a,b,c,d,x[k+9], S31,0xD9D4D039);
	  d = HH(d,a,b,c,x[k+12],S32,0xE6DB99E5);
	  c = HH(c,d,a,b,x[k+15],S33,0x1FA27CF8);
	  b = HH(b,c,d,a,x[k+2], S34,0xC4AC5665);
	  a = II(a,b,c,d,x[k+0], S41,0xF4292244);
	  d = II(d,a,b,c,x[k+7], S42,0x432AFF97);
	  c = II(c,d,a,b,x[k+14],S43,0xAB9423A7);
	  b = II(b,c,d,a,x[k+5], S44,0xFC93A039);
	  a = II(a,b,c,d,x[k+12],S41,0x655B59C3);
	  d = II(d,a,b,c,x[k+3], S42,0x8F0CCC92);
	  c = II(c,d,a,b,x[k+10],S43,0xFFEFF47D);
	  b = II(b,c,d,a,x[k+1], S44,0x85845DD1);
	  a = II(a,b,c,d,x[k+8], S41,0x6FA87E4F);
	  d = II(d,a,b,c,x[k+15],S42,0xFE2CE6E0);
	  c = II(c,d,a,b,x[k+6], S43,0xA3014314);
	  b = II(b,c,d,a,x[k+13],S44,0x4E0811A1);
	  a = II(a,b,c,d,x[k+4], S41,0xF7537E82);
	  d = II(d,a,b,c,x[k+11],S42,0xBD3AF235);
	  c = II(c,d,a,b,x[k+2], S43,0x2AD7D2BB);
	  b = II(b,c,d,a,x[k+9], S44,0xEB86D391);
	  a = AddUnsigned(a,AA); b=AddUnsigned(b,BB); c=AddUnsigned(c,CC); d=AddUnsigned(d,DD);
	 }
	 // Step 5.  Output the 128 bit digest
	 var temp = WordToHex(a) + WordToHex(b) + WordToHex(c) + WordToHex(d);
	 return temp.toLowerCase();
}
