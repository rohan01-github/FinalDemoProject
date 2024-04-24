package com.java.jsf;

import java.util.List;
import java.util.Map;
import javax.faces.context.FacesContext;


public class SearchController {

	private Subscription sub;
	private Impl impl;
	private JsfPaginationBean paginationDao;

	public Subscription getSub() {
		return sub;
	}

	public void setSub(Subscription sub) {
		this.sub = sub;
	}

	public Impl getImpl() {
		return impl;
	}

	public void setImpl(Impl impl) {
		this.impl = impl;
	}

	public JsfPaginationBean getPaginationDao() {
		return paginationDao;
	}

	public void setPaginationDao(JsfPaginationBean paginationDao) {
		this.paginationDao = paginationDao;
	}

	public List<Subscription> searchInsuranceName(String uhid, String insName, String payMode, String status){
			
		try {
			if (searchValid(insName, payMode, status)) {
				return paginationDao.getSubscriptionList(uhid, insName, payMode, status);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean searchValid(String insName, String payMode, String status) {
		
		System.out.println("Controller Hits");
		
		boolean flag = true;
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();

		try {
			if (insName.length() <= 0 && status.length() <= 0 && payMode.length() <= 0) {
				sessionMap.put("error", "Search by using at least one parameter!");
				flag = false;
			}
			
	
			// Validations for Number
			else if (insName.matches("\\d+") || insName.matches("^\\s*\\d+\\s*$")
					|| insName.matches(".*[a-zA-Z].*\\d+.*|.*\\d+.*[a-zA-Z].*")) {
				sessionMap.put("error", "Numerics are not allowed!");
				flag = false;
			}
			
			
			// Validation for Special Characters
			else {
				if (insName.matches(".*[`~!@#$%^&*_+=/\\\\\\-\\[\\]{};':\"|,.<>?].*")) {
					sessionMap.put("error", "Special characters are not allowed!");
					flag = false;
				}			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}

		return flag;
	}
}
