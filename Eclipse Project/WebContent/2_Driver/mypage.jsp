<%@page import="myUtil.DeliveryOrder"%>
<%@page import="myUtil.DeliveryOrderDB"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	if(session.getAttribute("id") == null){
%>
		<jsp:forward page ="login.html"></jsp:forward>
<%
	}
	String id = (String)session.getAttribute("id");
	String name =(String)session.getAttribute("name");
	String license = (String)session.getAttribute("license");
	String truck_type = (String)session.getAttribute("truck_type");
	String truck_number = (String)session.getAttribute("truck_number");
	String phone = (String)session.getAttribute("phone");
	
	// �������� ���
		
	String cargo_type="",cargo_help="",to_where="",from_where="",customer_name="";
	int cargo_weight=0,fix_cost=0;
	Timestamp depart_time=null;
	
	DeliveryOrderDB db = DeliveryOrderDB.getInstance();
	DeliveryOrder deliveryorder = db.shipping(id);

	if(id == null){
		System.out.println("���̵� �ȳѾ�Դ�..");
	}
	else{
		
		if(deliveryorder != null){
			truck_type = deliveryorder.getTruck_type();
			cargo_type = deliveryorder.getCargo_type();
			cargo_weight =deliveryorder.getCargo_weight();
			cargo_help = deliveryorder.getCargo_help();
			to_where = deliveryorder.getTo_where() + deliveryorder.getTo_spec();
			from_where = deliveryorder.getFrom_where() + deliveryorder.getFrom_spec();
			depart_time = deliveryorder.getDepart_time();
			customer_name = deliveryorder.getCustomer_name();
			fix_cost = deliveryorder.getFix_cost();
			
		}
	}
%>
<html lang="en">
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>����������</title>
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
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
                <td><a href = "orderlist.jsp?driver_id=<%=id%>">������Ȳ</a></td>
                <td><a href = "mypage.jsp">����������</a></td>
                <td><a href = "../3_ServiceCenter/FAQ_main.jsp">������</a></td>
                <td><a href = "../1_Customer/companyIntroduction.html">ȸ��Ұ�</a></td>
            </tr>
        </table>
      </nav>
    <section class="box">
        <h2 id="box">��������</h2> 
        <p style="font-weight: bolder; padding-left: 90px;">
           	ȯ���մϴ� ! <%= name %>(<%=id %>)�� 
        </p>
        <table>
            <form>
            <tr>
                <td>�̸� : <%=name %></td>
            </tr>
            <tr>
                <td>�޴���ȭ : <%=phone %></td>
            </tr>
            <tr>
                <td>���� ��ȣ: <%=license %></td>
            </tr>
            <tr>
                <td>
                	���� : 
			 		<%= truck_type %>
                </td>
            </tr>
            <tr>
                <td>������ȣ : <%=truck_number %></td>
            </tr>
            </form>
        </table>
        <input type="button" value="�α׾ƿ�" class="click" onclick="location.href='logOut.jsp'">
        <input type="button" value="��������" class="click" onclick="location.href='modification.jsp'">
    </section>
    <section class="now">
       		<%
            	if(depart_time != null){
       		%>
       				<h2 id="box">���� ���� ���</h2>
       		<%
            	}else{
            %>
            		<h2 id="box">�������� ����� �����ϴ�.</h2>
            <%
            	}
            %>
        <table>
            <form name="form" action="view_ordered.jsp" method="post" enctype="multipart/form-data">
            <%
            	if(depart_time != null){
       		%>
            <tr>
                <td>���̸� : <%=customer_name %></td>
            </tr>
            <tr>
                <td>
                	������� : <%=depart_time %>
               	</td>
            </tr>
            <tr>
                <td>ȭ������ : 
					<%
                    	String cargotype = "";
                    	if(cargo_type.equals("pallet")){
                    		cargotype = "�ķ�Ʈ";
                    	}else if(cargo_type.equals("box")){
                    		cargotype = "�ڽ�";
                    	}else if(cargo_type.equals("equipment")){
                    		cargotype = "�����";
                    	}else if(cargo_type.equals("general")){
                    		cargotype = "�Ϲ�ȭ��(�̻��� ��)";
                    	}
                    %>
                   	<%=cargotype %>
				</td>
            </tr>
            <tr>
                <td>ȭ������ : <%=cargo_weight %></td>
            </tr>
            <tr>
                <td>������ :<%=from_where %></td>
            </tr>
            <tr>
                <td>������ : <%=to_where %></td>
            </tr>
            <tr>
                <td>���������� : 
					<%
                    	String cargohelp = "";
                    	if(cargo_help.equals("drive_only")){
                    		cargohelp = "��۸�";
                    	}else if(cargo_help.equals("load_and_discharge")){
                    		cargohelp = "������ ���� �ʿ�";
                    	}else if(cargo_help.equals("to_door")){
                    		cargohelp = "�������� ��/â����� �̵�";
                    	}
                    %>
                   	<%=cargohelp %>
				</td>
            </tr>
            <tr>
                <td>���Ӻ�� : <%=fix_cost%></td>
            </tr>
            <tr>
                <td>
                    <input type="button" value="������" class="click" onclick="location.href='delete_order.jsp?driver_id=<%=id%>'">
                    <input type="button" value="��ۿϷ�" class="click" onclick="location.href='completed_order.jsp?driver_id=<%=id%>'">
                    <!-- @##@##@##@##@##@##@ here!!!#@#@#@#@#@#@# ��ۿϷ� ������ completed_order�� �Ѿ�� complete�� �ٲ�ϴ�. @#@#@#@#@#@#@#@#@#@#
                    		�޼ҵ�� deliveryOrderDB�� completeorder()�Դϴ�. @#@!#@!#!@#!@$!@#@!#!@#!@#!@#!@#-->
                    <input type="button" value="�������Ȯ��" class="click" onclick="location.href='orderlist.jsp?driver_id=<%=id%>'">
                    <input type="button" value="��۳���Ȯ��" class="click" onclick="location.href='view_ordered.jsp'">
                    
                 <%
            		}else{
           		 %>
                    <input type="button" value="�������Ȯ��" class="click_1" onclick="location.href='orderlist.jsp?driver_id=<%=id%>'">
                    <input type="button" value="��۳���Ȯ��" class="click_1" onclick="location.href='view_ordered.jsp'">
                <%
            		}
         	  	 %>    
                 </td>
             </tr>
            </form>
        </table>
    </section>

    <section class="question">
        <h2 id="box">���ǻ���</h2> 
        <ul>
            <li><a href="../3_ServiceCenter/Notice_main.jsp"> �������� �ٷΰ���</a></li>
            <li><a href="../3_ServiceCenter/FAQ_main.jsp"> �����ϴ� ����(FAQ) �ٷΰ���</a></li>
            <li>������ ��ð� 09:00~18:00</li>
            <li>��ȭ��ȣ 1555-1555</li>
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
