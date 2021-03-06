<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="myUtil.DeliveryOrder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myUtil.DeliveryOrderDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
// 오류 발생시 sdf.format(depart_time)에서 sdf.format를 삭제해보세요.
	String id = request.getParameter("driver_id");

	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	DeliveryOrderDB db = DeliveryOrderDB.getInstance();
	ArrayList<DeliveryOrder> orderList = db.listOrder_onlycomplete(pageNum);
	
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
    <title>배송내역조회(1/2)</title>
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
                <td><a href = "orderlist.jsp?driver_id=<%=id%>">접수현황</a></td>
                <td><a href = "mypage.jsp">마이페이지</a></td>
                <td><a href = "../3_ServiceCenter/FAQ_main.jsp">고객센터</a></td>
                <td><a href = "../1_Customer/companyIntroduction.html">회사소개</a></td>
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
                    <a href="view_orderedshow.jsp?order_id=<%=order_id %>&pageNum=<%=pageNum %>&driver_id=<%=id %>" ><%= order_id %></a>
			 	</td>
			 	<td align="center">
			 		<%
			 			String trucktype = "";
			 			if(truck_type.equals("damas")){
			 				trucktype = "다마스";
			 			}else if(truck_type.equals("labo")){
			 				trucktype = "라보";
			 			}else if(truck_type.equals("1ton")){
			 				trucktype = "1톤";
			 			}else if(truck_type.equals("1.4ton")){
			 				trucktype = "1.4톤";
			 			}else if(truck_type.equals("2.5ton")){
			 				trucktype = "2.5톤";
			 			}
			 		%>
			 		<%= trucktype %>
			 	</td>
			 	<td align="center">
			 		<%
                    	String cargotype = "";
                    	if(cargo_type.equals("pallet")){
                    		cargotype = "파레트";
                    	}else if(cargo_type.equals("box")){
                    		cargotype = "박스";
                    	}else if(cargo_type.equals("equipment")){
                    		cargotype = "중장비";
                    	}else if(cargo_type.equals("general")){
                    		cargotype = "일반화물(이삿짐 등)";
                    	}
                    %>
                    	<%=cargotype %>
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
					<%
						String orderstate = "";
						if(order_state.equals("order")){
							orderstate = "배송요청";
						}else if(order_state.equals("shipping")){
							orderstate = "배송중";
						}else if(order_state.equals("complete")){
							orderstate = "배송완료";
						}
					%>
					<%= orderstate %>
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