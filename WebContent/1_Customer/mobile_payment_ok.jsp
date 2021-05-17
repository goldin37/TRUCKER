<%@page import="SENS.Send"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="myUtil.HanConv"%>
<%@page import = "myUtil.DeliveryOrder" %>
<%@page import = "myUtil.DeliveryOrderDB" %>
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
	String recommend_cost = session.getAttribute("recommend_cost").toString();
	String fix_cost = session.getAttribute("fix_cost").toString();
	String customer_name = HanConv.toKor((String)session.getAttribute("customer_name"));
	String customer_telephone = (String)session.getAttribute("customer_telephone");

	DeliveryOrderDB db = DeliveryOrderDB.getInstance();
	int result = db.createOrder(truck_type, cargo_type, cargo_weight, cargo_help, cargo_spec, from_where, from_spec, depart_time, to_where, to_spec, distance, time, ETA, recommend_cost, fix_cost, customer_name, customer_telephone);
	//�����ͺ��̽� �Է� �����ϸ� ���� ������
	if(result == 0){
		 response.sendRedirect("order_failed.jsp");
	}
		
	//�����ͺ��̽� �Է� �����ϸ� ���� ������ ����, ���ڸ޽��� �ְ�, �˾�â �ݱ�
	else if(result != 0){
		session.setAttribute("order_id", result);
		response.sendRedirect("order_complete.jsp");
		Send.LMS(customer_telephone
				, customer_name + "���� �ֹ��� �Ϸ�Ǿ����ϴ�.\n"
				+ "��۹�ȣ : " + result + "\n"
				+ "���� : " + truck_type + "\n"
				+ "��� : " + from_where + from_spec + "\n"
				+ depart_time.substring(0, 16) + "\n"
				+ "���� : " + to_where + to_spec + "\n"
				+ "��۹�ȣ�� Ȩ���������� ���¸� ��ȸ�Ͻ� �� �ֽ��ϴ�.\n"
				+ "������ �Ϸ�Ǹ� ���ڸ޽����� �ȳ� �帮�ڽ��ϴ�.\n"
				+ "���� �� �ִ� ȭ���߰� �÷���, Ʈ��Ŀ"
				, "ncp:sms:kr:262195421504:message_sender", "1zB1FNZZofZBbLlwgesB", "wRREJhsLJRf46hyM28laTvoqp5yIpnndEuRYeM9A");
	}
%>
