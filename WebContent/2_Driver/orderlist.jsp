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
    <title>배송리스트</title>
    <link rel="stylesheet" href="../style/mystyle.css" type = "text/css">
    <!-- style/mystyle.css 로 변경 -->
</head>
<body>
    <header>
        <br><br><br><br><br><br><br><br><br><br><br>
        <h2>믿을 수 있는 화물 중개 플랫폼</h2>
        <h1>트럭커(TRUCKER)</h1>
    </header>
      <nav>
          <table>
            <tr>
                <td><a href = "orderlist.jsp">접수현황</a></td>
                <td><a href = "#">마이페이지</a></td>
                <td><a href = "#">고객센터</a></td>
                <td><a href = "#">회사소개</a></td>
            </tr>
        </table>
      </nav>
  <section class="orderlist">
        <table>
            <form>
                <tr>
                    <td>주문번호</td>
                    <td>차량종류</td>
                    <td>화물종류</td>
                    <td>화물무게</td>
                    <td>출발지</td>
                    <td>도착지</td>
                    <td>예상 시간</td>
                    <td>출발일시</td>
                    <td>요금</td>
                    <td>진행상태</td>
                </tr>
<%
				for(int i=0 ; i<orderList.size() ; i++){
					DeliveryOrder deliverorder = orderList.get(i); //한행씩 가져옴
					
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
					<%= fix_cost %>원
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
        (주)트럭커 부산시 해운대구 마린시티3로 45 | 사업자번호 : 123-45-12345 | <br> 
        통신판매업 : 2021 - 부산 동래-01234 | 화물운송주선 제160236호 | <br> 
        전화번호 : 1588-3333 | 팩스 : 070-1234-1234 | 대표메일 : trucker@naver.com <br>
        화물운송약관 | 개인정보 처리방침<br>
        COPYRIGHT(C) TRUCKER LTD. ALL RIGHT RESERVED.
    </footer>
</body>
</html>