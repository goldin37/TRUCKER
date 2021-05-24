<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%
	if(session.getAttribute("id") == null){
%>
		<jsp:forward page ="login.html"></jsp:forward>
<%
	}

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
    <title>����������</title>
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
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
                <td><a href = "orderlist.jsp">������Ȳ</a></td>
                <td><a href = "mypage.jsp">����������</a></td>
                <td><a href = "../3_ServiceCenter/FAQ_main.jsp">������</a></td>
                <td><a href = "../1_Customer/companyIntroduction.html">ȸ��Ұ�</a></td>
            </tr>
        </table>
      </nav>
    <section class="box">
        <h2 id="box">��������</h2> 
        <p style="font-weight: bolder; padding-left: 90px;">
           	ȯ���մϴ� ! <%= name %>(<%=id %>)�� 
        </p>
        <table>
            <form method=post>
            <tr>
                <td>�̸� : <%=name %></td>
            </tr>
            <tr>
                <td>�޴���ȭ : <%=phone %></td>
            </tr>
            <tr>
                <td>���� ��ȣ: <%=license %></td>
            </tr>
            <tr>
                <td>���� : <%=truck_type %></td>
            </tr>
            <tr>
                <td>������ȣ : <%=truck_number %></td>
            </tr>
            </form>
        </table>
        <input type="button" value="�α׾ƿ�" class="click" onclick="location.href='logOut.jsp'">
        <input type="button" value="��������" class="click" onclick="location.href='modification.jsp'">
    </section>
    <section class="now">
        <h2 id="box">�������� ���</h2> 
        <table>
            <form name="form" action="view_ordered_1.jsp" method="post" enctype="multipart/form-data">
            <tr>
                <td>������� : �޴°�</td>
            </tr>
            <tr>
                <td>���̸� : �޴� ��</td>
            </tr>
            <tr>
                <td>ȭ������ : �޴� ��</td>
            </tr>
            <tr>
                <td>ȭ������ : �޴� ��</td>
            </tr>
            <tr>
                <td>������ : �޴� ��</td>
            </tr>
            <tr>
                <td>������ : �޴� ��</td>
            </tr>
            <tr>
                <td>���������� : �޴� ��</td>
            </tr>
            <tr>
                <td>���Ӻ�� : �޴� ��</td>
            </tr>
            <tr>
                <td>
                    <input type="button" value="������" class="click" onclick="">
                    <input type="button" value="��ۿϷ�" class="click" onclick="">
                    <input type="button" value="�������Ȯ��" class="click" onclick="location.href='orderlist.jsp'">
                    <input type="button" value="��۳���Ȯ��" class="click" onclick="location.href='view_ordered_1.jsp'">
                    
                 </td>
             </tr>
            </form>
        </table>
    </section>

    <section class="question">
        <h2 id="box">���ǻ���</h2> 
        <ul>
            <li><a href="#"> FAQ �ٷΰ���</a></li>
            <li><a href="#"> Q & A �ٷΰ���</a></li>
            <li>������ ��ð� 09:00~18:00</li>
            <li>��ȭ��ȣ 1555-1555</li>
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
