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
	ArrayList<DeliveryOrder> orderList = db.listOrder(pageNum);
	String truck_type,cargo_type,cargo_help,cargo_spec,to,from,time,eta;
	int cargo_weight,distance,recommend_cost;
	Timestamp depart_time;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<html lang="en">
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>��۸���Ʈ</title>
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
                <td><a href = "orderlist.jsp">�����ȸ</a></td>
                <td><a href = "#">mypage</a></td>
                <td><a href = "#">������</a></td>
                <td><a href = "#">ȸ��Ұ�</a></td>
            </tr>
        </table>
      </nav>
    <section>
        <table>
            <form>
                <tr>
                    <td>��������</td>
                    <td>ȭ������</td>
                    <td>ȭ������</td>
                    <td>����������</td>
                    <td>�����</td>
                    <td>������</td>
                    <td>����Ͻ�</td>
                    <td>����Ÿ�</td>
                    <td>���� �ҿ�ð�</td>
                    <td>���� �����ð�</td>
                    <td>���</td>
                </tr>
<%
				for(int i=0 ; i<orderList.size() ; i++){
					DeliveryOrder deliverorder = orderList.get(i); //���྿ ������
					truck_type = deliverorder.getTruck_type();
					cargo_type = deliverorder.getCargo_type();
					cargo_weight = deliverorder.getCargo_weight();
					cargo_help = deliverorder.getCargo_help();
					from =  deliverorder.getFrom();
					to = deliverorder.getTo();
					distance = deliverorder.getDistance();
					time = deliverorder.getTime();
					eta = deliverorder.getETA();
					recommend_cost = deliverorder.getRecommend_cost();
					depart_time = deliverorder.getDepart_time();
%>
				<tr bgcolor="#f7f7f7"
			 onmouseout="this.style.backgroundColor = '#f7f7f7'"
			 onmouseover="this.style.backgroundColor = '#eeeeef'"> 
				<!-- ���콺 �÷������� �⺻ �� ����-->
			 	<td align="center">
			 		<%= truck_type %>
			 	</td>
			 	<td align="center">
			 		<%= cargo_type %>
			 	</td>
			 	<td>
			 		<a href="ordershow.jsp?&pageNum=<%=pageNum%>"><%= cargo_weight %></a>
			 	</td>
			 	<td align="center">
					<%=cargo_help %>
			 	</td>
			 	<td align="center">
					<%=from %>
			 	</td>
			 	<td align="center">
					<%=to %>
			 	</td>
			 	<td align="center">
					<%=distance %>
			 	</td>
			 	<td align="center">
					<%= time%>
			 	</td>
			 	<td align="center">
					<%=eta %>
			 	</td>
			 	<td align="center">
					<%= sdf.format(depart_time) %>
			 	</td>
			 	<td align="center">
					<%= recommend_cost %>
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