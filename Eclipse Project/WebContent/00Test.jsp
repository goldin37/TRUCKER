<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="DeliveryOrder.GeoCode"%>
<%@page import="DeliveryOrder.Directions5"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	Directions5 dir = new Directions5();
	dir.Direction("�λ� ���� ���Ϸ� 41", "���� �߱� ������� 110", "1ton", 1000, "drive_only", LocalDateTime.now().toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>