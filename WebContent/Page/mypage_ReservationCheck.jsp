<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
		if(session.getAttribute("id") == null){
			response.sendRedirect("login.jsp");
		}else{
			String id = session.getAttribute("id").toString();

		
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lazencar | 믿음을 주는 고품격 카셰어링</title>

<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<title>요금안내 &lt; 라젠카 소개</title>

</head>

<body>
	<!-- 	select text input 스크립트  start -->
	<script type="text/javascript">
	$(document).ready(function(){
		var $form = $("<form>").attr("action","/reservCheck.do").attr("method", "post");
		$form.appendTo($(document.body));
		$form.submit();
	});
	
 	</script>
	<!-- 	select text input 스크립트  end -->

</body>

</html>
<%}%>