<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="board.Notice"%>
<%@page import="board.NoticeDB"%>
<%
	String pageNum = request.getParameter("pageNum");

	int bid = Integer.parseInt(request.getParameter("notice_number"));
	NoticeDB db = NoticeDB.getInstance();
	Notice notice = db.getBoard(bid, true);
	
	int notice_number = 0, notice_hit = 0;
	String notice_title = "", notice_content = "";
	Timestamp notice_date = null;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");

	if(notice != null){
		notice_number = notice.getNotice_number();
		notice_title = notice.getNotice_title();
		notice_content = notice.getNotice_content();
		notice_date = notice.getNotice_date();
		notice_hit = notice.getNotice_hit();
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
                <td><a href = "../1_Customer/order_query.jsp">�����ȸ</a></td>
                <td><a href = "M-Notice_main.jsp">������</a></td>
                <td><a href = "../1_Customer/companyIntroduction.html">ȸ��Ұ�</a></td>
            </tr>
        </table>
    </nav>
    <section>
        <form name="form">
            <h3 class="deco1">��������</h3><br><br>
            <!-- <h3>�������� �ۼ��ϱ�</h3> -->
            <table>
                <tr>
                    <td class="aL"><%= notice_title %></td>
                    <td class="aR"><%= sdf.format(notice_date) %></td>
                </tr>
                <tr>
                    <td class="aL aR2" colspan="2"><%= notice.getNotice_content().replaceAll(" ", "&nbsp;").replaceAll("\n", "<br>") %></td>
                </tr>
            </table><br><br>
            <input type="button" value="����" class="shipping" onclick="location.href='Notice_edit.jsp?notice_number=<%= notice_number %>&pageNum=<%= pageNum %>'">
            <input type="button" value="����" class="shipping pd" onclick="location.href='Notice_delete.jsp?notice_number=<%= notice_number %>&pageNum=<%= pageNum %>'">
            <input type="button" value="���" class="shipping pd" onclick="location.href='M-Notice_main.jsp?pageNum=<%= pageNum %>'"><br>
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


