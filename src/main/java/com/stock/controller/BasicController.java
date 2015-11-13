package com.stock.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


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
	        return mv;

		}
	
	@RequestMapping(value = "/currency", method = RequestMethod.GET
			)
		public ModelAndView showMoney() {
			System.out.println("hi i m in Stock Currency Page");
			
			ModelAndView mv = new ModelAndView("currency");
	        return mv;

		}
}