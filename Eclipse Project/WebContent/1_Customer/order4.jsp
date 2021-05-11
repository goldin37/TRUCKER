<%@page import="myUtil.HanConv"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="myUtil.GeoCode"%>
<%@page import="myUtil.Directions5"%>
<jsp:useBean id="HanConv" class = "myUtil.HanConv"></jsp:useBean>
<%
	//order.jsp¿¡¼­ ³Ñ°ÜÁØ °ª ¼¼¼Ç¿¡ ÀúÀå
	//from_where, from_spec, depart_time, to_where, to_spec
	//truck-type, cargo_type, cargo_help, cargo_spec
	
	String depart_time = (String)session.getAttribute("depart_time");
	//¿î¼Û°Å¸®, ½Ã°£, ETA °è»ê
	Directions5 dir = new Directions5();
	
	dir.Direction(HanConv.toKor((String)session.getAttribute("from_where"))
			, HanConv.toKor((String)session.getAttribute("to_where"))
			, (String)session.getAttribute("truck_type")
			, Integer.parseInt((String)session.getAttribute("cargo_weight"))
			, (String)session.getAttribute("cargo_help")
			, depart_time);
	
	session.setAttribute("ETA", dir.ETA);
	session.setAttribute("recommend_cost", dir.recommend_cost);
	session.setAttribute("fix_cost", dir.recommend_cost);

	//Ãâ¹ß½Ã°¢ º¯È¯
	depart_time = depart_time.substring(0, 4) + "³â " + depart_time.substring(5,7) + "/" + depart_time.substring(8,10) + " " + depart_time.substring(11,13) + ":" + depart_time.substring(14,16);
	
	
	//¿µ¹®À» ÇÑ±Û·Î ¹Ù²Ù±â
	String truck_type = (String)session.getAttribute("truck_type");
	if(truck_type.equals("damas")){
		truck_type = "´Ù¸¶½º";
	} else if(truck_type.equals("labo")){
		truck_type = "¶óº¸";
	} else if(truck_type.equals("1ton")){
		truck_type = "1Åæ Æ®·°";
	} else if(truck_type.equals("1.4ton")){
		truck_type = "1.4Åæ Æ®·°";
	} else if(truck_type.equals("2.5ton")){
		truck_type = "2.5Åæ Æ®·°";
	}
	String cargo_type = (String)session.getAttribute("cargo_type");
	if(cargo_type.equals("pallet")){
		cargo_type = "ÆÄ·¹Æ®";
	} else if(cargo_type.equals("box")){
		cargo_type = "¹Ú½º";
	} else if(cargo_type.equals("equipment")){
		cargo_type = "ÁßÀåºñ";
	} else if(cargo_type.equals("general")){
		cargo_type = "ÀÏ¹İÈ­¹°";
	}
	String cargo_weight = session.getAttribute("cargo_weight") + "kg";
	
	String cargo_help = (String)session.getAttribute("cargo_help");;
	if(cargo_help.equals("drive_only")){
		cargo_help = "¿î¼Û¸¸";
	} else if(cargo_help.equals("load_and_discharge")){
		cargo_help = "½ÂÇÏÂ÷ µµ¿ò ÇÊ¿ä";
	} else if(cargo_help.equals("to_door")){
		cargo_help = "½ÂÇÏÂ÷ ÈÄ Áı/Ã¢°í±îÁö ÀÌµ¿";
	}
	
	int cost_left = dir.recommend_cost/1000;
	int cost_right = dir.recommend_cost%1000;
	String cost_right_text;
	if(cost_right == 0){
		cost_right_text = "000¿ø";
	} else{
		cost_right_text = cost_right + "¿ø";
	}
	String cost_text = cost_left + "," + cost_right_text;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel = "stylesheet" type = "text/css" href = "../style/mystyle.css">
    <title>È­¹°Á¢¼ö(4/4)</title>
<script language="javascript">
	document.form.fix_cost.value = <%= request.getParameter("recommend_cost") %>

	function check_spec(){
		form.spec.hidden = false;
	}
	
function order(){
	//ÀÌ¸§ ¾øÀ¸¸é °æ°í
	if(document.form.name.value == ""){
		alert("ÀÌ¸§À» Àû¾îÁÖ¼¼¿ä.")
		return
	}
	//ÀüÈ­¹øÈ£ ¾øÀ¸¸é °æ°í
	if(document.form.tel1.value == "" || document.form.tel2.value == "" || document.form.tel3.value == ""){
		alert("ÀüÈ­¹øÈ£¸¦ Àû¾îÁÖ¼¼¿ä.")
		return
	}
	//ÁÖ¹®È®ÀÎ Ã¼Å© ¾ÈÇÏ¸é °æ°í
	if(document.form.confirm.checked == false){
		alert("ÁÖ¹®³»¿ªÀ» È®ÀÎÇÑ ÈÄ Ã¼Å© ÇØÁÖ¼¼¿ä.")
		return
	}
	if(document.form.contract.checked == false){
		alert("È­¹°¿î¼Û ¾à°üÀ» È®ÀÎÇÑ ÈÄ Ã¼Å© ÇØÁÖ¼¼¿ä.")
		return
	}
	if(document.form.information.checked == false){
		alert("°³ÀÎÁ¤º¸ Ã³¸®¹æÄ§À» È®ÀÎÇÑ ÈÄ Ã¼Å© ÇØÁÖ¼¼¿ä.")
		return
	}
	form.submit()
}

</script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=tzchnboziv"></script>
</head>
<body>

    <header>
        <h2>¹ÏÀ» ¼ö ÀÖ´Â È­¹° Áß°³ ÇÃ·§Æû</h2>
        <h1>Æ®·°Ä¿(TRUCKER)</h1>
    </header>
    <nav>
        <table>
            <tr>
                <td><a href = "order1.jsp">È­¹°Á¢¼ö</a></td>
                <td><a href = "order_query.jsp">¹è¼ÛÁ¶È¸</a></td>
                <td><a href = "../3_ServiceCenter/FAQ_main.jsp">°í°´¼¾ÅÍ</a></td>
                <td><a href = "companyIntroduction.html">È¸»ç¼Ò°³</a></td>
            </tr>
        </table>
    </nav>
    <section>
        <h1>È­¹° Á¢¼ö(4/4)</h1>
    	<form name = "form" method = "post" action = "payment.jsp">
    <table>
    	<tr>
    		<th colspan = "2">¿î¼Û ÁÖ¹® ³»¿ª</th>
    	</tr>
    	<tr><td>Â÷·® Á¾·ù</td>
    	<td><%= truck_type %></td></tr>
    	<tr><td>È­¹° Á¾·ù</td>
    	<td><%= cargo_type %></td></tr>
    	<tr><td>È­¹° ¹«°Ô</td>
    	<td><%= cargo_weight %></td></tr>
    	<tr><td>½ÂÇÏÂ÷ µµ¿ò</td>
    	<td><%= cargo_help %></td></tr>
    	<tr><td>È­¹° ¼¼ºÎ»çÇ×</td>
    	<td><%= HanConv.toKor((String)session.getAttribute("cargo_spec")) %></td></tr>
    	<tr><td>Ãâ¹ßÁö</td>
    	<td><%= HanConv.toKor((String)session.getAttribute("from_where")) + HanConv.toKor((String)session.getAttribute("from_spec"))%></td></tr>
    	<tr><td>µµÂøÁö</td>
    	<td><%= HanConv.toKor((String)session.getAttribute("to_where")) + HanConv.toKor((String)session.getAttribute("to_spec"))%></td></tr>
    	<tr><td>Ãâ¹ß ½Ã°¢</td>
    	<td><%= depart_time %></td></tr>
    	<tr><td>¿î¼Û °Å¸®</td>
    	<td><input type = "text" name = "distance" value = "<%= dir.distance %>" readonly>km</td></tr>
    	<tr><td>¿î¼Û ½Ã°£</td>
    	<td><input type = "text" name = "time" value = "<%= dir.time %>" readonly></td></tr>
    	<tr><td>µµÂø ¿¹Á¤ ½Ã°¢</td>
    	<td><input type = "text" name = "ETA" value = "<%= dir.ETA.substring(0,4) + "³â " + dir.ETA.substring(5,7) + "¿ù " + dir.ETA.substring(8,10) + "ÀÏ " + dir.ETA.substring(11,13) + ":" + dir.ETA.substring(14,16) %>" readonly></td></tr>
    	<tr><td>¿îÀÓ</td>
    	<td><input type = "text" name = "fix_cost" value = "<%= cost_text %>">
    	<input type ="button" onClick="check_spec()" value = "¼¼ºÎ¿îÀÓ È®ÀÎ"></td></tr>

    	<tr><td></td><td><output name = "spec" hidden><b>1. ±³Åëºñ</b><br>
<<<<<<< HEAD
<<<<<<< HEAD
    	<%= dir.toll_cost + "¿ø + (" + dir.distance + "km ¡¿ " + (double)Math.round(dir.fuel_rate*100)/100 + "km/L ¡¿ " + dir.fuel_cost_rate + "¿ø/L) + = <b>" + (dir.toll_cost + dir.fuel_cost) + "¿ø</b>" %><br>
=======
    	<%= dir.toll_cost + "¿ø + (" + dir.distance + "km ¡À " + (double)Math.round(dir.fuel_rate*100)/100 + "km/L ¡¿ " + dir.fuel_cost_rate + "¿ø/L) = <b>" + (dir.toll_cost + dir.fuel_cost) + "¿ø</b>" %><br>
>>>>>>> parent of 0fcefb2 (Revert "ì´ê²ƒì €ê²ƒ")
=======
    	<%= dir.toll_cost + "¿ø + (" + dir.distance + "km ¡¿ " + (double)Math.round(dir.fuel_rate*100)/100 + "km/L ¡¿ " + dir.fuel_cost_rate + "¿ø/L) = <b>" + (dir.toll_cost + dir.fuel_cost) + "¿ø</b>" %><br>
>>>>>>> parent of ecba9a6 (Revert "ìŠ¤íƒ€ì¼, ìš´ì„ê³„ì‚° ì¼ë¶€ ìˆ˜ì •")
		Åçºñ + À¯·ùºñ(¿îÇà°Å¸® ¡À ¿¬ºñ ¡¿ ¸®ÅÍ´ç ¿¬·áºñ)<br><br>
		<b>2. Â÷·® À¯Áöºñ</b><br>
		<%= dir.distance + "km ¡¿ " + dir.maintenance_rate + "¿ø = <b>" + dir.maintenance_cost + "¿ø</b>" %><br>
		¿îÇà°Å¸® ¡¿ °Å¸®´ç À¯Áöºñ<br><br>
		<b>3. ÀÎ°Çºñ</b><br>
		<%= "( " + (double)(Math.round((double)dir.temptime/60/60*100))/100 + "½Ã°£ ¡¿ 10,000¿ø ) + ( " + session.getAttribute("cargo_weight") + "kg ¡¿ ÀÛ¾÷ºñ ) = <b>" + dir.labor_cost + "¿ø</b>"%><br>
		¿îÀüºñ(¿îÇà½Ã°£ ¡¿ 10,000¿ø) + ¼öÀÛ¾÷ºñ(È­¹°¹«°Ô(kg) ¡¿ ÀÛ¾÷ºñ)<br>
		¡ØÀÛ¾÷ºñ : ½ÂÇÏÂ÷ 15¿ø, ¹®¾ÕÀ¸·Î 50¿ø<br><br>
		<b>4. ÇÕ°è ¿îÀÓ</b><br>
		<%= (dir.toll_cost + dir.fuel_cost) + "¿ø + " + dir.maintenance_cost + "¿ø + " + dir.labor_cost + "¿ø + " + dir.commission + "¿ø + " + dir.vat + "¿ø = <b>" + dir.recommend_cost + "¿ø</b>"%><br>
		±³Åëºñ + Â÷·® À¯Áöºñ + ÀÎ°Çºñ + ¼ö¼ö·á + ºÎ°¡¼¼ ( 1,000¿ø ¹Ì¸¸ Àı»ç )
    	</output></td></tr>

    	<tr><th colspan = "2">¿î¼Û ÁÖ¹®</th></tr>
    	<tr><td>¼º¸í</td>
    	<td><input type = "text" name = "name" size = "6"></td>
    	</tr>
    	<tr><td>ÀüÈ­¹øÈ£</td>
    	<td><input type = "text" name = "tel1" value = "010" size = "3">
    	 - <input type = "text" name = "tel2" size = "4">
    	 - <input type = "text" name = "tel3" size = "4">
    	</td></tr>
    	<tr><td>ÁÖ¹® È®ÀÎ</td>
    	<td class = "simple_link">
			<label><input type = "checkbox" name = "confirm">À§ÀÇ ¿î¼ÛÁÖ¹® ³»¿ªÀ» È®ÀÎÇÏ¿´½À´Ï´Ù.</label><br>    	
    		<label><input type = "checkbox" name = "contract"><a href = "contract.html">È­¹°¿î¼Û ¾à°ü</a>¿¡ µ¿ÀÇÇÕ´Ï´Ù.</label><br>
			<label><input type = "checkbox" name = "information"><a href = "personal_information.html">°³ÀÎÁ¤º¸ Ã³¸®¹æÄ§</a>¿¡ µ¿ÀÇÇÕ´Ï´Ù.</label>    	
		</td></tr>
		<tr><td></td><td><input type = "button" value = "È®ÀÎ ¹× °áÁ¦" onClick = "order()"></td></tr>
    </table>
    	</form>
    </section>
    <footer>
        (ÁÖ)Æ®·°Ä¿ ºÎ»ê½Ã ÇØ¿î´ë±¸ ¸¶¸°½ÃÆ¼3·Î 45 | »ç¾÷ÀÚ¹øÈ£ : 123-45-12345 | <br> 
        Åë½ÅÆÇ¸Å¾÷ : 2021 - ºÎ»ê µ¿·¡-01234 | È­¹°¿î¼ÛÁÖ¼± Á¦160236È£ | <br> 
        ÀüÈ­¹øÈ£ : 1588-3333 | ÆÑ½º : 070-1234-1234 | ´ëÇ¥¸ŞÀÏ : trucker@naver.com <br>
        <a href = "contract.html">È­¹°¿î¼Û¾à°ü</a> | <a href = "personal_information.html">°³ÀÎÁ¤º¸ Ã³¸®¹æÄ§</a><br>
        COPYRIGHT(C) TRUCKER LTD. ALL RIGHT RESERVED.
    </footer>

</body>
</html>