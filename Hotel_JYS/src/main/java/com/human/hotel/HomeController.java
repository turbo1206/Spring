package com.human.hotel;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sun.org.apache.regexp.internal.recompile;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/")
	public String home(Locale locale, Model m) {
		return "home";
	}
	
	@RequestMapping("/newbie")
	public String newbie() {
		return "newbie";
	}
	
	@RequestMapping(value = "/check_user", method = RequestMethod.POST)
	public String booking(HttpServletRequest hsr, Model model) {
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode");
		
		System.out.println("userid="+userid+",passcode="+passcode);
		
		// DB에서 유저 확인 : 기존 유저면 booking, 없으면 home으로.
		HttpSession session = hsr.getSession();
		session.setAttribute("loginid", userid);
		
		return "redirect:/booking"; // RequestMapping의 경로 이름
	}
	
	@RequestMapping(value = "/booking", method = RequestMethod.GET)
	public String booking(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		
		String loginid=(String)session.getAttribute("loginid");
		
		if(loginid.equals("hello")) {
			return "booking";
		} else {
			return "redirect:/"; // JSP 화일 이름
		}
	}
	
	@RequestMapping("/room")
	public String room(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		if(session.getAttribute("loginid")==null) {
			return "redirect:/login";
		}
		// 여기서 interface 호출하고 결과를 room.jsp에 전달.
		iRoom room=sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roominfo = room.getRoomList();
		System.out.println(roominfo);
		model.addAttribute("list", roominfo);
		return "room";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		
		session.invalidate();
		
		return "redirect:/";
	}
	
}