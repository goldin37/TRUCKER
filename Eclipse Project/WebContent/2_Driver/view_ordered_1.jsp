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
    <title>��۳�����ȸ(1/2)</title>
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
    <script type="text/javascript" src="driver.js" charset="utf-8" ></script>
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
        <h2 id="box">��۳�����ȸ</h2> 
        <p style="font-weight: bolder; padding-left: 90px;">
           	ȯ���մϴ� ! <%= name %>(<%=id %>)�� 
        </p>
        <table>
        	<form name="form" action="view_ordered_2.jsp" method="post" enctype="multipart/form-data">
	       		<tr>
	               <td>��ȸ �Ⱓ:
	                   <input type = "datetime-local" name="period_start"> ~
	                   <input type = "datetime-local" name="period_end">
		               <input type="button" value="��ȸ�ϱ�" class="click" onclick="period_check_ok()">
	               </td>
	            </tr>
				<tr>		
	                <td>
	                	<input type="button" value="�������ι��" class="finished" onclick="location.href='mypage.jsp'">
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
