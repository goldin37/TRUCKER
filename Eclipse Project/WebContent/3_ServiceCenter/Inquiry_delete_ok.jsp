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
			alert("비밀번호가 틀렸습니다.");
			history.go(-1);
		</script>
<%
	}else if(re == -1){
%>
		<script>
			alert("삭제 실패");
			history.go(-1);
		</script>
<%
	}
%>

