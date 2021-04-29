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

//?ö¥?ûÑ Í≥ÑÏÇ∞?ùÑ ?úÑ?ïú ?Å¥?ûò?ä§, ÏµúÏ¢Ö?†Å?úºÎ°? Ï∂îÏ≤ú ?öîÍ∏àÏùÑ Í≥ÑÏÇ∞?ïú?ã§.
public class Directions5 {
	public String ETA; //?èÑÏ∞©ÏãúÍ∞?
	public int distance;	//Í±∞Î¶¨
	public double speed;	//?èâÍ∑? ?Üç?èÑ
	public int time;	//?Üå?öî?ãúÍ∞?(Ï¥?)
	public int toll_cost;	//?Ü®Îπ?
	
	public double public_fuel_rate;	//Í≥µÏù∏?ó∞Îπ?
	public double fuel_rate;	//?ó∞Îπ?
	public double fuel_cost_rate;	//Î¶¨ÌÑ∞?ãπ ?ó∞Î£åÎã®Í∞?
	public double fuel_cost;	//?ó∞Î£åÎπÑ
	
	public double maintenance_rate;	//Í±∞Î¶¨?ãπ ?ú†Ïß?Îπ?
	public double maintenance_cost;	//?ú†Ïß?Îπ?
	
	public int help_cost;
	public int labor_rate;	//?ãúÍ∞ÑÎãπ ?ù∏Í±¥ÎπÑ
	public int labor_cost;	//?ù∏Í±¥ÎπÑ
	
	public double sub_total;
	
	public double commission;	//?àò?àòÎ£?
	public double vat;			//Î∂?Í∞??Ñ∏
	
	public int recommend_cost;	//Ï∂îÏ≤ú ?ö¥?ûÑ
	// ?èâÍ∑? ?Üç?èÑ = Í±∞Î¶¨ * 1.5, MAX 80
	// ?ó∞Îπ? = Í≥µÏù∏?ó∞Îπ? * Ï∞®ÎüâÎ¨¥Í≤å / Ï∞®Îüâ + ?ôîÎ¨ºÎ¨¥Í≤?
	
	// Ï∂îÏ≤ú?öîÍ∏? = ?Ü®Îπ? + ?ó∞Î£åÎπÑ + ?ú†Ïß?Îπ? + ?ù∏Í±¥ÎπÑ + ?èÑ?? + ?àò?àòÎ£? + Î∂?Í∞??Ñ∏ ?óê?Ñú 1000?ã®?úÑ ÎØ∏Îßå ?†à?Ç¨
	// ?ó∞Î£åÎπÑ = Î¶¨ÌÑ∞?ãπ ?ó∞Î£åÎπÑ * Í±∞Î¶¨ / ?ó∞Îπ?
	// ?ú†Ïß?Îπ? = Í±∞Î¶¨ * Í±∞Î¶¨?ãπ ?ú†Ïß?Îπ?
	// ?ù∏Í±¥ÎπÑ = ?Üå?öî?ãúÍ∞?  * ?ãúÍ∞ÑÎãπ ?ù∏Í±¥ÎπÑ + ?èÑ??
	// ?àò?àòÎ£? = ( ?Ü®Îπ? + ?ó∞Î£åÎπÑ + ?ú†Ïß?Îπ? + ?ù∏Í±¥ÎπÑ ) * 8%
	// Î∂?Í∞??Ñ∏ = ( ?Ü®Îπ? + ?ó∞Î£åÎπÑ + ?ú†Ïß?Îπ? + ?ù∏Í±¥ÎπÑ  + ?àò?àòÎ£?) * 10%
	
	public String result; //Í≤∞Í≥º JSON
	public void Direction(String from_where, String to_where, String truck_type, int cargo_weight, String cargo_help, String depart_time) {
		//Ï∂úÎ∞úÏß??ûë ?èÑÏ∞©Ï? Ï¢åÌëú Î∞õÏïÑ?ò§Í∏?
		GeoCode from = new GeoCode();
		from.getGPS(from_where);
		System.out.println(from.x);
		System.out.println(from.y);
		
		GeoCode to = new GeoCode();
		to.getGPS(to_where);
		System.out.println(to.x);
		System.out.println(to.y);
		
		//Í±∞Î¶¨ Í≥ÑÏÇ∞?ç∞?ù¥?Ñ∞ Î∞õÍ∏∞
		try {
			//URL?ù¥?ûë Ï£ºÏÜå ?ûÖ?†•, Ï£ºÏÜå?äî UTF-8Î°? ?ù∏ÏΩîÎî©
			URL url = new URL("https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?X-NCP-APIGW-API-KEY-ID=tzchnboziv&X-NCP-APIGW-API-KEY=svQaeTRI6EoOAufCfliJfjFQlKpoNcjl4ZY5UMX7&start=" 
			+ from.x + "," + from.y + "&goal=" + to.x + "," + from.y + "&cartype=4");
			
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			
			//Ï°∞Ìöå?ïú ?ç∞?ù¥?Ñ∞Î•? responseÎ°? Î∞õÍ∏∞
			int responseCode = con.getResponseCode();
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			
			while((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			
			//JSON ?ç∞?ù¥?Ñ∞ ?åå?ã±
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(response.toString());
			System.out.println(jsonObj.toString());
			jsonObj = (JSONObject) jsonObj.get("route");
			JSONArray jsonArray = (JSONArray) jsonObj.get("traoptimal");
			jsonObj = (JSONObject) jsonArray.get(0);
			jsonObj = (JSONObject) jsonObj.get("summary");
			
			distance = Integer.valueOf(jsonObj.get("distance").toString()) * 1609 / 1000 / 1000; 

			toll_cost = Integer.valueOf(jsonObj.get("tollFare").toString());
			
			speed = distance * 1.5;
			if(speed > 80) speed = 80;

			time = (int)( distance / speed + 1 ) * 60 * 60;
			ETA = LocalDateTime.parse(depart_time).plusSeconds(time).toString();
			if(truck_type.equals("damas")) {
				public_fuel_rate = 8.8;
				fuel_rate = public_fuel_rate * 865 / ( 865 + cargo_weight);
				fuel_cost_rate = 950;
				maintenance_rate = 2000000 / 30000;	//?ó∞ ?ú†Ïß?Îπ? 200ÎßåÏõê / 5ÎßåÌÇ§Î°?
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
			//?ó∞Î£åÎπÑ
			fuel_cost = distance / 1000 * fuel_cost_rate / fuel_rate; 
			//?ú†Ïß?Îπ?
			maintenance_cost = distance / 1000 * maintenance_rate;
			//?äπ?ïòÏ∞? ?èÑ??
			if(cargo_help.equals("drive_only")){
				help_cost = 0;
			}
			if(cargo_help.equals("load_and_discharge")){
				help_cost = 10000;
			}
			if(cargo_help.equals("to_door")){
				help_cost = 30000;
			}
			//?ù∏Í±¥ÎπÑ
			labor_rate = 10000;
			labor_cost = time * labor_rate / 60 / 60 + help_cost;

			//?àò?àòÎ£?, Î∂?Í∞??Ñ∏ Î∞? ?ï©Í≥?
			sub_total = toll_cost + fuel_cost + maintenance_cost + labor_cost;
			commission = sub_total * 0.08;
			sub_total += commission;
			vat = sub_total * 0.1;
			recommend_cost = (int)(sub_total + vat)/1000*1000;
			System.out.println("Ï∞®Îüâ Ï¢ÖÎ•ò : " + truck_type);
			System.out.println("?ôîÎ¨? Î¨¥Í≤å : " + cargo_weight);
			System.out.println("?äπ?ïòÏ∞? ?èÑ?? : " + cargo_help);
			System.out.println("Í±∞Î¶¨ : " + distance);
			System.out.println("?èâÍ∑? ?Üç?èÑ : " + speed);
			System.out.println("?Üå?öî ?ãúÍ∞? : " + time);
			System.out.println("?èÑÏ∞? ?òà?†ï : " + ETA);
			System.out.println("Í≥µÏù∏?ó∞Îπ? : " + public_fuel_rate);
			System.out.println("?ó∞Îπ? : " + fuel_rate);
			System.out.println("?ó∞Î£åÎã®Í∞? : " + fuel_cost_rate);
			System.out.println("Í±∞Î¶¨?ãπ ?ú†Ïß?Îπ? : " + maintenance_rate);
			System.out.println("?äπ?ïòÏ∞? ?ù∏Í±¥ÎπÑ : " + help_cost);
			System.out.println("?ãúÍ∞ÑÎãπ ?ù∏Í±¥ÎπÑ : " + labor_rate);
			System.out.println("?Ü®Îπ? : " + toll_cost);
			System.out.println("?ó∞Î£åÎπÑ : " + fuel_cost);
			System.out.println("?ú†Ïß?Îπ? : " + maintenance_cost);
			System.out.println("?ù∏Í±¥ÎπÑ : " + labor_cost);
			System.out.println("?àò?àòÎ£? : " + commission);
			System.out.println("Î∂?Í∞??Ñ∏ : " + vat);
			System.out.println("Ï∂îÏ≤ú ?ö¥?ûÑ : " + recommend_cost);
			
			System.out.println("direction success");
		}
		catch(Exception e){
			System.out.println("direction failed");
		}
	}
}
