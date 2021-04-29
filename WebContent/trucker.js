function join_check_ok(){
	if(document.form.driver_id.value.length == 0){
		alert("아이디를 써주세요");
		form.driver_id.focus();
		return;
	}
	if(document.form.driver_password.value.length == 0){
		alert("비밀번호를 써주세요");
		form.driver_password.focus();
		return;
	}
	if(document.form.driver_password.value != document.form.driver_password_check.value){
		alert("비밀번호가 틀립니다");
		form.driver_password_check.focus();
		return;
	}
	if(document.form.driver_name.value.length == 0){
		alert("이름을 써주세요");
		form.driver_name.focus();
		return;
	}
	if(document.form.driver_jumin.value.length == 0){
		alert("주민등록번호를 입력하세요");
		form.driver_jumin.focus();
		return;
	}

	if(document.form.driver_phone_number.value.length == 0){
		alert("전화번호를 입력하세요");
		form.driver_phone_number.focus();
		return;
	}

	if(document.form.driver_address.value.length == 0){
		alert("주소를 입력하세요");
		form.driver_address.focus();
		return;
	}
	if(document.form.driver_email.value.length == 0){
		alert("이메일을 입력하세요");
		form.driver_email.focus();
		return;
	}
	if(document.form.truck_number.value.length == 0){
		alert("차량번호를 입력하세요");
		form.truck_number.focus();
		return;
	}
	if(document.form.driver_picture.value.length == 0){
		alert("면허사진을 입력하세요");
		form.driver_picture.focus();
		return;
	}
	if(document.form.driver_license.value.length == 0){
		alert("면허번호를 입력하세요");
		form.driver_license.focus();
		return;
	}
	document.form.submit();
}
function modification_ok(){
	if(document.form.driver_phone_number.value.length == 0){
		alert("전화번호를 입력하세요");
		form.driver_phone_number.focus();
		return;
	}

	if(document.form.driver_address.value.length == 0){
		alert("주소를 입력하세요");
		form.driver_address.focus();
		return;
	}
	if(document.form.driver_email.value.length == 0){
		alert("이메일을 입력하세요");
		form.driver_email.focus();
		return;
	}
	document.form.submit();
}
