<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="board.FAQ"%>
<%@page import="board.FAQDB"%>
<%@page import="board.Inquiry" %>
<%@page import="board.InquiryDB" %>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	String pageNum2 = request.getParameter("pageNum2");
	if(pageNum2 == null){
		pageNum2 = "1";
	}

	FAQDB db = FAQDB.getInstance();
	ArrayList<FAQ> boardList = db.listBoard(pageNum);
	int i, faq_number;
	String faq_title, faq_content;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	InquiryDB idb = InquiryDB.getInstance();
	ArrayList<Inquiry> inqList = idb.listBoardInq(pageNum2);
	int j, inquiry_number, inquiry_hit, inquiry_level;
	String inquiry_name, inquiry_title, inquiry_content;
	Timestamp inquiry_date;
%>
<html>
<head>
	<meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주하는 질문</title>
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
            <a href="Notice_main.jsp"><h3 class="deco2">공지사항</h3></a>
            <a href="FAQ_main.jsp"><h3 class="deco2">자주하는 질문</h3></a>
            <table>
            	<%
                	for(i=0; i<boardList.size(); i++){
                		FAQ faq = boardList.get(i);
                		faq_number = faq.getFaq_number();
                		faq_title = faq.getFaq_title();
                		faq_content = faq.getFaq_content();
                %>
                 <tr>
                	<td width="50px">
                		<input type="hidden" name="b_id" value="<%= faq_number %>">
                	</td>
                	<td  class="">
                		<a href="FAQ_show.jsp?faq_number=<%= faq_number %>&pageNum=<%= pageNum %>">
                		<strong>Q.</strong><%= faq_title %>
                	</td>
                </tr>
                
                <%
                	}
             	%>
            </table>
            <br><br>
            	<%= FAQ.pageNumberM(5) %>
            <br><br>
            <input type="button" value="작성" class="shipping" onclick="location.href='FAQ_write.jsp?pageNum=<%= pageNum %>'">
            <br><br><br>
            <h3 class="deco1">문의사항</h3><br><br>
            <table>
                <tr>
                    <td class="td1">번호</td>
                    <td class="">제목</td>
                    <td class="td3">작성자</td>
                    <td class="td3">날짜</td>
                    <td class="td3">조회수</td>
                </tr>
				<%
                	for(j = 0; j < inqList.size(); j++){
                		Inquiry inquiry = inqList.get(j);
                		inquiry_number = inquiry.getInquiry_number();
                		inquiry_title = inquiry.getInquiry_title();
                		inquiry_name = inquiry.getInquiry_name();
                		inquiry_date = inquiry.getInquiry_date();
                		inquiry_hit = inquiry.getInquiry_hit();
                		inquiry_level = inquiry.getInquiry_level();
                %>
                <tr>
                	<td class="td1">
                		<%= inquiry_number %>
                	</td>
               		<td  class="">
                			<% 
								if(inquiry_level > 0){
									for(int k = 0; j < inquiry_level; j++){
							%>
									&nbsp;&nbsp;
							<%
									}
							%>
									<img src="images/noun_Reply_847898.png" width="15" height="15">
							<%		
								}
							%>
							<a href="Inquiry_show.jsp?inquiry_number=<%= inquiry_number %>&pageNum2=<%= pageNum2 %>">
							<%= inquiry_title %>
							</a>
                	</td>
                	<td class="td3">
                		<%= inquiry_name %>
                	</td>
                	<td class="td3">
                		<%= sdf.format(inquiry_date) %>
                	</td>
                	<td  class="td3">
                		<%= inquiry_hit %>
                	</td>
                </tr>
                <%
                	}
             	%>
            </table>
            <br><br>
            	<%= Inquiry.pageNumberI(5) %>
            <br><br>
            <input type="button" value="작성" class="shipping" onclick="location.href='Inquiry_write.jsp?pageNum2=<%= pageNum2 %>'">
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