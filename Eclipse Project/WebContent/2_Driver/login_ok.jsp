<%@page import="Driver.DriverBean"%>
<%@page import="Driver.DriverDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//login.html의 값을 입력받은 id,password
	String id = request.getParameter("driver_id");
	String pwd = request.getParameter("driver_pwd");
	
	DriverDBBean db = DriverDBBean.getInstance();
	//DB의 객체를 받기 위해 생성
	
	int check = db.userCheck(id, pwd);
	//유저가 있는지 확인하는 메소드
	
	DriverBean tb = db.getDriver(id);
	
	if(tb == null){ // id가 null이면
%>
		<script>
			alert("존재하지 않은 회원");
			history.go(-1);//이전페이지 이동
		</script>
<%
	}else{ // 회원 존재할 시
		String name = tb.getDriver_name(); // 이름 출력 - >name
		String phone =tb.getDriver_phone_number(); // 전화번호
		String license = tb.getDriver_license(); // 면허
		String truck_type = tb.getTruck_type(); //차량종류
		String truck_number = tb.getTruck_number(); // 차량번호
		
		if(check ==1 ){
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("phone", phone);
			session.setAttribute("license", license);
			session.setAttribute("truck_type", truck_type);
			session.setAttribute("truck_number", truck_number);
			
			response.sendRedirect("mypage.jsp");
		}else if(check == 0){//비밀번호 틀릴때
%>
			<script>
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);//이전페이지 이동
			</script>
<%
		}else{//아이디가 없을 때,
%>
			<script>
				alert("아이디가 없습니다.");
				history.go(-1);
			</script>
<%
		}
	}
%>
