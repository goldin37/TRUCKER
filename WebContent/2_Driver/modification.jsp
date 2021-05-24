<%@page import="Driver.DriverBean"%>
<%@page import="Driver.DriverDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	DriverDBBean db = DriverDBBean.getInstance();
	DriverBean tb = db.getDriver(id);	//아이디가 일치하는 멤버의 정보를 가져옴
%>
<html lang="en">
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정보수정</title>
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
	<script type="text/javascript" src="driver.js" charset="utf-8"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                <td><a href = "../3_ServiceCenter/FAQ_main.jsp">고객센터</a></td>
                <td><a href = "../1_Customer/companyIntroduction.html">회사소개</a></td>
            </tr>
        </table>
      </nav>
      <section>
          <h1>정보수정</h1>
          <p style="margin-left:20px;"> 변경하실 정보를 입력해주세요.</p>
          <table>
              <form name = "form" method="post" action="modification_ok.jsp">
                <tr>
                    <td>아이디 : </td>
                    <td><%= tb.getDriver_id() %></td>
                </tr>

                <tr>
                    <td>이름 : </td>
                    <td><%= tb.getDriver_name() %></td>
                </tr>
                <tr>
                    <td>주민등록번호 : </td>
                    <td>
					<%=tb.getDriver_jumin() %>
                    </td>
                </tr>
                 <tr>
                    <td>전화번호 : </td>
                    <td>
                    <input type="text" name="phone1" value="010" size="1" maxlength="3"> -
                    <input type="text" name="phone2" size="3" maxlength="4"> -
                    <input type="text" name="phone3" size="3" maxlength="4">
                </td>
                </tr>
                <tr>
                    <td>주소 : </td>
                    <td>
                    	<input type="text" id="sample6_address" name="addr1" placeholder="주소" size="40" readonly>&nbsp;&nbsp;
                    	<a onclick="sample6_execDaumPostcode()">주소 검색</a><br>
						<input type="text" id="sample6_detailAddress" name="addr2" placeholder="상세주소" size="10">
                    </td>
               <tr>
                    <td>이메일 : </td>
                    <td>
                    	<input name="email1" type="text" size="15"> @
						<input name="email2" type="text" size="15" readonly>
							<select name="email" id="" onchange="check_email()">
							    <option value="0" selected>선택하세요</option>
							    <option value="naver.com">naver.com</option>
							    <option value="nate.com">nate.com</option>
							    <option value="hanmail.com">hanmail.com</option>
							    <option value="gmail.com">gmail.com</option>
							    <option value="9">직접입력</option>
							</select>	
                    </td>
                </tr>
                <tr>
                    <td>주 활동지역 : </td>
                    <td>
                        <select name="driver_position">
                            <option value="전국">전국</option>
                            <option value="서울">서울</option>
                            <option value="경기">경기</option>
                            <option value="강원">강원</option>
                            <option value="충청">충청</option>
                            <option value="전라">전라</option>
                            <option value="경북">경북</option>
                            <option value="경남">경남</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>차량종류 : </td>
                    <td>
                    <label><input type="radio" name="truck_type" value="damas">다마스</label>
                    <label><input type="radio" name="truck_type" value="labo">라보</label>
                    <label><input type="radio" name="truck_type" value="1ton">1톤</label>
                    <label><input type="radio" name="truck_type" value="1.4ton" checked="checked">1.4톤</label>
                    <label><input type="radio" name="truck_type" value="2.5ton">2.5톤</label>
                </td>
                </tr>
                <tr>
                    <td>차량번호 : </td>
                    <td><input type="text" size="10" value="<%=tb.getTruck_number()%>" name="truck_number"></td>
                </tr>
                <tr>
                    <td>면허정보 : </td>
                    <td>
                    	<%=tb.getDriver_license()%>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center">
                    <input type="button" value="정보수정" id="join" onclick="modification_ok()">
                    <input type="button" value="돌아가기" id="join" onclick="location.href='mypage.jsp'">
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