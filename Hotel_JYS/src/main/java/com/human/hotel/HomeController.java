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
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
		
		System.out.println("userid="+userid+"  "+"passcode="+passcode);
		
		// DB�뿉�꽌 �쑀�� �솗�씤 : 湲곗〈 �쑀��硫� booking, �뾾�쑝硫� home�쑝濡�.
		HttpSession session = hsr.getSession();
		session.setAttribute("loginid", userid);
		
		return "redirect:/booking"; // RequestMapping�쓽 寃쎈줈 �씠由�
	}
	
	@RequestMapping(value = "/booking", method = RequestMethod.GET)
	public String booking(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		
		String loginid=(String)session.getAttribute("loginid");
		
		if(loginid.equals("hello")) {
			return "booking";
		} else {
			return "home"; // JSP �솕�씪 �씠由�
		}
	}
	
	@RequestMapping("/room")
	public String room(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		if(session.getAttribute("loginid")==null) {
			return "redirect:/login";
		}
		// �뿬湲곗꽌 interface �샇異쒗븯怨� 寃곌낵瑜� room.jsp�뿉 �쟾�떖.
		iRoom room=sqlSession.getMapper(iRoom.class);
//		ArrayList<Roominfo> roominfo = room.getRoomList();
		ArrayList<Roomtypeinfo> roomtypeinfo = room.getRoomTypeList();
//		System.out.println(roominfo);
//		model.addAttribute("list", roominfo);
		model.addAttribute("typelist", roomtypeinfo);
		return "room";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/getRoomList",method=RequestMethod.POST,
					produces = "application/text; charset=utf-8")
	@ResponseBody
	public String getRoomList(HttpServletRequest hsr) {
		iRoom room=sqlSession.getMapper(iRoom.class);
		ArrayList<Roominfo> roominfo = room.getRoomList();
		// 찾아진 데이터로 JSONArray 만들기
		JSONArray ja = new JSONArray();
		for(int i=0;i<roominfo.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomcode", roominfo.get(i).getRoomcode());
			jo.put("roomname", roominfo.get(i).getRoomname());
			jo.put("typename", roominfo.get(i).getTypename());
			jo.put("howmany", roominfo.get(i).getHowmany());
			jo.put("howmuch", roominfo.get(i).getHowmuch());
			ja.add(jo);
		}
		return ja.toString();
	}
	
}