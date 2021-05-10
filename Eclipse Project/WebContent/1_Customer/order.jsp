<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
    <title>화물 접수</title>
    <script>
    function next(){
       	//무게 입력 안하면 경고       	
       	if(document.getElementById("from_where").value == ""){
       		alert("비어있군!");
       		return;
       	}
     	//출발시각 비어있으면 경고
    	//도착지 주소 비어있으면 경고
    	
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
        <h1>화물 접수</h1>
        <form method = "post" action = "order_confirm.jsp">
        	<table>
        		<tr><th colspan = "2">출발지 및 도착지</th></tr>
        		<tr><td width="20%">출발지</td>
        		<td><input type="text" id="from_where" name = "from_where" placeholder="주소" onclick="from()" readonly>
					<input type="text" id="from_spec" name = "from_spec" placeholder="상세주소">
					<div id="wrap_from" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
        		</td></tr>
        		<tr><td>출발 시각</td>
        		<td><input type = "datetime-local" name = "depart_time"></td></tr>
        		
        		<tr><td>도착지</td>
        		<td><input type="text" id="to_where" name = "to_where" placeholder="주소" onclick="to()" readonly>
					<input type="text" id="to_spec" name = "to_spec" placeholder="상세주소">
					<div id="wrap_to" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
        		</td></tr>
        		
	        	<tr><th colspan = 2>차량 및 화물 정보</th></tr>
               	<tr><td>차량</td><td>
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
            <tr><td>화물 세부사항</td><td><textarea name = "cargo_spec" cols = "70" rows = "5" 
            placeholder="예> 40kg 밀가루 포대 X 60포대, 고박에 신경 써주세요. 화물 적재 및 하차는 지게차로 하니, 운송만 해주시면 됩니다. 19:00까지 똑 도착해야 하니 반드시 시간 맞춰주세요."></textarea><br>
            	 ※ 세부적인 화물 종류와 운송시 필수적인 사항을 적어주세요. 화물 운송에 필요한 세부적인 정보가 누락되는 경우, 기사 도착 이후 운송이 거부될 수 있습니다.<br>
            <input type = "button" value = "다음" onClick = "next()"></td></tr>
        		
        	</table>
        </form>
	</section>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap_from = document.getElementById('wrap_from');
    var element_wrap_to = document.getElementById('wrap_to');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap_from.style.display = 'none';
        element_wrap_to.style.display = 'none';
    }
	//출발지 주소 검색
    function from() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("from_spec").value = extraAddr;
                
                } else {
                    document.getElementById("from_spec").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("from_where").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("from_spec").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap_from.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap_from.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap_from);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap_from.style.display = 'block';
        
        
    }
	//출발지 주소 검색
    function to() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("to_spec").value = extraAddr;
                
                } else {
                    document.getElementById("to_spec").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("to_where").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("to_spec").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap_to.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap_to.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap_to);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap_to.style.display = 'block';
        
        
    }
</script>
</body>
</html>