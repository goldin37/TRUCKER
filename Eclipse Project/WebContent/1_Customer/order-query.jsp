<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <link rel = "stylesheet" type = "text/css" href = "css/mystyle.css">
</head>
</head>
<body class = "order_query">
    <header>
        <h2>���� �� �ִ� ȭ�� �߰� �÷���</h2>
        <h1>Ʈ��Ŀ(TRUCKER)</h1>
    </header>
    <nav>
        <table>
            <tr>
                <td><a href = "order.html">ȭ������</a></td>
                <td><a href = "order_query.html">�����ȸ</a></td>
                <td><a href = "">��������</a></td>
                <td><a href = "">ȸ��Ұ�</a></td>
            </tr>
        </table>
    </nav>
    <section>
    <br>
        <form action="order-query-Search-order_id.jsp" method="post">
        <h1>��� ��ȸ</h1>
        <table>
            <tr>
                <td rowspan = 4 width = 250px>
                    ��� ��ȣ <input type = "text" size = 5 name="order_id">
                    <input type="submit" value="��ȸ" class="shipping">    
                </td>
                <td>
                    ��۹�ȣ�� �Ҿ���Ⱦ��. <a>��۹�ȣ ã��</a>
                </td>
            </tr>
            </form>
            <form action="order-query-Search-name+tel.jsp" method="post">
            <tr>
                <th>��۹�ȣ ��ȸ</th>
            </tr>
            <tr>
                <td>
                    �̸� <input type = "text" size = 3 name="customer_name"> 
                    ��ȭ��ȣ <input type = "text" size = 3 name="phone1" maxlength="3">-<input type = "text" size = 4 name="phone2" maxlength="4">-<input type = "text" size = 4 name=phone3 maxlength="4">
                    <input type="submit" value="��ȸ" class="shipping">
                </td>
            </tr>
            <tr>
                <td>
                    2021�� 5�� 12�� 14:22 &nbsp;&nbsp;&nbsp;�λ� > ��õ &nbsp;&nbsp;&nbsp;<point>B53PK</point>
                </td>
            </tr>
        </table>
        </form>
        <br><br>
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