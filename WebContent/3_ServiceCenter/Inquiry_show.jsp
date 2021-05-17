<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="board.Inquiry"%>
<%@page import="board.InquiryDB"%>
<%
	String pageNum2 = request.getParameter("pageNum2");

	int bid = Integer.parseInt(request.getParameter("inquiry_number"));
	InquiryDB inq = InquiryDB.getInstance();
	Inquiry inquiry = inq.getBoard(bid, true);
	
	int inquiry_number = 0, inquiry_hit = 0;
	String inquiry_name="", inquiry_title = "", inquiry_content = "";
	Timestamp inquiry_date = null;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");

	if(inquiry != null){
		inquiry_number = inquiry.getInquiry_number();
		inquiry_name = inquiry.getInquiry_name();
		inquiry_title = inquiry.getInquiry_title();
		inquiry_content = inquiry.getInquiry_content();
		inquiry_date = inquiry.getInquiry_date();
		inquiry_hit = inquiry.getInquiry_hit();
	}
%>
<html>
<head>
	<meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의하기</title>
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
                <td><a href = "../1_Customer/order-query.jsp">배송조회</a></td>
                <td><a href = "Notice_main.jsp">고객센터</a></td>
                <td><a href = "../1_Customer/companyIntroduction.html">회사소개</a></td>
            </tr>
        </table>
    </nav>
    <section>
        <form name="form">
            <h3 class="deco1">문의사항</h3><br><br>
            <!-- <h3>공지사항 작성하기</h3> -->
            <table>
                <tr>
                    <td class="aL"><%= inquiry_name %></td>
                    <td class="aR"><%= sdf.format(inquiry_date) %></td>
                </tr>
                <tr>
                    <td class="aL" colspan="2"><%= inquiry_title %></td>
                </tr>
                <tr>
                    <td class="aL aR2" colspan="2"><%= inquiry.getInquiry_content().replaceAll(" ", "&nbsp;").replaceAll("\n", "<br>") %></td>
                </tr>
            </table><br><br>
            <input type="button" value="답변" class="shipping" onclick="location.href='Inquiry_write.jsp?inquiry_number=<%= inquiry_number %>&pageNum2=<%= pageNum2 %>'" >
            <input type="button" value="수정" class="shipping pd" onclick="location.href='Inquiry_edit.jsp?inquiry_number=<%= inquiry_number %>&pageNum2=<%= pageNum2 %>'">
            <input type="button" value="삭제" class="shipping pd" onclick="location.href='Inquiry_delete.jsp?inquiry_number=<%= inquiry_number %>&pageNum2=<%= pageNum2 %>'">
            <input type="button" value="목록" class="shipping pd" onclick="location.href='Notice_main.jsp?pageNum2=<%= pageNum2 %>'"><br>
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


