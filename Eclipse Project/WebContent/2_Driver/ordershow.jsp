<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="myUtil.DeliveryOrderDB"%>
<%@page import="myUtil.DeliveryOrder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum =request.getParameter("pageNum");

	int orderid = Integer.parseInt(request.getParameter("order_id"));
	DeliveryOrderDB db = DeliveryOrderDB.getInstance();
	DeliveryOrder deliveryorder = db.getOrder(orderid);
	
	String truck_type ="",cargo_type ="",cargo_help ="",cargo_spec ="",
			to_where ="",from_where ="",time ="",eta ="",customer_name ="",customer_tel ="";
	int order_id = 0, cargo_weight = 0, distance = 0,fix_cost = 0;
	Timestamp depart_time = null;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	
	if(deliveryorder != null){
		order_id = deliveryorder.getOrder_id();
		truck_type = deliveryorder.getTruck_type();
		cargo_type = deliveryorder.getCargo_type();
		cargo_weight =deliveryorder.getCargo_weight();
		cargo_help = deliveryorder.getCargo_help();
		cargo_spec = deliveryorder.getCargo_spec();
		to_where = deliveryorder.getTo_where() + deliveryorder.getTo_spec();
		from_where = deliveryorder.getFrom_where() + deliveryorder.getFrom_spec();
		depart_time = deliveryorder.getDepart_time();
		time = deliveryorder.getTime();
		distance = deliveryorder.getDistance();
		eta = deliveryorder.getETA();
		customer_name = deliveryorder.getCustomer_name();
		customer_tel = deliveryorder.getCustomer_telephone();
		fix_cost = deliveryorder.getFix_cost();
		
	}
%>
<html lang="en">
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../style/mystyle.css" type = "text/css">
    <!-- style/mystyle.css �� ���� -->
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
                <td><a href = "#">�����ȸ</a></td>
                <td><a href = "#">mypage</a></td>
                <td><a href = "#">��������</a></td>
                <td><a href = "#">ȸ��Ұ�</a></td>
            </tr>
        </table>
      </nav>
   <section class="ordershow">
        <h1>��û�� ���</h1>
        <table>
            <form>
                <tr>
                    <td width="130">�ֹ���ȣ</td>
                    <td><%=orderid%></td>
                </tr>
                <tr>
                    <td width="130">�ۼ���</td>
                    <td><%= customer_name %></td>
                    <td width="130">����ó</td>
                    <td><%= customer_tel %></td>
                </tr>
                <tr>
                   <td width="130">ȭ������ </td>
                   <td><%= cargo_type %></td>
                   <td width="130">ȭ������ </td>
                   <td><%= cargo_weight%>kg</td>
                </tr>
                <tr>
                    <td width="130">������ ����</td>
                    <td><%=cargo_help %></td>
                    <td width="130">���</td>
                    <td><%= fix_cost%>��</td>
                </tr>
                <tr>
                    <td width="130">�����</td>
                    <td colspan="4"><%=from_where %></td>
                </tr>
                <tr>
                    <td width="130">������</td>
                    <td colspan="4"><%= to_where%></td>
                </tr>
                <tr>
                    <td width="130">����Ͻ�</td>
                    <td><%= sdf.format(depart_time) %></td>
                    <td width="130">����Ÿ�</td>
                    <td><%=distance %>km</td>
                </tr>
                <tr>
                    <td width="130">���� �ҿ�ð�</td>
                    <td><%= time%></td>
                    <td width="130">���� �����ð�</td>
                    <td><%= eta %></td>
                </tr>
                <tr>
                    <td width="130">���λ���</td>
   		            <td><%=cargo_spec %></td>
                </tr>
                <tr>
                    <td colspan="5">
                        <input type="button" value="����" onclick="" id="order" >
                        <input type="button" value="�۸��" id="order" onclick="location.href='orderlist.jsp?pageNum=<%= pageNum %>'">
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