<%@page import="myUtil.DeliveryOrderDB"%>
<%@page import="myUtil.DeliveryOrder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="deliveryorder" class="myUtil.DeliveryOrder"></jsp:useBean>
<jsp:setProperty property="*" name="deliveryorder"/>
<%
	DeliveryOrderDB db = DeliveryOrderDB.getInstance();

	int re = db.startOrder(deliveryorder);

	
	if(re == 1 ){
		%>
		<script>
			var answer = confirm("����� �����Ͻðڽ��ϱ�?");
			if(answer == true){
				alert("����� �����ϼ̽��ϴ�.");
				document.location.href="orderlist.jsp"
			}else{
				alert("����� �����Ͻ��� �ʾҽ��ϴ�. \n �۸������ ���ư��ϴ�.");
				document.location.href="orderlist.jsp"
				
			}
		</script>
		<%
	}





%>