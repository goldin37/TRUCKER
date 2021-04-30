m<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="HanConv" class = "myUtil.HanConv"></jsp:useBean>
<%
	//order4에서 넘겨준 값 세션에 저장
	session.setAttribute("fix_cost", session.getAttribute("recommend_cost"));
	session.setAttribute("customer_name", request.getParameter("name"));
	session.setAttribute("customer_telephone", 
		request.getParameter("tel1") + request.getParameter("tel2") + request.getParameter("tel3"));
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel = "stylesheet" type = "text/css" href = "style/mystyle.css">
    <title>운송요금 결제</title>
<script language="javascript">
function mobile_payment(){
	window.open("mobile_payment.jsp", "휴대전화 소액결제", "left = 100px, top = 100, width = 500px, height = 600px")
	return
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
                <td><a href = "order.html">화물접수</a></td>
                <td><a href = "order_query.html">배송조회</a></td>
                <td><a href = "">고객센터</a></td>
                <td><a href = "">회사소개</a></td>
            </tr>
        </table>
    </nav>
    <section>
        <h1>운임 결제</h1>
    <form name = "form" method = "post" action = "mobile_payment.jsp">
    <table name = "table">
    	<tr>
    		<th colspan = "4">결제수단 선택</th>
    	</tr>
    	<tr>
    		<td><img src = "images/transfer.png" width = 250px><br><br><center><a>실시간 계좌이체</a></center></td>
    		<td><img src = "images/virtual_transfer.png" width = 250px><br><br><center><a>가상계좌 입금</a></center></td>
    		<td><img src = "images/credit_card.png" width = 250px><br><center><a>카드 결제</a></center></td>
    		<td><img src = "images/mobile.png" width = 250px><br><br><center><a onClick = "mobile_payment()">휴대전화 소액결제</a></center></td>
    	</tr>
    	<th colspan = "4">휴대전화 소액결제</th>
    	<td></td>
    	</tr>
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