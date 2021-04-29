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

// ?„ë¡œëª… ì£¼ì†Œë¡? ?œ„ì¹˜ì¢Œ?‘œ(ê²½ë„, ?œ„?„) ?”°?˜¤?Š” ?´?˜?Š¤
public class GeoCode {
	public double x;
	public double y;

	public void getGPS(String address){
		try {
			//URL?´?‘ ì£¼ì†Œ ?…? ¥, ì£¼ì†Œ?Š” UTF-8ë¡? ?¸ì½”ë”©
			URL url = new URL("https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?X-NCP-APIGW-API-KEY-ID=tzchnboziv&X-NCP-APIGW-API-KEY=svQaeTRI6EoOAufCfliJfjFQlKpoNcjl4ZY5UMX7&query=" 
			+ URLEncoder.encode(address, "UTF-8"));
			
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
			//addresses ì²«ë²ˆì§?(0) ë°°ì—´?—?„œ x?‘ yë¡? ê°’ì„ ë½‘ì•„?‚¸?‹¤.
			JSONParser parser = new JSONParser();
			JSONObject jsonObj = (JSONObject) parser.parse(response.toString());
			JSONArray jsonArray = (JSONArray) jsonObj.get("addresses");
			jsonObj = (JSONObject) jsonArray.get(0);
			x = Double.valueOf((String) jsonObj.get("x"));
			y = Double.valueOf((String) jsonObj.get("y"));
			
			//ê²°ê³¼ ì¶œë ¥
			System.out.println("HTTP ?‘?‹µ ì½”ë“œ ; " + responseCode);
			System.out.println("HTTP body : " + response.toString());
			System.out.println("x : " + x);
			System.out.println("y : " + y);
			System.out.println("ì¢Œí‘œ ë°›ê¸° ?„±ê³?");
		} catch(Exception e) {
			System.out.println("ì¢Œí‘œ ë°›ê¸° ?‹¤?Œ¨");
		}
	}
}
