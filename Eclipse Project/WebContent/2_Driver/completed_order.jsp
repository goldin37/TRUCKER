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
					alert("����� �Ϸ��ϼ̽��ϴ�.");
					document.location.href="mypage.jsp"
			</script>					
<%
		}else{
%>
			<script>
					alert("����� �Ϸ����� ���߽��ϴ�. \n �������� ���ư��ϴ�.");
					document.location.href="mypage.jsp"
			</script>					
<%
			System.out.println("�����߻� �����߻�");
	}
%>


			