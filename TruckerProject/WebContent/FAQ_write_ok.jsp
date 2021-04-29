<%@page import="java.sql.Timestamp"%>
<%@page import="board.FAQDB" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="faq" class="board.FAQ"></jsp:useBean>
<jsp:setProperty property="*" name="faq"/>

<%
	FAQDB db = FAQDB.getInstance();
	
	int re = db.insertBoard(faq);
	if(re == 1){
	   response.sendRedirect("M-FAQ_main.jsp");
	}else{
	   response.sendRedirect("FAQ_write.jsp");
	}
 %>