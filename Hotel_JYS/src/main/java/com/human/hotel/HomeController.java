package com.human.hotel;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/")
	public String show() {
		return "home";
	}
	
	@RequestMapping("/home")
	public String home(HttpServletRequest hsr, Model model) {
		String strPath = hsr.getParameter("path");
		if(strPath.equals("login")) {
			return "login";
		} else if(strPath.equals("newbie")) {
			return "newbie";
		} else {
			return "home";
		}
	}
	
	@RequestMapping("/info")
	public String getInfo(HttpServletRequest hsr, Model model) {
		String uid = hsr.getParameter("userid");
		String pw = hsr.getParameter("password");
		model.addAttribute("loginid", uid);
		model.addAttribute("loginpw", pw);
		return "viewinfo";
	}
	
	@RequestMapping("/newinfo")
	public String getNewInfo(HttpServletRequest hsr, Model model) {
		String n = hsr.getParameter("username");
		String uid = hsr.getParameter("userid");
		String pw = hsr.getParameter("password");
		String pw1 = hsr.getParameter("password2");
		String m = hsr.getParameter("phonenumber");
		model.addAttribute("un", n);
		model.addAttribute("loginid", uid);
		model.addAttribute("loginpw", pw);
		model.addAttribute("loginpw1", pw1);
		model.addAttribute("pn", m);
		return "newinfo";
	}
	
	@RequestMapping("/backhome")
	public String bh() {
		return "home";
	}
	
	@RequestMapping("/backlogin")
	public String bl() {
		return "login";
	}
}