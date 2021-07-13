<%@page import="Driver.DriverBean"%>
<%@page import="Driver.DriverDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="driver" class="Driver.DriverBean"></jsp:useBean>
<jsp:setProperty property="*" name="driver"/>
<%
	String id = (String)session.getAttribute("id");
	driver.setDriver_id(id); // session에 있는 id값 받아옴.
	driver.setDriver_phone_number(request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3"));
	driver.setDriver_email(request.getParameter("email1")+request.getParameter("email2"));
	driver.setDriver_addr(request.getParameter("addr1") + request.getParameter("addr2"));
	DriverDBBean db = DriverDBBean.getInstance();
	DriverBean tb = db.getDriver(id); // 값을 가져옴
	
	int re = db.updateDriver(driver);
	
	if(re == 1){ // 제대로 진행되었을 때
%>
		<script>
			alert("입력하신대로 회원 정보가 수정되었습니다.\n 다시 로그인 해주세요");
			document.location.href="logOut.jsp";//수정완료했을 때 로그아웃으로 이동
		</script>		
<%
	}else{
%>
		<script>
			alert("수정을 실패하였습니다.");
			history.back();
		</script>
<%
	}
%>