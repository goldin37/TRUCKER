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
					alert("배송을 취소하셨습니다.");
					document.location.href="mypage.jsp"
			</script>		
<%
	}else{
%>
			<script>
					alert("취소하지 못했습니다.\n 이전으로 돌아갑니다.");
					history.go(-1);
			</script>
<%
	}
%>

				
