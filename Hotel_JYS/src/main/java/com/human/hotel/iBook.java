package com.human.hotel;

import java.util.ArrayList;

public interface iBook {
	
	ArrayList<Findbookedinfo> findBooked(String checkin, String checkout, int typecode);
	
	void doInsertBooking(int roomcode, int howmany, String checkin, String checkout, int total, String booker, String mobile);
	void doDeleteBooking(int bookcode);
}
