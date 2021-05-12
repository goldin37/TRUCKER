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
                <td><a href = "#">배송조회</a></td>
                <td><a href = "#">mypage</a></td>
                <td><a href = "#">고객센터</a></td>
                <td><a href = "#">회사소개</a></td>
            </tr>
        </table>
      </nav>
    <section>
        <h1>요청된 배송</h1>
        <table cellspacing="0" border="1" width="1000">
            <form>
                <tr align ="center">
                    <td width="200">작성자</td>
                    <td><%=customer_name %></td>
                    <td width="200">전화번호</td>
                    <td><%=customer_tel %></td>
                </tr>
                <tr>
                   <td>화물종류 </td>
                   <td><%=cargo_type%></td>
                   <td>화물무게 </td>
                   <td><%=cargo_weight%></td>
                </tr>
                <tr>
                    <td>승하차 도움</td>
                    <td><%=cargo_help%></td>
                    <td>요금</td>
                    <td><%=recommend_cost%></td>
                </tr>
                <tr>
                    <td>출발지</td>
                    <td><%=from%></td>
                </tr>
                <tr>
                    <td>도착지</td>
                    <td><%=to%></td>
                </tr>
                <tr>
                    <td>출발일시</td>
                    <td><%= sdf.format(depart_time) %></td>
                    <td>예상거리</td>
                    <td><%=distance%></td>
                </tr>
                <tr>
                    <td>예상 소요시간</td>
                    <td><%=time%></td>
                    <td>예상 도착시간</td>
                    <td><%=eta%></td>
                </tr>
                <tr>
                    <td>세부사항</td>
                    <td><%=cargo_spec%></td>
                </tr>
                <tr>
                    <td>
                        <input type="button" value="수락" onclick="">
                        <input type="button" value="글목록" onclick="javascript:windows.location='orderlist.jsp?pageNum<%= pageNum%>'">
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