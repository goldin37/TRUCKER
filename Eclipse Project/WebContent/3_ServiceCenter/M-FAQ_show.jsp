<%@page import="board.FAQDB"%>
<%@page import="board.FAQ"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	String pageNum = request.getParameter("pageNum");	

	int bid = Integer.parseInt(request.getParameter("faq_number"));
	FAQDB db = FAQDB.getInstance();
	FAQ	faq= db.getBoard(bid);
	
	int faq_number = 0;
	String faq_title = "", faq_content = "";
	

	if(faq != null){
		faq_number = faq.getFaq_number();
		faq_title = faq.getFaq_title();
		faq_content = faq.getFaq_title();
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
                <td><a href = "../1_Customer/order-query.jsp">배송조회</a></td>
                <td><a href = "M-Notice_main.jsp">고객센터</a></td>
                <td><a href = "../1_Customer/companyIntroduction.html">회사소개</a></td>
            </tr>
        </table>
    </nav>
    <section>
        <form>
            <h3 class="deco1">자주하는 질문</h3><br><br>
            <!-- <h3>공지사항 작성하기</h3> -->
            <table>
                <tr>
                    <td class="aL"><strong>Q.</strong><%= faq_title %></td>
                </tr>
                <tr>
                    <td class="aL aR2"><%= faq.getFaq_content().replaceAll(" ", "&nbsp;").replaceAll("\n", "<br>") %></td>
                </tr>
            </table><br><br>
            <input type="button" value="수정" class="shipping" onclick="location.href='FAQ_edit.jsp?faq_number=<%= faq_number %>&pageNum=<%= pageNum %>'">
            <input type="button" value="삭제" class="shipping pd" onclick="location.href='FAQ_delete.jsp?faq_number=<%= faq_number %>&pageNum=<%= pageNum %>'">
            <input type="button" value="목록" class="shipping pd" onclick="location.href='M-FAQ_main.jsp?pageNum=<%= pageNum %>'"><br>
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


