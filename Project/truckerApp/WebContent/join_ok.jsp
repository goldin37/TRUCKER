<%@page import="trucker.TruckerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="trucker" class="trucker.TruckerBean"></jsp:useBean>
<jsp:setProperty property="*" name="trucker"/>
<%
	TruckerDBBean db = TruckerDBBean.getInstance();
	
	if(db.confirmID(trucker.getDriver_id()) == 1){
%>
		<script>
			alert("�ߺ��Ǵ� ���̵� �����մϴ�.");
			history.go(-1);
		</script>
<%
	}else{
		int re = db.insertTrucker(trucker);
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