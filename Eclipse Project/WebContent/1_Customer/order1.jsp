<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
    <title>화물접수(1/4)</title>
    <script>
    function next(){
    	// 차량종류 선택 안하면 경고
    	var radio = document.getElementsByName("truck_type");
        var radio_value = null; 
        for(var i=0; i<radio.length; i++) {
            if(radio[i].checked) {
             radio_value = radio[i].value
            }
        }
        if(radio_value == null){
        	alert("차량 종류를 선택하세요.")
        	return
        }
        //화물종류 선택 안하면 경고
    	radio = document.getElementsByName("cargo_type");
        radio_value = null; 
        for(var i=0; i<radio.length; i++) {
            if(radio[i].checked) {
             radio_value = radio[i].value
            }
        }
        if(radio_value == null){
        	alert("화물 종류를 선택하세요.")
        	return
        }
       	//무게 입력 안하면 경고
    	if(document.form.cargo_weight.value == ""){
    		alert("화물 무게가 입력되지 않았습니다.")
    		return
    	}
       	//차량에 따라 무게 초과되면 경고
    	radio = document.getElementsByName("truck_type");
        radio_value = null; 
        for(var i=0; i<radio.length; i++) {
            if(radio[i].checked) {
             radio_value = radio[i].value
            }
        }
        if(radio_value == "damas" && document.form.cargo_weight.value > 300){
        	alert("다마스 적재용량은 300kg을 넘을 수 없습니다.")
        	return
        }
        if(radio_value == "labo" && document.form.cargo_weight.value > 500){
        	alert("라보 적재용량은 500kg을 넘을 수 없습니다.")
        	return
        }
        if(radio_value == "1ton" && document.form.cargo_weight.value > 1000){
        	alert("1톤트럭 적재용량은 1000kg을 넘을 수 없습니다.")
        	return
        }
        if(radio_value == "1.4ton" && document.form.cargo_weight.value > 1400){
        	alert("1.4톤트럭 적재용량은 1400kg을 넘을 수 없습니다.")
        	return
        }
        if(radio_value == "2.5ton" && document.form.cargo_weight.value > 2500){
        	alert("2.5톤트럭 적재용량은 2500kg을 넘을 수 없습니다.")
        	return
        }
        //승하차 도움 선택 안하면 경고
    	radio = document.getElementsByName("cargo_help");
        radio_value = null; 
        for(var i=0; i<radio.length; i++) {
            if(radio[i].checked) {
             radio_value = radio[i].value
            }
        }
        if(radio_value == null){
        	alert("승하차 도움 여부를 선택하세요.")
        	return
        }
       	
    	form.submit()
    }
    </script>
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
        <h1>화물 접수(1/4)</h1>
        <form name = "form" method = "post" action = "order2.jsp">
            <table>
        	<tr><th colspan = 2>차량 및 화물 정보</th></tr>
        	<tr>
        		<td>차량</td><td>
        		    <label><input type = "radio" name = "truck_type" value = "damas"">다마스</label> &nbsp&nbsp&nbsp
                    <label><input type = "radio" name = "truck_type" value = "labo"">라보</label> &nbsp&nbsp&nbsp
                    <label><input type = "radio" name = "truck_type" value = "1ton">1톤</label> &nbsp&nbsp&nbsp
                    <label><input type = "radio" name = "truck_type" value = "1.4ton">1.4톤</label> &nbsp&nbsp&nbsp
                    <label><input type = "radio" name = "truck_type" value = "2.5ton">2.5톤</label> &nbsp&nbsp&nbsp
                    <a href = "truck_information.html">차량 정보</a>
        		</td>
        	</tr>
            <tr><td>화물 종류</td>
                <td>
                    <label><input type = "radio" name = "cargo_type" value = "pallet">파레트</label> &nbsp&nbsp&nbsp
                    <label><input type = "radio" name = "cargo_type" value = "box">박스</label> &nbsp&nbsp&nbsp
                    <label><input type = "radio" name = "cargo_type" value = "equipment">중장비</label> &nbsp&nbsp&nbsp
                    <label><input type = "radio" name = "cargo_type" value = "general">일반화물(이삿짐 등)</label> &nbsp&nbsp&nbsp
                </td></tr>
            <tr><td>화물 무게</td><td><input type = "number" name = "cargo_weight" size = "2" max = "2500" min = "0">kg</td></tr>
            <tr><td>승하차 도움</td>
                <td>
                    <label><input type = "radio" name = "cargo_help" value = "drive_only">운송만</label><br>
                    <label><input type = "radio" name = "cargo_help" value = "load_and_discharge">승하차 도움 필요</label><br>
                    <label><input type = "radio" name = "cargo_help" value = "to_door">승하차 후 집/창고까지 이동</label><br>
                </td></tr>
            <tr><td>화물 세부사항</td><td><textarea name = "cargo_spec" cols = "75" rows = "5" 
            placeholder="예> 40kg 밀가루 포대 X 60포대, 고박에 신경 써주세요. 화물 적재 및 하차는 지게차로 하니, 운송만 해주시면 됩니다. 19:00까지 똑 도착해야 하니 반드시 시간 맞춰주세요."></textarea><br>
            	 ※ 세부적인 화물 종류와 운송시 필수적인 사항을 적어주세요. 화물 운송에 필요한 세부적인 정보가 누락되는 경우, 기사 도착 이후 운송이 거부될 수 있습니다.<br>
            <input type = "button" value = "다음" onClick = "next()"></td></tr>
       	</table>
       	</form>
    </section>
    <footer>
        (주)트럭커 부산시 해운대구 마린시티3로 45 | 사업자번호 : 123-45-12345 | <br> 
        통신판매업 : 2021 - 부산 동래-01234 | 화물운송주선 제160236호 | <br> 
        전화번호 : 1588-3333 | 팩스 : 070-1234-1234 | 대표메일 : trucker@naver.com <br>
        <a href = "contract.html">화물운송약관</a> | <a href = "personal_information.html">개인정보 처리방침</a><br>
        COPYRIGHT(C) TRUCKER LTD. ALL RIGHT RESERVED.
    </footer>

</body>
</html>