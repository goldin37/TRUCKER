<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
    <title>ȭ�� ����</title>
    <script>
    function next(){
       	//���� �Է� ���ϸ� ���       	
       	if(document.getElementById("from_where").value == ""){
       		alert("����ֱ�!");
       		return;
       	}
     	//��߽ð� ��������� ���
    	//������ �ּ� ��������� ���
    	
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
        <h1>ȭ�� ����</h1>
        <form method = "post" action = "order_confirm.jsp">
        	<table>
        		<tr><th colspan = "2">����� �� ������</th></tr>
        		<tr><td width="20%">�����</td>
        		<td><input type="text" id="from_where" name = "from_where" placeholder="�ּ�" onclick="from()" readonly>
					<input type="text" id="from_spec" name = "from_spec" placeholder="���ּ�">
					<div id="wrap_from" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="���� ��ư">
					</div>
        		</td></tr>
        		<tr><td>��� �ð�</td>
        		<td><input type = "datetime-local" name = "depart_time"></td></tr>
        		
        		<tr><td>������</td>
        		<td><input type="text" id="to_where" name = "to_where" placeholder="�ּ�" onclick="to()" readonly>
					<input type="text" id="to_spec" name = "to_spec" placeholder="���ּ�">
					<div id="wrap_to" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="���� ��ư">
					</div>
        		</td></tr>
        		
	        	<tr><th colspan = 2>���� �� ȭ�� ����</th></tr>
               	<tr><td>����</td><td>
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
            <tr><td>ȭ�� ���λ���</td><td><textarea name = "cargo_spec" cols = "70" rows = "5" 
            placeholder="��> 40kg �а��� ���� X 60����, ��ڿ� �Ű� ���ּ���. ȭ�� ���� �� ������ �������� �ϴ�, ��۸� ���ֽø� �˴ϴ�. 19:00���� �� �����ؾ� �ϴ� �ݵ�� �ð� �����ּ���."></textarea><br>
            	 �� �������� ȭ�� ������ ��۽� �ʼ����� ������ �����ּ���. ȭ�� ��ۿ� �ʿ��� �������� ������ �����Ǵ� ���, ��� ���� ���� ����� �źε� �� �ֽ��ϴ�.<br>
            <input type = "button" value = "����" onClick = "next()"></td></tr>
        		
        	</table>
        </form>
	</section>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // �����ȣ ã�� ã�� ȭ���� ���� element
    var element_wrap_from = document.getElementById('wrap_from');
    var element_wrap_to = document.getElementById('wrap_to');

    function foldDaumPostcode() {
        // iframe�� ���� element�� �Ⱥ��̰� �Ѵ�.
        element_wrap_from.style.display = 'none';
        element_wrap_to.style.display = 'none';
    }
	//����� �ּ� �˻�
    function from() {
        // ���� scroll ��ġ�� �����س��´�.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                    document.getElementById("from_spec").value = extraAddr;
                
                } else {
                    document.getElementById("from_spec").value = '';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById("from_where").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("from_spec").focus();

                // iframe�� ���� element�� �Ⱥ��̰� �Ѵ�.
                // (autoClose:false ����� �̿��Ѵٸ�, �Ʒ� �ڵ带 �����ؾ� ȭ�鿡�� ������� �ʴ´�.)
                element_wrap_from.style.display = 'none';

                // �����ȣ ã�� ȭ���� ���̱� �������� scroll ��ġ�� �ǵ�����.
                document.body.scrollTop = currentScroll;
            },
            // �����ȣ ã�� ȭ�� ũ�Ⱑ �����Ǿ����� ������ �ڵ带 �ۼ��ϴ� �κ�. iframe�� ���� element�� ���̰��� �����Ѵ�.
            onresize : function(size) {
                element_wrap_from.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap_from);

        // iframe�� ���� element�� ���̰� �Ѵ�.
        element_wrap_from.style.display = 'block';
        
        
    }
	//����� �ּ� �˻�
    function to() {
        // ���� scroll ��ġ�� �����س��´�.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                    document.getElementById("to_spec").value = extraAddr;
                
                } else {
                    document.getElementById("to_spec").value = '';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById("to_where").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("to_spec").focus();

                // iframe�� ���� element�� �Ⱥ��̰� �Ѵ�.
                // (autoClose:false ����� �̿��Ѵٸ�, �Ʒ� �ڵ带 �����ؾ� ȭ�鿡�� ������� �ʴ´�.)
                element_wrap_to.style.display = 'none';

                // �����ȣ ã�� ȭ���� ���̱� �������� scroll ��ġ�� �ǵ�����.
                document.body.scrollTop = currentScroll;
            },
            // �����ȣ ã�� ȭ�� ũ�Ⱑ �����Ǿ����� ������ �ڵ带 �ۼ��ϴ� �κ�. iframe�� ���� element�� ���̰��� �����Ѵ�.
            onresize : function(size) {
                element_wrap_to.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap_to);

        // iframe�� ���� element�� ���̰� �Ѵ�.
        element_wrap_to.style.display = 'block';
        
        
    }
</script>
</body>
</html>