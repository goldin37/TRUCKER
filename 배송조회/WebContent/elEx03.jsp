<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>[액션 태그와 표현 언어]</h3>
	<jsp:useBean id="user" class="glory.User"></jsp:useBean>
	1<br>
	<jsp:getProperty property="firstName" name="user"/>
	<jsp:getProperty property="lastName" name="user"/>
	<hr>
	
 	<jsp:setProperty property="firstName" name="user" value="Gildong"/>
	<jsp:setProperty property="lastName" name="user" value="Hong"/>
	
	2<br>
	<jsp:getProperty property="firstName" name="user"/>
	<jsp:getProperty property="lastName" name="user"/>
	<hr>
	
	3<br>
	${user.firstName }
	${user.lastName }
</body>
</html>