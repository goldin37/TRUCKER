<%@page import="java.text.DecimalFormat"%>
<%@page import="myUtil.HanConv"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="myUtil.GeoCode"%>
<%@page import="myUtil.Directions5"%>
<jsp:useBean id="HanConv" class = "myUtil.HanConv"></jsp:useBean>
<%
	//order3���� �Ѱ��� �� ���ǿ� ����
	session.setAttribute("to_where", request.getParameter("to_where"));
	session.setAttribute("to_spec", request.getParameter("to_spec"));
	
	String depart_time = (String)session.getAttribute("depart_time");
	//��۰Ÿ�, �ð�, ETA ���
	Directions5 dir = new Directions5();
	
	dir.Direction(HanConv.toKor((String)session.getAttribute("from_where"))
			, HanConv.toKor((String)session.getAttribute("to_where"))
			, (String)session.getAttribute("truck_type")
			, Integer.parseInt((String)session.getAttribute("cargo_weight"))
			, (String)session.getAttribute("cargo_help")
			, depart_time);
	
	session.setAttribute("ETA", dir.ETA);
	session.setAttribute("recommend_cost", dir.recommend_cost);
	session.setAttribute("fix_cost", dir.recommend_cost);

	//��߽ð� ��ȯ
	depart_time = depart_time.substring(0, 4) + "�� " + depart_time.substring(5,7) + "/" + depart_time.substring(8,10) + " " + depart_time.substring(11,13) + ":" + depart_time.substring(14,16);
	
	
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
	
	DecimalFormat df = new DecimalFormat(",###");
	String cost_text = df.format(dir.recommend_cost) + "��";
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
    <title>ȭ������(4/4)</title>
<script language="javascript">
	document.form.fix_cost.value = <%= request.getParameter("recommend_cost") %>

	function check_spec(){
		form.spec.hidden = false;
	}
	
function order(){
	//�̸� ������ ���
	if(document.form.name.value == ""){
		alert("�̸��� �����ּ���.")
		return
	}
	//��ȭ��ȣ ������ ���
	if(document.form.tel1.value == "" || document.form.tel2.value == "" || document.form.tel3.value == ""){
		alert("��ȭ��ȣ�� �����ּ���.")
		return
	}
	//�ֹ�Ȯ�� üũ ���ϸ� ���
	if(document.form.confirm.checked == false){
		alert("�ֹ������� Ȯ���� �� üũ ���ּ���.")
		return
	}
	if(document.form.contract.checked == false){
		alert("ȭ����� ����� Ȯ���� �� üũ ���ּ���.")
		return
	}
	if(document.form.information.checked == false){
		alert("�������� ó����ħ�� Ȯ���� �� üũ ���ּ���.")
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
        <h1>ȭ�� ����(4/4)</h1>
    	<form name = "form" method = "post" action = "payment.jsp">
    <table>
    	<tr>
    		<th colspan = "2">��� �ֹ� ����</th>
    	</tr>
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
    	<td><input type = "text" name = "distance" value = "<%= dir.distance %>" readonly>km</td></tr>
    	<tr><td>��� �ð�</td>
    	<td><input type = "text" name = "time" value = "<%= dir.time %>" readonly></td></tr>
    	<tr><td>���� ���� �ð�</td>
    	<td><input type = "text" name = "ETA" value = "<%= dir.ETA.substring(0,4) + "�� " + dir.ETA.substring(5,7) + "�� " + dir.ETA.substring(8,10) + "�� " + dir.ETA.substring(11,13) + ":" + dir.ETA.substring(14,16) %>" readonly></td></tr>
    	<tr><td>����</td>
    	<td><input type = "text" name = "fix_cost" value = "<%= cost_text %>">
    	<input type ="button" onClick="check_spec()" value = "���ο��� Ȯ��"></td></tr>

    	<tr><td></td><td><output name = "spec" hidden><b>1. �����</b><br>
    	<%= dir.toll_cost + "�� + (" + dir.distance + "km �� " + (double)Math.round(dir.fuel_rate*100)/100 + "km/L �� " + dir.fuel_cost_rate + "��/L) + = <b>" + (dir.toll_cost + dir.fuel_cost) + "��</b>" %><br>
    	<%= dir.toll_cost + "�� + (" + dir.distance + "km �� " + (double)Math.round(dir.fuel_rate*100)/100 + "km/L �� " + dir.fuel_cost_rate + "��/L) = <b>" + (dir.toll_cost + dir.fuel_cost) + "��</b>" %><br>
    	<%= dir.toll_cost + "�� + (" + dir.distance + "km �� " + (double)Math.round(dir.fuel_rate*100)/100 + "km/L �� " + dir.fuel_cost_rate + "��/L) = <b>" + (dir.toll_cost + dir.fuel_cost) + "��</b>" %><br>
		��� + ������(����Ÿ� �� ���� �� ���ʹ� �����)<br><br>
		<b>2. ���� ������</b><br>
		<%= dir.distance + "km �� " + dir.maintenance_rate + "�� = <b>" + dir.maintenance_cost + "��</b>" %><br>
		����Ÿ� �� �Ÿ��� ������<br><br>
		<b>3. �ΰǺ�</b><br>
		<%= "( " + (double)(Math.round((double)dir.temptime/60/60*100))/100 + "�ð� �� 10,000�� ) + ( " + session.getAttribute("cargo_weight") + "kg �� �۾��� ) = <b>" + dir.labor_cost + "��</b>"%><br>
		������(����ð� �� 10,000��) + ���۾���(ȭ������(kg) �� �۾���)<br>
		���۾��� : ������ 15��, �������� 50��<br><br>
		<b>4. �հ� ����</b><br>
		<%= (dir.toll_cost + dir.fuel_cost) + "�� + " + dir.maintenance_cost + "�� + " + dir.labor_cost + "�� + " + dir.commission + "�� + " + dir.vat + "�� = <b>" + dir.recommend_cost + "��</b>"%><br>
		����� + ���� ������ + �ΰǺ� + ������ + �ΰ��� ( 1,000�� �̸� ���� )
    	</output></td></tr>

    	<tr><th colspan = "2">��� �ֹ�</th></tr>
    	<tr><td>����</td>
    	<td><input type = "text" name = "name" size = "6"></td>
    	</tr>
    	<tr><td>��ȭ��ȣ</td>
    	<td><input type = "text" name = "tel1" value = "010" size = "3">
    	 - <input type = "text" name = "tel2" size = "4">
    	 - <input type = "text" name = "tel3" size = "4">
    	</td></tr>
    	<tr><td>�ֹ� Ȯ��</td>
    	<td class = "simple_link">
			<label><input type = "checkbox" name = "confirm">���� ����ֹ� ������ Ȯ���Ͽ����ϴ�.</label><br>    	
    		<label><input type = "checkbox" name = "contract"><a href = "contract.html">ȭ����� ���</a>�� �����մϴ�.</label><br>
			<label><input type = "checkbox" name = "information"><a href = "personal_information.html">�������� ó����ħ</a>�� �����մϴ�.</label>    	
		</td></tr>
		<tr><td></td><td><input type = "button" value = "Ȯ�� �� ����" onClick = "order()"></td></tr>
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