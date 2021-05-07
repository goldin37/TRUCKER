<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>화물운송 주문 접수 완료</title>
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
</head>
<body>
    <header>
        <h2>믿을 수 있는 화물 중개 플랫폼</h2>
        <h1>트럭커(TRUCKER)</h1>
    </header>
    <nav>
        <table>
            <tr>
                <td><a href = "order1.jsp">화물접수</a></td>
                <td><a href = "order_query.jsp">배송조회</a></td>
                <td><a href = "../3_ServiceCenter/FAQ_main.jsp">고객센터</a></td>
                <td><a href = "companyIntroduction.html">회사소개</a></td>
            </tr>
        </table>
    </nav>
    <section>
    <h2>화물운송 주문 접수 완료</h2>
        화물운송 주문 접수가 완료되었습니다.<br>
        운송번호 :<order_number><%= session.getAttribute("order_id") %></order_number><br>
        <p class = "simple_link">운송 상태는 <a onclick="javascript:window.open('order_query.html')">운송조회 페이지</a>에서 확인하실 수 있습니다.</p>
        운송기사에 배차 후, 문자메시지로 안내 드리겠습니다.<br>
    </section>
    <footer>
        (주)트럭커 부산시 해운대구 마린시티3로 45 | 사업자번호 : 123-45-12345 | <br> 
        통신판매업 : 2021 - 부산 동래-01234 | 화물운송주선 제160236호 | <br> 
        전화번호 : 1588-3333 | 팩스 : 070-1234-1234 | 대표메일 : trucker@naver.com <br>
        <a href = "contract.html">화물운송약관</a> | <a href = "personal_information.html">개인정보 처리방침</a><br>
        COPYRIGHT(C) TRUCKER LTD. ALL RIGHT RESERVED.
    </footer>
</body>
</html>