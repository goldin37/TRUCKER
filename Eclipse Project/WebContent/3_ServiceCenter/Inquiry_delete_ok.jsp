<%@page import="board.InquiryDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int inquiry_number = Integer.parseInt(request.getParameter("inquiry_number"));
	String inquiry_pwd = request.getParameter("inquiry_pwd");

	InquiryDB inq = InquiryDB.getInstance();
	int re = inq.deleteBoard(inquiry_number, inquiry_pwd);
	
	if(re == 1){
		response.sendRedirect("Notice_main.jsp");
	} else if(re == 0){
%>
		<script>
			alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
			history.go(-1);
		</script>
<%
	}else if(re == -1){
%>
		<script>
			alert("���� ����");
			history.go(-1);
		</script>
<%
	}
%>

