package com.UGAHacks.InvestBetter.Service;

import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Scanner;

import org.json.simple.parser.JSONParser;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
public class StockService {
	
//	//private static final String REQUEST_URL = "https://api.twelvedata.com/time_series?symbol=AAPL&interval=1min&outputsize=12&apikey=YOUR_API_KEY_HERE";
//	public static void main(String[] args) {
//	try {
//        //Public API:
//        //https://www.metaweather.com/api/location/search/?query=<CITY>
//        //https://www.metaweather.com/api/location/44418/
//
//        URL url = new URL("https://yh-finance.p.rapidapi.com/stock/v2/get-summary");
//
//        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//        conn.setRequestMethod("GET");
//        conn.connect();
//
//        //Check if connect is made
//        int responseCode = conn.getResponseCode();
//
//        // 200 OK
//        if (responseCode != 200) {
//            throw new RuntimeException("HttpResponseCode: " + responseCode);
//        } else {
//
//            StringBuilder informationString = new StringBuilder();
//            Scanner scanner = new Scanner(url.openStream());
//
//            while (scanner.hasNext()) {
//                informationString.append(scanner.nextLine());
//            }
//            //Close the scanner
//            scanner.close();
//
//            System.out.println(informationString);
//
//
//            //JSON simple library Setup with Maven is used to convert strings to JSON
//            JSONParser parse = new JSONParser();
//            JSONArray dataObject = (JSONArray) parse.parse(String.valueOf(informationString));
//
//            //Get the first JSON object in the JSON array
//            System.out.println(dataObject.get(0));
//
//            JSONObject countryData = (JSONObject) dataObject.get(0);
//
//            System.out.println(countryData.get("woeid"));
//
//        }
//    } catch (Exception e) {
//        e.printStackTrace();
//    }
//}

}
