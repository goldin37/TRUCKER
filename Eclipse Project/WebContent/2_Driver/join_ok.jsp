<%@page import="Driver.DriverDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="driver" class="Driver.DriverBean"></jsp:useBean>
<jsp:setProperty property="*" name="driver"/>
<%
	DriverDBBean db = DriverDBBean.getInstance();
	
	if(db.confirmID(driver.getDriver_id()) == 1){
%>
		<script>
			alert("�ߺ��Ǵ� ���̵� �����մϴ�.");
			history.go(-1);
		</script>
<%
	}else{
		int re = db.insertDriver(driver);
		//ȸ�������ϴ� ��� ������ insert�ؾ���.
		if(re ==1){
%>
		<script>
			alert("ȸ�������� ���ϵ帳�ϴ�. \n ȸ������ �α��� ���ּ���.");
			document.location.href="login.html";
		</script>
<%
		}else{ //insert�� ������ ���� ��
%>
		<script>
			alert("ȸ�������� �����߽��ϴ�.");
			document.location.href="login.html";
		</script>
<%
		}
	}
%>