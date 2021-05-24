<%@page import="Driver.DriverBean"%>
<%@page import="Driver.DriverDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	DriverDBBean db = DriverDBBean.getInstance();
	DriverBean tb = db.getDriver(id);	//���̵� ��ġ�ϴ� ����� ������ ������
%>
<html lang="en">
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>��������</title>
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
	<script type="text/javascript" src="driver.js" charset="utf-8"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                <td><a href = "../3_ServiceCenter/FAQ_main.jsp">������</a></td>
                <td><a href = "../1_Customer/companyIntroduction.html">ȸ��Ұ�</a></td>
            </tr>
        </table>
      </nav>
      <section>
          <h1>��������</h1>
          <p style="margin-left:20px;"> �����Ͻ� ������ �Է����ּ���.</p>
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
                    <input type="text" name="phone1" value="010" size="1" maxlength="3"> -
                    <input type="text" name="phone2" size="3" maxlength="4"> -
                    <input type="text" name="phone3" size="3" maxlength="4">
                </td>
                </tr>
                <tr>
                    <td>�ּ� : </td>
                    <td>
                    	<input type="text" id="sample6_address" name="addr1" placeholder="�ּ�" size="40" readonly>&nbsp;&nbsp;
                    	<a onclick="sample6_execDaumPostcode()">�ּ� �˻�</a><br>
						<input type="text" id="sample6_detailAddress" name="addr2" placeholder="���ּ�" size="10">
                    </td>
               <tr>
                    <td>�̸��� : </td>
                    <td>
                    	<input name="email1" type="text" size="15"> @
						<input name="email2" type="text" size="15" readonly>
							<select name="email" id="" onchange="check_email()">
							    <option value="0" selected>�����ϼ���</option>
							    <option value="naver.com">naver.com</option>
							    <option value="nate.com">nate.com</option>
							    <option value="hanmail.com">hanmail.com</option>
							    <option value="gmail.com">gmail.com</option>
							    <option value="9">�����Է�</option>
							</select>	
                    </td>
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
                    <td colspan="3" style="text-align:center">
                    <input type="button" value="��������" id="join" onclick="modification_ok()">
                    <input type="button" value="���ư���" id="join" onclick="location.href='mypage.jsp'">
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