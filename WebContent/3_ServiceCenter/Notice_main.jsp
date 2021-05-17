<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="board.Notice"%>
<%@page import="board.NoticeDB"%>
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
	
	NoticeDB db = NoticeDB.getInstance();
	ArrayList<Notice> boardList = db.listBoard(pageNum);
	int i, notice_number, notice_hit;
	String notice_title, notice_content;
	Timestamp notice_date;
	
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
    <title>��������</title>
    <link rel = "stylesheet" type = "text/css" href = "../style/board.css">
</head>
<body>
    <header>
        <br><br><br><br><br><br><br><br><br><br><br>
        <h2>���� �� �ִ� ȭ�� �߰� �÷���</h2>
        <h1>Ʈ��Ŀ(TRUCKER)</h1>
    </header>
    <nav>
        <table>
            <tr>
                <td><a href = "../1_Customer/order1.jsp">ȭ������</a></td>
                <td><a href = "../1_Customer/order-query.jsp">�����ȸ</a></td>
                <td><a href = "Notice_main.jsp">������</a></td>
                <td><a href = "../1_Customer/companyIntroduction.html">ȸ��Ұ�</a></td>
            </tr>
        </table>
    </nav>
    <section>
        <form>
            <a href="Notice_main.jsp"><h3 class="deco2">��������</h3></a>
            <a href="FAQ_main.jsp"><h3 class="deco2">�����ϴ� ����</h3></a>
            <table>
                <tr>
                    <td class="td1">��ȣ</td>
                    <td class="">����</td>
                    <td class="td3">��¥</td>
                    <td class="td3">��ȸ��</td>
                </tr>
                <%
                	for(i=0; i<boardList.size(); i++){
                		Notice notice = boardList.get(i);
                		notice_number = notice.getNotice_number();
                		notice_title = notice.getNotice_title();
                		notice_date = notice.getNotice_date();
                		notice_hit = notice.getNotice_hit();
                	
                %>
                <tr>
                	<td class="td1">
                		<%= notice_number %>
                	</td>
                	<td  class="">
                		<a href="Notice_show.jsp?notice_number=<%= notice_number %>&pageNum=<%= pageNum %>">
                		<%= notice_title %>
                	</td>
                	<td class="td3">
                		<%= sdf.format(notice_date) %>
                	</td>
                	<td class="td3">
                		<%= notice_hit %>
                	</td>
                </tr>
                <%
                	}
             	%>
            </table>
            <br><br>
            	<%= Notice.pageNumber(5) %>
            <br><br><br>
            <h3 class="deco1">���ǻ���</h3><br><br>
            <table>
                <tr>
                    <td class="td1">��ȣ</td>
                    <td class="">����</td>
                    <td class="td3">�ۼ���</td>
                    <td class="td3">��¥</td>
                    <td class="td3">��ȸ��</td>
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
            <input type="button" value="�ۼ�" class="shipping" onclick="location.href='Inquiry_write.jsp?pageNum2=<%= pageNum2 %>'">
        </form>
    </section>
    <footer>
        (��)Ʈ��Ŀ �λ�� �ؿ�뱸 ������Ƽ3�� 45 | ����ڹ�ȣ : 123-45-12345 | <br> 
        ����Ǹž� : 2021 - �λ� ����-01234 | ȭ������ּ� ��160236ȣ | <br> 
        ��ȭ��ȣ : 1588-3333 | �ѽ� : 070-1234-1234 | ��ǥ���� : trucker@naver.com <br>
        ȭ����۾�� | �������� ó����ħ<br>
        COPYRIGHT(C) TRUCKER LTD. ALL RIGHT RESERVED.
    </footer>
</body>
</html>