<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%= session.getAttribute("truck_type") %>
<%= session.getAttribute("cargo_type") %>
<%= session.getAttribute("cargo_weight") %>
<%= session.getAttribute("cargo_help") %>
<%= session.getAttribute("cargo_spec") %>
<%= session.getAttribute("from_where") %>
<%= session.getAttribute("from_spec") %>
<%= session.getAttribute("depart_time") %>
<%= session.getAttribute("to_where") %>
<%= session.getAttribute("to_spec") %>
<%= session.getAttribute("distance") %>
<%= session.getAttribute("time") %>
<%= session.getAttribute("ETA") %>
<%= session.getAttribute("recommend_cost") %>
<%= session.getAttribute("fix_cost") %>
<%= session.getAttribute("customer_name") %>
<%= session.getAttribute("customer_telephone") %>
</body>
</html>