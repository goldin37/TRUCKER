function check_ok(){
	if(document.form.notice_title.value.length == 0){
		alert("제목을 입력하세요");
		form.notice_title.focus();
		return;
	}
	document.form.submit();
}
function check_ok1(){
	if(document.form1.faq_title.value.length == 0){
		alert("제목을 입력하세요");
		form.faq_title.focus();
		return;
	}
	document.form1.submit();
}
function inq_ok(){
	if(document.inqform.inquiry_name.value.length == 0){
		alert("이름을 입력하세요");
		form.Inquiry_name.focus();
		return;
	}
	if(document.inqform.inquiry_pwd.value.length == 0){
		alert("비밀번호를 입력하세요");
		form.inquiry_pwd.focus();
		return;
	}
	if(document.inqform.inquiry_title.value.length == 0){
		alert("제목을 입력하세요");
		form.Inquiry_title.focus();
		return;
	}
	if(document.inqform.inquiry_content.value.length == 0){
		alert("내용을 입력하세요");
		form.Inquiry_content.focus();
		return;
	}
	document.inqform.submit();
}
function inq_ok1(){
	if(document.inqform1.inquiry_name.value.length == 0){
		alert("이름을 입력하세요");
		form.Inquiry_name.focus();
		return;
	}
	if(document.inqform1.inquiry_pwd.value.length == 0){
		alert("비밀번호를 입력하세요");
		form.inquiry_pwd.focus();
		return;
	}
	if(document.inqform1.inquiry_title.value.length == 0){
		alert("제목을 입력하세요");
		form.Inquiry_title.focus();
		return;
	}
	if(document.inqform1.inquiry_content.value.length == 0){
		alert("내용을 입력하세요");
		form.Inquiry_content.focus();
		return;
	}
	document.inqform1.submit();
}
function delete_ok(){
	if(document.deleteform.inquiry_pwd.value.length == 0){
		alert("비밀번호를 입력하세요");
		deleteform.inquiry_pwd.focus();
		return;
	}
	document.deleteform.submit();
}