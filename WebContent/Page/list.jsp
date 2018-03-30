<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <div class="container"> -->
<div class="container" >

<table class="table table-striped table-hover">
<thead>
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" begin="0" end="${paging.listCount }" var="i">
	<tr>
		<td><a href="#">${i.rev_num }</a></td>
		<td><a href="#">${i.rev_title }</a></td>
		<td>${i.rev_userId }</td>
		<td>${i.rev_hit }</td>
		<td>${i.rev_date }</td>
	</tr>
</c:forEach>
</tbody>
</table>

<%-- 페이징 불러오기 --%>
<jsp:include page="/Page/paging.jsp" />

</div>
</body>
</html>