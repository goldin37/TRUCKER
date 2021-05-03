<%@page import="board.FAQDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int faq_number = Integer.parseInt(request.getParameter("faq_number"));

	FAQDB db=FAQDB.getInstance();
	int re = db.deleteBoard(faq_number);
	
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
