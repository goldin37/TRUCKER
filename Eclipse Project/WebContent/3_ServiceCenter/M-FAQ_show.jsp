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
                <td><a href = "M-Notice_main.jsp">������</a></td>
                <td><a href = "../1_Customer/companyIntroduction.html">ȸ��Ұ�</a></td>
            </tr>
        </table>
    </nav>
    <section>
        <form>
            <h3 class="deco1">�����ϴ� ����</h3><br><br>
            <!-- <h3>�������� �ۼ��ϱ�</h3> -->
            <table>
                <tr>
                    <td class="aL"><strong>Q.</strong><%= faq_title %></td>
                </tr>
                <tr>
                    <td class="aL aR2"><%= faq.getFaq_content().replaceAll(" ", "&nbsp;").replaceAll("\n", "<br>") %></td>
                </tr>
            </table><br><br>
            <input type="button" value="����" class="shipping" onclick="location.href='FAQ_edit.jsp?faq_number=<%= faq_number %>&pageNum=<%= pageNum %>'">
            <input type="button" value="����" class="shipping pd" onclick="location.href='FAQ_delete.jsp?faq_number=<%= faq_number %>&pageNum=<%= pageNum %>'">
            <input type="button" value="���" class="shipping pd" onclick="location.href='M-FAQ_main.jsp?pageNum=<%= pageNum %>'"><br>
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


