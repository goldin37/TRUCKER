<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="myUtil.GeoCode"%>
<%@page import="myUtil.Directions5"%>
<%
	//order2���� �Ѱ��� �� ���ǿ� ����
	session.setAttribute("from_where", request.getParameter("from_where"));
	session.setAttribute("from_spec", request.getParameter("from_spec"));
	session.setAttribute("depart_time", request.getParameter("depart_time"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel = "stylesheet" type = "text/css" href = "style/mystyle.css">
    <title>ȭ������(3/4)</title>
    <script language="javascript">

function toPopup(){
	var pop = window.open("fromPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function fromCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		document.form.to_where.value = roadAddrPart1;
		document.form.to_spec.value = roadAddrPart2 + addrDetail;
}

function calculate(){
	//�ּҸ� �Է¾��ϸ� ���
	if(document.form.to_where.value == ""){
		alert("�ּҸ� �˻� ���ּ���.")
		return
	}
	//�Ÿ��� �ð� ���
	document.form.distance.value = "123"
	document.form.time.value = "2�ð� 10��"
	document.form.ETA.value = "4/26 17:50"
	document.form.recommend_cost.value = "150000"
	document.form.next.hidden = false
}

function next(){
	alert("next")
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
                <td><a href = "order.html">ȭ������</a></td>
                <td><a href = "order_query.html">�����ȸ</a></td>
                <td><a href = "">������</a></td>
                <td><a href = "">ȸ��Ұ�</a></td>
            </tr>
        </table>
    </nav>
    <section>
        <h1>ȭ�� ����(3/4)</h1>
        <table>
        <form  name = "form" method = "post" action = "order4.jsp">
        	<tr><th colspan = 2>������</th></tr>
    		<tr>
			    <td>������</td>
        	   	<td>
					<input type="text"  name="to_where" size = "40" readonly>
					<a onClick="toPopup();">�ּ� �˻�</a><br><br>
					<input type="text" name="to_spec" size = "40">
					<a onClick="calculate();">���</a>
				</td>
			</tr>
			<tr>
				<td>���� �Ÿ�</td>
				<td><input name = "distance" size = "5" readonly></td>
			</tr>
			<tr>
				<td>���� �ҿ�ð�</td>
				<td><input name = "time" size = "6" readonly></td>
			</tr>
			<tr>
				<td>���� �����ð�</td>
				<td><input name = "ETA" size = "8" readonly></td>
			</tr>
			<tr>
				<td>��õ ���</td>
				<td><input name = "recommend_cost" size = "8" readonly>(VAT ����)</td>
			</tr>
			<tr>
				<td></td>
				<td><input type = "submit" name = "next" value = "����" onClick = "next()" hidden>
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