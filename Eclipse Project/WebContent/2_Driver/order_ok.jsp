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
			var answer = confirm("배송을 진행하시겠습니까?");
			if(answer == true){
				db.startOrder(deliveryorder);
				alert("배송을 선택하셨습니다.");	 
				document.location.href="mypage.jsp"
			}else { 
				alert("배송을 선택하시지 않았습니다. \n 글목록으로 돌아갑니다.");
				document.location.href="orderlist.jsp"
			}
		</script>
