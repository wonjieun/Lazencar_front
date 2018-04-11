<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>

<%@ page import = "dto.Review" %>
<%@ page import = "dao.ReviewDaoImpl" %>
<%@ page import = "java.util.*, java.text.*"  %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 글 수정 액션 </title>
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
	   script.println("location.href = 'login.jsp'");
	   script.println("</script>");
   }

   int rev_num = 0;

   if (request.getParameter("rev_num") != null) {
	   
	   rev_num = Integer.parseInt(request.getParameter("rev_num"));
   }

   if (rev_num == 0) {
	   
	      PrintWriter script = response.getWriter();
	      script.println("<script>");
	      script.println("alert('삭제되었거나 유효하지 않은 글입니다')");
	      script.println("location.href = 'review_Board_List.do'");
	      script.println("</script>");
   }
   
   Review rev = new ReviewDaoImpl().getReview(rev_num);
   
   // 예외처리 현재 로그인한 아이디랑 글 아이디랑 비교해서 다를경우
   
   if (!now_id.equals(rev.getRev_userId())) {
	   
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
       script.println("alert('권한이 없습니다')");
	   script.println("location.href = 'review_Board_List.do'");
	   script.println("</script>");
   } else {
	   
		if (request.getParameter("rev_title") == null || request.getParameter("rev_content") == null 
				|| request.getParameter("rev_title").equals("") || request.getParameter("rev_content").equals("")) {

			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 입력하세요 입력이 안됐어요')");
			script.println("history.back()");
			script.println("</script>");

		} else {

			ReviewDaoImpl revDao = new ReviewDaoImpl();
			int result = revDao.update(rev_num, request.getParameter("rev_title"), request.getParameter("rev_content"));

			if (result == -1) {

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 수정에 실패하였습니다')");
				script.println("history.back()");
				script.println("</script>");
			} 
			else {
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href= 'review_Board_List.do'");
				script.println("</script>");
			}
		}
   }
   
%>

</body>
</html>