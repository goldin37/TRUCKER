<%@page import="Driver.DriverBean"%>
<%@page import="Driver.DriverDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//login.html�� ���� �Է¹��� id,password
	String id = request.getParameter("driver_id");
	String pwd = request.getParameter("driver_pwd");
	
	DriverDBBean db = DriverDBBean.getInstance();
	//DB�� ��ü�� �ޱ� ���� ����
	
	int check = db.userCheck(id, pwd);
	//������ �ִ��� Ȯ���ϴ� �޼ҵ�
	
	DriverBean tb = db.getDriver(id);
	
	if(tb == null){ // id�� null�̸�
%>
		<script>
			alert("�������� ���� ȸ��");
			history.go(-1);//���������� �̵�
		</script>
<%
	}else{ // ȸ�� ������ ��
		String name = tb.getDriver_name(); // �̸� ��� - >name
		String phone =tb.getDriver_phone_number(); // ��ȭ��ȣ
		String license = tb.getDriver_license(); // ����
		String truck_type = tb.getTruck_type(); //��������
		String truck_number = tb.getTruck_number(); // ������ȣ
		
		if(check ==1 ){
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("phone", phone);
			session.setAttribute("license", license);
			session.setAttribute("truck_type", truck_type);
			session.setAttribute("truck_number", truck_number);
			
			response.sendRedirect("mypage.jsp");
		}else if(check == 0){//��й�ȣ Ʋ����
%>
			<script>
				alert("��й�ȣ�� ���� �ʽ��ϴ�.");
				history.go(-1);//���������� �̵�
			</script>
<%
		}else{//���̵� ���� ��,
%>
			<script>
				alert("���̵� �����ϴ�.");
				history.go(-1);
			</script>
<%
		}
	}
%>
