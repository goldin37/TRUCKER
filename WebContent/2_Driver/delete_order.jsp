<%@page import="myUtil.DeliveryOrderDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="deliveryorder" class="myUtil.DeliveryOrder"></jsp:useBean>
<jsp:setProperty property="*" name="deliveryorder"/>
<%
	DeliveryOrderDB db = DeliveryOrderDB.getInstance();
	String id = request.getParameter("driver_id");
	if(db.deleteOrder(id) == 1 ){
%>
			<script>
					alert("����� ����ϼ̽��ϴ�.");
					document.location.href="mypage.jsp"
			</script>		
<%
	}else{
%>
			<script>
					alert("������� ���߽��ϴ�.\n �������� ���ư��ϴ�.");
					history.go(-1);
			</script>
<%
	}
%>

				
