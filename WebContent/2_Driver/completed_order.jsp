<%@page import="myUtil.DeliveryOrderDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="deliveryorder" class="myUtil.DeliveryOrder"></jsp:useBean>
<jsp:setProperty property="*" name="deliveryorder"/>
<%
	DeliveryOrderDB db = DeliveryOrderDB.getInstance();
	String id = request.getParameter("driver_id");
	System.out.println(id);
	if(db.completeOrder(id) == 1 ){
%>
		<script>
			alert("����� �Ϸ��ϼ̽��ϴ�.");
		</script>
<%
		response.sendRedirect("mypage.jsp");		
	}else{
%>
		<script>
			alert("��ۿϷ���Ͽ����ϴ�.\n ����� ��� �����մϴ�.");
		</script>
<%
		response.sendRedirect("mypage.jsp");		
	}
%>