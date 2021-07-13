<%@page import="myUtil.DeliveryOrderDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	DeliveryOrderDB db = DeliveryOrderDB.getInstance();
	String id = request.getParameter("driver_id");
	int re = db.completeOrder(id);
	System.out.println(re);
	if(re == 1 ){
%>
			<script>
					alert("배송을 완료하셨습니다.");
					document.location.href="mypage.jsp"
			</script>					
<%
		}else{
%>
			<script>
					alert("배송을 완료하지 못했습니다. \n 이전으로 돌아갑니다.");
					document.location.href="mypage.jsp"
			</script>					
<%
			System.out.println("오류발생 오류발생");
	}
%>


			