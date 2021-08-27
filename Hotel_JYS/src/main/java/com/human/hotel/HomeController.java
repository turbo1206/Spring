package com.human.hotel;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		String pw = hsr.getParameter("passcode");
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
	
	@RequestMapping("/gobooking")
	public String gb() {
		return "booking";
	}
	
	@RequestMapping("/goroom")
	public String gr() {
		return "room";
	}
	
	@RequestMapping("/gomanage")
	public String gm() {
		return "booking";
	}
	
	@RequestMapping("/login")
	public String li() {
		return "login";
	}
	
	@RequestMapping(value = "/check_user", method = RequestMethod.POST)
	public String booking(HttpServletRequest hsr, Model model) {
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode");
		
		System.out.println("userid="+userid+",passcode="+passcode);
		
		HttpSession session = hsr.getSession();
		session.setAttribute("loginid", userid);
		
		return "redirect:/booking"; // RequestMapping의 경로 이름
	}
	
	@RequestMapping(value = "/booking", method = RequestMethod.GET)
	public String booking(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		String loginid=(String)session.getAttribute("loginid");
		if(!loginid.equals("")) {
			return "booking";
		} else {
			return "redirect:/login"; // JSP 화일 이름
		}
	}
	
	@RequestMapping("/room")
	public String room(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		if(session.getAttribute("loginid")==null) {
			return "redirect:login";
		}
		return "room";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		session.invalidate();
		return "redirect:/";
	}
}