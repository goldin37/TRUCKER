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

public class Directions5 {
	public String ETA;
	public int distance;
	public double speed;
	public int temptime;
	public String time;
	public int toll_cost;
	
	public double public_fuel_rate;
	public double fuel_rate;
	public double fuel_cost_rate;
	public double fuel_cost;	
	
	public double maintenance_rate;
	public double maintenance_cost;
	
	public int help_cost;
	public int labor_rate;
	public int labor_cost;
	
	public double sub_total;
	
	public double commission;
	public double vat;
	
	public int recommend_cost;
	
	public String result; //결과 JSON
	public void Direction(String from_where, String to_where, String truck_type, int cargo_weight, String cargo_help, String depart_time) {
		//출발지, 도착지 좌표 받기
		GeoCode from = new GeoCode();
		from.getGPS(from_where);
		System.out.println(from.x);
		System.out.println(from.y);
		
		GeoCode to = new GeoCode();
		to.getGPS(to_where);
		System.out.println(to.x);
		System.out.println(to.y);
		
		//거리 계산
		try {
			//URL로 주소 넘겨주기
			URL url = new URL("https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?X-NCP-APIGW-API-KEY-ID=tzchnboziv&X-NCP-APIGW-API-KEY=svQaeTRI6EoOAufCfliJfjFQlKpoNcjl4ZY5UMX7&start=" 
			+ from.x + "," + from.y + "&goal=" + to.x + "," + from.y + "&cartype=4");
			
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			
			//response 데이터 받기
			int responseCode = con.getResponseCode();
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			
			while((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			
			//JSON 데이터 파싱하기
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
			
			temptime = (int)(( distance / speed + 1 ) * 60 * 60);
			time = temptime / 3600 + "시간 " + temptime / 60 + "분";
			ETA = LocalDateTime.parse(depart_time).plusSeconds(temptime).toString();
			if(truck_type.equals("damas")) {
				public_fuel_rate = 8.8;
				fuel_rate = public_fuel_rate * 865 / ( 865 + cargo_weight);
				fuel_cost_rate = 950;
				maintenance_rate = 2000000 / 30000;	//연간 200만원, 3만 키로
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

			fuel_cost = distance * fuel_cost_rate / fuel_rate; 

			maintenance_cost = distance * maintenance_rate;

			if(cargo_help.equals("drive_only")){
				help_cost = 0;
			}
			if(cargo_help.equals("load_and_discharge")){
				help_cost = 10000;
			}
			if(cargo_help.equals("to_door")){
				help_cost = 30000;
			}

			labor_rate = 10000;
			labor_cost = temptime * labor_rate / 60 / 60 + help_cost;

			sub_total = toll_cost + fuel_cost + maintenance_cost + labor_cost;
			commission = sub_total * 0.08;
			sub_total += commission;
			vat = sub_total * 0.1;
			recommend_cost = (int)(sub_total + vat)/1000*1000;
			System.out.println("차량 종류 : " + truck_type);
			System.out.println("화물 무게 : " + cargo_weight);
			System.out.println("화물 도움 : " + cargo_help);
			System.out.println("거리 : " + distance);
			System.out.println("속도 : " + speed);
			System.out.println("시간 : " + time);
			System.out.println("도착 예정시간 : " + ETA);
			System.out.println("공인연비 : " + public_fuel_rate);
			System.out.println("연비 : " + fuel_rate);
			System.out.println("연료 단가 : " + fuel_cost_rate);
			System.out.println("유지비 비율 : " + maintenance_rate);
			System.out.println("도움 인건비 : " + help_cost);
			System.out.println("시간당 인건비 : " + labor_rate);
			System.out.println("톨비 : " + toll_cost);
			System.out.println("연료비 : " + fuel_cost);
			System.out.println("유지비 : " + maintenance_cost);
			System.out.println("인건비 : " + labor_cost);
			System.out.println("수수료 : " + commission);
			System.out.println("부가세 : " + vat);
			System.out.println("추천운임 : " + recommend_cost);
			
			System.out.println("direction success");
		}
		catch(Exception e){
			System.out.println("direction failed");
		}
	}
}
