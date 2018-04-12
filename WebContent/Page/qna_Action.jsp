<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>


<%@ page import = "dao.adminDao.QnaListDaoImpl" %>
<%@ page import = "java.util.*, java.text.*"  %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="qna" class ="dto.Qna" scope = "page"></jsp:useBean>

<jsp:setProperty name="qna" property="qnaTitle" />
<jsp:setProperty name="qna" property="qnaContents" />
<jsp:setProperty name="qna" property="qnaCate" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 글쓰기 액션 </title>
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

	if (qna.getQnaTitle() == null || qna.getQnaContents() == null) {

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('내용을 입력하세요 입력이 안됐어요')");
		script.println("history.back()");
		script.println("</script>");

	} else {

		QnaListDaoImpl qnaDao = new QnaListDaoImpl();
		int result = qnaDao.insertQna(qna.getQnaTitle(), qna.getQnaContents(), now_id, qna.getQnaCate());

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