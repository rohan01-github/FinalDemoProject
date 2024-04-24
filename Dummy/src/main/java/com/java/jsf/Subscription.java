package com.java.jsf;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Subscription {

	private int subId;
	private String uhid;	
	private String insId;
	private String insName;
	private int planId;
	private double premium;
	private double covAmount;
	private String payMode;
	private String email;
	private Date regDate;
	private Date endDate;	
	private String status;
	
	
	public int getSubId() {
		return subId;
	}
	public void setSubId(int subId) {
		this.subId = subId;
	}
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
	public String getInsName() {
		return insName;
	}
	public void setInsName(String insName) {
		this.insName = insName;
	}
	public int getPlanId() {
		return planId;
	}
	public void setPlanId(int planId) {
		this.planId = planId;
	}
	public double getPremium() {
		return premium;
	}
	public void setPremium(double premium) {
		this.premium = premium;
	}
	public double getCovAmount() {
		return covAmount;
	}
	public void setCovAmount(double covAmount) {
		this.covAmount = covAmount;
	}
	public String getPayMode() {
		return payMode;
	}
	public void setPayMode(String payMode) {
		this.payMode = payMode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		
		DecimalFormat decFormat = new DecimalFormat("###0.00");
        String premiumFormat = decFormat.format(premium);
        String covAmountFormat = decFormat.format(covAmount);
        
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String regDateFormat = sdf.format(regDate);
        String endDateFormat = sdf.format(endDate);

		return "Subscription [subId=" + subId + ", uhid=" + uhid + ", insId=" + insId + ", insName=" + insName
				+ ", planId=" + planId + ", premium=" + premiumFormat + ", covAmount=" + covAmountFormat + ", payMode=" + payMode
				+ ", email=" + email + ", regDate=" + regDateFormat + ", endDate=" + endDateFormat + ", status=" + status + "]";
	}
	public Subscription(int subId, String uhid, String insId, String insName, int planId, double premium,
			double covAmount, String payMode, String email, Date regDate, Date endDate, String status) {
		super();
		this.subId = subId;
		this.uhid = uhid;
		this.insId = insId;
		this.insName = insName;
		this.planId = planId;
		this.premium = premium;
		this.covAmount = covAmount;
		this.payMode = payMode;
		this.email = email;
		this.regDate = regDate;
		this.endDate = endDate;
		this.status = status;
	}
	public Subscription() {
		super();
		// TODO Auto-generated constructor stub
	}	
	
	
}
