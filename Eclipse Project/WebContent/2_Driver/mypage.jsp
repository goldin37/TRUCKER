<%@page import="myUtil.DeliveryOrder"%>
<%@page import="myUtil.DeliveryOrderDB"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	if(session.getAttribute("id") == null){
%>
		<jsp:forward page ="login.html"></jsp:forward>
<%
	}
	String id = (String)session.getAttribute("id");
	String name =(String)session.getAttribute("name");
	String license = (String)session.getAttribute("license");
	String truck_type = (String)session.getAttribute("truck_type");
	String truck_number = (String)session.getAttribute("truck_number");
	String phone = (String)session.getAttribute("phone");
	
	// 진행중인 배송
		
	String cargo_type="",cargo_help="",to_where="",from_where="",customer_name="";
	int cargo_weight=0,fix_cost=0;
	Timestamp depart_time=null;
	
	DeliveryOrderDB db = DeliveryOrderDB.getInstance();
	DeliveryOrder deliveryorder = db.shipping(id);

	if(id == null){
		System.out.println("아이디가 안넘어왔다..");
	}
	else{
		
		if(deliveryorder != null){
			truck_type = deliveryorder.getTruck_type();
			cargo_type = deliveryorder.getCargo_type();
			cargo_weight =deliveryorder.getCargo_weight();
			cargo_help = deliveryorder.getCargo_help();
			to_where = deliveryorder.getTo_where() + deliveryorder.getTo_spec();
			from_where = deliveryorder.getFrom_where() + deliveryorder.getFrom_spec();
			depart_time = deliveryorder.getDepart_time();
			customer_name = deliveryorder.getCustomer_name();
			fix_cost = deliveryorder.getFix_cost();
			
		}
	}
%>
<html lang="en">
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
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
    <section class="box">
        <h2 id="box">개인정보</h2> 
        <p style="font-weight: bolder; padding-left: 90px;">
           	환영합니다 ! <%= name %>(<%=id %>)님 
        </p>
        <table>
            <form>
            <tr>
                <td>이름 : <%=name %></td>
            </tr>
            <tr>
                <td>휴대전화 : <%=phone %></td>
            </tr>
            <tr>
                <td>면허 번호: <%=license %></td>
            </tr>
            <tr>
                <td>
                	차량 : 
			 		<%= truck_type %>
                </td>
            </tr>
            <tr>
                <td>차량번호 : <%=truck_number %></td>
            </tr>
            </form>
        </table>
        <input type="button" value="로그아웃" class="click" onclick="location.href='logOut.jsp'">
        <input type="button" value="정보수정" class="click" onclick="location.href='modification.jsp'">
    </section>
    <section class="now">
       		<%
            	if(depart_time != null){
       		%>
       				<h2 id="box">진행 중인 배송</h2>
       		<%
            	}else{
            %>
            		<h2 id="box">진행중인 배송이 없습니다.</h2>
            <%
            	}
            %>
        <table>
            <form name="form" action="view_ordered.jsp" method="post" enctype="multipart/form-data">
            <%
            	if(depart_time != null){
       		%>
            <tr>
                <td>고객이름 : <%=customer_name %></td>
            </tr>
            <tr>
                <td>
                	출발일자 : <%=depart_time %>
               	</td>
            </tr>
            <tr>
                <td>화물종류 : 
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
            </tr>
            <tr>
                <td>화물무게 : <%=cargo_weight %></td>
            </tr>
            <tr>
                <td>상차지 :<%=from_where %></td>
            </tr>
            <tr>
                <td>하차지 : <%=to_where %></td>
            </tr>
            <tr>
                <td>승하차도움 : 
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
            </tr>
            <tr>
                <td>운임비용 : <%=fix_cost%></td>
            </tr>
            <tr>
                <td>
                    <input type="button" value="운송취소" class="click" onclick="location.href='delete_order.jsp?driver_id=<%=id%>'">
                    <input type="button" value="운송완료" class="click" onclick="location.href='completed_order.jsp?driver_id=<%=id%>'">
                    <!-- @##@##@##@##@##@##@ here!!!#@#@#@#@#@#@# 운송완료 누르면 completed_order로 넘어가서 complete로 바뀝니다. @#@#@#@#@#@#@#@#@#@#
                    		메소드는 deliveryOrderDB에 completeorder()입니다. @#@!#@!#!@#!@$!@#@!#!@#!@#!@#!@#-->
                    <input type="button" value="운송접수확인" class="click" onclick="location.href='orderlist.jsp?driver_id=<%=id%>'">
                    <input type="button" value="운송내역확인" class="click" onclick="location.href='view_ordered.jsp'">
                    
                 <%
            		}else{
           		 %>
                    <input type="button" value="운송접수확인" class="click_1" onclick="location.href='orderlist.jsp?driver_id=<%=id%>'">
                    <input type="button" value="운송내역확인" class="click_1" onclick="location.href='view_ordered.jsp'">
                <%
            		}
         	  	 %>    
                 </td>
             </tr>
            </form>
        </table>
    </section>

    <section class="question">
        <h2 id="box">문의사항</h2> 
        <ul>
            <li><a href="../3_ServiceCenter/Notice_main.jsp"> 공지사항 바로가기</a></li>
            <li><a href="../3_ServiceCenter/FAQ_main.jsp"> 자주하는 질문(FAQ) 바로가기</a></li>
            <li>고객센터 운영시간 09:00~18:00</li>
            <li>전화번호 1555-1555</li>
        </ul>
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
