<%@page import="trucker.TruckerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("driver_id");
	String name = request.getParameter("driver_name");
	String jumin = request.getParameter("driver_jumin");

	TruckerDBBean db = TruckerDBBean.getInstance();
	String password = db.searchPW(id, name, jumin);
%>
<html lang="en">
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정보수정</title>
    <link rel = "stylesheet" type = "text/css" href = "css/trucker_modify.css">
	<script type="text/javascript" src="trucker.js" charset="utf-8"></script>
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
                <td><a href = "#">화물접수</a></td>
                <td><a href = "#">배송조회</a></td>
                <td><a href = "#">고객센터</a></td>
                <td><a href = "#">회사소개</a></td>
            </tr>
        </table>
      </nav>
      <section>
          <h1>비밀번호 찾기</h1>
          <table>
              <form action="login.html">
<%
          	if(password != null){
%>			
                <tr align ="center">
                    <td>비밀번호를 찾았습니다.</td>
                </tr>
                <tr align = "center">
                	<td><%= password %></td>
                </tr>
<%
          	}else{
%>
				<script>
					alert("비밀번호를 찾지 못했습니다.");
					history.go(-1);
				</script>
<%
          	}
%>
				<tr>
					<td><input type="submit" value="로그인 돌아가기"></td>
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