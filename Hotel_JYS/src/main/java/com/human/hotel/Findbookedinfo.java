package com.human.hotel;

public class Findbookedinfo {
	private int bookcode;
	private String roomname;
	private String roomtype;
	private int howmany;
	private String checkin;
	private String checkout;
	private int total;
	private String booker;
	private String mobile;
	private int typecode;
	
	public Findbookedinfo() {
		
	}

	public Findbookedinfo(int bookcode, String roomname, String roomtype, int howmany, String checkin, String checkout,
			int total, String booker, String mobile, int typecode) {
		this.bookcode = bookcode;
		this.roomname = roomname;
		this.roomtype = roomtype;
		this.howmany = howmany;
		this.checkin = checkin;
		this.checkout = checkout;
		this.total = total;
		this.booker = booker;
		this.mobile = mobile;
		this.typecode = typecode;
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

	public String getRoomtype() {
		return roomtype;
	}

	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
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

	public int getTypecode() {
		return typecode;
	}

	public void setTypecode(int typecode) {
		this.typecode = typecode;
	}
	
}
