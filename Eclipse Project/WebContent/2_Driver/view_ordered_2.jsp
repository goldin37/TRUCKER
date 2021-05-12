<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("id");
	String name =(String)session.getAttribute("name");
	String license = (String)session.getAttribute("license");
	String truck_type = (String)session.getAttribute("truck_type");
	String truck_number = (String)session.getAttribute("truck_number");
	String phone = (String)session.getAttribute("phone");
%>
<html lang="en">
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>��۳�����ȸ(2/2)</title>
    <link rel = "stylesheet" type = "text/css" href = "../css/mystyle.css">
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
                <td><a href = "#">�����ȸ</a></td>
                <td><a href = "#">mypage</a></td>
                <td><a href = "#">������</a></td>
                <td><a href = "#">ȸ��Ұ�</a></td>
            </tr>
        </table>
      </nav>

    <section>
        <form method="post">
        <h2>��۳�����ȸ</h2> 
        <p>�ȳ��ϼ��� <%= name %>(<%=id %>)��</p>
        <table>
       		<tr>
               <td>��ȸ �Ⱓ</td>
               <td>
                   <input type = "datetime-local" value = "<%= "PERIOD_START" %>"> ~
                   <input type = "datetime-local"  value = "<%= "PERIOD_END" %>">
               </td>
            </tr>
		</table>
		<table>
		 	<tr><td>��ȣ : <%= "ORDERED_NUM" %></td></tr>
            <tr><td>������� : <%= "COMPLETE_DATE_TIME" %></td></tr>
            <tr><td>���̸� : <%= "CUSTOMER_NAME" %></td></tr>
            <tr><td>������ó : <%= "CUSTOMER_TELEPHONE" %></td></tr>
            <tr><td>ȭ������ : <%= "CARGO_TYPE" %></td></tr>
            <tr><td>ȭ������ : <%= "CARGO_WEIGHT" %></td></tr>
            <tr><td>�̵��Ÿ� : <%= "DISTANCE" %></td></tr>
            <tr><td>����� : <%= "FROM_WHERE" %> <%= "FROM_SPEC" %></td></tr>
            <tr><td>������ : <%= "TO_WHERE" %> <%= "TO_SPEC" %></td></tr>
            <tr><td>���������� : <%= "CARGO_HELP" %></td></tr>
            <tr><td>���� : <%= "FIX_COST" %></td></tr>         
            <tr>
                <td>
                <input type="button" value="�������ι��" class="finished" onclick="location.href='list.jsp'">
                </td>
             </tr>
            </form>
        </table>
    </section>

    <section class="question">
        <h2>���ǻ���</h2> 
        <ul>
            <li><a href="#"> �����ϴ� ����</a></li>
            <li><a href="#"> Q & A �ٷΰ���</a></li>
            <li>������ ��ð� 09:00~18:00</li>
            <li>��ȭ��ȣ 1555-1555</li>
            <input type="button" value="�ٷΰ���" class="click">
        </ul>
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
