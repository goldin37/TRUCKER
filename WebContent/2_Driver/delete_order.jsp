<%@page import="myUtil.DeliveryOrderDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="deliveryorder" class="myUtil.DeliveryOrder"></jsp:useBean>
<jsp:setProperty property="*" name="deliveryorder"/>
<%
	DeliveryOrderDB db = DeliveryOrderDB.getInstance();
%>
		<script>
			var answer = confirm("����� ����Ͻðڽ��ϱ�?");
			if(answer == true){
				alert("����� ����ϼ̽��ϴ�.");
				db.deleteOrder(deliveryorder);
				history.go(-1);				
			}else{
				alert("����� �����Ͻ��� �ʾҽ��ϴ�. \n �۸������ ���ư��ϴ�.");
				history.go(-1);				
			}
		</script>
