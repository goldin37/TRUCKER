<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="Driver.DriverBean"%>
<%@page import="Driver.DriverDBBean"%>
<%@page import="myUtil.HanConv"%>
<%@page import="com.jspsmart.upload.File"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- <jsp:useBean id="trucker" class="trucker.TruckerBean"></jsp:useBean>
<jsp:setProperty property="*" name="trucker"/>
--%>
<%	
	String path = request.getRealPath("images");
	int size = 1024* 1024 *10;
	String file ="";
	
	
	MultipartRequest multi = new MultipartRequest(request, path, size, "EUC-KR", new DefaultFileRenamePolicy());
	//같은 이름의 파일을 알아서 번호를 매겨줌
	Enumeration files = multi.getFileNames();
	String str = (String)files.nextElement();
	
	file = multi.getFilesystemName(str);
	
	DriverDBBean db = DriverDBBean.getInstance();
	DriverBean trucker = new DriverBean();
	//한글화가 안됨 
	trucker.setDriver_id(multi.getParameter("driver_id"));
	trucker.setDriver_pwd(multi.getParameter("driver_pwd"));
	trucker.setDriver_jumin(multi.getParameter("jumin1")+multi.getParameter("jumin2")  );
	trucker.setDriver_license(multi.getParameter("driver_license"));
	trucker.setDriver_pwd_check(multi.getParameter("driver_pwd_check"));
	trucker.setDriver_name(multi.getParameter("driver_name"));
	trucker.setDriver_phone_number(multi.getParameter("phone1")+multi.getParameter("phone2")+multi.getParameter("phone3"));
	trucker.setDriver_addr(multi.getParameter("addr1") +multi.getParameter("addr2"));
	trucker.setDriver_email(multi.getParameter("email1")+multi.getParameter("email2"));
	trucker.setDriver_position(multi.getParameter("driver_position"));
	trucker.setTruck_type(multi.getParameter("truck_type"));
	trucker.setTruck_number(multi.getParameter("truck_number"));
	trucker.setDriver_photo(file);
	
	if(db.confirmID(trucker.getDriver_id()) == 1){
%>
		<script>
			alert("중복되는 아이디가 존재합니다.");
			history.go(-1);
		</script>
<%
	}else{
		int re = db.insertDriver(trucker);
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