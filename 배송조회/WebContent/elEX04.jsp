<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setAttribute("name", "ȫ�浿");
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>JSP ǥ��</h3>
	<%= request.getAttribute("name") %>
	<hr>
	
	<h3>[ǥ�� ����� ���� ��ü�� ������]</h3>
	<h4>�� �����ڷ� ����</h4>
	${requestScope.name }
	<hr>
	<h4>����� �����ڷ� ����</h4>
	${requestScope["name"] }
	<hr>
</body>
</html>