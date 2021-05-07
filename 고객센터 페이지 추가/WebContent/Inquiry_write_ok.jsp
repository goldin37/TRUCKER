<%@page import="java.sql.Timestamp"%>
<%@page import="board.InquiryDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="inquiry" class="board.Inquiry"></jsp:useBean>
<jsp:setProperty property="*" name="inquiry"/>

<%
	inquiry.setInquiry_date(new Timestamp(System.currentTimeMillis()));
	InquiryDB inq = InquiryDB.getInstance();
	
	int re = inq.insertBoard(inquiry);
	if(re == 1){
	   response.sendRedirect("Notice_main.jsp");
	}else{
	   response.sendRedirect("Inquiry_write.jsp");
	}
 %>