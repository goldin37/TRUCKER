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
	//���� �̸��� ������ �˾Ƽ� ��ȣ�� �Ű���
	Enumeration files = multi.getFileNames();
	String str = (String)files.nextElement();
	
	file = multi.getFilesystemName(str);
	
	DriverDBBean db = DriverDBBean.getInstance();
	DriverBean trucker = new DriverBean();
	//�ѱ�ȭ�� �ȵ� 
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
			alert("�ߺ��Ǵ� ���̵� �����մϴ�.");
			history.go(-1);
		</script>
<%
	}else{
		int re = db.insertDriver(trucker);
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