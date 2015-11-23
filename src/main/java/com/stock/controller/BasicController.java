package com.stock.controller;


import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.stock.dao.DashboardDao;
import com.stock.model.Gainer;
import com.stock.model.Loser;



@Controller 
public class BasicController {

	String json_File = "JSON_Data.json";

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView showRegistration(ModelMap model) {

		ModelAndView mv = new ModelAndView("home");
		return mv;

	}	

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET
			)
	public ModelAndView showLocations() {
		System.out.println("hi i m in showLocations");

		ModelAndView mv = new ModelAndView("dashboard");
		DashboardDao dashboardDao = new DashboardDao();
		ArrayList<Gainer> list1 = dashboardDao.readGainer();
		ArrayList<Loser> list2 = dashboardDao.readLoser();
		JsonArray jsonGainer = new JsonArray();
		JsonArray jsonLoser = new JsonArray();


		for(Gainer obj:list1)
		{
			// create a dataset
			JsonObject dataset = new JsonObject();
			// add the properties key and value to the dataset
			dataset.addProperty("key",obj.getName());
			dataset.addProperty("value",obj.getPercentChange());
			System.out.println("dataset obj"+dataset);
			jsonGainer.add(dataset);
			System.out.println(jsonGainer);
		}
		for(Loser obj:list2)
		{
			// create a dataset
			JsonObject dataset = new JsonObject();
			// add the properties key and value to the dataset
			dataset.addProperty("key",obj.getName());
			dataset.addProperty("value",obj.getPercentChange());
			System.out.println("dataset obj"+dataset);
			jsonLoser.add(dataset);
			System.out.println("jsonLoser:"+jsonLoser);
		}
		mv.addObject("jsonLoser",jsonLoser);
		mv.addObject("jsonGainer",jsonGainer);
		return mv;

	}

	@RequestMapping(value = "/currency", method = RequestMethod.GET)
	public ModelAndView showMoney() {
		System.out.println("hi i m in Stock Currency Page");

		ModelAndView mv = new ModelAndView("currency");
		return mv;

	}
	@RequestMapping(value = "/company", method = RequestMethod.GET)
	public ModelAndView getCompany(){
		ModelAndView mv = new ModelAndView("company_Stock");

		//mv.addObject("priceData",priceList);
		return mv;
	}

	//Per company stock data to be shown on the Home page
	@RequestMapping(value = "/perCompany", method = RequestMethod.GET)
	@ResponseBody String getcompany()
	{
		//		DashboardDao dashboardDao = new DashboardDao();
		//
		JsonArray priceList = new JsonArray();
		//
		//		List<StockPrice> spList = dashboardDao.readStockPrice();
		//		for(StockPrice sp : spList)
		//		{
		//			JsonObject jObj = new JsonObject();
		//			//jObj.addProperty("name", );
		//			
		//			jObj.addProperty("key",sp.getDate());
		//			jObj.addProperty("value",sp.getPrice());
		//			priceList.add(jObj);
		//		}
		//				String name = "facebook";
		//				JsonObject stockPrice = new JsonObject();
		//				stockPrice.add("priceList", priceList);
		//				stockPrice.addProperty("stockName",name);
		//				
		//		return stockPrice.toString();
		String filePath = "C:\\Users\\Niveditha\\Documents\\SJSU\\Fall 2015\\280\\Project\\src\\main\\java\\JSON_Data\\facebook.json";
		FileReader reader;
		try {
			reader = new FileReader(filePath);

			//.out.println("file"+file);
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject;
			jsonObject = (JSONObject) jsonParser.parse(reader);

			System.out.println("before stocockdatae");
			// get an array from the JSON object
			JSONArray stockData= new JSONArray();
			stockData = (JSONArray) jsonObject.get("stock_data");
			return stockData.toString();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	//Per company employee strength
	@RequestMapping(value = "/emplStrengthShareHolder", method = RequestMethod.GET)
	@ResponseBody String getEmplStrengthShareHolder()
	{
		//DashboardDao dashBoardDao = new DashboardDao();
		//JsonArray emplStrength = 
		String filePath = "C:\\Users\\Niveditha\\Documents\\SJSU\\Fall 2015\\280\\Project\\src\\main\\java\\JSON_Data\\facebook.json";
		FileReader reader;
		try {
			reader = new FileReader(filePath);
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject;
			jsonObject = (JSONObject) jsonParser.parse(reader);			
			JSONArray strength= new JSONArray();
			strength = (JSONArray) jsonObject.get("company_strength");
			return strength.toString();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}