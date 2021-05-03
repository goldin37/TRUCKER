<%@page import="board.NoticeDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="notice" class="board.Notice"></jsp:useBean>
<jsp:setProperty property="*" name="notice"/>
<%
	NoticeDB db=NoticeDB.getInstance();
	int re = db.editBoard(notice);
	
	if(re == 1){
		response.sendRedirect("M-Notice_main.jsp");
	} else if(re == 0){
%>
		<script>
			alert("수정실패");
			history.go(-1);
		</script>
<%
	} else if(re == -1){
%>

		<script>
			alert("수정실패");
			history.go(-1);
		</script>
<% 
	}
%>