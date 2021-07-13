<%@page import="board.InquiryDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="inquiry" class="board.Inquiry"></jsp:useBean>
<jsp:setProperty property="*" name="inquiry"/>
<%
	InquiryDB inq= InquiryDB.getInstance();
	int re = inq.editBoard(inquiry);
	
	if(re == 1){
		response.sendRedirect("Notice_main.jsp");
	}else if(re == 0){
%>
		<script language="JavaScript" >
			alert("비밀번호가 틀렸습니다.");
			history.go(-1);
		</script>
<%
	}else if(re == -1){
%>
		<script language="JavaScript" >
			alert("수정 실패");
			history.go(-1);
		</script>
<%
	}
%>

