<%@page import="java.text.DecimalFormat"%>
<%@page import="myUtil.HanConv"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="myUtil.GeoCode"%>
<%@page import="myUtil.Directions5"%>
<jsp:useBean id="HanConv" class = "myUtil.HanConv"></jsp:useBean>
<%
	//order3에서 넘겨준 값 세션에 저장
	session.setAttribute("to_where", request.getParameter("to_where"));
	session.setAttribute("to_spec", request.getParameter("to_spec"));
	
	String depart_time = (String)session.getAttribute("depart_time");
	//운송거리, 시간, ETA 계산
	Directions5 dir = new Directions5();
	
	dir.Direction(HanConv.toKor((String)session.getAttribute("from_where"))
			, HanConv.toKor((String)session.getAttribute("to_where"))
			, (String)session.getAttribute("truck_type")
			, Integer.parseInt((String)session.getAttribute("cargo_weight"))
			, (String)session.getAttribute("cargo_help")
			, depart_time);
	
	session.setAttribute("ETA", dir.ETA);
	session.setAttribute("recommend_cost", dir.recommend_cost);
	session.setAttribute("fix_cost", dir.recommend_cost);

	//출발시각 변환
	depart_time = depart_time.substring(0, 4) + "년 " + depart_time.substring(5,7) + "/" + depart_time.substring(8,10) + " " + depart_time.substring(11,13) + ":" + depart_time.substring(14,16);
	
	
	//영문을 한글로 바꾸기
	String truck_type = (String)session.getAttribute("truck_type");
	if(truck_type.equals("damas")){
		truck_type = "다마스";
	} else if(truck_type.equals("labo")){
		truck_type = "라보";
	} else if(truck_type.equals("1ton")){
		truck_type = "1톤 트럭";
	} else if(truck_type.equals("1.4ton")){
		truck_type = "1.4톤 트럭";
	} else if(truck_type.equals("2.5ton")){
		truck_type = "2.5톤 트럭";
	}
	String cargo_type = (String)session.getAttribute("cargo_type");
	if(cargo_type.equals("pallet")){
		cargo_type = "파레트";
	} else if(cargo_type.equals("box")){
		cargo_type = "박스";
	} else if(cargo_type.equals("equipment")){
		cargo_type = "중장비";
	} else if(cargo_type.equals("general")){
		cargo_type = "일반화물";
	}
	String cargo_weight = session.getAttribute("cargo_weight") + "kg";
	
	String cargo_help = (String)session.getAttribute("cargo_help");;
	if(cargo_help.equals("drive_only")){
		cargo_help = "운송만";
	} else if(cargo_help.equals("load_and_discharge")){
		cargo_help = "승하차 도움 필요";
	} else if(cargo_help.equals("to_door")){
		cargo_help = "승하차 후 집/창고까지 이동";
	}
	
	DecimalFormat df = new DecimalFormat(",###");
	String cost_text = df.format(dir.recommend_cost) + "원";
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
    <title>화물접수(4/4)</title>
<script language="javascript">
	document.form.fix_cost.value = <%= request.getParameter("recommend_cost") %>

	function check_spec(){
		form.spec.hidden = false;
	}
	
function order(){
	//이름 없으면 경고
	if(document.form.name.value == ""){
		alert("이름을 적어주세요.")
		return
	}
	//전화번호 없으면 경고
	if(document.form.tel1.value == "" || document.form.tel2.value == "" || document.form.tel3.value == ""){
		alert("전화번호를 적어주세요.")
		return
	}
	//주문확인 체크 안하면 경고
	if(document.form.confirm.checked == false){
		alert("주문내역을 확인한 후 체크 해주세요.")
		return
	}
	if(document.form.contract.checked == false){
		alert("화물운송 약관을 확인한 후 체크 해주세요.")
		return
	}
	if(document.form.information.checked == false){
		alert("개인정보 처리방침을 확인한 후 체크 해주세요.")
		return
	}
	form.submit()
}

</script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=tzchnboziv"></script>
</head>
<body>

    <header>
        <h2>믿을 수 있는 화물 중개 플랫폼</h2>
        <h1>트럭커(TRUCKER)</h1>
    </header>
    <nav>
        <table>
            <tr>
                <td><a href = "order1.jsp">화물접수</a></td>
                <td><a href = "order_query.jsp">배송조회</a></td>
                <td><a href = "../3_ServiceCenter/FAQ_main.jsp">고객센터</a></td>
                <td><a href = "companyIntroduction.html">회사소개</a></td>
            </tr>
        </table>
    </nav>
    <section>
        <h1>화물 접수(4/4)</h1>
    	<form name = "form" method = "post" action = "payment.jsp">
    <table>
    	<tr>
    		<th colspan = "2">운송 주문 내역</th>
    	</tr>
    	<tr><td>차량 종류</td>
    	<td><%= truck_type %></td></tr>
    	<tr><td>화물 종류</td>
    	<td><%= cargo_type %></td></tr>
    	<tr><td>화물 무게</td>
    	<td><%= cargo_weight %></td></tr>
    	<tr><td>승하차 도움</td>
    	<td><%= cargo_help %></td></tr>
    	<tr><td>화물 세부사항</td>
    	<td><%= HanConv.toKor((String)session.getAttribute("cargo_spec")) %></td></tr>
    	<tr><td>출발지</td>
    	<td><%= HanConv.toKor((String)session.getAttribute("from_where")) + HanConv.toKor((String)session.getAttribute("from_spec"))%></td></tr>
    	<tr><td>도착지</td>
    	<td><%= HanConv.toKor((String)session.getAttribute("to_where")) + HanConv.toKor((String)session.getAttribute("to_spec"))%></td></tr>
    	<tr><td>출발 시각</td>
    	<td><%= depart_time %></td></tr>
    	<tr><td>운송 거리</td>
    	<td><input type = "text" name = "distance" value = "<%= dir.distance %>" readonly>km</td></tr>
    	<tr><td>운송 시간</td>
    	<td><input type = "text" name = "time" value = "<%= dir.time %>" readonly></td></tr>
    	<tr><td>도착 예정 시각</td>
    	<td><input type = "text" name = "ETA" value = "<%= dir.ETA.substring(0,4) + "년 " + dir.ETA.substring(5,7) + "월 " + dir.ETA.substring(8,10) + "일 " + dir.ETA.substring(11,13) + ":" + dir.ETA.substring(14,16) %>" readonly></td></tr>
    	<tr><td>운임</td>
    	<td><input type = "text" name = "fix_cost" value = "<%= cost_text %>">
    	<input type ="button" onClick="check_spec()" value = "세부운임 확인"></td></tr>

    	<tr><td></td><td><output name = "spec" hidden><b>1. 교통비</b><br>
    	<%= dir.toll_cost + "원 + (" + dir.distance + "km × " + (double)Math.round(dir.fuel_rate*100)/100 + "km/L × " + dir.fuel_cost_rate + "원/L) + = <b>" + (dir.toll_cost + dir.fuel_cost) + "원</b>" %><br>
    	<%= dir.toll_cost + "원 + (" + dir.distance + "km ÷ " + (double)Math.round(dir.fuel_rate*100)/100 + "km/L × " + dir.fuel_cost_rate + "원/L) = <b>" + (dir.toll_cost + dir.fuel_cost) + "원</b>" %><br>
    	<%= dir.toll_cost + "원 + (" + dir.distance + "km × " + (double)Math.round(dir.fuel_rate*100)/100 + "km/L × " + dir.fuel_cost_rate + "원/L) = <b>" + (dir.toll_cost + dir.fuel_cost) + "원</b>" %><br>
		톨비 + 유류비(운행거리 ÷ 연비 × 리터당 연료비)<br><br>
		<b>2. 차량 유지비</b><br>
		<%= dir.distance + "km × " + dir.maintenance_rate + "원 = <b>" + dir.maintenance_cost + "원</b>" %><br>
		운행거리 × 거리당 유지비<br><br>
		<b>3. 인건비</b><br>
		<%= "( " + (double)(Math.round((double)dir.temptime/60/60*100))/100 + "시간 × 10,000원 ) + ( " + session.getAttribute("cargo_weight") + "kg × 작업비 ) = <b>" + dir.labor_cost + "원</b>"%><br>
		운전비(운행시간 × 10,000원) + 수작업비(화물무게(kg) × 작업비)<br>
		※작업비 : 승하차 15원, 문앞으로 50원<br><br>
		<b>4. 합계 운임</b><br>
		<%= (dir.toll_cost + dir.fuel_cost) + "원 + " + dir.maintenance_cost + "원 + " + dir.labor_cost + "원 + " + dir.commission + "원 + " + dir.vat + "원 = <b>" + dir.recommend_cost + "원</b>"%><br>
		교통비 + 차량 유지비 + 인건비 + 수수료 + 부가세 ( 1,000원 미만 절사 )
    	</output></td></tr>

    	<tr><th colspan = "2">운송 주문</th></tr>
    	<tr><td>성명</td>
    	<td><input type = "text" name = "name" size = "6"></td>
    	</tr>
    	<tr><td>전화번호</td>
    	<td><input type = "text" name = "tel1" value = "010" size = "3">
    	 - <input type = "text" name = "tel2" size = "4">
    	 - <input type = "text" name = "tel3" size = "4">
    	</td></tr>
    	<tr><td>주문 확인</td>
    	<td class = "simple_link">
			<label><input type = "checkbox" name = "confirm">위의 운송주문 내역을 확인하였습니다.</label><br>    	
    		<label><input type = "checkbox" name = "contract"><a href = "contract.html">화물운송 약관</a>에 동의합니다.</label><br>
			<label><input type = "checkbox" name = "information"><a href = "personal_information.html">개인정보 처리방침</a>에 동의합니다.</label>    	
		</td></tr>
		<tr><td></td><td><input type = "button" value = "확인 및 결제" onClick = "order()"></td></tr>
    </table>
    	</form>
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