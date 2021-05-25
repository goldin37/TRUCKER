<%@page import="myUtil.queryDB"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myUtil.DeliveryOrder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("customer_name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");

	String tel = phone1+phone2+phone3;
	
	
	queryDB odb = queryDB.getInstance(); 
	DeliveryOrder order = odb.getOrder2(name, tel);
	
	int order_id = 0;
	String order_state = "";
	Timestamp order_date_time = null;
	Timestamp accept_date_time = null;
	Timestamp depart_date_time = null;
	Timestamp arrive_date_time = null;
	Timestamp complete_date_time = null;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	
	if(order != null){
		order_id = order.getOrder_id();
		order_state = order.getOrder_state();
		order_date_time = order.getOrder_date_time();
		accept_date_time = order.getAccept_date_time();
		depart_date_time = order.getDepart_date_time();
		arrive_date_time = order.getArrive_date_time();
		complete_date_time = order.getComplete_date_time();
	} else {
		%>
		<script>
		alert("ã���ô� ������ �����ϴ�");
		history.go(-1);
		</script>
		<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
</head>
</head>
<body class = "order_query">
    <header>
        <h2>���� �� �ִ� ȭ�� �߰� �÷���</h2>
        <h1>Ʈ��Ŀ(TRUCKER)</h1>
    </header>
    <nav>
        <table>
            <tr>
                <td><a href = "order.html">ȭ������</a></td>
                <td><a href = "order_query.jsp">�����ȸ</a></td>
                <td><a href = "../3_ServiceCenter/Notice_main.jsp">������</a></td>
                <td><a href = "companyIntroduction.html">ȸ��Ұ�</a></td>
            </tr>
        </table>
    </nav>
    <section>
    <br>
        <form action="order_query_Search_order_id.jsp" method="post">
        <h1>��� ��ȸ</h1>
        <table>
            <tr>
                <td rowspan = 4 width = 250px>
                    ��� ��ȣ <input type = "text" size = 5 name="order_id">
                    <input type="submit" value="��ȸ" class="shipping">    
                </td>
                <td>
                    ��۹�ȣ�� �Ҿ���Ⱦ��. <a>��۹�ȣ ã��</a>
                </td>
            </tr>
            </form>
            <form action="order_query_Search_name_tel.jsp" method="post">
            <tr>
                <th>��۹�ȣ ��ȸ</th>
            </tr>
            <tr>
                <td>
                    �̸� <input type = "text" size = 3 name="customer_name">
                    ��ȭ��ȣ <input type = "text" size = 3 name="phone1" maxlength="3">-<input type = "text" size = 4 name="phone2" maxlength="4">-<input type = "text" size = 4 name=phone3 maxlength="4">

                    <input type="submit" value="��ȸ" class="shipping">
                </td>
            </tr>
        </table>
        <table>
                <tr><th colspan="2">��� ����</th></tr>
            <td colspan="2">
                ��� ��ȣ : <point><%= order_id %></point><br><br>
                
                <!-- ��ۻ��¿� �´� �̹��� -->
                <% if(order_state.equals("order")){
                	%> <img src = "../images/assign1.png" width="100%"> <%
                }else if(order_state.equals("accept")){
                	%> <img src = "../images/assign2.png" width="100%"> <%
                }else if(order_state.equals("depart")){
                	%> <img src = "../images/assign3.png" width="100%"> <%
                }else if(order_state.equals("arrive")){
                	%> <img src = "../images/assign4.png" width="100%"> <%
                }else{
                	%> <img src = "../images/assign5.png" width="100%"> <%
                } %>
                <br><br>
                
                
                <!-- ��ۻ��� �޼��� -->
                ������ ȭ���� <point><% if(order_state.equals("order")){
                	%> ��� ���� <%
                }else if(order_state.equals("accept")){
                	%> ���� �Ϸ� <%
                }else if(order_state.equals("depart")){
                	%> ��� ���� <%
                }else if(order_state.equals("arrive")){
                	%> ��� �Ϸ� <%
                }else{
                	%> ��� Ȯ�� <%
                } %>
                
              </point> �Ǿ����ϴ�.<br><br><br>
              
               <!-- null���� �ƹ��͵� ���x -->
                ��� ���� : <% if(order_date_time == null){
                } else {
                	%><%= order_date_time %> <%
                }
                %><br>
                
                ���� �Ϸ� : <% if(accept_date_time == null){
                } else {
                	%><%= accept_date_time %> <%
                }
                %><br>
                
                ��� ���� : <% if(depart_date_time == null){
                } else {
                	%><%= depart_date_time %> <%
                }
                %><br>  
                
                ��� �Ϸ� : <% if(arrive_date_time == null){
                } else {
                	%><%= arrive_date_time %> <%
                }
                %><br> 
                
                ��� Ȯ�� : <% if(complete_date_time == null){
                } else {
                	%><%= complete_date_time %> <%
                }
                %><br> 
            </td>
        </table>
        </form>
        <br><br>
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