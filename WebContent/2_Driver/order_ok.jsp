<%@page import="java.sql.Timestamp"%>
<%@page import="myUtil.DeliveryOrderDB"%>
<%@page import="myUtil.DeliveryOrder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="deliveryorder" class="myUtil.DeliveryOrder"></jsp:useBean>
<jsp:setProperty property="*" name="deliveryorder"/>
<%
		DeliveryOrderDB db = DeliveryOrderDB.getInstance();
		
		int re = db.startOrder(deliveryorder);
		String id = request.getParameter("driver_id");
		int order_id = Integer.parseInt(request.getParameter("order_id"));
		
		if(re ==1){
%>
			<script>
					alert("����� �����ϼ̽��ϴ�.");
					document.location.href="mypage.jsp"
			</script>					
<%
		}else{
%>
			<script>
					alert("�������� ���߽��ϴ�.\n ������� ���ư��ϴ�.");
					history.go(-1);
			</script>
<%
		}
%>