<%@page import="SENS.Send"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%= "truck_type " + session.getAttribute("truck_type") %>
<%= "cargo_type " + session.getAttribute("cargo_type") %>
<%= "cargo_weight " + session.getAttribute("cargo_weight") %>
<%= "cargo_help " + session.getAttribute("cargo_help") %>
<%= "cargo_spec " + session.getAttribute("cargo_spec") %>
<%= "from_where " + session.getAttribute("from_where") %>
<%= "from_spec " + session.getAttribute("from_spec") %>
<%= "depart_time " + session.getAttribute("depart_time") %>
<%= "to_where " + session.getAttribute("to_where") %>
<%= "to_spec " + session.getAttribute("to_spec") %>
<%= "distance " + session.getAttribute("distance") %>
<%= "time " + session.getAttribute("time") %>
<%= "ETA " + session.getAttribute("ETA") %>
<%= "recommend_cost " + session.getAttribute("recommend_cost") %>
<%= "fix_cost " + session.getAttribute("fix_cost") %>
<%= "customer_name " + session.getAttribute("customer_name") %>
<%= "customer_telephone " + session.getAttribute("customer_telephone") %>
<%
	Send.SMS("01048516339", "메시지 잘 보내지나요??", "ncp:sms:kr:262195421504:message_sender", "1zB1FNZZofZBbLlwgesB", "wRREJhsLJRf46hyM28laTvoqp5yIpnndEuRYeM9A");
%>
</body>
</html>