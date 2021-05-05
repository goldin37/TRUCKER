<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

	String id = (String)session.getAttribute("id");
	String name =(String)session.getAttribute("name");
	String license = (String)session.getAttribute("license");
	String truck_type = (String)session.getAttribute("truck_type");
	String truck_number = (String)session.getAttribute("truck_number");
	String phone = (String)session.getAttribute("phone");
%>
<html lang="en">
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>운송내역조회(1/2)</title>
    <link rel = "stylesheet" type = "text/css" href = "css/mystyle.css">
</head>
<body>
    <header>
        <br><br><br><br><br><br><br><br><br><br><br>
        <h2>믿을 수 있는 화물 중개 플랫폼</h2>
        <h1>트럭커(TRUCKER)</h1>
    </header>
      <nav>
          <table>
           <tr>
                <td><a href = "#">접수현황</a></td>
                <td><a href = "#">mypage</a></td>
                <td><a href = "#">고객센터</a></td>
                <td><a href = "#">회사소개</a></td>
            </tr>
        </table>
      </nav>
    <script type="text/javascript" src="Driver.js" charset="utf-8" ></script>
    <section>
        <h2>운송내역조회</h2> 
        <p>안녕하세요 <%= name %>(<%=id %>)님</p>
        <table>
        	<form method="post">
	       		<tr>
	               <td>조회 기간:
	                   <input type = "datetime-local" name="period_start"> ~
	                   <input type = "datetime-local" name="period_end">
		               <input type="button" value="조회하기" class="click" onclick="period_check_ok()">
	               </td>
	            </tr>
				<tr>		
	                <td>
	                	<input type="button" value="진행중인배송" class="finished" onclick="location.href='mypage.jsp'">
	                </td>
	            </tr>
        	</form>
        </table>
    </section>

    <section class="question">
        <h2>문의사항</h2> 
        <ul>
            <li><a href="#"> 자주하는 질문</a></li>
            <li><a href="#"> Q & A 바로가기</a></li>
            <li>고객센터 운영시간 09:00~18:00</li>
            <li>전화번호 1555-1555</li>
            <input type="button" value="바로가기" class="click">
        </ul>
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
