<%@page import="myUtil.DeliveryOrderDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="deliveryorder" class="myUtil.DeliveryOrder"></jsp:useBean>
<jsp:setProperty property="*" name="deliveryorder"/>
<%
	DeliveryOrderDB db = DeliveryOrderDB.getInstance();
%>
		<script>
			var answer = confirm("배송을 취소하시겠습니까?");
			if(answer == true){
				alert("배송을 취소하셨습니다.");
				db.deleteOrder(deliveryorder);
				history.go(-1);				
			}else{
				alert("배송을 선택하시지 않았습니다. \n 글목록으로 돌아갑니다.");
				history.go(-1);				
			}
		</script>
