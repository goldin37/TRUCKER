<%@page import="board.FAQDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="faq" class="board.FAQ"></jsp:useBean>
<jsp:setProperty property="*" name="faq"/>
<%
	FAQDB db = FAQDB.getInstance();
	int re = db.editBoard(faq);
	
	if(re == 1){
		response.sendRedirect("M-FAQ_main.jsp");
	} else if(re == 0){
%>
		<script>
			alert("��������");
			history.go(-1);
		</script>
<%
	} else if(re == -1){
%>

		<script>
			alert("��������");
			history.go(-1);
		</script>
<% 
	}
%>