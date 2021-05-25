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
		alert("찾으시는 정보가 없습니다");
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
        <h2>믿을 수 있는 화물 중개 플랫폼</h2>
        <h1>트럭커(TRUCKER)</h1>
    </header>
    <nav>
        <table>
            <tr>
                <td><a href = "order.html">화물접수</a></td>
                <td><a href = "order_query.jsp">배송조회</a></td>
                <td><a href = "../3_ServiceCenter/Notice_main.jsp">고객센터</a></td>
                <td><a href = "companyIntroduction.html">회사소개</a></td>
            </tr>
        </table>
    </nav>
    <section>
    <br>
        <form action="order_query_Search_order_id.jsp" method="post">
        <h1>배송 조회</h1>
        <table>
            <tr>
                <td rowspan = 4 width = 250px>
                    배송 번호 <input type = "text" size = 5 name="order_id">
                    <input type="submit" value="조회" class="shipping">    
                </td>
                <td>
                    배송번호를 잃어버렸어요. <a>배송번호 찾기</a>
                </td>
            </tr>
            </form>
            <form action="order_query_Search_name_tel.jsp" method="post">
            <tr>
                <th>배송번호 조회</th>
            </tr>
            <tr>
                <td>
                    이름 <input type = "text" size = 3 name="customer_name">
                    전화번호 <input type = "text" size = 3 name="phone1" maxlength="3">-<input type = "text" size = 4 name="phone2" maxlength="4">-<input type = "text" size = 4 name=phone3 maxlength="4">

                    <input type="submit" value="조회" class="shipping">
                </td>
            </tr>
        </table>
        <table>
                <tr><th colspan="2">배송 정보</th></tr>
            <td colspan="2">
                배송 번호 : <point><%= order_id %></point><br><br>
                
                <!-- 배송상태에 맞는 이미지 -->
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
                
                
                <!-- 배송상태 메세지 -->
                고객님의 화물은 <point><% if(order_state.equals("order")){
                	%> 배송 접수 <%
                }else if(order_state.equals("accept")){
                	%> 배차 완료 <%
                }else if(order_state.equals("depart")){
                	%> 배송 시작 <%
                }else if(order_state.equals("arrive")){
                	%> 배송 완료 <%
                }else{
                	%> 배송 확인 <%
                } %>
                
              </point> 되었습니다.<br><br><br>
              
               <!-- null값시 아무것도 출력x -->
                배송 접수 : <% if(order_date_time == null){
                } else {
                	%><%= order_date_time %> <%
                }
                %><br>
                
                배차 완료 : <% if(accept_date_time == null){
                } else {
                	%><%= accept_date_time %> <%
                }
                %><br>
                
                배송 시작 : <% if(depart_date_time == null){
                } else {
                	%><%= depart_date_time %> <%
                }
                %><br>  
                
                배송 완료 : <% if(arrive_date_time == null){
                } else {
                	%><%= arrive_date_time %> <%
                }
                %><br> 
                
                배송 확인 : <% if(complete_date_time == null){
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
        (주)트럭커 부산시 해운대구 마린시티3로 45 | 사업자번호 : 123-45-12345 | <br> 
        통신판매업 : 2021 - 부산 동래-01234 | 화물운송주선 제160236호 | <br> 
        전화번호 : 1588-3333 | 팩스 : 070-1234-1234 | 대표메일 : trucker@naver.com <br>
        화물운송약관 | 개인정보 처리방침<br>
        COPYRIGHT(C) TRUCKER LTD. ALL RIGHT RESERVED.
    </footer>
</body>
</html>