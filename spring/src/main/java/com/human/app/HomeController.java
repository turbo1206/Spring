package com.human.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping("/membersName")
//	public String home1(Locale locale, Model m) {
//		m.addAttribute("m_name", "Jenny,Jisoo");
//		return "members";
//		
//	}
//	@RequestMapping("/test")
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		model.addAttribute("myName","Jang Yeon Seo");
//		model.addAttribute("homeAddress","불당동");
//		model.addAttribute("mobileNumber","010");
//		return "home";
//	}
//	
	// getinfo로 진입
	@RequestMapping("/getinfo")
	public String getInfo() {
		return "getinfo";
	}
	// info로 진입
	// ../info?user_id=xaexal&address=Cheonan
	@RequestMapping("/info")
//	public String doInfo(HttpServletRequest hsr, Model model) {
//		String uid = hsr.getParameter("userid");
//		String addr = hsr.getParameter("address");
	public String doInfo(@RequestParam("user_id") String uid,
						 @RequestParam("address") String addr,
						 @RequestParam("salary") int salary,
						 Model model) {
		System.out.println("uid="+uid);
		System.out.println("addr="+addr);
		model.addAttribute("loginid", uid);
		model.addAttribute("region", addr);
		// userid -> uid -> loginid, address -> addr -> region
		return "viewinfo";
	}
	// Command 객체.
	public String doInfo(ParamList pl, Model model) {
		System.out.println("uid="+pl.user_id);
		System.out.println("addr="+pl.address);
		model.addAttribute("loginid",pl.user_id);
		model.addAttribute("region",pl.address);
		// userid -> uid -> loginid, address -> addr -> region
		return "viewinfo";
	}
	
	@RequestMapping("/choose")
	public String doChoose() {
		return "choose";
	}
	
	@RequestMapping("/selected")
	public String doJob(HttpServletRequest hsr, Model model) {
		String strPath=hsr.getParameter("path");
		if(strPath.equals("login")) {
			return "getinfo";
		} else if(strPath.equals("newbie")) {
			return "newbie";
		} else {
			return "choose";
		}
	}
}
