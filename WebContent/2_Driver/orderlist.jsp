<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="myUtil.DeliveryOrder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myUtil.DeliveryOrderDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	DeliveryOrderDB db = DeliveryOrderDB.getInstance();
	ArrayList<DeliveryOrder> orderList = db.listOrder_onlyorder(pageNum);
	
	String truck_type,cargo_type,cargo_help,cargo_spec,to_where,from_where,time,eta, order_state;
	int order_id, cargo_weight,distance,fix_cost;
	Timestamp depart_time;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<html lang="en">
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>��۸���Ʈ</title>
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
                <td><a href = "orderlist.jsp">������Ȳ</a></td>
                <td><a href = "#">����������</a></td>
                <td><a href = "#">������</a></td>
                <td><a href = "#">ȸ��Ұ�</a></td>
            </tr>
        </table>
      </nav>
  <section class="orderlist">
        <table>
            <form>
                <tr>
                    <td>�ֹ���ȣ</td>
                    <td>��������</td>
                    <td>ȭ������</td>
                    <td>ȭ������</td>
                    <td>�����</td>
                    <td>������</td>
                    <td>���� �ð�</td>
                    <td>����Ͻ�</td>
                    <td>���</td>
                    <td>�������</td>
                </tr>
<%
				for(int i=0 ; i<orderList.size() ; i++){
					DeliveryOrder deliverorder = orderList.get(i); //���྿ ������
					
					order_id = deliverorder.getOrder_id();
					truck_type = deliverorder.getTruck_type();
					cargo_type = deliverorder.getCargo_type();
					cargo_weight = deliverorder.getCargo_weight();
					from_where = deliverorder.getFrom_spec();
					to_where = deliverorder.getTo_spec();
					distance = deliverorder.getDistance();
					time = deliverorder.getTime();
					eta = deliverorder.getETA();
					fix_cost = deliverorder.getFix_cost();
					depart_time = deliverorder.getDepart_time();
					order_state = deliverorder.getOrder_state();
%>
				<tr bgcolor="#f7f7f7"> 
			 	<td align="center"  id="click">
                    <a href="ordershow.jsp?order_id=<%=order_id %>&pageNum=<%=pageNum %>"><%= order_id %></a>
			 	</td>
			 	<td align="center">
			 		<%= truck_type %>
			 	</td>
			 	<td align="center">
			 		<%= cargo_type %>
			 	</td>
			 	<td>
			 		<%= cargo_weight %> kg
			 	</td>
			 	<td align="center">
					<%=from_where %>
			 	</td>
			 	<td align="center">
					<%=to_where %>
			 	</td>

			 	<td align="center">
					<%= time%>
			 	</td>

			 	<td align="center">
					<%= sdf.format(depart_time) %>
			 	</td>
			 	<td align="center">
					<%= fix_cost %>��
			 	</td>
			 	<td align="center">
					<%= order_state %>
			 	</td>
			</tr>
	<%
		}
	%>
            </form>
        </table>
        <br><br>
        <center>
        <%= DeliveryOrder.pageNumber(4) %>
        </center>
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