<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>


<%@ page import = "dao.AskDaoImpl" %>
<%@ page import = "java.util.*, java.text.*"  %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="ask" class ="dto.Ask" scope = "page"></jsp:useBean>

<jsp:setProperty name="ask" property="ask_title" />
<jsp:setProperty name="ask" property="ask_content" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 문의하기 액션 </title>
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

	if (ask.getAsk_title() == null || ask.getAsk_content() == null) {

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('내용을 입력하세요 입력이 안됐어요')");
		script.println("history.back()");
		script.println("</script>");

	} else {

		AskDaoImpl askDao = new AskDaoImpl();
		int result = askDao.ask(ask.getAsk_title(), ask.getAsk_content(), now_id);

		if (result == -1) {

			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기 실패')");
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
%>

</body>
</html>