package com.java.jsf;

public class InsurancePlans {
	
	private int planId;
	private String insId;
	private double premiumAmount;
	private double coverageAmount;
	private String benefits;
	
	public InsurancePlans() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public String getInsId() {
		return insId;
	}

	public void setInsId(String insId) {
		this.insId = insId;
	}

	public double getPremiumAmount() {
		return premiumAmount;
	}

	public void setPremiumAmount(double premiumAmount) {
		this.premiumAmount = premiumAmount;
	}

	public double getCoverageAmount() {
		return coverageAmount;
	}

	public void setCoverageAmount(double coverageAmount) {
		this.coverageAmount = coverageAmount;
	}

	public String getBenefits() {
		return benefits;
	}

	public void setBenefits(String benefits) {
		this.benefits = benefits;
	}

	@Override
	public String toString() {
		return "InsurancePlans [planId=" + planId + ", insId=" + insId + ", premiumAmount=" + premiumAmount
				+ ", coverageAmount=" + coverageAmount + ", benefits=" + benefits + "]";
	}

	public InsurancePlans(int planId, String insId, double premiumAmount, double coverageAmount, String benefits) {
		super();
		this.planId = planId;
		this.insId = insId;
		this.premiumAmount = premiumAmount;
		this.coverageAmount = coverageAmount;
		this.benefits = benefits;
	}	
	
	
}
