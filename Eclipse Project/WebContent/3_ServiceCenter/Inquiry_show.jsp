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
    <title>�����ϱ�</title>
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
        <form name="form">
            <h3 class="deco1">���ǻ���</h3><br><br>
            <!-- <h3>�������� �ۼ��ϱ�</h3> -->
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
            <input type="button" value="�亯" class="shipping" onclick="location.href='Inquiry_write.jsp?inquiry_number=<%= inquiry_number %>&pageNum2=<%= pageNum2 %>'" >
            <input type="button" value="����" class="shipping pd" onclick="location.href='Inquiry_edit.jsp?inquiry_number=<%= inquiry_number %>&pageNum2=<%= pageNum2 %>'">
            <input type="button" value="����" class="shipping pd" onclick="location.href='Inquiry_delete.jsp?inquiry_number=<%= inquiry_number %>&pageNum2=<%= pageNum2 %>'">
            <input type="button" value="���" class="shipping pd" onclick="location.href='Notice_main.jsp?pageNum2=<%= pageNum2 %>'"><br>
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


