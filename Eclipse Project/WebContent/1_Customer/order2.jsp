<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//order1���� �Ѱ��� �� ���ǿ� ����
	session.setAttribute("truck_type", request.getParameter("truck_type"));
	session.setAttribute("cargo_type", request.getParameter("cargo_type"));
	session.setAttribute("cargo_weight", request.getParameter("cargo_weight"));
	session.setAttribute("cargo_help", request.getParameter("cargo_help"));
	session.setAttribute("cargo_spec", request.getParameter("cargo_spec"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
    <title>ȭ������(2/4)</title>
    <script language="javascript">

function fromPopup(){
	var pop = window.open("fromPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function fromCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		document.form.from_where.value = roadAddrPart1;
		document.form.from_spec.value = roadAddrPart2 + addrDetail;
}

function next(){
	//�ּҸ� �Է¾��ϸ� ���
	if(document.form.from_where.value == ""){
		alert("�ּҸ� �˻� ���ּ���.")
		return
	}
	//����Ͻø� �Է� ���ϸ� ���
	if(document.form.depart_time.value == ""){
		alert("����Ͻø� �Է��ϼ���.")
		return
	}
	form.submit()
}

</script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=tzchnboziv"></script>
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
        <h1>ȭ�� ����(2/4)</h1>
        <table>
        <form  name = "form" method = "post" action = "order3.jsp">
        	<tr><th colspan = 2>��� ����</th></tr>
    		<tr>
			    <td>�����</td>
        	   	<td>
					<input type="text"  name="from_where" size = "40" readonly>
					<a onClick="fromPopup();">�ּ� �˻�</a><br><br>
					<input type="text" name="from_spec" size = "40">
				</td>
			</tr>
			<tr>
				<td>����Ͻ�</td>
				<td>
				<input type = "datetime-local" name = "depart_time" value = "<%= LocalDateTime.now() %>">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<input type = "button" value = "����" onClick = "next();">
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