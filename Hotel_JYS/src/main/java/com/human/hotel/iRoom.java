package com.human.hotel;

import java.util.ArrayList;

public interface iRoom {
	ArrayList<Roominfo> getRoomList();
	ArrayList<Roomtypeinfo> getRoomTypeList();
	
	void doDeleteRoom(int roomcode);
	void doAddRoom(String roomname, int roomtype, int howmany, int howmuch);
	void doUpdateRoom(int roomcode, String roomname, int roomtype, int howmany, int howmuch);
	void doAddBooking(int bookcode, int roomcode, int person, String checkin, String checkout, String name, String moblie, int price);
	
}
