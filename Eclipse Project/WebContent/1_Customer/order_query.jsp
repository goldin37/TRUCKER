<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
</head>
<body class = "order_query">
    <header>
        <h2>믿을 수 있는 화물 중개 플랫폼</h2>
        <h1>트럭커(TRUCKER)</h1>
    </header>
    <nav>
        <table>
            <tr>
                <td><a href = "order.html">화물접수</a></td>
                <td><a href = "order_query.jsp">배송조회</a></td>
                <td><a href = "../3_ServiceCenter/Notice_main.jsp">고객센터</a></td>
                <td><a href = "companyIntroduction.html">회사소개</a></td>
            </tr>
        </table>
    </nav>
    <section><br>
    	<form action="order_query_Search_order_id.jsp" method="post">
	      <h1>배송 조회</h1>
	      <table>
	   		<tr>
               <td rowspan = 4 width = 250px>배송 번호
	               <input type="text" size = 5 name="order_id">
<!-- 	               <input type="button" value="조회" class="shipping" onclick="order_id_check_ok()">     -->
	               <input type="submit" value="조회" class="shipping">    
               </td>
               <td> </td>
            </tr>
        </form>
            
        <form action="order_query_Search_name_tel.jsp" method="post">
	            <tr>
	                <th>배송번호 찾기</th>
	            </tr>
	            <tr>
	                <td>
                    	이름 <input type = "text" size = 3 name="customer_name"> 
	                   	전화번호 
	                   	<input type = "text" size = 3 name="phone1" maxlength="3">-
	                   	<input type = "text" size = 4 name="phone2" maxlength="4">-
	                   	<input type = "text" size = 4 name=phone3 maxlength="4">
	                    <input type="submit" value="조회" class="shipping">
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    2021년 5월 12일 14:22 &nbsp;&nbsp;&nbsp;부산 > 김천 &nbsp;&nbsp;&nbsp;<point>B53PK</point>
	                </td>
	            </tr>
        	</table>
        </form>
        <br><br>
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