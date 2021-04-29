<%@page import="java.sql.Timestamp"%>
<%@page import="board.NoticeDB" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="notice" class="board.Notice"></jsp:useBean>
<jsp:setProperty property="*" name="notice"/>

<%
	notice.setNotice_date(new Timestamp(System.currentTimeMillis()));
	NoticeDB nd = NoticeDB.getInstance();
	
	int re = nd.insertBoard(notice);
	if(re == 1){
	   response.sendRedirect("M-Notice_main.jsp");
	}else{
	   response.sendRedirect("Notice_write.jsp");
	}
 %>