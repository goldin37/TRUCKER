<%@page import="Driver.DriverBean"%>
<%@page import="Driver.DriverDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="driver" class="Driver.DriverBean"></jsp:useBean>
<jsp:setProperty property="*" name="driver"/>
<%
	String id = (String)session.getAttribute("id");
	driver.setDriver_id(id); // session�� �ִ� id�� �޾ƿ�.
	
	DriverDBBean db = DriverDBBean.getInstance();
	DriverBean tb = db.getDriver(id); // ���� ������
	
	int re = db.updateDriver(driver);
	
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