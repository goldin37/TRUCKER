<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
    <title>ȭ������(1/4)</title>
    <script>
    function next(){
    	// �������� ���� ���ϸ� ���
    	var radio = document.getElementsByName("truck_type");
        var radio_value = null; 
        for(var i=0; i<radio.length; i++) {
            if(radio[i].checked) {
             radio_value = radio[i].value
            }
        }
        if(radio_value == null){
        	alert("���� ������ �����ϼ���.")
        	return
        }
        //ȭ������ ���� ���ϸ� ���
    	radio = document.getElementsByName("cargo_type");
        radio_value = null; 
        for(var i=0; i<radio.length; i++) {
            if(radio[i].checked) {
             radio_value = radio[i].value
            }
        }
        if(radio_value == null){
        	alert("ȭ�� ������ �����ϼ���.")
        	return
        }
       	//���� �Է� ���ϸ� ���
    	if(document.form.cargo_weight.value == ""){
    		alert("ȭ�� ���԰� �Էµ��� �ʾҽ��ϴ�.")
    		return
    	}
       	//������ ���� ���� �ʰ��Ǹ� ���
    	radio = document.getElementsByName("truck_type");
        radio_value = null; 
        for(var i=0; i<radio.length; i++) {
            if(radio[i].checked) {
             radio_value = radio[i].value
            }
        }
        if(radio_value == "damas" && document.form.cargo_weight.value > 300){
        	alert("�ٸ��� ����뷮�� 300kg�� ���� �� �����ϴ�.")
        	return
        }
        if(radio_value == "labo" && document.form.cargo_weight.value > 500){
        	alert("�� ����뷮�� 500kg�� ���� �� �����ϴ�.")
        	return
        }
        if(radio_value == "1ton" && document.form.cargo_weight.value > 1000){
        	alert("1��Ʈ�� ����뷮�� 1000kg�� ���� �� �����ϴ�.")
        	return
        }
        if(radio_value == "1.4ton" && document.form.cargo_weight.value > 1400){
        	alert("1.4��Ʈ�� ����뷮�� 1400kg�� ���� �� �����ϴ�.")
        	return
        }
        if(radio_value == "2.5ton" && document.form.cargo_weight.value > 2500){
        	alert("2.5��Ʈ�� ����뷮�� 2500kg�� ���� �� �����ϴ�.")
        	return
        }
        //������ ���� ���� ���ϸ� ���
    	radio = document.getElementsByName("cargo_help");
        radio_value = null; 
        for(var i=0; i<radio.length; i++) {
            if(radio[i].checked) {
             radio_value = radio[i].value
            }
        }
        if(radio_value == null){
        	alert("������ ���� ���θ� �����ϼ���.")
        	return
        }
       	
    	form.submit()
    }
    </script>
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
        <h1>ȭ�� ����(1/4)</h1>
        <form name = "form" method = "post" action = "order2.jsp">
            <table>
        	<tr><th colspan = 2>���� �� ȭ�� ����</th></tr>
        	<tr>
        		<td>����</td><td>
        		    <label><input type = "radio" name = "truck_type" value = "damas"">�ٸ���</label> &nbsp&nbsp&nbsp
                    <label><input type = "radio" name = "truck_type" value = "labo"">��</label> &nbsp&nbsp&nbsp
                    <label><input type = "radio" name = "truck_type" value = "1ton">1��</label> &nbsp&nbsp&nbsp
                    <label><input type = "radio" name = "truck_type" value = "1.4ton">1.4��</label> &nbsp&nbsp&nbsp
                    <label><input type = "radio" name = "truck_type" value = "2.5ton">2.5��</label> &nbsp&nbsp&nbsp
                    <a href = "truck_information.html">���� ����</a>
        		</td>
        	</tr>
            <tr><td>ȭ�� ����</td>
                <td>
                    <label><input type = "radio" name = "cargo_type" value = "pallet">�ķ�Ʈ</label> &nbsp&nbsp&nbsp
                    <label><input type = "radio" name = "cargo_type" value = "box">�ڽ�</label> &nbsp&nbsp&nbsp
                    <label><input type = "radio" name = "cargo_type" value = "equipment">�����</label> &nbsp&nbsp&nbsp
                    <label><input type = "radio" name = "cargo_type" value = "general">�Ϲ�ȭ��(�̻��� ��)</label> &nbsp&nbsp&nbsp
                </td></tr>
            <tr><td>ȭ�� ����</td><td><input type = "number" name = "cargo_weight" size = "2" max = "2500" min = "0">kg</td></tr>
            <tr><td>������ ����</td>
                <td>
                    <label><input type = "radio" name = "cargo_help" value = "drive_only">��۸�</label><br>
                    <label><input type = "radio" name = "cargo_help" value = "load_and_discharge">������ ���� �ʿ�</label><br>
                    <label><input type = "radio" name = "cargo_help" value = "to_door">������ �� ��/â����� �̵�</label><br>
                </td></tr>
            <tr><td>ȭ�� ���λ���</td><td><textarea name = "cargo_spec" cols = "75" rows = "5" 
            placeholder="��> 40kg �а��� ���� X 60����, ��ڿ� �Ű� ���ּ���. ȭ�� ���� �� ������ �������� �ϴ�, ��۸� ���ֽø� �˴ϴ�. 19:00���� �� �����ؾ� �ϴ� �ݵ�� �ð� �����ּ���."></textarea><br>
            	 �� �������� ȭ�� ������ ��۽� �ʼ����� ������ �����ּ���. ȭ�� ��ۿ� �ʿ��� �������� ������ �����Ǵ� ���, ��� ���� ���� ����� �źε� �� �ֽ��ϴ�.<br>
            <input type = "button" value = "����" onClick = "next()"></td></tr>
       	</table>
       	</form>
    </section>
    <footer>
        (��)Ʈ��Ŀ �λ�� �ؿ�뱸 ������Ƽ3�� 45 | ����ڹ�ȣ : 123-45-12345 | <br> 
        ����Ǹž� : 2021 - �λ� ����-01234 | ȭ������ּ� ��160236ȣ | <br> 
        ��ȭ��ȣ : 1588-3333 | �ѽ� : 070-1234-1234 | ��ǥ���� : trucker@naver.com <br>
        <a href = "contract.html">ȭ����۾��</a> | <a href = "personal_information.html">�������� ó����ħ</a><br>
        COPYRIGHT(C) TRUCKER LTD. ALL RIGHT RESERVED.
    </footer>

</body>
</html>