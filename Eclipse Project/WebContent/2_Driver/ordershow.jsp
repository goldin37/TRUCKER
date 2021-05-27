<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="myUtil.DeliveryOrderDB"%>
<%@page import="myUtil.DeliveryOrder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("driver_id");
	
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
   <section class="ordershow">
        <h1>요청된 배송</h1>
        <table>
            <form action= "order_ok.jsp?order_id=<%=order_id %>&driver_id=<%=id %>" method="post">
                <tr>
                    <td width="130">주문번호: </td>
                    <td><%=orderid%></td>
                </tr>
                <tr>
                    <td width="130">작성자: </td>
                    <td><%= customer_name %></td>
                    <td width="130">연락처: </td>
                    <td><%= customer_tel %></td>
                </tr>
                <tr>
                   <td width="130">화물종류: </td>
                   <td>
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
                   <td width="130">화물무게: </td>
                   <td><%= cargo_weight%>kg</td>
                </tr>
                <tr>
                    <td width="130">승하차 도움: </td>
                    <td>
                    <%
                    	String cargohelp = "";
                    	if(cargo_help.equals("drive_only")){
                    		cargohelp = "운송만";
                    	}else if(cargo_help.equals("load_and_discharge")){
                    		cargohelp = "승하차 도움 필요";
                    	}else if(cargo_help.equals("to_door")){
                    		cargohelp = "승하차후 집/창고까지 이동";
                    	}
                    %>
                    	<%=cargohelp %>
                    </td>
                    <td width="130">요금: </td>
                    <td><%= fix_cost%>원</td>
                </tr>
                <tr>
                    <td width="130">출발지: </td>
                    <td colspan="4"><%=from_where %></td>
                </tr>
                <tr>
                    <td width="130">도착지: </td>
                    <td colspan="4"><%= to_where%></td>
                </tr>
                <tr>
                    <td width="130">출발일시: </td>
                    <td><%= sdf.format(depart_time) %></td>
                    <td width="130">예상거리: </td>
                    <td><%=distance %>km</td>
                </tr>
                <tr>
                    <td width="130">예상 소요시간: </td>
                    <td><%= time%></td>
                    <td width="130">예상 도착시간: </td>
                    <td><%= eta %></td>
                </tr>
                <tr>
                    <td width="130">세부사항: </td>
   		            <td><%=cargo_spec %></td>
                </tr>
                <tr>
                    <td colspan="5">
                        <input type="submit" value="수락" class="order" style="height: 40px" >
                        <input type="button" value="글목록" class="order" onclick="location.href='orderlist.jsp?pageNum=<%= pageNum %>'">
                    </td>
                </tr>
            </form>
        </table>
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