package DeliveryOrder;

import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

//도로명 주소로 경위도(x,y) 받아오는 클래스
public class GeoCode {
	public double x;
	public double y;

	public void getGPS(String address){
		try {
			//URL로 도로명 주소를 GET 보내기, UTF-8 형식으로 해야 한글 받음
			URL url = new URL("https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?X-NCP-APIGW-API-KEY-ID=tzchnboziv&X-NCP-APIGW-API-KEY=svQaeTRI6EoOAufCfliJfjFQlKpoNcjl4ZY5UMX7&query=" 
			+ URLEncoder.encode(address, "UTF-8"));
			
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			
			//조회  데이터를 response 문자열로 받기
			int responseCode = con.getResponseCode();
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			
			while((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			
			//JSON 데이터 파싱
			//addresses 첫번째(0) 배열에서 위치 좌표 뽑아내기
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(response.toString());
			JSONArray jsonArray = (JSONArray) jsonObj.get("addresses");
			jsonObj = (JSONObject) jsonArray.get(0);
			x = Double.valueOf((String) jsonObj.get("x"));
			y = Double.valueOf((String) jsonObj.get("y"));
			
			//결과 출력
			System.out.println("HTTP 응답 코드 ; " + responseCode);
			System.out.println("HTTP body : " + response.toString());
			System.out.println("x : " + x);
			System.out.println("y : " + y);
			System.out.println("geocode success");
		} catch(Exception e) {
			System.out.println("geocode failed");
		}
	}
}
