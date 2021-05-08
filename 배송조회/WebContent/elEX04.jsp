<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setAttribute("name", "홍길동");
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>JSP 표현</h3>
	<%= request.getAttribute("name") %>
	<hr>
	
	<h3>[표현 언어의 내장 객체와 접근자]</h3>
	<h4>닷 연산자로 접근</h4>
	${requestScope.name }
	<hr>
	<h4>브라켓 연산자로 접근</h4>
	${requestScope["name"] }
	<hr>
</body>
</html>