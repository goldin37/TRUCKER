<%@page import="trucker.TruckerBean"%>
<%@page import="trucker.TruckerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="trucker" class="trucker.TruckerBean"></jsp:useBean>
<jsp:setProperty property="*" name="trucker"/>
<%
	String id = (String)session.getAttribute("id");
	trucker.setDriver_id(id); // session�� �ִ� id�� �޾ƿ�.
	
	TruckerDBBean db = TruckerDBBean.getInstance();
	TruckerBean tb = db.getTrucker(id); // ���� ������
	
	int re = db.updateTrucker(trucker);
	
	if(re == 1){ // ����� ����Ǿ��� ��
		String name = tb.getDriver_name(); // �̸� ��� - >name
		String phone =tb.getDriver_phone_number(); // ��ȭ��ȣ
		String license = tb.getDriver_license(); // ����
		String truck_type = tb.getTruck_type(); //��������
		String truck_number = tb.getTruck_number(); // ������ȣ
%>
		<script>
			alert("�Է��ϽŴ�� ȸ�� ������ �����Ǿ����ϴ�.");
			document.location.href="mypage.jsp";//�����Ϸ����� �� ������������ �̵�
		</script>		
<%
	}else{
%>
		<script>
			alert("������ �����Ͽ����ϴ�.");
			history.back();
		</script>
<%
	}
%>