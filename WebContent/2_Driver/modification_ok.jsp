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
	driver.setDriver_addr(request.getParameter("addr1") + request.getParameter("addr2"));
	DriverDBBean db = DriverDBBean.getInstance();
	DriverBean tb = db.getDriver(id); // ���� ������
	
	int re = db.updateDriver(driver);
	
	if(re == 1){ // ����� ����Ǿ��� ��
%>
		<script>
			alert("�Է��ϽŴ�� ȸ�� ������ �����Ǿ����ϴ�.\n �ٽ� �α��� ���ּ���");
			document.location.href="logOut.jsp";//�����Ϸ����� �� �α׾ƿ����� �̵�
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