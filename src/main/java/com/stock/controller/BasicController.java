package com.stock.controller;


import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.stock.dao.DashboardDao;
import com.stock.model.DashboardCommodity;
import com.stock.model.Gainer;
import com.stock.model.Loser;
import com.stock.model.MyProfile;
import com.stock.model.PopularStock;


@Controller 
public class BasicController {

	String json_File = "JSON_Data.json";

	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public ModelAndView showTeam() {
		System.out.println("In About Us Page");

		ModelAndView mv = new ModelAndView("about");
		return mv;
	}
	
	@RequestMapping(value = "/currency", method = RequestMethod.GET)
	public ModelAndView showMoney() {
		System.out.println("hi i m in Stock Currency Page");

		ModelAndView mv = new ModelAndView("currency");
		return mv;

	}
	@RequestMapping(value = "/company", method = RequestMethod.GET)
	public ModelAndView getCompany(HttpServletRequest req){
		ModelAndView mv = new ModelAndView("company_Stock");
		String filePath = req.getSession().getServletContext().getRealPath("/")+"resources/companyList.json";
		FileReader reader;
		try {
			reader = new FileReader(filePath);

			//.out.println("file"+file);
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject;
			jsonObject = (JSONObject) jsonParser.parse(reader);

			// get an array from the JSON object
			JSONArray compList= new JSONArray();
			compList = (JSONArray) jsonObject.get("company_list");
			mv.addObject("jsonCompanyList",compList);
			System.out.println(compList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return mv;
	}
	
	@RequestMapping(value = "/companyList", method = RequestMethod.GET)
	@ResponseBody String getCompanyList(HttpServletRequest req)
	{
		String filePath = req.getSession().getServletContext().getRealPath("/")+"resources/companyList.json";
		FileReader reader;
		try {
			reader = new FileReader(filePath);

			//.out.println("file"+file);
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject;
			jsonObject = (JSONObject) jsonParser.parse(reader);

			// get an array from the JSON object
			JSONArray stockData= new JSONArray();
			stockData = (JSONArray) jsonObject.get("company_list");
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
	//Per company stock data to be shown on the Home page
	@RequestMapping(value = "/perCompany/{comp}", method = RequestMethod.GET)
	@ResponseBody String getcompany(HttpServletRequest req,@PathVariable("comp") String id)
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
		String filePath = req.getSession().getServletContext().getRealPath("/")+"resources/"+id+".json";
		FileReader reader;
		try {
			System.out.println("filepath ="+filePath);
			reader = new FileReader(filePath);

			//.out.println("file"+file);
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject;
			jsonObject = (JSONObject) jsonParser.parse(reader);

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
	@RequestMapping(value = "/emplStrengthShareHolder/{comp}", method = RequestMethod.GET)
	@ResponseBody String getEmplStrengthShareHolder(HttpServletRequest req,@PathVariable("comp") String comp)
	{
		//DashboardDao dashBoardDao = new DashboardDao();
		//JsonArray emplStrength = 
		//String filePath = "C:\\Users\\Niveditha\\Documents\\SJSU\\Fall 2015\\280\\Project\\src\\main\\java\\JSON_Data\\facebook.json";
		String filePath = req.getSession().getServletContext().getRealPath("/")+"resources/"+comp+".json";
		System.out.println();
		FileReader reader;
		try {
			reader = new FileReader(filePath);
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject,objToSend;
			jsonObject = (JSONObject) jsonParser.parse(reader);	
			
			JSONArray strength= new JSONArray();
			strength = (JSONArray) jsonObject.get("company_strength");
			
			JSONArray pie= new JSONArray();
			pie = (JSONArray) jsonObject.get("share_holders");
			
			objToSend = new JSONObject();
			objToSend.put("companyInfo", jsonObject.get("company_data"));
			objToSend.put("strength",strength);
			objToSend.put("pie",pie);
			return objToSend.toString();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "/stockHighLowCompany/{comp}", method = RequestMethod.GET)
	@ResponseBody String getOHLCStock(HttpServletRequest req,@PathVariable("comp") String comp)
	{
		//DashboardDao dashBoardDao = new DashboardDao();
		//JsonArray emplStrength = 
		String filePath = req.getSession().getServletContext().getRealPath("/")+"resources/"+comp+".json";
		FileReader reader;
		try {
			reader = new FileReader(filePath);
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject,objToSend;
			jsonObject = (JSONObject) jsonParser.parse(reader);			
			JSONArray strength= new JSONArray();
			strength = (JSONArray) jsonObject.get("stock_ohlc");
			
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