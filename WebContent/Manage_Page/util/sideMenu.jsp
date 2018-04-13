<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/Manage_Page/css/main.css" />
	<style>
	.demo { margin:30px 0;}
	.date-picker-wrapper .month-wrapper table .day.lalala { background-color:orange; }
	.options { display:none; border-left:6px solid #8ae; padding:10px; font-size:12px; line-height:1.4; background-color:#eee; border-radius:4px;}
	.date-picker-wrapper.date-range-picker19 .day.first-date-selected { background-color: red !important; }
	.date-picker-wrapper.date-range-picker19 .day.last-date-selected { background-color: orange !important; }
	
	tr.hiddenTr{
 	display:none;  
/*  	display:table-row;  */
	}
	tr.hiddenTr td{
		padding: 15px 0 15px 100px;
	
	}
	tr.hiddenTr td div{    
	text-align: left;
	float: left; 
	width: 33%;
	margin-left:30px;
	}
	tr.hiddenTr td div font{
		font-size:17px;
	}
	tr.hiddenTr td div button{
		text-align:right;
	}
	</style>
</head>
<body>
<%  
   String now_id = null;
   if (session.getAttribute("id") != null) {
     now_id = (String) session.getAttribute("id");
   }

   // 예외처리 현재 아이디값 안들어와있을때

   if (now_id == null) {

      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('로그인부터 해주세요!')");
      script.println("location.href = '/login/login.do'");
      script.println("</script>");
   }else if(!(now_id.equals("manager1"))){
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('관리자만 이용할 수 있습니다.')");
      script.println("location.href = '/login/login.do'");
      script.println("</script>");
   }
%>

<div id="menu">
   <ul class="level1">
      <li><a href="/main.do">Home</a></li>
      <li><a class="fly" href="/admin/memberManage.do">회원 관리</a>
         <ul>
            <li><a href="/admin/memberManage.do" >회원목록 조회</a></li>
         </ul>
      </li>
      
      <li><a class="fly" href="javascript:void(0);">예약 관리</a>
         <ul>
            <li><a href="/admin/reservationManage.do">예약목록 조회</a></li>
         </ul>
      </li>
      
      <li><a class="fly" href="/admin/carRegister.do">차량 관리</a>
         <ul>
            <li><a href="/admin/carRegister.do">차량 등록</a></li>
            <li><a href="/admin/carCheckList.do">차량 조회/수정</a></li>
         </ul>
      </li>
      
      <li><a class="fly" href="/admin/noticeRegister.do">공지 사항</a>
         <ul>
            <li><a href="/admin/noticeRegister.do">공지사항 등록</a></li>
            <li><a href="/admin/noticeList.do">공지사항 조회/수정</a></li>
         </ul>
      </li>
      
      <li><a class="fly" href="javascript:void(0);">후기 관리</a>
         <ul>
            <li><a href="/admin/reviewList.do">후기목록 조회</a></li>
         </ul>
      </li>
      
      <li><a class="fly" href="/admin/qnaList.do">문의 관리</a>
         <ul>
            <li><a href="/admin/qnaList.do">문의 조회/답변</a></li>
         </ul>
      </li>
		
		<li><a class="fly" href="/admin/couponRegister.do">쿠폰 관리</a>
			<ul>
				<li><a href="/admin/couponRegister.do">쿠폰 등록</a></li>
				<li><a href="/admin/couponList.do">쿠폰 조회/삭제</a></li>
			</ul>
		</li>
		
		<li><a class="fly" href="/admin/promotionRegister.do">특가 상품</a>
			<ul>
				<li><a href="/admin/promotionRegister.do">특가 등록</a></li>
				<li><a href="/admin/promotionList.do">특가 조회/삭제</a></li>

			</ul>
		</li>
		
		<li><a class="fly" href="/admin/paymentList.do">결제 관리</a>
		<ul>
				<li><a href="/admin/paymentList.do">결제 조회</a></li>

			</ul>
		</li>
		
	</ul>
</div>		<!-- sideMenu end -->
</body>
</html>