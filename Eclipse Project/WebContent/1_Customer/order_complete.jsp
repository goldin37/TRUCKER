<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȭ����� �ֹ� ���� �Ϸ�</title>
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
</head>
<body>
    <header>
        <h2>���� �� �ִ� ȭ�� �߰� �÷���</h2>
        <h1>Ʈ��Ŀ(TRUCKER)</h1>
    </header>
    <nav>
        <table>
            <tr>
                <td><a href = "order1.jsp">ȭ������</a></td>
                <td><a href = "order_query.jsp">�����ȸ</a></td>
                <td><a href = "../3_ServiceCenter/FAQ_main.jsp">������</a></td>
                <td><a href = "companyIntroduction.html">ȸ��Ұ�</a></td>
            </tr>
        </table>
    </nav>
    <section>
    <h2>ȭ����� �ֹ� ���� �Ϸ�</h2>
        ȭ����� �ֹ� ������ �Ϸ�Ǿ����ϴ�.<br>
        ��۹�ȣ :<order_number><%= session.getAttribute("order_id") %></order_number><br>
        <p class = "simple_link">��� ���´� <a onclick="javascript:window.open('order_query.html')">�����ȸ ������</a>���� Ȯ���Ͻ� �� �ֽ��ϴ�.</p>
        ��۱�翡 ���� ��, ���ڸ޽����� �ȳ� �帮�ڽ��ϴ�.<br>
    </section>
    <footer>
        (��)Ʈ��Ŀ �λ�� �ؿ�뱸 ������Ƽ3�� 45 | ����ڹ�ȣ : 123-45-12345 | <br> 
        ����Ǹž� : 2021 - �λ� ����-01234 | ȭ������ּ� ��160236ȣ | <br> 
        ��ȭ��ȣ : 1588-3333 | �ѽ� : 070-1234-1234 | ��ǥ���� : trucker@naver.com <br>
        <a href = "contract.html">ȭ����۾��</a> | <a href = "personal_information.html">�������� ó����ħ</a><br>
        COPYRIGHT(C) TRUCKER LTD. ALL RIGHT RESERVED.
    </footer>
</body>
</html>