<%@page import="Driver.DriverDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String name = request.getParameter("driver_name");
	String jumin = request.getParameter("driver_jumin");

	DriverDBBean db = DriverDBBean.getInstance();
	String id = db.searchID(name, jumin);
%>
<html lang="en">
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>��������</title>
    <link rel = "stylesheet" type = "text/css" href = "style/mystyle.css">
	<script type="text/javascript" src="Driver.js" charset="utf-8"></script>
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
                <td><a href = "#">ȭ������</a></td>
                <td><a href = "#">�����ȸ</a></td>
                <td><a href = "#">������</a></td>
                <td><a href = "#">ȸ��Ұ�</a></td>
            </tr>
        </table>
      </nav>
      <section>
          <table>
              <form action="login.html">
<%
          	if(id != null){
%>			
                <tr align ="center">
                    <td>���̵� ã�ҽ��ϴ�.</td>
                </tr>
                <tr align = "center">
                	<td><%= id %></td>
                </tr>
<%
          	}else{
%>
				<script>
					alert("���̵� ã�� ���߽��ϴ�.");
					history.go(-1);
				</script>
<%
          	}
%>
				<tr>
					<td colspan="2" style="text-align:center" >
					<input type="submit" value="�α��� ���ư���" id="join">
					</td>
				</tr>
              </form>
          </table>
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