package com.human.app;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController {
	
//	@RequestMapping("/contactus")
//	public String method1(Model model) {             // Model class 이용.
//		model.addAttribute("mobile", "01010101010");
//		return "contactus";
//		// /WEB-INF/views/contactus.jsp
//	}
	
	@RequestMapping("/contactus")
	public ModelAndView method2() {
		ModelAndView mov = new ModelAndView();
		mov.addObject("mobile","041-561-1122");
		mov.setViewName("contactus");
		return mov;
	}
}
