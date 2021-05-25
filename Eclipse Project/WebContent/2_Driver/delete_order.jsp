<%@page import="myUtil.DeliveryOrderDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="deliveryorder" class="myUtil.DeliveryOrder"></jsp:useBean>
<jsp:setProperty property="*" name="deliveryorder"/>
<%
	DeliveryOrderDB db = DeliveryOrderDB.getInstance();
	String id = request.getParameter("driver_id");
	System.out.println(id);
	if(db.deleteOrder(id) == 1 ){
%>
		<script>
			alert("배송을 취소하셨습니다.");
		</script>
<%
		response.sendRedirect("mypage.jsp");		
	}else{
%>
		<script>
			alert("배송을 취소하지 못하였습니다.");
		</script>
<%
		response.sendRedirect("mypage.jsp");		
	}
%>
		
				
