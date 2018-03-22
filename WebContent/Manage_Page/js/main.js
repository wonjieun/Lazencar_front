$(document).ready(function(){
	var init_ui = function(){
		var slideHeight = parseInt($(window).height());
		var slideTxtTop = parseInt(slideHeight * 0.24 + 200);

		$('.section_box').height($(window).height()); //section 최소 높이
		$('.section0 .btn_join').css('top', slideTxtTop); //그린카 소개 텍스트 위치
	}
	init_ui();

	$(window).on("load resize",function(){
		init_ui();
	});

	// for main
	$('#header').removeClass('sub');
	$('.mainview-box').parents().find('#container').addClass('main-content-box');
	$(".navigation a").hover(
		function () {
			$("#fp-nav").css('z-index', '1000');
		}
	);
	$("#header").mouseleave(function () {
		$("#fp-nav").css('z-index', '1001');
	});

	$('#fullpage').fullpage({
		navigation: true,
		navigationPosition: 'right',
		navigationTooltips: ['대한민국 No.1 그린카', '가까운 그린존', '경제적인 쿠폰/특가', '간편한 앱', '그린카 이용안내', '이벤트', '공지사항', '공지사항'],
		slidesNavigation: true,
		css3:false,
		scrollOverflow: true,
		controlArrows: false,
		verticalCentered: false,
		paddingTop:'0',
		afterLoad: function(anchorLink, index) {
			$('#fp-nav ul li').each(function(i, e){
				$(this).addClass('fp-nav-li'+i);
			});

			$('.section4 .fp-slidesNav ul li').each(function(i, e){
				$(this).attr('id', 'nav'+i);
			});

			$('.section5 .event_list li').each(function(i, e){
				$(this).addClass('event'+i);
			});

			$('.section6 .notice_list li').each(function(i, e){
				$(this).addClass('notice'+i);
			});

			if(index==1) {
				$('.section0 .btn_join').addClass('on');
				$('.section1').css('background-attachment', 'scroll');
				$("#slick_section0").slick('slickPlay');
				$('#slick_section0 .slick01').addClass('slick-active');
			} else {
				$('.section1').css('background-attachment', 'fixed');
				$("#slick_section0").slick('slickPause');
				$('#slick_section0').slick('slickGoTo', 0);
				$('#slick_section0 .slick-slide').removeClass('slick-active');
				$('.section0 .slick-pause').addClass('paused');
			}

			if(index==2) {
				$('.section1 .img02').delay(300).fadeIn(400);
				$('.section1 .img03').delay(700).fadeIn(400);
				$('.section1 .img04').delay(1100).fadeIn(400);
				$('.section1 .img05').delay(1500).fadeIn(400);
			} else {
				$('.section1 .section_img_wrap div').stop().hide();
			}

			if(index==3) {
				$('.section2 .img02').delay(300).fadeIn(150);
				$('.section2 .img03').delay(880).fadeIn(150);
				$('.section2 .img04').delay(1460).fadeIn(150);
				$('.section2 .img05').delay(2040).fadeIn(150);
				$('.section2 .img06').delay(2620).fadeIn(150);
			} else {
				$('.section2 .section_img_wrap div').stop().hide();
			}

			if(index==4) {
				$('.section3 .section_img.img02').delay(700).fadeIn(700);
				$('.section3 .section_img.img03').delay(1400).fadeIn(700);
			} else {
				$('.section3 .section_img.img02').stop().hide();
				$('.section3 .section_img.img03').stop().hide();
			}

			if(index==5) {
				$("#slick_section4").slick('slickPlay');
				$('#slick_section4 .guide01').addClass('slick-active');

				$('.slick.guide01 .img02').delay(800).fadeIn(200);
				$('.slick.guide01 .img03').delay(1600).fadeIn(200);
				$('.slick.guide01 .img04').delay(2400).fadeIn(200);

				$('.guidePlay').click(function(){
					$("#slick_section4").slick('slickPause');
				});

				$('.layer_close').click(function(){
					$("#slick_section4").slick('slickPlay');
				});
			} else {
				$("#slick_section4").slick('slickPause');
				$('#slick_section4').slick('slickGoTo', 0);
				$('#slick_section4 .slick-slide').removeClass('slick-active');
				$('.section4 .section_img_wrap div').stop().hide();
			}

			if(index==6 || index==7 || index==8) {
				$('#header').addClass('sub');
			} else {
				$('#header').removeClass('sub');
			}

			if(index==6) {
				$('.section5 .event_list li').addClass('on');
			} else {
				$('.section5 .event_list li').removeClass('on');
			}

			if(index==7) {
				$('.section6 .notice_list li').addClass('on');
			} else if(index!=8) {
				$('.section6 .notice_list li').removeClass('on');
			}

			if(index==8) {
				$('.fp-nav-li7').css('z-index','1');
				$('a.btn_top').fadeIn(500);
			} else {
				$('.fp-nav-li7').css('z-index','0');
				$('a.btn_top').hide();
			}
		},
		afterRender: function () {
			$('a.btn_top').on('click', function() {
				$('.section1').css('background-attachment', 'scroll');
				$.fn.fullpage.moveTo(1);
			});
			$('a.btn_down').on('click', function() {
				$.fn.fullpage.moveTo(2);
			});
		},
		onLeave: function(index, nextIndex, direction){
			if(index==1) {
				$('.section0 .btn_join').removeClass('on');
			}

			if(index==2 && direction == 'up') {
				$('.section1').css('background-attachment', 'scroll');
			}

			if(index==5 && direction == 'down') {
				$('#header').addClass('sub');
			}
		}
	});

	$('#slick_section0').slick({
		dots: true,
		infinite: true,
		speed: 500,
		slidesToScroll: 1,
		autoplay: true,
		autoplaySpeed: 5000,
		pauseOnHover: false,
		fade: true
	});
	$('.section0 .slick-pause').click(function(){
		if ($(this).hasClass('paused')){
			$("#slick_section0").slick('slickPause');
			$(this).removeClass('paused');
			$(this).text('재생');
		} else {
			$("#slick_section0").slick('slickPlay');
			$(this).addClass('paused');
			$(this).text('정지');
		}
	});

	$('#slick_section4').slick({
		dots: true,
		infinite: true,
		speed: 500,
		slidesToScroll: 1,
		autoplay: true,
		autoplaySpeed: 5000,
		pauseOnHover: false,
		fade: true
	});
	$('#slick_section4').on('beforeChange', function(event, slick, currentSlide, nextSlide){
		if(nextSlide == '0'){
			$('.slick.guide01 .img02').delay(800).fadeIn(200);
			$('.slick.guide01 .img03').delay(1600).fadeIn(200);
			$('.slick.guide01 .img04').delay(2400).fadeIn(200);
		}
		if(nextSlide == '1') {
			$('.slick.guide02 .img02').delay(1200).fadeIn(200);
			$('.slick.guide02 .img03').delay(2400).fadeIn(200);
			$('.slick.guide02 .img04').delay(3600).fadeIn(200);
		}
		if(nextSlide == '2') {
			$('.slick.guide03 .img02').delay(1000).fadeIn(200);
			$('.slick.guide03 .img03').delay(2000).fadeIn(200);
			$('.slick.guide03 .img04').delay(3000).fadeIn(200);
		}
		if(nextSlide == '3') {
			$('.slick.guide04 .img02').delay(800).fadeIn(200);
			$('.slick.guide04 .img03').delay(1600).fadeIn(200);
			$('.slick.guide04 .img04').delay(2400).fadeIn(200);
			$('.slick.guide04 .img05').delay(3200).fadeIn(200);
		}
		if(nextSlide == '4') {
			$('.slick.guide05 .img02').delay(800).fadeIn(200);
			$('.slick.guide05 .img03').delay(1600).fadeIn(200);
			$('.slick.guide05 .img04').delay(2400).fadeIn(200);
			$('.slick.guide05 .img05').delay(3200).fadeIn(200);
		}
	});
	$('#slick_section4').on('afterChange', function(event, slick, currentSlide, nextSlide){
		currentSlide = currentSlide+1;
		var current = '.guide0'+currentSlide+' .section_img_wrap div';
		$('.section4 .section_img_wrap div').not(current).stop().hide().css('opacity', '');
	});

	//이용안내 영상 레이어
	var videoUrl = 'https://www.youtube.com/embed/YcleuinAtLg?autoplay=1&rel=0';
	$('.guidePlay').click(function(){
		$('body').on('scroll touchmove mousewheel keydown keyup', function(event) {
			event.preventDefault();
			event.stopPropagation();

			return false;
		});
		$('#videoGuide iframe').attr('src', videoUrl);
		$('#videoGuide').show();
		videoSize();
	});
	$('.layer_close').click(function(){
		$('body').off('scroll touchmove mousewheel keydown keyup');
		$('#videoGuide').hide();
		$('#videoGuide iframe').attr('src', '');
	});
	$(".filter, .layer_wrap").click(function(e){
		if(!$(".layer_cont").has(e.target).length){
			$(".layer_close").trigger("click");
		};
	});
});

var videoSize = function(){
	var contHt, contWd;

	if($(window).height() > 720) {
		contHt = 720;
		contWd = 1280;
	} else {
		contHt = $('.layer_wrap').height();
		contWd = contHt * 1.77;
	}

	var contHtHalf = contHt / 2;
	var contWdHalf = contWd / 2;
	$('.layer_cont').height(contHt).width(contWd).css({
		'margin-left': -contWdHalf,
		'margin-top': -contHtHalf
	});
}
$(window).on("resize",function(){
	videoSize();
});