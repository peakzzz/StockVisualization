package com.stock.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
public class MarketController {
	@RequestMapping(value = "/markets", method = RequestMethod.GET)
	public ModelAndView showMarkets(HttpServletRequest req) {
		//System.out.println("In showMarkets");
		
		ModelAndView mv = new ModelAndView("markets");
		//DashboardDao dashboardDao = new DashboardDao();
		
		JSONArray jsonMarketGainer= new JSONArray();
		JSONArray jsonMarketLoser= new JSONArray();
		JSONArray jsonMarketPopularStock= new JSONArray();
		JSONArray jsonMarketCommodity= new JSONArray();
		String jsonMarketGainerFilePath = req.getSession().getServletContext().getRealPath("/")+"resources/data/jsonMarketGainer.json";
		String jsonMarketLoserFilePath = req.getSession().getServletContext().getRealPath("/")+"resources/data/jsonMarketLoser.json";
		String jsonMarketPopularStockFilePath = req.getSession().getServletContext().getRealPath("/")+"resources/data/jsonMarketPopularStock.json";
		String jsonMarketCommodityFilePath = req.getSession().getServletContext().getRealPath("/")+"resources/data/jsonMarketCommodity.json";
		FileReader reader;
		try {
			//System.out.println("filepath ="+jsonMarketGainerFilePath);
			reader = new FileReader(jsonMarketGainerFilePath);

			//.out.println("file"+file);
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject;
			jsonObject = (JSONObject) jsonParser.parse(reader);
			// get an array from the JSON object		
			jsonMarketGainer = (JSONArray) jsonObject.get("jsonMarketGainer");
			reader = new FileReader(jsonMarketLoserFilePath);
			jsonObject = (JSONObject) jsonParser.parse(reader);
			// get an array from the JSON object		
			jsonMarketLoser = (JSONArray) jsonObject.get("jsonMarketLoser");
			reader = new FileReader(jsonMarketPopularStockFilePath);
			jsonObject = (JSONObject) jsonParser.parse(reader);
			// get an array from the JSON object		
			jsonMarketPopularStock = (JSONArray) jsonObject.get("jsonMarketPopularStock");
			reader = new FileReader(jsonMarketCommodityFilePath);
			jsonObject = (JSONObject) jsonParser.parse(reader);
			// get an array from the JSON object		
			jsonMarketCommodity = (JSONArray) jsonObject.get("jsonMarketCommodity");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		//from mysql db data
		 /*ArrayList<Gainer> list1 = dashboardDao.readGainer();
		ArrayList<Loser> list2 = dashboardDao.readLoser();
		
		ArrayList<PopularStock> list6 = dashboardDao.readPopularStock();
		ArrayList<DashboardCommodity> list7 = dashboardDao.readDashboardCommodities();
        JsonArray jsonGainer = new JsonArray();
        JsonArray jsonLoser = new JsonArray();
        
        JsonArray jsonPopularStock = new JsonArray();
        JsonArray jsonDashboardCommodity = new JsonArray();
       for(Gainer obj:list1)
        {
        	// create a dataset
	        JsonObject dataset = new JsonObject();
        	// add the properties key and value to the dataset
        	dataset.addProperty("key",obj.getName());
        	dataset.addProperty("value",obj.getPercentChange());
        	//System.out.println("dataset obj"+dataset);
        	jsonGainer.add(dataset);
        	//System.out.println(jsonGainer);
        }
        for(Loser obj:list2)
        {
        	// create a dataset
	        JsonObject dataset = new JsonObject();
        	// add the properties key and value to the dataset
        	dataset.addProperty("key",obj.getName());
        	dataset.addProperty("value",obj.getPercentChange());
        	//System.out.println("dataset obj"+dataset);
        	jsonLoser.add(dataset);
        	//System.out.println("jsonLoser:"+jsonLoser);
        }
       
        for(PopularStock obj:list6)
        {
        	// create a dataset
	        JsonObject dataset = new JsonObject();
        	// add the properties key and value to the dataset
        	dataset.addProperty("key",obj.getCompanyName());
        	dataset.addProperty("value",obj.getPrice());
        	//System.out.println("dataset obj"+dataset);
        	jsonPopularStock.add(dataset);
        	//System.out.println("jsonPopularStock:"+jsonPopularStock);
        }
        for(DashboardCommodity obj:list7)
        {
        	// create a dataset
	        JsonObject dataset = new JsonObject();
        	// add the properties key and value to the dataset
        	dataset.addProperty("key",obj.getCommodity());
        	dataset.addProperty("value",obj.getPrice());
        	System.out.println("dataset obj"+dataset);
        	jsonDashboardCommodity.add(dataset);
        	System.out.println("jsonDashboardCommodity:"+jsonDashboardCommodity);
        }*/
        //System.out.println("jsonMarketCommodity:"+jsonMarketCommodity);
        mv.addObject("jsonDashboardCommodity",jsonMarketCommodity);
        mv.addObject("jsonPopularStock",jsonMarketPopularStock);
        mv.addObject("jsonLoser",jsonMarketLoser);
		mv.addObject("jsonGainer",jsonMarketGainer);
        return mv;
	}
}
