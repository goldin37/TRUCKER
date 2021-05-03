<%@page import="trucker.TruckerBean"%>
<%@page import="trucker.TruckerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	TruckerDBBean db = TruckerDBBean.getInstance();
	TruckerBean tb = db.getTrucker(id);	//아이디가 일치하는 멤버의 정보를 가져옴
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
          <h1>정보수정</h1>
          <p> 변경하실 정보를 입력해주세요.</p>
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
                    <input type="text" name="driver_phone_number"size="40"  value="<%=tb.getDriver_phone_number() %>">
                </td>
                </tr>
                <tr>
                    <td>주소 : </td>
                    <td><input type="text" size="40" value="<%=tb.getDriver_address() %>" name="driver_address"></td>
                </tr>
                <tr>
                    <td>이메일 : </td>
                    <td><input type="text" size="40" value="<%= tb.getDriver_email()%>" name="driver_email">
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
                    <td colspan="2"><input type="button" value="정보수정" class="join" onclick="modification_ok()"></td>
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