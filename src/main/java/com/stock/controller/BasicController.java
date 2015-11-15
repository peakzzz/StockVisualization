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



@Controller 
public class BasicController {
	

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
		return mv;
	}
	
}