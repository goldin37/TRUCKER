<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="board.FAQDB"%>
<%@page import="board.FAQ"%>
<%
	String pageNum = request.getParameter("pageNum");	

	int faq_number = Integer.parseInt(request.getParameter("faq_number"));

	FAQDB db=FAQDB.getInstance();
	FAQ faq = db.getBoard(faq_number);
%>
<html>
<head>
	<meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 작성</title>
    <script type="text/javascript" src="board.js" charset="utf-8"></script>
    <link rel = "stylesheet" type = "text/css" href = "css/mystyle.css">
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
                <td><a href = "">화물접수</a></td>
                <td><a href = "">배송조회</a></td>
                <td><a href = "M-Notice_main.jsp">고객센터</a></td>
                <td><a href = "companyIntroduction.html">회사소개</a></td>
            </tr>
        </table>
    </nav>
    <section>
        <form name="form1" method="post" action="FAQ_edit_ok.jsp">
            <h3 class="deco1">자주하는 질문 수정하기</h3><br><br>
            <input type="hidden" name="faq_number" value="<%= faq_number %>">
            <table>
                <tr>
                    <td class="mg">글 제 목</td>
                    <td><input type="text" size="58" name="faq_title" value="<%= faq.getFaq_title() %>"></td>
                </tr>
                <tr>
                    <td class="mg">글 내 용</td>
                    <td><textarea rows="9" cols="60" name="faq_content">
                    	<%= faq.getFaq_content() %>
                    </textarea></td>
                </tr>
            </table><br><br>
            <input type="button" value="작성" class="shipping" onclick="check_ok1()"></td>
            <input type="button" value="목록" class="shipping pd" onclick="location.href='M-FAQ_main.jsp?pageNum=<%= pageNum %>'"></td><br>
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