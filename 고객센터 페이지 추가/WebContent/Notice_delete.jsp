<%@page import="board.NoticeDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int notice_number = Integer.parseInt(request.getParameter("notice_number"));

	NoticeDB db=NoticeDB.getInstance();
	int re = db.deleteBoard(notice_number);
	
	if(re == 1){
		response.sendRedirect("M-Notice_main.jsp");
		
	}else if(re == 0){
%>
		<script>
			alert("오류");
			history.go(-1);
		</script>
<%
	}else if(re == -1){
%>
		<script>
			alert("오류");
			history.go(-1);
		</script>
<%
	}
%>
