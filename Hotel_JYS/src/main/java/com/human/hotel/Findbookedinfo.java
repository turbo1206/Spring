package com.human.hotel;

public class Findbookedinfo {
	private int bookcode;
	private String roomname;
	private String typename;
	private int howmany;
	private String checkin;
	private String checkout;
	private int total;
	private String booker;
	private String mobile;
	private int roomcode;
	
	public Findbookedinfo() {
		
	}

	public Findbookedinfo(int bookcode, String roomname, String typename, int howmany, String checkin, String checkout,
			int total, String booker, String mobile, int roomcode) {
		this.bookcode = bookcode;
		this.roomname = roomname;
		this.typename = typename;
		this.howmany = howmany;
		this.checkin = checkin;
		this.checkout = checkout;
		this.total = total;
		this.booker = booker;
		this.mobile = mobile;
		this.roomcode = roomcode;
	}

	public int getBookcode() {
		return bookcode;
	}

	public void setBookcode(int bookcode) {
		this.bookcode = bookcode;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String roomtype) {
		this.typename = roomtype;
	}

	public int getHowmany() {
		return howmany;
	}

	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getBooker() {
		return booker;
	}

	public void setBooker(String booker) {
		this.booker = booker;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public int getRoomcode() {
		return roomcode;
	}

	public void setRoomcode(int typecode) {
		this.roomcode = typecode;
	}
	
}
