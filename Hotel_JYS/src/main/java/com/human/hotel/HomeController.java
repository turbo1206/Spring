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
	public String getInfo() {
		return "newbie";
	}
	
	@RequestMapping("/login")
	public String doLogin() {
		return "login";
	}
	
	@RequestMapping(value="/signin", method=RequestMethod.POST,
					produces = "application/text; charset=utf-8")
	public String doSignin(HttpServletRequest hsr) {
		String realname=hsr.getParameter("realname");
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode1");
		iMember member = sqlSession.getMapper(iMember.class);
		member.doSignin(realname,userid,passcode);
		return "home";
	}
	
	@RequestMapping(value = "/check_user", method = RequestMethod.POST)
	public String check_user(HttpServletRequest hsr, Model model) {
		String userid=hsr.getParameter("userid");
		String passcode=hsr.getParameter("passcode");
//		System.out.println("userid="+userid+"  "+"passcode="+passcode);
		// DB에서 유저확인 : 기존 유저면 booking, 없으면 home으로.
		iMember member = sqlSession.getMapper(iMember.class);
		int n= member.doCheckUser(userid, passcode);
		if(n>0) {
			HttpSession session = hsr.getSession();
			session.setAttribute("loginid", userid);
			return "redirect:/booking";
		} else {
			return "home";
		}
	}
	
	@RequestMapping(value = "/booking", method = RequestMethod.GET)
	public String booking(HttpServletRequest hsr) {
		HttpSession session = hsr.getSession();
		
		String loginid=(String)session.getAttribute("loginid");
		
		if(loginid==null) {
			return "redirect:home";
		} else {
			return "booking"; 
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
	/*
	 * 설명: 객실리스트를 가져오는 AJAX에 대응하는 메소드
	 */
	@RequestMapping(value="/updateRoom",method=RequestMethod.POST,
			produces = "application/text; charset=utf-8")
	@ResponseBody
	public String updateRoom(HttpServletRequest hsr) {
		//디버깅 하는 코드
		iRoom room = sqlSession.getMapper(iRoom.class);
		int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
		String roomname=hsr.getParameter("roomname");
		int roomtype=Integer.parseInt(hsr.getParameter("roomtype"));
		System.out.println("roomcode ["+roomcode+"]");
		System.out.println("roomname ["+roomname+"]");
		System.out.println("roomtype ["+roomtype+"]");
		room.doUpdateRoom(roomcode, roomname, roomtype, Integer.parseInt(hsr.getParameter("howmany")), Integer.parseInt(hsr.getParameter("howmuch")));
//		room.doUpdateRoom(Integer.parseInt(hsr.getParameter("roomcode")),
//				hsr.getParameter("roomname"),
//				Integer.parseInt(hsr.getParameter("roomtype")),
//				Integer.parseInt(hsr.getParameter("howmany")),
//				Integer.parseInt(hsr.getParameter("howmuch"))
//				);
		return "ok";
	}
}