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
    <title>�������� �ۼ�</title>
    <script type="text/javascript" src="board.js" charset="utf-8"></script>
    <link rel = "stylesheet" type = "text/css" href = "css/mystyle.css">
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
                <td><a href = "">ȭ������</a></td>
                <td><a href = "">�����ȸ</a></td>
                <td><a href = "M-Notice_main.jsp">������</a></td>
                <td><a href = "companyIntroduction.html">ȸ��Ұ�</a></td>
            </tr>
        </table>
    </nav>
    <section>
        <form name="form1" method="post" action="FAQ_edit_ok.jsp">
            <h3 class="deco1">�����ϴ� ���� �����ϱ�</h3><br><br>
            <input type="hidden" name="faq_number" value="<%= faq_number %>">
            <table>
                <tr>
                    <td class="mg">�� �� ��</td>
                    <td><input type="text" size="58" name="faq_title" value="<%= faq.getFaq_title() %>"></td>
                </tr>
                <tr>
                    <td class="mg">�� �� ��</td>
                    <td><textarea rows="9" cols="60" name="faq_content">
                    	<%= faq.getFaq_content() %>
                    </textarea></td>
                </tr>
            </table><br><br>
            <input type="button" value="�ۼ�" class="shipping" onclick="check_ok1()"></td>
            <input type="button" value="���" class="shipping pd" onclick="location.href='M-FAQ_main.jsp?pageNum=<%= pageNum %>'"></td><br>
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