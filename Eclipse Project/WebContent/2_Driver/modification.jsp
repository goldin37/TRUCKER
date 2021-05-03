<%@page import="trucker.TruckerBean"%>
<%@page import="trucker.TruckerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	TruckerDBBean db = TruckerDBBean.getInstance();
	TruckerBean tb = db.getTrucker(id);	//���̵� ��ġ�ϴ� ����� ������ ������
%>
<html lang="en">
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>��������</title>
    <link rel = "stylesheet" type = "text/css" href = "css/trucker_modify.css">
	<script type="text/javascript" src="trucker.js" charset="utf-8"></script>
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
          <h1>��������</h1>
          <p> �����Ͻ� ������ �Է����ּ���.</p>
          <table>
              <form name = "form" method="post" action="modification_ok.jsp">
                <tr>
                    <td>���̵� : </td>
                    <td><%= tb.getDriver_id() %></td>
                </tr>

                <tr>
                    <td>�̸� : </td>
                    <td><%= tb.getDriver_name() %></td>
                </tr>
                <tr>
                    <td>�ֹε�Ϲ�ȣ : </td>
                    <td>
					<%=tb.getDriver_jumin() %>
                    </td>
                </tr>
                <tr>
                    <td>��ȭ��ȣ : </td>
                    <td>
                    <input type="text" name="driver_phone_number"size="40"  value="<%=tb.getDriver_phone_number() %>">
                </td>
                </tr>
                <tr>
                    <td>�ּ� : </td>
                    <td><input type="text" size="40" value="<%=tb.getDriver_address() %>" name="driver_address"></td>
                </tr>
                <tr>
                    <td>�̸��� : </td>
                    <td><input type="text" size="40" value="<%= tb.getDriver_email()%>" name="driver_email">
                </tr>
                <tr>
                    <td>�� Ȱ������ : </td>
                    <td>
                        <select name="driver_position">
                            <option value="����">����</option>
                            <option value="����">����</option>
                            <option value="���">���</option>
                            <option value="����">����</option>
                            <option value="��û">��û</option>
                            <option value="����">����</option>
                            <option value="���">���</option>
                            <option value="�泲">�泲</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>�������� : </td>
                    <td>
                    <label><input type="radio" name="truck_type" value="damas">�ٸ���</label>
                    <label><input type="radio" name="truck_type" value="labo">��</label>
                    <label><input type="radio" name="truck_type" value="1ton">1��</label>
                    <label><input type="radio" name="truck_type" value="1.4ton" checked="checked">1.4��</label>
                    <label><input type="radio" name="truck_type" value="2.5ton">2.5��</label>
                </td>
                </tr>
                <tr>
                    <td>������ȣ : </td>
                    <td><input type="text" size="10" value="<%=tb.getTruck_number()%>" name="truck_number"></td>
                </tr>
                <tr>
                    <td>�������� : </td>
                    <td>
                    	<%=tb.getDriver_license()%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="button" value="��������" class="join" onclick="modification_ok()"></td>
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