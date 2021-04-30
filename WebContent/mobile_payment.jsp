<%@page import="myUtil.HanConv"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="HanConv" class = "myUtil.HanConv"></jsp:useBean>
<%
	
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
	String depart_time = (String)session.getAttribute("depart_time");
	depart_time = depart_time.substring(0,4) + "년 " 
	+ Integer.parseInt(depart_time.substring(5,7)) + "월 "
	+ Integer.parseInt(depart_time.substring(8,10)) + "일 "
	+ depart_time.substring(11,13) + "시 "
	+ depart_time.substring(14,16) + "분";
	
	String ETA = (String)session.getAttribute("ETA");
	ETA = ETA.substring(0,4) + "년 " 
	+ Integer.parseInt(ETA.substring(5,7)) + "월 "
	+ Integer.parseInt(ETA.substring(8,10)) + "일 "
	+ ETA.substring(11,13) + "시 "
	+ ETA.substring(14,16) + "분";
	
	
	String cost_text = session.getAttribute("fix_cost") +"";
	int temp_cost = Integer.parseInt(cost_text);
	int cost_left = temp_cost / 1000;
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>휴대전화 소액결제</title>
</head>
<script>
function mobile_payment(){
	//전화번호 입력 안하면 경고
	if(document.form.tel_company.value == "tel_company"){
		alert("통신사를 선택 해주세요.")
		return
	}
	if(document.form.tel1.value == "" || document.form.tel2.value == "" || document.form.tel3.value == ""){
		alert("전화번호를 입력 해주세요.")
		return
	}
	//이름 입력 안하면 경고
	if(document.form.name.value == ""){
		alert("이름을 입력 해주세요.")
		return
	}
		
	opener.location.href = "mobile_payment_ok.jsp"
	window.close()
}
</script>
<body>
	<table>
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
    	<td><%= (String)session.getAttribute("distance") %>km</td></tr>
    	<tr><td>운송 시간</td>
    	<td><%= HanConv.toKor((String)session.getAttribute("time")) %></td></tr>
    	<tr><td>도착 예정 시각</td>
    	<td><%= ETA %></td></tr>
    	<tr><td>고객 성명</td>
    	<td><%= HanConv.toKor((String)session.getAttribute("customer_name")) %></td></tr>
    	<tr><td>고객 연락처</td>
    	<td><%= (String)session.getAttribute("customer_telephone") %></td></tr>
    	<tr><td>운임</td>
    	<td><%= cost_left + ",000원 (부가가치세 포함)" %></td></tr>
	</table>
	<h1>결제 금액 : <%= cost_left + ",000원"%></h1>
	<form name = "form" method = "post" action = "mobile_payment_ok.jsp">
		<select name = "tel_company">
			<option value = "tel_company">통신사</option>
			<option value = "SKT">SKT</option>
			<option value = "KT">KT</option>
			<option value = "LGU+">LGU+</option>
		</select>
		<input type = "text" name = "tel1" value = "010" size = "3">
		- <input type = "text" name = "tel2" size = "4">
		- <input type = "text" name = "tel3" size = "4">
		이름 : <input type = "text" name = "name" size = "5">
		<input type = "button" value = "결제" onClick = "mobile_payment()">
	</form>
</body>
</html>