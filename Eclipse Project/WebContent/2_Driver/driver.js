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

	if(document.form.driver_addr.value.length == 0){
		alert("주소를 입력하세요");
		form.driver_addr.focus();
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

	if(document.form.driver_addr.value.length == 0){
		alert("주소를 입력하세요");
		form.driver_addr.focus();
		return;
	}
	document.form.submit();
}
function period_check_ok(){
	if(document.form.period_start.value.length == 0){
		alert("조회시작기간을 입력하세요");
		form.period_start.focus();
		return;
	}
	if(document.form.period_start.value.length == 0){
		alert("조회마침시간을 입력하세요");
		form.period_start.focus();
		return;
	}
	document.form.submit();
}
