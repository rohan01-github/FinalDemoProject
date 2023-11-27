package com.java.jsf;

public class Recipient {

	private String uhid;
	private String insId;
	private int planId;
	private String firstName;
	private String lastName;
	public String getUhid() {
		return uhid;
	}
	public void setUhid(String uhid) {
		this.uhid = uhid;
	}
	public String getInsId() {
		return insId;
	}
	public void setInsId(String insId) {
		this.insId = insId;
	}
	public int getPlanId() {
		return planId;
	}
	public void setPlanId(int planId) {
		this.planId = planId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	@Override
	public String toString() {
		return "Recipient [uhid=" + uhid + ", insId=" + insId + ", planId=" + planId + ", firstName=" + firstName
				+ ", lastName=" + lastName + "]";
	}
	public Recipient(String uhid, String insId, int planId, String firstName, String lastName) {
		super();
		this.uhid = uhid;
		this.insId = insId;
		this.planId = planId;
		this.firstName = firstName;
		this.lastName = lastName;
	}
	public Recipient() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
