<%@page import="myUtil.HanConv"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="HanConv" class = "myUtil.HanConv"></jsp:useBean>
<%
	
	//������ �ѱ۷� �ٲٱ�
	String truck_type = (String)session.getAttribute("truck_type");
	if(truck_type.equals("damas")){
		truck_type = "�ٸ���";
	} else if(truck_type.equals("labo")){
		truck_type = "��";
	} else if(truck_type.equals("1ton")){
		truck_type = "1�� Ʈ��";
	} else if(truck_type.equals("1.4ton")){
		truck_type = "1.4�� Ʈ��";
	} else if(truck_type.equals("2.5ton")){
		truck_type = "2.5�� Ʈ��";
	}
	String cargo_type = (String)session.getAttribute("cargo_type");
	if(cargo_type.equals("pallet")){
		cargo_type = "�ķ�Ʈ";
	} else if(cargo_type.equals("box")){
		cargo_type = "�ڽ�";
	} else if(cargo_type.equals("equipment")){
		cargo_type = "�����";
	} else if(cargo_type.equals("general")){
		cargo_type = "�Ϲ�ȭ��";
	}
	String cargo_weight = session.getAttribute("cargo_weight") + "kg";
	
	String cargo_help = (String)session.getAttribute("cargo_help");;
	if(cargo_help.equals("drive_only")){
		cargo_help = "��۸�";
	} else if(cargo_help.equals("load_and_discharge")){
		cargo_help = "������ ���� �ʿ�";
	} else if(cargo_help.equals("to_door")){
		cargo_help = "������ �� ��/â����� �̵�";
	}
	String depart_time = (String)session.getAttribute("depart_time");
	depart_time = depart_time.substring(0,4) + "�� " 
	+ Integer.parseInt(depart_time.substring(5,7)) + "�� "
	+ Integer.parseInt(depart_time.substring(8,10)) + "�� "
	+ depart_time.substring(11,13) + "�� "
	+ depart_time.substring(14,16) + "��";
	
	String ETA = (String)session.getAttribute("ETA");
	ETA = ETA.substring(0,4) + "�� " 
	+ Integer.parseInt(ETA.substring(5,7)) + "�� "
	+ Integer.parseInt(ETA.substring(8,10)) + "�� "
	+ ETA.substring(11,13) + "�� "
	+ ETA.substring(14,16) + "��";
	
	
	String cost_text = session.getAttribute("fix_cost") +"";
	int temp_cost = Integer.parseInt(cost_text);
	int cost_left = temp_cost / 1000;
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�޴���ȭ �Ҿװ���</title>
</head>
<script>
function mobile_payment(){
	//��ȭ��ȣ �Է� ���ϸ� ���
	if(document.form.tel_company.value == "tel_company"){
		alert("��Ż縦 ���� ���ּ���.")
		return
	}
	if(document.form.tel1.value == "" || document.form.tel2.value == "" || document.form.tel3.value == ""){
		alert("��ȭ��ȣ�� �Է� ���ּ���.")
		return
	}
	//�̸� �Է� ���ϸ� ���
	if(document.form.name.value == ""){
		alert("�̸��� �Է� ���ּ���.")
		return
	}
		
	opener.location.href = "mobile_payment_ok.jsp"
	window.close()
}
</script>
<body>
	<table>
    	<tr><td>���� ����</td>
    	<td><%= truck_type %></td></tr>
    	<tr><td>ȭ�� ����</td>
    	<td><%= cargo_type %></td></tr>
    	<tr><td>ȭ�� ����</td>
    	<td><%= cargo_weight %></td></tr>
    	<tr><td>������ ����</td>
    	<td><%= cargo_help %></td></tr>
    	<tr><td>ȭ�� ���λ���</td>
    	<td><%= HanConv.toKor((String)session.getAttribute("cargo_spec")) %></td></tr>
    	<tr><td>�����</td>
    	<td><%= HanConv.toKor((String)session.getAttribute("from_where")) + HanConv.toKor((String)session.getAttribute("from_spec"))%></td></tr>
    	<tr><td>������</td>
    	<td><%= HanConv.toKor((String)session.getAttribute("to_where")) + HanConv.toKor((String)session.getAttribute("to_spec"))%></td></tr>
    	<tr><td>��� �ð�</td>
    	<td><%= depart_time %></td></tr>
    	<tr><td>��� �Ÿ�</td>
    	<td><%= (String)session.getAttribute("distance") %>km</td></tr>
    	<tr><td>��� �ð�</td>
    	<td><%= HanConv.toKor((String)session.getAttribute("time")) %></td></tr>
    	<tr><td>���� ���� �ð�</td>
    	<td><%= ETA %></td></tr>
    	<tr><td>�� ����</td>
    	<td><%= HanConv.toKor((String)session.getAttribute("customer_name")) %></td></tr>
    	<tr><td>�� ����ó</td>
    	<td><%= (String)session.getAttribute("customer_telephone") %></td></tr>
    	<tr><td>����</td>
    	<td><%= cost_left + ",000�� (�ΰ���ġ�� ����)" %></td></tr>
	</table>
	<h1>���� �ݾ� : <%= cost_left + ",000��"%></h1>
	<form name = "form" method = "post" action = "mobile_payment_ok.jsp">
		<select name = "tel_company">
			<option value = "tel_company">��Ż�</option>
			<option value = "SKT">SKT</option>
			<option value = "KT">KT</option>
			<option value = "LGU+">LGU+</option>
		</select>
		<input type = "text" name = "tel1" value = "010" size = "3">
		- <input type = "text" name = "tel2" size = "4">
		- <input type = "text" name = "tel3" size = "4">
		�̸� : <input type = "text" name = "name" size = "5">
		<input type = "button" value = "����" onClick = "mobile_payment()">
	</form>
</body>
</html>