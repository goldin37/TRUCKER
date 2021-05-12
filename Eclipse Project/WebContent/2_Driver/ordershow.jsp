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
			to ="",from ="",time ="",eta ="",customer_name ="",customer_tel ="";
	int cargo_weight = 0,distance = 0,recommend_cost = 0;
	Timestamp depart_time = null;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	
	if(deliveryorder != null){
		truck_type = deliveryorder.getTruck_type();
		cargo_type = deliveryorder.getCargo_type();
		cargo_weight =deliveryorder.getCargo_weight();
		cargo_help = deliveryorder.getCargo_help();
		cargo_spec = deliveryorder.getCargo_spec();
		to = deliveryorder.getTo();
		from = deliveryorder.getFrom();
		time = deliveryorder.getTime();
		distance = deliveryorder.getDistance();
		eta = deliveryorder.getETA();
		customer_name = deliveryorder.getCustomer_name();
		customer_tel = deliveryorder.getCustomer_telephone();
		recommend_cost = deliveryorder.getRecommend_cost();
		
	}
%>
<html lang="en">
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/trucker_orderlist.css" type = "text/css">
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
                <td><a href = "#">������</a></td>
                <td><a href = "#">ȸ��Ұ�</a></td>
            </tr>
        </table>
      </nav>
    <section>
        <h1>��û�� ���</h1>
        <table cellspacing="0" border="1" width="1000">
            <form>
                <tr align ="center">
                    <td width="200">�ۼ���</td>
                    <td><%=customer_name %></td>
                    <td width="200">��ȭ��ȣ</td>
                    <td><%=customer_tel %></td>
                </tr>
                <tr>
                   <td>ȭ������ </td>
                   <td><%=cargo_type%></td>
                   <td>ȭ������ </td>
                   <td><%=cargo_weight%></td>
                </tr>
                <tr>
                    <td>������ ����</td>
                    <td><%=cargo_help%></td>
                    <td>���</td>
                    <td><%=recommend_cost%></td>
                </tr>
                <tr>
                    <td>�����</td>
                    <td><%=from%></td>
                </tr>
                <tr>
                    <td>������</td>
                    <td><%=to%></td>
                </tr>
                <tr>
                    <td>����Ͻ�</td>
                    <td><%= sdf.format(depart_time) %></td>
                    <td>����Ÿ�</td>
                    <td><%=distance%></td>
                </tr>
                <tr>
                    <td>���� �ҿ�ð�</td>
                    <td><%=time%></td>
                    <td>���� �����ð�</td>
                    <td><%=eta%></td>
                </tr>
                <tr>
                    <td>���λ���</td>
                    <td><%=cargo_spec%></td>
                </tr>
                <tr>
                    <td>
                        <input type="button" value="����" onclick="">
                        <input type="button" value="�۸��" onclick="javascript:windows.location='orderlist.jsp?pageNum<%= pageNum%>'">
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