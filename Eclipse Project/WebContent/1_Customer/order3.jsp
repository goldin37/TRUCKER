<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//order2에서 넘겨준 값 세션에 저장
	session.setAttribute("from_where", request.getParameter("from_where"));
	session.setAttribute("from_spec", request.getParameter("from_spec"));
	session.setAttribute("depart_time", request.getParameter("depart_time"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
    <title>화물접수(3/4)</title>
    <script language="javascript">

function toPopup(){
	var pop = window.open("fromPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function fromCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		document.form.to_where.value = roadAddrPart1;
		document.form.to_spec.value = roadAddrPart2 + addrDetail;
}

function next(){
	//주소를 입력안하면 경고
	if(document.form.to_where.value == ""){
		alert("주소를 검색 해주세요.")
		return
	}
	form.submit()
}

</script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=tzchnboziv"></script>
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
        <h1>화물 접수(3/4)</h1>
        <table>
        <form  name = "form" method = "post" action = "order4.jsp">
        	<tr><th colspan = 2>도착지</th></tr>
    		<tr>
			    <td>도착지</td>
        	   	<td>
					<input type="text"  name="to_where" size = "40" readonly>
					<a onClick="toPopup();">주소 검색</a><br><br>
					<input type="text" name="to_spec" size = "40">
					<a onClick="next()">다음</a>
				</td>
			</tr>
		</form>
        </table>
    
    
    
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