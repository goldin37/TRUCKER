m<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="HanConv" class = "myUtil.HanConv"></jsp:useBean>
<%
	//order4���� �Ѱ��� �� ���ǿ� ����
	session.setAttribute("fix_cost", session.getAttribute("recommend_cost"));
	session.setAttribute("customer_name", request.getParameter("name"));
	session.setAttribute("customer_telephone", 
		request.getParameter("tel1") + request.getParameter("tel2") + request.getParameter("tel3"));
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel = "stylesheet" type = "text/css" href = "style/mystyle.css">
    <title>��ۿ�� ����</title>
<script language="javascript">
function mobile_payment(){
	window.open("mobile_payment.jsp", "�޴���ȭ �Ҿװ���", "left = 100px, top = 100, width = 500px, height = 600px")
	return
}
</script>
</head>
<body>

    <header>
        <h2>���� �� �ִ� ȭ�� �߰� �÷���</h2>
        <h1>Ʈ��Ŀ(TRUCKER)</h1>
    </header>
    <nav>
        <table>
            <tr>
                <td><a href = "order.html">ȭ������</a></td>
                <td><a href = "order_query.html">�����ȸ</a></td>
                <td><a href = "">������</a></td>
                <td><a href = "">ȸ��Ұ�</a></td>
            </tr>
        </table>
    </nav>
    <section>
        <h1>���� ����</h1>
    <form name = "form" method = "post" action = "mobile_payment.jsp">
    <table name = "table">
    	<tr>
    		<th colspan = "4">�������� ����</th>
    	</tr>
    	<tr>
    		<td><img src = "images/transfer.png" width = 250px><br><br><center><a>�ǽð� ������ü</a></center></td>
    		<td><img src = "images/virtual_transfer.png" width = 250px><br><br><center><a>������� �Ա�</a></center></td>
    		<td><img src = "images/credit_card.png" width = 250px><br><center><a>ī�� ����</a></center></td>
    		<td><img src = "images/mobile.png" width = 250px><br><br><center><a onClick = "mobile_payment()">�޴���ȭ �Ҿװ���</a></center></td>
    	</tr>
    	<th colspan = "4">�޴���ȭ �Ҿװ���</th>
    	<td></td>
    	</tr>
    </table>
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