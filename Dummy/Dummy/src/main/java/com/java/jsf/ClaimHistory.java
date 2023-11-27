package com.java.jsf;

import java.util.Date;

public class ClaimHistory {

	private int claimHistoryId;
	private int claimId;
	private String providerId;
	private int planId;// plan id
	private String uhid; // member or recipient ID
	private Date fromDate;
	private Date toDate;
	private double claimAmount;
	private String status;
	private String comments;
	public int getClaimHistoryId() {
		return claimHistoryId;
	}
	public void setClaimHistoryId(int claimHistoryId) {
		this.claimHistoryId = claimHistoryId;
	}
	public int getClaimId() {
		return claimId;
	}
	public void setClaimId(int claimId) {
		this.claimId = claimId;
	}
	public String getProviderId() {
		return providerId;
	}
	public void setProviderId(String providerId) {
		this.providerId = providerId;
	}
	public int getPlanId() {
		return planId;
	}
	public void setPlanId(int planId) {
		this.planId = planId;
	}
	public String getUhid() {
		return uhid;
	}
	public void setUhid(String uhid) {
		this.uhid = uhid;
	}
	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	public double getClaimAmount() {
		return claimAmount;
	}
	public void setClaimAmount(double claimAmount) {
		this.claimAmount = claimAmount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	@Override
	public String toString() {
		return "ClaimHistory [claimHistoryId=" + claimHistoryId + ", claimId=" + claimId + ", providerId=" + providerId
				+ ", planId=" + planId + ", uhid=" + uhid + ", fromDate=" + fromDate + ", toDate=" + toDate
				+ ", claimAmount=" + claimAmount + ", status=" + status + ", comments=" + comments + "]";
	}
	public ClaimHistory(int claimHistoryId, int claimId, String providerId, int planId, String uhid, Date fromDate,
			Date toDate, double claimAmount, String status, String comments) {
		super();
		this.claimHistoryId = claimHistoryId;
		this.claimId = claimId;
		this.providerId = providerId;
		this.planId = planId;
		this.uhid = uhid;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.claimAmount = claimAmount;
		this.status = status;
		this.comments = comments;
	}
	public ClaimHistory() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
