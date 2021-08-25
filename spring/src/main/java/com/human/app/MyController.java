package com.human.app;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyController {
	
	@RequestMapping(value="/contactus",method=RequestMethod.GET)
	public String method1(Model model) {
		model.addAttribute("mobile", "....");
		return "contactus";
	}
}
