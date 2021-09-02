package com.human.hotel;

import java.util.ArrayList;

public interface iRoom {
	ArrayList<Roominfo> getRoomList();
	ArrayList<Roomtypeinfo> getRoomTypeList();
	
	void doDeleteRoom(int roomcode);
	void doAddRoom(String roomname, String roomtype, int howmany, int howmuch);
	
}
