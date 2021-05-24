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
			var answer = confirm("배송을 진행하시겠습니까?");
			if(answer == true){
				alert("배송을 선택하셨습니다.");
				document.location.href="orderlist.jsp"
			}else{
				alert("배송을 선택하시지 않았습니다. \n 글목록으로 돌아갑니다.");
				document.location.href="orderlist.jsp"
				
			}
		</script>
		<%
	}





%>