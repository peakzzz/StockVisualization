package com.stock.controller;

import java.io.FileReader;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;




@Controller 
public class DashboardController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView showDashboard(ModelMap model,HttpServletRequest req) {	
		//System.out.println("In showDashboard");
	
		ModelAndView mv = new ModelAndView("dashboard");
		//DashboardDao dashboardDao = new DashboardDao();
		JSONArray jsonMyProfileGain= new JSONArray();
		JSONArray jsonMyProfileLoss = new JSONArray();
		JSONArray jsonMyProfile = new JSONArray();
		JSONArray jsonMyInvestmentSector = new JSONArray();
		String filePath = req.getSession().getServletContext().getRealPath("/")+"resources/data/jsonMyProfileGain.json";
		String jsonMyProfileLossFilePath = req.getSession().getServletContext().getRealPath("/")+"resources/data/jsonMyProfileLoss.json";
		String jsonMyProfileFilePath = req.getSession().getServletContext().getRealPath("/")+"resources/data/jsonMyProfile.json";
		String jsonMyInvestmentSectorFilePath = req.getSession().getServletContext().getRealPath("/")+"resources/data/jsonMyInvestmentSector.json";
		FileReader reader;
		try {
			//System.out.println("filepath ="+filePath);
			reader = new FileReader(filePath);

			//.out.println("file"+file);
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject;
			jsonObject = (JSONObject) jsonParser.parse(reader);
			// get an array from the JSON object		
			jsonMyProfileGain = (JSONArray) jsonObject.get("jsonMyProfileGain");
			reader = new FileReader(jsonMyProfileLossFilePath);
			jsonObject = (JSONObject) jsonParser.parse(reader);
			// get an array from the JSON object		
			jsonMyProfileLoss = (JSONArray) jsonObject.get("jsonMyProfileLoss");
			
			reader = new FileReader(jsonMyProfileFilePath);
			jsonObject = (JSONObject) jsonParser.parse(reader);
			// get an array from the JSON object		
			jsonMyProfile = (JSONArray) jsonObject.get("jsonMyProfile");
			reader = new FileReader(jsonMyInvestmentSectorFilePath);
			jsonObject = (JSONObject) jsonParser.parse(reader);
			// get an array from the JSON object		
			jsonMyInvestmentSector =  (JSONArray) jsonObject.get("treeData");
			
			System.out.println("jsonMyInvestmentSector"+jsonMyInvestmentSector);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		///
		/*
		ArrayList<MyProfile> myProfileGainList = dashboardDao.readMyProfileGain();
		ArrayList<MyProfile> myProfileLossList = dashboardDao.readMyProfileLoss();
		ArrayList<MyProfile> myProfileList = dashboardDao.readMyProfile();
 
       JsonArray jsonMyProfileGain = new JsonArray();
       JsonArray jsonMyProfileLoss = new JsonArray();
       JsonArray jsonMyProfile = new JsonArray();
	
        for(MyProfile obj:myProfileGainList)
        {
        	// create a data set
	        JsonObject dataset = new JsonObject();
        	// add the properties key and value to the data set
        	dataset.addProperty("key",obj.getCompany());
        	dataset.addProperty("value",obj.getPercentChange());
        	//System.out.println("dataset obj"+dataset);
        	jsonMyProfileGain.add(dataset);
        	System.out.println("jsonMyProfileGain:"+jsonMyProfileGain);
        }
        for(MyProfile obj:myProfileLossList)
        {
        	// create a data set
	        JsonObject dataset = new JsonObject();
        	// add the properties key and value to the data set
        	dataset.addProperty("key",obj.getCompany());
        	dataset.addProperty("value",obj.getPercentChange());
        	//System.out.println("dataset obj"+dataset);
        	jsonMyProfileLoss.add(dataset);
        	//System.out.println("jsonMyProfileLoss:"+jsonMyProfileLoss);
        }
        for(MyProfile obj:myProfileList)
        {
        	// create a data set
	        JsonObject dataset = new JsonObject();
        	// add the properties key and value to the data set
        	dataset.addProperty("key",obj.getCompany());
        	dataset.addProperty("value",obj.getPercentChange());
        	//System.out.println("dataset obj"+dataset);
        	jsonMyProfile.add(dataset);
        	//System.out.println("jsonMyProfile:"+jsonMyProfile);
        }*/
        //System.out.println("jsonMyProfile:"+jsonMyProfile);
        mv.addObject("jsonMyProfile",jsonMyProfile);
        mv.addObject("jsonMyProfileLoss",jsonMyProfileLoss);
        mv.addObject("jsonMyProfileGain",jsonMyProfileGain);
        mv.addObject("jsonMyInvestmentSector",jsonMyInvestmentSector);
        return mv;
	}	
	
	
}
