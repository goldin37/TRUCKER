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
					alert("배송을 선택하셨습니다.");
					document.location.href="mypage.jsp"
			</script>					
<%
		}else{
%>
			<script>
					alert("선택하지 못했습니다.\n 목록으로 돌아갑니다.");
					history.go(-1);
			</script>
<%
		}
%>