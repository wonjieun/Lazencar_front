<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>


<%@ page import = "dao.ReviewDaoImpl" %>
<%@ page import = "java.util.*, java.text.*"  %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="rev" class ="dto.Review" scope = "page"></jsp:useBean>

<jsp:setProperty name="rev" property="rev_title" />
<jsp:setProperty name="rev" property="rev_content" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 글쓰기 액션 </title>
</head>
<body>

<%
    
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
    String today = formatter.format(new java.util.Date());
    
    out.println(today);
    out.println(rev.getRev_title());
    out.println(rev.getRev_content());
    

   if(rev.getRev_title() == null || rev.getRev_content() == null){
	   
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('내용을 입력하세요 입력이 안됐어요')");
	   script.println("history.back()");
	   script.println("</script>");

   } else {
	   
	   ReviewDaoImpl revDao = new ReviewDaoImpl();
	   int result = revDao.write(rev.getRev_title(), rev.getRev_content());

	   if (result == -1) {
		   
		   PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('글쓰기 실패요')");
		   script.println("history.back()");
		   script.println("</script>");
	   } 
   }

%>

<script type="text/javascript"> location.href="review_Board_List.do"; </script><br />

</body>
</html>