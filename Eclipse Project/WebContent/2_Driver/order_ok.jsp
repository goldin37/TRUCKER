<%@page import="java.sql.Timestamp"%>
<%@page import="myUtil.DeliveryOrderDB"%>
<%@page import="myUtil.DeliveryOrder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="deliveryorder" class="myUtil.DeliveryOrder"></jsp:useBean>
<jsp:setProperty property="*" name="deliveryorder"/>
<%
	
	DeliveryOrderDB db = DeliveryOrderDB.getInstance();
	String id = request.getParameter("driver_id");
	int order_id = Integer.parseInt(request.getParameter("order_id"));
	
	Timestamp depart_time = deliveryorder.getDepart_time();
	String customer_name = deliveryorder.getCustomer_name();
	String cargo_type = deliveryorder.getCargo_type();
	int cargo_weight = deliveryorder.getCargo_weight();
	String from_where = deliveryorder.getFrom_where()+deliveryorder.getFrom_spec();
	String to_where = deliveryorder.getTo_where() + deliveryorder.getTo_spec();
	String cargo_help = deliveryorder.getCargo_help();
	int fix_cost = deliveryorder.getFix_cost();
	

%>
		<script>
			var answer = confirm("����� �����Ͻðڽ��ϱ�?");
			if(answer == true){
				db.startOrder(deliveryorder);
				alert("����� �����ϼ̽��ϴ�.");	 
				document.location.href="mypage.jsp"
			}else { 
				alert("����� �����Ͻ��� �ʾҽ��ϴ�. \n �۸������ ���ư��ϴ�.");
				document.location.href="orderlist.jsp"
			}
		</script>
