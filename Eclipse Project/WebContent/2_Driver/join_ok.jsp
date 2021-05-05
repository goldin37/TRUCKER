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
			alert("중복되는 아이디가 존재합니다.");
			history.go(-1);
		</script>
<%
	}else{
		int re = db.insertDriver(driver);
		//회원가입하는 경우 때문에 insert해야함.
		if(re ==1){
%>
		<script>
			alert("회원가입을 축하드립니다. \n 회원으로 로그인 해주세요.");
			document.location.href="login.html";
		</script>
<%
		}else{ //insert에 문제가 있을 시
%>
		<script>
			alert("회원가입을 실패했습니다.");
			document.location.href="login.html";
		</script>
<%
		}
	}
%>