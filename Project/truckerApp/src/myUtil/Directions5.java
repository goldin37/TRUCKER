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

//?��?�� 계산?�� ?��?�� ?��?��?��, 최종?��?���? 추천 ?��금을 계산?��?��.
public class Directions5 {
	public String ETA; //?��착시�?
	public int distance;	//거리
	public double speed;	//?���? ?��?��
	public int time;	//?��?��?���?(�?)
	public int toll_cost;	//?���?
	
	public double public_fuel_rate;	//공인?���?
	public double fuel_rate;	//?���?
	public double fuel_cost_rate;	//리터?�� ?��료단�?
	public double fuel_cost;	//?��료비
	
	public double maintenance_rate;	//거리?�� ?���?�?
	public double maintenance_cost;	//?���?�?
	
	public int help_cost;
	public int labor_rate;	//?��간당 ?��건비
	public int labor_cost;	//?��건비
	
	public double sub_total;
	
	public double commission;	//?��?���?
	public double vat;			//�?�??��
	
	public int recommend_cost;	//추천 ?��?��
	// ?���? ?��?�� = 거리 * 1.5, MAX 80
	// ?���? = 공인?���? * 차량무게 / 차량 + ?��물무�?
	
	// 추천?���? = ?���? + ?��료비 + ?���?�? + ?��건비 + ?��?? + ?��?���? + �?�??�� ?��?�� 1000?��?�� 미만 ?��?��
	// ?��료비 = 리터?�� ?��료비 * 거리 / ?���?
	// ?���?�? = 거리 * 거리?�� ?���?�?
	// ?��건비 = ?��?��?���?  * ?��간당 ?��건비 + ?��??
	// ?��?���? = ( ?���? + ?��료비 + ?���?�? + ?��건비 ) * 8%
	// �?�??�� = ( ?���? + ?��료비 + ?���?�? + ?��건비  + ?��?���?) * 10%
	
	public String result; //결과 JSON
	public void Direction(String from_where, String to_where, String truck_type, int cargo_weight, String cargo_help, String depart_time) {
		//출발�??�� ?��착�? 좌표 받아?���?
		GeoCode from = new GeoCode();
		from.getGPS(from_where);
		System.out.println(from.x);
		System.out.println(from.y);
		
		GeoCode to = new GeoCode();
		to.getGPS(to_where);
		System.out.println(to.x);
		System.out.println(to.y);
		
		//거리 계산?��?��?�� 받기
		try {
			//URL?��?�� 주소 ?��?��, 주소?�� UTF-8�? ?��코딩
			URL url = new URL("https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?X-NCP-APIGW-API-KEY-ID=tzchnboziv&X-NCP-APIGW-API-KEY=svQaeTRI6EoOAufCfliJfjFQlKpoNcjl4ZY5UMX7&start=" 
			+ from.x + "," + from.y + "&goal=" + to.x + "," + from.y + "&cartype=4");
			
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			
			//조회?�� ?��?��?���? response�? 받기
			int responseCode = con.getResponseCode();
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			
			while((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			
			//JSON ?��?��?�� ?��?��
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(response.toString());
			System.out.println(jsonObj.toString());
			jsonObj = (JSONObject) jsonObj.get("route");
			JSONArray jsonArray = (JSONArray) jsonObj.get("traoptimal");
			jsonObj = (JSONObject) jsonArray.get(0);
			jsonObj = (JSONObject) jsonObj.get("summary");
			
			// �??��?��?�� ?��?��?��?�� 거리?�� ?���?
			distance = Integer.valueOf(jsonObj.get("distance").toString()) * 1609 / 1000;		//�?�? 마일 ?��?���? 계산?��?�� ?��, 1.609 곱하�? ?��?��?�� ?��?�� ?��
			toll_cost = Integer.valueOf(jsonObj.get("tollFare").toString());
			// �? �??�� 계산
			// ?��?��
			speed = distance * 1.5;
			if(speed > 80) speed = 80;
			//?���?
			time = (int)( distance / 1000 / speed + 1 ) * 60 * 60; // ?���? = 거리 / ?��?�� + 1?���?, ?��?��?�� �?
			//?��착예?��?��?��
			ETA = LocalDateTime.parse(depart_time).plusSeconds(time).toString();
			//?���?, ?��료단�?, ?���??���?
			if(truck_type.equals("damas")) {
				public_fuel_rate = 8.8;
				fuel_rate = public_fuel_rate * 865 / ( 865 + cargo_weight);
				fuel_cost_rate = 950;
				maintenance_rate = 2000000 / 30000;	//?�� ?���?�? 200만원 / 5만키�?
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
			//?��료비
			fuel_cost = distance / 1000 * fuel_cost_rate / fuel_rate; 
			//?���?�?
			maintenance_cost = distance / 1000 * maintenance_rate;
			//?��?���? ?��??
			if(cargo_help.equals("drive_only")){
				help_cost = 0;
			}
			if(cargo_help.equals("load_and_discharge")){
				help_cost = 10000;
			}
			if(cargo_help.equals("to_door")){
				help_cost = 30000;
			}
			//?��건비
			labor_rate = 10000;
			labor_cost = time * labor_rate / 60 / 60 + help_cost;

			//?��?���?, �?�??�� �? ?���?
			sub_total = toll_cost + fuel_cost + maintenance_cost + labor_cost;
			commission = sub_total * 0.08;
			sub_total += commission;
			vat = sub_total * 0.1;
			recommend_cost = (int)(sub_total + vat)/1000*1000;
			System.out.println("차량 종류 : " + truck_type);
			System.out.println("?���? 무게 : " + cargo_weight);
			System.out.println("?��?���? ?��?? : " + cargo_help);
			System.out.println("거리 : " + distance);
			System.out.println("?���? ?��?�� : " + speed);
			System.out.println("?��?�� ?���? : " + time);
			System.out.println("?���? ?��?�� : " + ETA);
			System.out.println("공인?���? : " + public_fuel_rate);
			System.out.println("?���? : " + fuel_rate);
			System.out.println("?��료단�? : " + fuel_cost_rate);
			System.out.println("거리?�� ?���?�? : " + maintenance_rate);
			System.out.println("?��?���? ?��건비 : " + help_cost);
			System.out.println("?��간당 ?��건비 : " + labor_rate);
			System.out.println("?���? : " + toll_cost);
			System.out.println("?��료비 : " + fuel_cost);
			System.out.println("?���?�? : " + maintenance_cost);
			System.out.println("?��건비 : " + labor_cost);
			System.out.println("?��?���? : " + commission);
			System.out.println("�?�??�� : " + vat);
			System.out.println("추천 ?��?�� : " + recommend_cost);
			
			System.out.println("거리/?��금계?�� ?���?");
		}
		catch(Exception e){
			System.out.println("거리/?��금계?�� ?��?��");
		}
	}
}
