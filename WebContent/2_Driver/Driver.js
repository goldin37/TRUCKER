function login_check_ok(){
	if(document.form.driver_id.value.length == 0){
		alert("아이디를 써주세요");
		form.driver_id.focus();
		return;
	}
	if(document.form.driver_pwd.value.length == 0){
		alert("비밀번호를 써주세요");
		form.driver_pwd.focus();
		return;
	}
	document.form.submit();
}

function join_check_ok(){
	if(document.form.driver_id.value.length == 0){
		alert("아이디를 써주세요");
		form.driver_id.focus();
		return;
	}
	if(document.form.driver_pwd.value.length == 0){
		alert("비밀번호를 써주세요");
		form.driver_pwd.focus();
		return;
	}
	if(document.form.driver_pwd.value != document.form.driver_pwd_check.value){
		alert("비밀번호가 틀립니다");
		form.driver_pwd_check.focus();
		return;
	}
	if(document.form.driver_name.value.length == 0){
		alert("이름을 써주세요");
		form.driver_name.focus();
		return;
	}
	if(document.form.jumin1.value.length == 0){
		alert("주민등록번호를 입력하세요");
		form.jumin1.focus();
		return;
	}
	if(document.form.jumin2.value.length == 0){
		alert("주민등록번호를 입력하세요");
		form.jumin2.focus();
		return;
	}

	if(document.form.phone2.value.length == 0){
		alert("전화번호를 입력하세요");
		form.phone2.focus();
		return;
	}
	if(document.form.phone3.value.length == 0){
		alert("전화번호를 입력하세요");
		form.phone3.focus();
		return;
	}

	if(document.form.addr1.value.length == 0){
		alert("주소를 입력하세요");
		form.addr1.focus();
		return;
	}
	if(document.form.addr2.value.length == 0){
		alert("주소를 입력하세요");
		form.addr2.focus();
		return;
	}
	if(document.form.truck_number.value.length == 0){
		alert("차량번호를 입력하세요");
		form.truck_number.focus();
		return;
	}
	if(document.form.driver_photo.value.length == 0){
		alert("면허사진을 입력하세요");
		form.driver_photo.focus();
		return;
	}
	if(document.form.driver_license.value.length == 0){
		alert("면허번호를 입력하세요");
		form.driver_license.focus();
		return;
	}
	document.form.submit();
}

function check_email(){
	if(document.form.email.options[document.form.email.selectedIndex].value == '0'){
	 document.form.email2.value = false;
	 document.form.email2.value = "";
	}
	if(document.form.email.options[document.form.email.selectedIndex].value == '9'){
	 document.form.email2.value = "";
	 document.form.email2.focus();
	} else{
	 document.form.email2.value = document.form.email.options[document.form.email.selectedIndex].value;
	}
}

function autoHypen(obj) {
    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";

    if(number.length < 3) {
        return number;
    } else if(number.length < 10) {
        phone += number.substr(0, 2);
        phone += "-";
        phone += number.substr(2);
    } else if(number.length < 13) {
        phone += number.substr(0, 2);
        phone += "-";
        phone += number.substr(2, 6);
        phone += "-";
        phone += number.substr(8);
    } else {
        phone += number.substr(0, 2);
        phone += "-";
        phone += number.substr(8, 9);
        phone += "-";
        phone += number.substr(2);
    }
    obj.value = phone;
}
function modification_ok(){
	if(document.form.phone2.value.length == 0){
		alert("전화번호를 입력하세요");
		form.phone2.focus();
		return;
	}
	if(document.form.phone3.value.length == 0){
		alert("전화번호를 입력하세요");
		form.phone3.focus();
		return;
	}

	if(document.form.addr1.value.length == 0){
		alert("주소를 입력하세요");
		form.addr.focus();
		return;
	}
	if(document.form.addr2.value.length == 0){
		alert("주소를 입력하세요");
		form.addr2.focus();
		return;
	}
	document.form.submit();
}

function period_check_ok(){
	if(document.form.period_start.value.length == 0){
		alert("조회시작날짜를 입력하세요");
		form.period_start.focus();
		return;
	}
	if(document.form.period_end.value.length == 0){
		alert("조회마침날짜를 입력하세요");
		form.period_end.focus();
		return;
	}
	document.form.submit();
}

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                    document.getElementById("sample6_detailAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_detailAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

 function delete_order_ok(){
 		
 		if(confirm("배송을 취소하시겠습니까?") == true){
 			alert("배송을 취소하셨습니다.");
 			document.location.href="delete_order.jsp";				
 		}else{
 			alert("배송을 취소하지 않으셨습니다.");
 			document.location.href="mypage.jsp";				
 		}
  }
  function complete_order_ok(){
 		
 		if(confirm("배송을 완료하시겠습니까?") == true){
 			alert("배송을 완료하셨습니다.");
 			document.location.href="completed_order.jsp";				
 		}else{
 			alert("배송을 완료하지 않으셨습니다.");
 			document.location.href="mypage.jsp";				
 		}
  }
