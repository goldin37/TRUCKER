<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	pageContext.setAttribute("input", "");
	pageContext.setAttribute("input2", "aaa");
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>[표현 언어의 연산자]</h3><br>
	\${empty input} : ${empty input}<br>
	\${empty input2} : ${empty input2}<br>
	\${empty ""} : ${empty ""}<br>
	\${empty "zzz"} : ${empty "zzz"}<br>
	\${(5 > 2) ? 5 : 2} : ${(5 > 2) ? 5 : 2}<br>
	\${2 gt 10} : ${2 gt 10}<br>
	
	\${5 + 2} : ${5 + 2}<br>
	\${5 / 2} : ${5 / 2}<br>
	\${5 % 2} : ${5 % 2}<br>
	\${5 mod 2} : ${5 mod 2}<br>
	\${5 > 2} : ${5 > 2}<br>
</body>
</html>