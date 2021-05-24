<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%
	if(session.getAttribute("id") == null){
%>
		<jsp:forward page ="login.html"></jsp:forward>
<%
	}

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
    <title>마이페이지</title>
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
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
                <td><a href = "orderlist.jsp">접수현황</a></td>
                <td><a href = "mypage.jsp">마이페이지</a></td>
                <td><a href = "../3_ServiceCenter/FAQ_main.jsp">고객센터</a></td>
                <td><a href = "../1_Customer/companyIntroduction.html">회사소개</a></td>
            </tr>
        </table>
      </nav>
    <section class="box">
        <h2 id="box">개인정보</h2> 
        <p style="font-weight: bolder; padding-left: 90px;">
           	환영합니다 ! <%= name %>(<%=id %>)님 
        </p>
        <table>
            <form method=post>
            <tr>
                <td>이름 : <%=name %></td>
            </tr>
            <tr>
                <td>휴대전화 : <%=phone %></td>
            </tr>
            <tr>
                <td>면허 번호: <%=license %></td>
            </tr>
            <tr>
                <td>차량 : <%=truck_type %></td>
            </tr>
            <tr>
                <td>차량번호 : <%=truck_number %></td>
            </tr>
            </form>
        </table>
        <input type="button" value="로그아웃" class="click" onclick="location.href='logOut.jsp'">
        <input type="button" value="정보수정" class="click" onclick="location.href='modification.jsp'">
    </section>
    <section class="now">
        <h2 id="box">진행중인 운송</h2> 
        <table>
            <form name="form" action="view_ordered_1.jsp" method="post" enctype="multipart/form-data">
            <tr>
                <td>출발일자 : 받는값</td>
            </tr>
            <tr>
                <td>고객이름 : 받는 값</td>
            </tr>
            <tr>
                <td>화물종류 : 받는 값</td>
            </tr>
            <tr>
                <td>화물무게 : 받는 값</td>
            </tr>
            <tr>
                <td>상차지 : 받는 값</td>
            </tr>
            <tr>
                <td>하차지 : 받는 값</td>
            </tr>
            <tr>
                <td>승하차도움 : 받는 값</td>
            </tr>
            <tr>
                <td>운임비용 : 받는 값</td>
            </tr>
            <tr>
                <td>
                    <input type="button" value="운송취소" class="click" onclick="">
                    <input type="button" value="운송완료" class="click" onclick="">
                    <input type="button" value="운송접수확인" class="click" onclick="location.href='orderlist.jsp'">
                    <input type="button" value="운송내역확인" class="click" onclick="location.href='view_ordered_1.jsp'">
                    
                 </td>
             </tr>
            </form>
        </table>
    </section>

    <section class="question">
        <h2 id="box">문의사항</h2> 
        <ul>
            <li><a href="#"> FAQ 바로가기</a></li>
            <li><a href="#"> Q & A 바로가기</a></li>
            <li>고객센터 운영시간 09:00~18:00</li>
            <li>전화번호 1555-1555</li>
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
