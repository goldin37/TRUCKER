package myUtil;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

//?š´?„ ê³„ì‚°?„ ?œ„?•œ ?´?˜?Š¤, ìµœì¢…? ?œ¼ë¡? ì¶”ì²œ ?š”ê¸ˆì„ ê³„ì‚°?•œ?‹¤.
public class Directions5 {
	public String ETA; //?„ì°©ì‹œê°?
	public int distance;	//ê±°ë¦¬
	public double speed;	//?‰ê·? ?†?„
	public int time;	//?†Œ?š”?‹œê°?(ì´?)
	public int toll_cost;	//?†¨ë¹?
	
	public double public_fuel_rate;	//ê³µì¸?—°ë¹?
	public double fuel_rate;	//?—°ë¹?
	public double fuel_cost_rate;	//ë¦¬í„°?‹¹ ?—°ë£Œë‹¨ê°?
	public double fuel_cost;	//?—°ë£Œë¹„
	
	public double maintenance_rate;	//ê±°ë¦¬?‹¹ ?œ ì§?ë¹?
	public double maintenance_cost;	//?œ ì§?ë¹?
	
	public int help_cost;
	public int labor_rate;	//?‹œê°„ë‹¹ ?¸ê±´ë¹„
	public int labor_cost;	//?¸ê±´ë¹„
	
	public double sub_total;
	
	public double commission;	//?ˆ˜?ˆ˜ë£?
	public double vat;			//ë¶?ê°??„¸
	
	public int recommend_cost;	//ì¶”ì²œ ?š´?„
	// ?‰ê·? ?†?„ = ê±°ë¦¬ * 1.5, MAX 80
	// ?—°ë¹? = ê³µì¸?—°ë¹? * ì°¨ëŸ‰ë¬´ê²Œ / ì°¨ëŸ‰ + ?™”ë¬¼ë¬´ê²?
	
	// ì¶”ì²œ?š”ê¸? = ?†¨ë¹? + ?—°ë£Œë¹„ + ?œ ì§?ë¹? + ?¸ê±´ë¹„ + ?„?? + ?ˆ˜?ˆ˜ë£? + ë¶?ê°??„¸ ?—?„œ 1000?‹¨?œ„ ë¯¸ë§Œ ? ˆ?‚¬
	// ?—°ë£Œë¹„ = ë¦¬í„°?‹¹ ?—°ë£Œë¹„ * ê±°ë¦¬ / ?—°ë¹?
	// ?œ ì§?ë¹? = ê±°ë¦¬ * ê±°ë¦¬?‹¹ ?œ ì§?ë¹?
	// ?¸ê±´ë¹„ = ?†Œ?š”?‹œê°?  * ?‹œê°„ë‹¹ ?¸ê±´ë¹„ + ?„??
	// ?ˆ˜?ˆ˜ë£? = ( ?†¨ë¹? + ?—°ë£Œë¹„ + ?œ ì§?ë¹? + ?¸ê±´ë¹„ ) * 8%
	// ë¶?ê°??„¸ = ( ?†¨ë¹? + ?—°ë£Œë¹„ + ?œ ì§?ë¹? + ?¸ê±´ë¹„  + ?ˆ˜?ˆ˜ë£?) * 10%
	
	public String result; //ê²°ê³¼ JSON
	public void Direction(String from_where, String to_where, String truck_type, int cargo_weight, String cargo_help, String depart_time) {
		//ì¶œë°œì§??‘ ?„ì°©ì? ì¢Œí‘œ ë°›ì•„?˜¤ê¸?
		GeoCode from = new GeoCode();
		from.getGPS(from_where);
		System.out.println(from.x);
		System.out.println(from.y);
		
		GeoCode to = new GeoCode();
		to.getGPS(to_where);
		System.out.println(to.x);
		System.out.println(to.y);
		
		//ê±°ë¦¬ ê³„ì‚°?°?´?„° ë°›ê¸°
		try {
			//URL?´?‘ ì£¼ì†Œ ?…? ¥, ì£¼ì†Œ?Š” UTF-8ë¡? ?¸ì½”ë”©
			URL url = new URL("https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?X-NCP-APIGW-API-KEY-ID=tzchnboziv&X-NCP-APIGW-API-KEY=svQaeTRI6EoOAufCfliJfjFQlKpoNcjl4ZY5UMX7&start=" 
			+ from.x + "," + from.y + "&goal=" + to.x + "," + from.y + "&cartype=4");
			
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			
			//ì¡°íšŒ?•œ ?°?´?„°ë¥? responseë¡? ë°›ê¸°
			int responseCode = con.getResponseCode();
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			
			while((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			
			//JSON ?°?´?„° ?ŒŒ?‹±
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(response.toString());
			System.out.println(jsonObj.toString());
			jsonObj = (JSONObject) jsonObj.get("route");
			JSONArray jsonArray = (JSONArray) jsonObj.get("traoptimal");
			jsonObj = (JSONObject) jsonArray.get(0);
			jsonObj = (JSONObject) jsonObj.get("summary");
			
			// ê°?? ¸?˜¤?Š” ?°?´?„°?Š” ê±°ë¦¬?‘ ?†¨ë¹?
			distance = Integer.valueOf(jsonObj.get("distance").toString()) * 1609 / 1000;		//ë°?ë¦? ë§ˆì¼ ?‹¨?œ„ë¡? ê³„ì‚°?˜?Š” ?“¯, 1.609 ê³±í•˜ë©? ? ?‹¹?ˆ ?‚˜?˜¬ ?“¯
			toll_cost = Integer.valueOf(jsonObj.get("tollFare").toString());
			// ê°? ë³??ˆ˜ ê³„ì‚°
			// ?†?„
			speed = distance * 1.5;
			if(speed > 80) speed = 80;
			//?‹œê°?
			time = (int)( distance / 1000 / speed + 1 ) * 60 * 60; // ?‹œê°? = ê±°ë¦¬ / ?†?„ + 1?‹œê°?, ?‹¨?œ„?Š” ì´?
			//?„ì°©ì˜ˆ? •?¼?‹œ
			ETA = LocalDateTime.parse(depart_time).plusSeconds(time).toString();
			//?—°ë¹?, ?—°ë£Œë‹¨ê°?, ?œ ì§??‹¨ê°?
			if(truck_type.equals("damas")) {
				public_fuel_rate = 8.8;
				fuel_rate = public_fuel_rate * 865 / ( 865 + cargo_weight);
				fuel_cost_rate = 950;
				maintenance_rate = 2000000 / 30000;	//?—° ?œ ì§?ë¹? 200ë§Œì› / 5ë§Œí‚¤ë¡?
			}
			if(truck_type.equals("labo")) {
				public_fuel_rate = 8.6;
				fuel_rate = public_fuel_rate * 760 / ( 760 + cargo_weight);
				fuel_cost_rate = 950;
				maintenance_rate = 2000000 / 30000;
			}
			if(truck_type.equals("1ton")) {
				public_fuel_rate = 9.9;
				fuel_rate = public_fuel_rate * 1825 / ( 1825 + cargo_weight);
				fuel_cost_rate = 1300;
				maintenance_rate = 3500000 / 50000;
			}
			if(truck_type.equals("1.4ton")) {
				public_fuel_rate = 9.0;
				fuel_rate = public_fuel_rate * 1800 / ( 1800 + cargo_weight);
				fuel_cost_rate = 1300;
				maintenance_rate = 4000000 / 50000;
			}
			if(truck_type.equals("2.5ton")) {
				public_fuel_rate = 7.5;
				fuel_rate = public_fuel_rate * 2500 / ( 2500 + cargo_weight);
				fuel_cost_rate = 1300;
				maintenance_rate = 5000000 / 70000;
			}
			//?—°ë£Œë¹„
			fuel_cost = distance / 1000 * fuel_cost_rate / fuel_rate; 
			//?œ ì§?ë¹?
			maintenance_cost = distance / 1000 * maintenance_rate;
			//?Š¹?•˜ì°? ?„??
			if(cargo_help.equals("drive_only")){
				help_cost = 0;
			}
			if(cargo_help.equals("load_and_discharge")){
				help_cost = 10000;
			}
			if(cargo_help.equals("to_door")){
				help_cost = 30000;
			}
			//?¸ê±´ë¹„
			labor_rate = 10000;
			labor_cost = time * labor_rate / 60 / 60 + help_cost;

			//?ˆ˜?ˆ˜ë£?, ë¶?ê°??„¸ ë°? ?•©ê³?
			sub_total = toll_cost + fuel_cost + maintenance_cost + labor_cost;
			commission = sub_total * 0.08;
			sub_total += commission;
			vat = sub_total * 0.1;
			recommend_cost = (int)(sub_total + vat)/1000*1000;
			System.out.println("ì°¨ëŸ‰ ì¢…ë¥˜ : " + truck_type);
			System.out.println("?™”ë¬? ë¬´ê²Œ : " + cargo_weight);
			System.out.println("?Š¹?•˜ì°? ?„?? : " + cargo_help);
			System.out.println("ê±°ë¦¬ : " + distance);
			System.out.println("?‰ê·? ?†?„ : " + speed);
			System.out.println("?†Œ?š” ?‹œê°? : " + time);
			System.out.println("?„ì°? ?˜ˆ? • : " + ETA);
			System.out.println("ê³µì¸?—°ë¹? : " + public_fuel_rate);
			System.out.println("?—°ë¹? : " + fuel_rate);
			System.out.println("?—°ë£Œë‹¨ê°? : " + fuel_cost_rate);
			System.out.println("ê±°ë¦¬?‹¹ ?œ ì§?ë¹? : " + maintenance_rate);
			System.out.println("?Š¹?•˜ì°? ?¸ê±´ë¹„ : " + help_cost);
			System.out.println("?‹œê°„ë‹¹ ?¸ê±´ë¹„ : " + labor_rate);
			System.out.println("?†¨ë¹? : " + toll_cost);
			System.out.println("?—°ë£Œë¹„ : " + fuel_cost);
			System.out.println("?œ ì§?ë¹? : " + maintenance_cost);
			System.out.println("?¸ê±´ë¹„ : " + labor_cost);
			System.out.println("?ˆ˜?ˆ˜ë£? : " + commission);
			System.out.println("ë¶?ê°??„¸ : " + vat);
			System.out.println("ì¶”ì²œ ?š´?„ : " + recommend_cost);
			
			System.out.println("ê±°ë¦¬/?š”ê¸ˆê³„?‚° ?„±ê³?");
		}
		catch(Exception e){
			System.out.println("ê±°ë¦¬/?š”ê¸ˆê³„?‚° ?‹¤?Œ¨");
		}
	}
}
