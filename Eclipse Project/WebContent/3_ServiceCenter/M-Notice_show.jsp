<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="board.Notice"%>
<%@page import="board.NoticeDB"%>
<%
	String pageNum = request.getParameter("pageNum");

	int bid = Integer.parseInt(request.getParameter("notice_number"));
	NoticeDB db = NoticeDB.getInstance();
	Notice notice = db.getBoard(bid, true);
	
	int notice_number = 0, notice_hit = 0;
	String notice_title = "", notice_content = "";
	Timestamp notice_date = null;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");

	if(notice != null){
		notice_number = notice.getNotice_number();
		notice_title = notice.getNotice_title();
		notice_content = notice.getNotice_content();
		notice_date = notice.getNotice_date();
		notice_hit = notice.getNotice_hit();
	}
%>
<html>
<head>
	<meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel = "stylesheet" type = "text/css" href = "../style/board.css">
</head>
<body>
    <header>
        <br><br><br><br><br><br><br><br><br><br><br>
        <h2>믿을 수 있는 화물 중개 플랫폼</h2>
        <h1>트럭커(TRUCKER)</h1>
    </header>
    <nav>
        <table>
            <tr>
                <td><a href = "../1_Customer/order1.jsp">화물접수</a></td>
                <td><a href = "../1_Customer/order_query.jsp">배송조회</a></td>
                <td><a href = "M-Notice_main.jsp">고객센터</a></td>
                <td><a href = "../1_Customer/companyIntroduction.html">회사소개</a></td>
            </tr>
        </table>
    </nav>
    <section>
        <form name="form">
            <h3 class="deco1">공지사항</h3><br><br>
            <!-- <h3>공지사항 작성하기</h3> -->
            <table>
                <tr>
                    <td class="aL"><%= notice_title %></td>
                    <td class="aR"><%= sdf.format(notice_date) %></td>
                </tr>
                <tr>
                    <td class="aL aR2" colspan="2"><%= notice.getNotice_content().replaceAll(" ", "&nbsp;").replaceAll("\n", "<br>") %></td>
                </tr>
            </table><br><br>
            <input type="button" value="수정" class="shipping" onclick="location.href='Notice_edit.jsp?notice_number=<%= notice_number %>&pageNum=<%= pageNum %>'">
            <input type="button" value="삭제" class="shipping pd" onclick="location.href='Notice_delete.jsp?notice_number=<%= notice_number %>&pageNum=<%= pageNum %>'">
            <input type="button" value="목록" class="shipping pd" onclick="location.href='M-Notice_main.jsp?pageNum=<%= pageNum %>'"><br>
        </form>
    </section>
    <footer>
        (주)트럭커 부산시 해운대구 마린시티3로 45 | 사업자번호 : 123-45-12345 | <br> 
        통신판매업 : 2021 - 부산 동래-01234 | 화물운송주선 제160236호 | <br> 
        전화번호 : 1588-3333 | 팩스 : 070-1234-1234 | 대표메일 : trucker@naver.com <br>
        화물운송약관 | 개인정보 처리방침<br>
        COPYRIGHT(C) TRUCKER LTD. ALL RIGHT RESERVED.
    </footer>
</body>
</html>


