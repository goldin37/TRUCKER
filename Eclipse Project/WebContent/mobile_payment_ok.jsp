<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="myUtil.HanConv"%>
<%@page import = "DeliveryOrder.DeliveryOrder" %>
<%@page import = "DeliveryOrder.DeliveryOrderDB" %>
<jsp:useBean id="HanConv" class = "myUtil.HanConv"></jsp:useBean>

<%
	//�����ͺ��̽� �Է�
	//���� �� ������ �޾ƿ���
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
	String recommend_cost = (String)session.getAttribute("recommend_cost");
	String fix_cost = (String)session.getAttribute("fix_cost");
	String customer_name = HanConv.toKor((String)session.getAttribute("customer_name"));
	String customer_telephone = (String)session.getAttribute("customer_telephone");
	
	DeliveryOrder.DeliveryOrderDB db = DeliveryOrder.DeliveryOrderDB.getInstance();
	int result = db.createOrder(truck_type, cargo_type, cargo_weight, cargo_help, cargo_spec, from_where, from_spec, depart_time, to_where, to_spec, distance, time, ETA, recommend_cost, fix_cost, customer_name, customer_telephone);
	//�����ͺ��̽� �Է� �����ϸ� ���� ������
	if(result == 0){
		 response.sendRedirect("order_failed.jsp");
	}
		
	//�����ͺ��̽� �Է� �����ϸ� ���� ������ ����, ���ڸ޽��� �ְ�, �˾�â �ݱ�
	else if(result != 0){
		session.setAttribute("order_id", result);
		response.sendRedirect("order_complete.jsp");
	}
%>
