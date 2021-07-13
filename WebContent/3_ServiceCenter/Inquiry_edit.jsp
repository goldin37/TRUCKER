<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="board.Inquiry"%>
<%@page import="board.InquiryDB"%>
<%
	String pageNum2 = request.getParameter("pageNum2");
	
	int inquiry_number = Integer.parseInt(request.getParameter("inquiry_number"));
	
	InquiryDB inq = InquiryDB.getInstance();
	Inquiry inquiry = inq.getBoard(inquiry_number, false);
%>
<html>
<head>
	<meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�����ϱ�</title>
    <script type="text/javascript" src="board.js" charset="utf-8"></script>
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
                <td><a href = "../1_Customer/order_query.jsp">�����ȸ</a></td>
                <td><a href = "Notice_main.jsp">������</a></td>
                <td><a href = "../1_Customer/companyIntroduction.html">ȸ��Ұ�</a></td>
            </tr>
        </table>
    </nav>
    <section>
        <form name="inqform1" method="post" action="Inquiry_edit_ok.jsp?inquiry_number=<%= inquiry_number %>">
            <h3 class="deco1">���ǻ���</h3><br><br>
            <table>
                <tr>
                    <td class="mg">�ۼ��ڸ�</td>
                    <td class="bl"><input type="text" size="30" name="inquiry_name" value="<%= inquiry.getInquiry_name() %>"></td>
                </tr>
                <tr>
                    <td class="mg">��й�ȣ</td>
                    <td class="bl"><input type="password" size="30" name="inquiry_pwd"></td>
                </tr>
                <tr>
                    <td class="mg">�� �� ��</td>
                    <td><input type="text" size="58" name="inquiry_title" value="<%= inquiry.getInquiry_title() %>"></td>
                </tr>
                <tr>
                    <td class="mg">�� �� ��</td>
                    <td><textarea rows="9" cols="60" name="inquiry_content">
                    	<%= inquiry.getInquiry_content() %>
                    </textarea></td>
                </tr>
            </table><br><br>
            <input type="button" value="�ۼ�" class="shipping" onclick="inq_ok1()"></td>
            <input type="button" value="���" class="shipping pd" onclick="location.href='Notice_main.jsp?pageNum2=<%= pageNum2 %>'"></td><br>
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