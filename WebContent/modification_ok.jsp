<%@page import="Driver.DriverBean"%>
<%@page import="Driver.DriverDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="driver" class="Driver.DriverBean"></jsp:useBean>
<jsp:setProperty property="*" name="driver"/>
<%
	String id = (String)session.getAttribute("id");
	driver.setDriver_id(id); // session�� �ִ� id�� �޾ƿ�.
	driver.setDriver_phone_number(request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3"));
	driver.setDriver_email(request.getParameter("email1")+request.getParameter("email2"));
	
	DriverDBBean db = DriverDBBean.getInstance();
	DriverBean tb = db.getDriver(id); // ���� ������
	
	int re = db.updateDriver(driver);
	
	if(re == 1){ // ����� ����Ǿ��� ��
		String name = tb.getDriver_name(); // �̸� ��� - >name
		String phone =tb.getDriver_phone_number(); // ��ȭ��ȣ
		String license = tb.getDriver_license(); // ����
		String truck_type = tb.getTruck_type(); //��������
		String truck_number = tb.getTruck_number(); // ������ȣ
		
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		session.setAttribute("phone", phone);
		session.setAttribute("license", license);
		session.setAttribute("truck_type", truck_type);
		session.setAttribute("truck_number", truck_number);
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