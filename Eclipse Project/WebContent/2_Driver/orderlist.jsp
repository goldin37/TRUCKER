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
    <title>배송리스트</title>
    <link rel="stylesheet" href="css/trucker_orderlist.css" type = "text/css">
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
                <td><a href = "orderlist.jsp">배송조회</a></td>
                <td><a href = "#">mypage</a></td>
                <td><a href = "#">고객센터</a></td>
                <td><a href = "#">회사소개</a></td>
            </tr>
        </table>
      </nav>
    <section>
        <table>
            <form>
                <tr>
                    <td>차량종류</td>
                    <td>화물종류</td>
                    <td>화물무게</td>
                    <td>승하차도움</td>
                    <td>출발지</td>
                    <td>도착지</td>
                    <td>출발일시</td>
                    <td>예상거리</td>
                    <td>예상 소요시간</td>
                    <td>예상 도착시간</td>
                    <td>요금</td>
                </tr>
<%
				for(int i=0 ; i<orderList.size() ; i++){
					DeliveryOrder deliverorder = orderList.get(i); //한행씩 가져옴
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
				<!-- 마우스 올렸을때랑 기본 색 지정-->
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
        (주)트럭커 부산시 해운대구 마린시티3로 45 | 사업자번호 : 123-45-12345 | <br> 
        통신판매업 : 2021 - 부산 동래-01234 | 화물운송주선 제160236호 | <br> 
        전화번호 : 1588-3333 | 팩스 : 070-1234-1234 | 대표메일 : trucker@naver.com <br>
        화물운송약관 | 개인정보 처리방침<br>
        COPYRIGHT(C) TRUCKER LTD. ALL RIGHT RESERVED.
    </footer>
</body>
</html>