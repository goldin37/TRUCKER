<%@page import="trucker.TruckerBean"%>
<%@page import="trucker.TruckerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="trucker" class="trucker.TruckerBean"></jsp:useBean>
<jsp:setProperty property="*" name="trucker"/>
<%
	String id = (String)session.getAttribute("id");
	trucker.setDriver_id(id); // session에 있는 id값 받아옴.
	
	TruckerDBBean db = TruckerDBBean.getInstance();
	TruckerBean tb = db.getTrucker(id); // 값을 가져옴
	
	int re = db.updateTrucker(trucker);
	
	if(re == 1){ // 제대로 진행되었을 때
		String name = tb.getDriver_name(); // 이름 출력 - >name
		String phone =tb.getDriver_phone_number(); // 전화번호
		String license = tb.getDriver_license(); // 면허
		String truck_type = tb.getTruck_type(); //차량종류
		String truck_number = tb.getTruck_number(); // 차량번호
%>
		<script>
			alert("입력하신대로 회원 정보가 수정되었습니다.");
			document.location.href="mypage.jsp";//수정완료했을 때 마이페이지로 이동
		</script>		
<%
	}else{
%>
		<script>
			alert("수정을 실패하였습니다.");
			history.back();
		</script>
<%
	}
%>