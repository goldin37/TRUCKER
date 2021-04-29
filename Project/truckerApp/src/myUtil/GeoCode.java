package myUtil;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

// ?��로명 주소�? ?��치좌?��(경도, ?��?��) ?��?��?�� ?��?��?��
public class GeoCode {
	public double x;
	public double y;

	public void getGPS(String address){
		try {
			//URL?��?�� 주소 ?��?��, 주소?�� UTF-8�? ?��코딩
			URL url = new URL("https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?X-NCP-APIGW-API-KEY-ID=tzchnboziv&X-NCP-APIGW-API-KEY=svQaeTRI6EoOAufCfliJfjFQlKpoNcjl4ZY5UMX7&query=" 
			+ URLEncoder.encode(address, "UTF-8"));
			
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
			//addresses 첫번�?(0) 배열?��?�� x?�� y�? 값을 뽑아?��?��.
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(response.toString());
			JSONArray jsonArray = (JSONArray) jsonObj.get("addresses");
			jsonObj = (JSONObject) jsonArray.get(0);
			x = Double.valueOf((String) jsonObj.get("x"));
			y = Double.valueOf((String) jsonObj.get("y"));
			
			//결과 출력
			System.out.println("HTTP ?��?�� 코드 ; " + responseCode);
			System.out.println("HTTP body : " + response.toString());
			System.out.println("x : " + x);
			System.out.println("y : " + y);
			System.out.println("좌표 받기 ?���?");
		} catch(Exception e) {
			System.out.println("좌표 받기 ?��?��");
		}
	}
}
