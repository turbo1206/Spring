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
		
		
		HttpSession session = hsr.getSession();
		session.setAttribute("loginid", userid);
		
		return "redirect:/booking"; 
	}
	
	@RequestMapping(value = "/booking", method = RequestMethod.GET)
	public String booking(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		
		String loginid=(String)session.getAttribute("loginid");
		
		if(loginid.equals("hello")) {
			return "booking";
		} else {
			return "home"; 
		}
	}
	
	@RequestMapping("/room")
	public String room(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		if(session.getAttribute("loginid")==null) {
			return "redirect:/login";
		}
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
		ArrayList<Roominfo> roominfo = room.getRoomList(); // camel notation
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
	
	@RequestMapping(value="/deleteRoom",method=RequestMethod.POST,
			produces = "application/text; charset=utf-8")
	@ResponseBody
	public String deleteRoom(HttpServletRequest hsr) {
		int roodcode = Integer.parseInt(hsr.getParameter("roomcode"));
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.doDeleteRoom(roodcode);
		return "ok";
	}
	
	@RequestMapping(value="/addRoom",method=RequestMethod.POST,
			produces = "application/text; charset=utf-8")
	@ResponseBody
	public String addRoom(HttpServletRequest hsr) {
		String rname=hsr.getParameter("roomname");
		int rtype=Integer.parseInt(hsr.getParameter("roomtype"));
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.doAddRoom(rname, rtype, howmany, howmuch);
		return "ok";
	}
	
	@RequestMapping(value="/updateRoom",method=RequestMethod.POST,
			produces = "application/text; charset=utf-8")
	@ResponseBody
	public String updateRoom(HttpServletRequest hsr) {
		iRoom room = sqlSession.getMapper(iRoom.class);
		room.doUpdateRoom(Integer.parseInt(hsr.getParameter("roomcode")),
				hsr.getParameter("roomname"),
				Integer.parseInt(hsr.getParameter("roomtype")),
				Integer.parseInt(hsr.getParameter("howmany")),
				Integer.parseInt(hsr.getParameter("howmuch"))
				);
		return "ok";
	}
}