<%@page import="board.Inquiry"%>
<%@page import="board.InquiryDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum2 = request.getParameter("pageNum2");

	int inquiry_number = 0, inquiry_ref = 0, inquiry_step = 0, inquiry_level = 0;
	String inquiry_title = "";
	if(request.getParameter("inquiry_number") != null){
		inquiry_number = Integer.parseInt(request.getParameter("inquiry_number"));
	}
	
	InquiryDB inq = InquiryDB.getInstance();
	Inquiry inquiry = inq.getBoard(inquiry_number, false);
	
	if(inquiry != null){
		inquiry_title = inquiry.getInquiry_title();
		inquiry_ref = inquiry.getInquiry_ref();
		inquiry_step = inquiry.getInquiry_step();
		inquiry_level = inquiry.getInquiry_level();
	}
%>
<html>
<head>
	<meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의하기</title>
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
                <td><a href = "../1_Customer/order1.jsp">화물접수</a></td>
                <td><a href = "../1_Customer/order-query.jsp">배송조회</a></td>
                <td><a href = "Notice_main.jsp">고객센터</a></td>
                <td><a href = "../1_Customer/companyIntroduction.html">회사소개</a></td>
            </tr>
        </table>
    </nav>
    <section>
        <form name="inqform" method="post" action="Inquiry_write_ok.jsp">
            <h3 class="deco1">문의사항</h3><br><br>
            <input type="hidden" name="inquiry_number" value="<%= inquiry_number %>">
            <input type="hidden" name="inquiry_ref" value="<%= inquiry_ref %>">
            <input type="hidden" name="inquiry_step" value="<%= inquiry_step %>">
            <input type="hidden" name="inquiry_level" value="<%= inquiry_level %>">
            <table>
            
                <tr>
                    <td class="mg">작성자명</td>
                    <td class="bl"><input type="text" size="30" name="inquiry_name"></td>
                </tr>
                <tr>
                    <td class="mg">비밀번호</td>
                    <td class="bl"><input type="password" size="30" name="inquiry_pwd"></td>
                </tr>
                <tr>
                    <td class="mg">글 제 목</td>
                    <td>
                    	<% 
							if(inquiry_number == 0){
						%>
									<input type="text" size="58" name="inquiry_title">									
						<%
							} else {
						%>
									<input type="text" size="58" name="inquiry_title" value="[<%= inquiry_title %>]">
						<%
							}
						%>
                    </td>
                </tr>
                <tr>
                    <td class="mg">글 내 용</td>
                    <td><textarea rows="9" cols="60" name="inquiry_content"></textarea></td>
                </tr>
            </table><br><br>
            <input type="button" value="작성" class="shipping" onclick="inq_ok()"></td>
            <input type="button" value="목록" class="shipping pd" onclick="location.href='Notice_main.jsp?pageNum2=<%= pageNum2 %>'"></td><br>
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







