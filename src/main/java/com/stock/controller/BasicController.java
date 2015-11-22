package com.stock.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import com.stock.dao.DashboardDao;
import com.stock.model.Gainer;
import com.stock.model.Loser;
import com.stock.model.DashboardCommodity;
import com.stock.model.MyProfile;
import com.stock.model.PopularStock;


@Controller 
public class BasicController {
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView showDashboard(ModelMap model) {	
		System.out.println("In showDashboard");
	
		ModelAndView mv = new ModelAndView("dashboard");
		DashboardDao dashboardDao = new DashboardDao();
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
        	//System.out.println("jsonMyProfileGain:"+jsonMyProfileGain);
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
        }
        
        mv.addObject("jsonMyProfile",jsonMyProfile);
        mv.addObject("jsonMyProfileLoss",jsonMyProfileLoss);
        mv.addObject("jsonMyProfileGain",jsonMyProfileGain);
        return mv;
	}	

	@RequestMapping(value = "/markets", method = RequestMethod.GET)
	public ModelAndView showMarkets() {
		System.out.println("In showMarkets");
		
		ModelAndView mv = new ModelAndView("markets");
		DashboardDao dashboardDao = new DashboardDao();
		ArrayList<Gainer> list1 = dashboardDao.readGainer();
		ArrayList<Loser> list2 = dashboardDao.readLoser();
		ArrayList<MyProfile> list3 = dashboardDao.readMyProfileGain();
		ArrayList<MyProfile> list4 = dashboardDao.readMyProfileLoss();
		ArrayList<MyProfile> list5 = dashboardDao.readMyProfile();
		ArrayList<PopularStock> list6 = dashboardDao.readPopularStock();
		ArrayList<DashboardCommodity> list7 = dashboardDao.readDashboardCommodities();
        JsonArray jsonGainer = new JsonArray();
        JsonArray jsonLoser = new JsonArray();
        JsonArray jsonMyProfileGain = new JsonArray();
        JsonArray jsonMyProfileLoss = new JsonArray();
        JsonArray jsonMyProfile = new JsonArray();
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
        }
        mv.addObject("jsonDashboardCommodity",jsonDashboardCommodity);
        mv.addObject("jsonPopularStock",jsonPopularStock);
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
		return mv;
	}
	
}