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
			alert("배송을 완료하셨습니다.");
		</script>
<%
		response.sendRedirect("mypage.jsp");		
	}else{
%>
		<script>
			alert("배송완료못하였습니다.\n 배송을 계속 진행합니다.");
		</script>
<%
		response.sendRedirect("mypage.jsp");		
	}
%>