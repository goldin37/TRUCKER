<%@page import="SENS.Send"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="myUtil.HanConv"%>
<%@page import = "myUtil.DeliveryOrder" %>
<%@page import = "myUtil.DeliveryOrderDB" %>
<jsp:useBean id="HanConv" class = "myUtil.HanConv"></jsp:useBean>

<%
	//데이터베이스 입력
	//세션 값 변수로 받아오기
	String truck_type = (String)session.getAttribute("truck_type");
	String cargo_type = (String)session.getAttribute("cargo_type");
	String cargo_weight = (String)session.getAttribute("cargo_weight");
	String cargo_help = (String)session.getAttribute("cargo_help");
	String cargo_spec = HanConv.toKor((String)session.getAttribute("cargo_spec"));
	String from_where = HanConv.toKor((String)session.getAttribute("from_where"));
	String from_spec = HanConv.toKor((String)session.getAttribute("from_spec"));
	String depart_time = (String)session.getAttribute("depart_time");
	String to_where = HanConv.toKor((String)session.getAttribute("to_where"));
	String to_spec = HanConv.toKor((String)session.getAttribute("to_spec"));
	String distance = (String)session.getAttribute("distance");
	String time = HanConv.toKor((String)session.getAttribute("time"));
	String ETA = HanConv.toKor((String)session.getAttribute("ETA"));
	String recommend_cost = session.getAttribute("recommend_cost").toString();
	String fix_cost = session.getAttribute("fix_cost").toString();
	String customer_name = HanConv.toKor((String)session.getAttribute("customer_name"));
	String customer_telephone = (String)session.getAttribute("customer_telephone");

	DeliveryOrderDB db = DeliveryOrderDB.getInstance();
	int result = db.createOrder(truck_type, cargo_type, cargo_weight, cargo_help, cargo_spec, from_where, from_spec, depart_time, to_where, to_spec, distance, time, ETA, recommend_cost, fix_cost, customer_name, customer_telephone);
	//데이터베이스 입력 실패하면 실패 페이지
	if(result == 0){
		 response.sendRedirect("order_failed.jsp");
	}
		
	//데이터베이스 입력 성공하면 성공 페이지 띄우고, 문자메시지 주고, 팝업창 닫기
	else if(result != 0){
		session.setAttribute("order_id", result);
		response.sendRedirect("order_complete.jsp");
		Send.LMS(customer_telephone
				, customer_name + "님의 주문이 완료되었습니다.\n"
				+ "운송번호 : " + result + "\n"
				+ "차량 : " + truck_type + "\n"
				+ "출발 : " + from_where + from_spec + "\n"
				+ depart_time.substring(0, 16) + "\n"
				+ "도착 : " + to_where + to_spec + "\n"
				+ "운송번호로 홈페이지에서 상태를 조회하실 수 있습니다.\n"
				+ "배차가 완료되면 문자메시지로 안내 드리겠습니다.\n"
				+ "믿을 수 있는 화물중개 플랫폼, 트러커"
				, "ncp:sms:kr:262195421504:message_sender", "1zB1FNZZofZBbLlwgesB", "wRREJhsLJRf46hyM28laTvoqp5yIpnndEuRYeM9A");
	}
%>
