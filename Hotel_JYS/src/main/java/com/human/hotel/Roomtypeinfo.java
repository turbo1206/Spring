package com.human.hotel;

public class Roomtypeinfo {
	private int typecode;
	private String name;
	
	public Roomtypeinfo() {
		
	}
	
	public Roomtypeinfo(int typecode, String name) {
		this.typecode = typecode;
		this.name = name;
	}

	public int getTypecode() {
		return typecode;
	}

	public void setTypecode(int typecode) {
		this.typecode = typecode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
