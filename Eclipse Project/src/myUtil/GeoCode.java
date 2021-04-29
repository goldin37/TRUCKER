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

// ?λ‘λͺ μ£Όμλ‘? ?μΉμ’?(κ²½λ, ??) ?°?€? ?΄??€
public class GeoCode {
	public double x;
	public double y;

	public void getGPS(String address){
		try {
			//URL?΄? μ£Όμ ?? ₯, μ£Όμ? UTF-8λ‘? ?Έμ½λ©
			URL url = new URL("https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?X-NCP-APIGW-API-KEY-ID=tzchnboziv&X-NCP-APIGW-API-KEY=svQaeTRI6EoOAufCfliJfjFQlKpoNcjl4ZY5UMX7&query=" 
			+ URLEncoder.encode(address, "UTF-8"));
			
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			
			//μ‘°ν? ?°?΄?°λ₯? responseλ‘? λ°κΈ°
			int responseCode = con.getResponseCode();
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			
			while((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			
			//JSON ?°?΄?° ??±
			//addresses μ²«λ²μ§?(0) λ°°μ΄?? x? yλ‘? κ°μ λ½μ?Έ?€.
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(response.toString());
			JSONArray jsonArray = (JSONArray) jsonObj.get("addresses");
			jsonObj = (JSONObject) jsonArray.get(0);
			x = Double.valueOf((String) jsonObj.get("x"));
			y = Double.valueOf((String) jsonObj.get("y"));
			
			//κ²°κ³Ό μΆλ ₯
			System.out.println("HTTP ??΅ μ½λ ; " + responseCode);
			System.out.println("HTTP body : " + response.toString());
			System.out.println("x : " + x);
			System.out.println("y : " + y);
			System.out.println("geocode success");
		} catch(Exception e) {
			System.out.println("geocode failed");
		}
	}
}
