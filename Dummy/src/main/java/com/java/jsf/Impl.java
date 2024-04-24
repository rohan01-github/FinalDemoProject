package com.java.jsf;

import java.util.List;
import java.util.Map;

import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class Impl {

	JsfPaginationBean firstRow;
	
	SessionFactory sf; // interacts with Database and also "create and manage" Hibernate session
						// instances
	Session session; // It caches objects retrieved from DB
	
	
	// SHOW AND SEARCH SUBSCRIPTION using PAGINATION *****

	public List<Subscription> getListOfSubscription(String uhid, String insName, String payMode, String status,
			int firstRow, int rowCount)  {
		// It is the datatable method to show the list of data records of the particular uhid
		try{
			Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap(); // The sessionMap holds the data of particular session
		
			SessionFactory sf = SessionHelper.getConnection(); // this provides Hibernate Session Factory
			Session session = sf.openSession();
			Criteria criteria = session.createCriteria(Subscription.class);
			criteria.add(Restrictions.eq("uhid", uhid));
			System.out.println("Method hitted");
		
			insName = trimInsName(insName);		// insName Trimming method is called
		
			// To Search by Insurance Name ------>
			if (!insName.isEmpty()) { 
				System.out.println("Hi"); 
				criteria.add(Restrictions.like("insName", "%" + insName + "%")); // It add restrictions to criteria and "like" is used to check any characters matches or not
			}
			
			// To search by payMode (Monthly/Quarterly/Half-Yearly/Yearly) ------>
			if (!payMode.isEmpty()) {
				System.out.println("Hey");
				criteria.add(Restrictions.eq("payMode", payMode));
				sessionMap.remove("error");
			}

			// To Search by Status(ACTIVE/INACTIVE) ----->
			if (!status.isEmpty()) {
				System.out.println("Hello");
				criteria.add(Restrictions.eq("status", status));
				sessionMap.remove("error");
			}
		
			handlingSubscriptionSort(criteria); 		// this method is called for sorting in Subscription table
		
			criteria.setFirstResult(firstRow); 			// it is the starting index of first record		
			criteria.setMaxResults(rowCount); 			// the no. of records found from DB
		
			return criteria.list(); 								// list() contains the list which has to be return
		}catch(Exception  e) {
			e.printStackTrace();
			return null;
		}
	}

	// This counts the no. of Rows per pages for Subscription Class
	public int countRows(String uhid, String insName, String payMode, String status) {
		
		SessionFactory sf = SessionHelper.getConnection();
		Session session = sf.openSession();
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Subscription.class);
			if (criteria != null) {
				criteria.add(Restrictions.eq("uhid", uhid));
				if (insName.length() > 0) {
					criteria.add(Restrictions.like("insName", "%" + insName + "%"));
					System.out.println(insName);
				}
				if (payMode.length() > 0) {
					criteria.add(Restrictions.eq("payMode", payMode));
					System.out.println(payMode);
				}
				if (status.length() > 0) {
					criteria.add(Restrictions.eq("status", status));
					System.out.println(status);
				}

				return criteria.list().size();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}


	// SORTING of SUBSCRIPTION ################################################
	static String orderbySubscriptionNo = "sort";
	static String orderbyInsuranceNo = "sort"; // Here static string variable is declared to store the current value
												// (sort)
	static String orderbyInsuranceName = "sort";
	static String orderbyPlanNo = "sort";
	static String orderbyPremiumAmount = "sort";
	static String orderbyCovAmount = "sort";
	static String orderbyPayMode = "sort";
	static String orderbyRegDate = "sort";
	static String orderbyEndDate = "sort";
	static String orderbyStatus = "sort";

	public String sortbyInsuranceNo() { 	// This method is responsible for toggling of sorting for SubId
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.remove("insName");
		sessionMap.remove("payMode");
		sessionMap.remove("status");
		System.out.println("orderbyInsuranceNo : " + orderbyInsuranceNo);
		if (orderbyInsuranceNo.length() == 4) { // if the static string variables length is 4 then ascending sorting occurs
												
			orderbyInsuranceNo = "asc";
			orderbyInsuranceName = "sort";
			orderbyPlanNo = "sort"; // here only InsNo static variables value is changed to asc and other static
									// variables values remains same
			orderbyPremiumAmount = "sort";
			orderbySubscriptionNo = "sort";
			orderbyCovAmount = "sort";
			orderbyPayMode = "sort";
			orderbyRegDate = "sort";
			orderbyEndDate = "sort";
			orderbyStatus = "sort";

		} else if (orderbyInsuranceNo.equals("asc")) { // if static string variables length is "asc" then descending order occurs
														 
			orderbyInsuranceNo = "desc";
			orderbyInsuranceName = "sort";
			orderbyPlanNo = "sort";
			orderbyPremiumAmount = "sort";
			orderbySubscriptionNo = "sort";
			orderbyCovAmount = "sort";
			orderbyPayMode = "sort";
			orderbyRegDate = "sort";
			orderbyEndDate = "sort";
			orderbyStatus = "sort";
		}
		return "ShowSubscription.jsp?faces-redirect=true"; // Returns the result in ShowSub jsp page
	}

	public String sortbyInsuranceName() {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.remove("insName");
		sessionMap.remove("payMode");
		sessionMap.remove("status");
		System.out.println("orderbyInsuranceName : " + orderbyInsuranceName);
		if (orderbyInsuranceName.length() == 4) {
			orderbyInsuranceName = "asc";
			orderbyInsuranceNo = "sort";
			orderbyPlanNo = "sort";
			orderbyPremiumAmount = "sort";
			orderbySubscriptionNo = "sort";
			orderbyCovAmount = "sort";
			orderbyPayMode = "sort";
			orderbyRegDate = "sort";
			orderbyEndDate = "sort";
			orderbyStatus = "sort";

		} else if (orderbyInsuranceName.equals("asc")) {
			orderbyInsuranceName = "desc";
			orderbyInsuranceNo = "sort";
			orderbyPlanNo = "sort";
			orderbyPremiumAmount = "sort";
			orderbySubscriptionNo = "sort";
			orderbyCovAmount = "sort";
			orderbyPayMode = "sort";
			orderbyRegDate = "sort";
			orderbyEndDate = "sort";
			orderbyStatus = "sort";
		}
		return "ShowSubscription.jsp?faces-redirect=true";
	}

	public String sortbyPlanNo() {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.remove("insName");
		sessionMap.remove("payMode");
		sessionMap.remove("status");
		System.out.println("orderbyPlanNo : " + orderbyPlanNo);
		if (orderbyPlanNo.length() == 4) {
			orderbyPlanNo = "asc";
			orderbyInsuranceNo = "sort";
			orderbyInsuranceName = "sort";
			orderbyPremiumAmount = "sort";
			orderbySubscriptionNo = "sort";
			orderbyCovAmount = "sort";
			orderbyPayMode = "sort";
			orderbyRegDate = "sort";
			orderbyEndDate = "sort";
			orderbyStatus = "sort";

		} else if (orderbyPlanNo.equals("asc")) {
			orderbyPlanNo = "desc";
			orderbyInsuranceNo = "sort";
			orderbyInsuranceName = "sort";
			orderbyPremiumAmount = "sort";
			orderbySubscriptionNo = "sort";
			orderbyCovAmount = "sort";
			orderbyPayMode = "sort";
			orderbyRegDate = "sort";
			orderbyEndDate = "sort";
			orderbyStatus = "sort";
		}
		return "ShowSubscription.jsp?faces-redirect=true";
	}

	public String sortbyPremiumAmount() {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.remove("insName");
		sessionMap.remove("payMode");
		sessionMap.remove("status");
		System.out.println("orderbyPremiumAmount : " + orderbyPremiumAmount);
		if (orderbyPremiumAmount.length() == 4) {
			orderbyPremiumAmount = "asc";
			orderbyInsuranceNo = "sort";
			orderbyInsuranceName = "sort";
			orderbyPlanNo = "sort";
			orderbySubscriptionNo = "sort";
			orderbyCovAmount = "sort";
			orderbyPayMode = "sort";
			orderbyRegDate = "sort";
			orderbyEndDate = "sort";
			orderbyStatus = "sort";

		} else if (orderbyPremiumAmount.equals("asc")) {
			orderbyPremiumAmount = "desc";
			orderbyInsuranceNo = "sort";
			orderbyInsuranceName = "sort";
			orderbyPlanNo = "sort";
			orderbySubscriptionNo = "sort";
			orderbyCovAmount = "sort";
			orderbyPayMode = "sort";
			orderbyRegDate = "sort";
			orderbyEndDate = "sort";
			orderbyStatus = "sort";
		}
		return "ShowSubscription.jsp?faces-redirect=true";
	}

	public String sortbyCovAmount() {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.remove("insName");
		sessionMap.remove("payMode");
		sessionMap.remove("status");
		System.out.println("orderbyCovAmount : " + orderbyCovAmount);
		if (orderbyCovAmount.length() == 4) {
			orderbyCovAmount = "asc";
			orderbyInsuranceNo = "sort";
			orderbyInsuranceName = "sort";
			orderbyPlanNo = "sort";
			orderbySubscriptionNo = "sort";
			orderbyPremiumAmount = "sort";
			orderbyPayMode = "sort";
			orderbyRegDate = "sort";
			orderbyEndDate = "sort";
			orderbyStatus = "sort";
			
		} else if (orderbyCovAmount.equals("asc")) {
			orderbyCovAmount = "desc";
			orderbyInsuranceNo = "sort";
			orderbyInsuranceName = "sort";
			orderbyPlanNo = "sort";
			orderbySubscriptionNo = "sort";
			orderbyPremiumAmount = "sort";
			orderbyPayMode = "sort";
			orderbyRegDate = "sort";
			orderbyEndDate = "sort";
			orderbyStatus = "sort";
		}
		return "ShowSubscription.jsp?faces-redirect=true";
	}

	public String sortbyRegDate() {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.remove("insName");
		sessionMap.remove("payMode");
		sessionMap.remove("status");
		System.out.println("orderbyRegDate : " + orderbyRegDate);
		if (orderbyRegDate.length() == 4) {
			orderbyRegDate = "asc";
			orderbyInsuranceNo = "sort";
			orderbyInsuranceName = "sort";
			orderbyPlanNo = "sort";
			orderbyCovAmount = "sort";
			orderbySubscriptionNo = "sort";
			orderbyPremiumAmount = "sort";
			orderbyPayMode = "sort";
			orderbyEndDate = "sort";
			orderbyStatus = "sort";
			
		} else if (orderbyRegDate.equals("asc")) {
			orderbyRegDate = "desc";
			orderbyInsuranceNo = "sort";
			orderbyInsuranceName = "sort";
			orderbyPlanNo = "sort";
			orderbyCovAmount = "sort";
			orderbySubscriptionNo = "sort";
			orderbyPremiumAmount = "sort";
			orderbyPayMode = "sort";
			orderbyEndDate = "sort";
			orderbyStatus = "sort";
		}
		return "ShowSubscription.jsp?faces-redirect=true";
	}
	
	public String sortbyEndDate() {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.remove("insName");
		sessionMap.remove("payMode");
		sessionMap.remove("status");
		if (orderbyEndDate.length() == 4) {
			orderbyEndDate = "asc";
			orderbyRegDate = "sort";
			orderbyInsuranceNo = "sort";
			orderbyInsuranceName = "sort";
			orderbyPlanNo = "sort";
			orderbyCovAmount = "sort";
			orderbySubscriptionNo = "sort";
			orderbyPremiumAmount = "sort";
			orderbyPayMode = "sort";
			orderbyStatus = "sort";
			
		} else if (orderbyEndDate.equals("asc")) {
			orderbyEndDate = "desc";
			orderbyRegDate = "sort";
			orderbyInsuranceNo = "sort";
			orderbyInsuranceName = "sort";
			orderbyPlanNo = "sort";
			orderbyCovAmount = "sort";
			orderbySubscriptionNo = "sort";
			orderbyPremiumAmount = "sort";
			orderbyPayMode = "sort";
			orderbyStatus = "sort";
		}
		return "ShowSubscription.jsp?faces-redirect=true";
	}
	
	public String sortbyPayMode() {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.remove("insName");
		sessionMap.remove("payMode");
		sessionMap.remove("status");
		if (orderbyPayMode.length() == 4) {
			orderbyPayMode = "asc";			
			orderbyRegDate = "sort";
			orderbyInsuranceNo = "sort";
			orderbyInsuranceName = "sort";
			orderbyPlanNo = "sort";
			orderbyCovAmount = "sort";
			orderbySubscriptionNo = "sort";
			orderbyPremiumAmount = "sort";
			orderbyEndDate = "sort";
			orderbyStatus = "sort";
			
		} else if (orderbyPayMode.equals("asc")) {
			orderbyPayMode = "desc";
			orderbyRegDate = "sort";
			orderbyInsuranceNo = "sort";
			orderbyInsuranceName = "sort";
			orderbyPlanNo = "sort";
			orderbyCovAmount = "sort";
			orderbySubscriptionNo = "sort";
			orderbyPremiumAmount = "sort";
			orderbyEndDate = "sort";
			orderbyStatus = "sort";
		}
		return "ShowSubscription.jsp?faces-redirect=true";
	}

	public String sortbyStatus() {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.remove("insName");
		sessionMap.remove("payMode");
		sessionMap.remove("status");
		if (orderbyStatus.length() == 4) {
			orderbyStatus = "asc";
			orderbyPayMode = "sort";			
			orderbyRegDate = "sort";
			orderbyInsuranceNo = "sort";
			orderbyInsuranceName = "sort";
			orderbyPlanNo = "sort";
			orderbyCovAmount = "sort";
			orderbySubscriptionNo = "sort";
			orderbyPremiumAmount = "sort";
			orderbyEndDate = "sort";			
		} else if (orderbyStatus.equals("asc")) {
			orderbyStatus = "desc";
			orderbyPayMode = "sort";
			orderbyRegDate = "sort";
			orderbyInsuranceNo = "sort";
			orderbyInsuranceName = "sort";
			orderbyPlanNo = "sort";
			orderbyCovAmount = "sort";
			orderbySubscriptionNo = "sort";
			orderbyPremiumAmount = "sort";
			orderbyEndDate = "sort";			
		}
		return "ShowSubscription.jsp?faces-redirect=true";
	}
	
	// This is the sorting method for Subscription Class
	public void handlingSubscriptionSort(Criteria criteria) { // this method accepts the criteria object as parameter and also improves code reusability
		
		try {
			if (orderbySubscriptionNo.equals("asc")) { 				// It checks sorting order is in asc/desc
				System.out.println("Order by Subscription No " + orderbySubscriptionNo);
				criteria.addOrder(Order.desc("subId")); 				// Order class is used to add sorting orders to criteria
			} else if (orderbySubscriptionNo.equals("desc")) {
				criteria.addOrder(Order.asc("subId"));
			} 
			
			else if (orderbyInsuranceNo.equals("asc")) {
				System.out.println("Order by Insurance No " + orderbyInsuranceNo);
				criteria.addOrder(Order.desc("insId"));
			} else if (orderbyInsuranceNo.equals("desc")) {
				criteria.addOrder(Order.asc("insId"));
			}
	
			else if (orderbyInsuranceName.equals("asc")) {
				criteria.addOrder(Order.desc("insName"));
			} else if (orderbyInsuranceName.equals("desc")) {
				criteria.addOrder(Order.asc("insName"));
			}
	
			else if (orderbyPlanNo.equals("asc")) {
				System.out.println("Order by Plan No " + orderbyPlanNo);
				criteria.addOrder(Order.desc("planId"));
			} else if (orderbyPlanNo.equals("desc")) {
				criteria.addOrder(Order.asc("planId"));
			}
	
			else if (orderbyPremiumAmount.equals("asc")) {
				System.out.println("Order by Premium Amount" + orderbyPremiumAmount);
				criteria.addOrder(Order.desc("premium"));
			} else if (orderbyPremiumAmount.equals("desc")) {
				criteria.addOrder(Order.asc("premium"));
			}
	
			else if (orderbyCovAmount.equals("asc")) {
				System.out.println("Order by Coverage Amount" + orderbyCovAmount);
				criteria.addOrder(Order.desc("covAmount"));
			} else if (orderbyCovAmount.equals("desc")) {
				criteria.addOrder(Order.asc("covAmount"));
			}
			
			else if(orderbyPayMode.equals("asc")) {
				criteria.addOrder(Order.desc("payMode"));
			}else if(orderbyPayMode.equals("desc")){
				criteria.addOrder(Order.asc("payMode"));
			}
	
			else if (orderbyRegDate.equals("asc")) {
				System.out.println("Order by Registration Date" + orderbyRegDate);
				criteria.addOrder(Order.desc("regDate"));
			} else if (orderbyRegDate.equals("desc")) {
				criteria.addOrder(Order.asc("regDate"));
			} 
			
			else if(orderbyStatus.equals("asc")) {
				criteria.addOrder(Order.desc("status"));
			}else if(orderbyStatus.equals("desc")) {
				criteria.addOrder(Order.asc("status"));
			}
			
			else if (orderbyEndDate.equals("asc")) {
				System.out.println("Order by End Date" + orderbyEndDate);
				criteria.addOrder(Order.desc("endDate"));
			} else {
				if (orderbyEndDate.equals("desc")) {
					criteria.addOrder(Order.asc("endDate"));
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	// For reseting the sorting purpose this below method is declared
	public void resetSorting() { 			// This method will help to bring the list to default form
		orderbySubscriptionNo = "sort";
		orderbyInsuranceNo = "sort";
		orderbyInsuranceName = "sort";
		orderbyPlanNo = "sort";
		orderbyPremiumAmount = "sort";
		orderbyCovAmount = "sort";
		orderbyPayMode = "sort";
		orderbyRegDate = "sort";
		orderbyEndDate = "sort";
		orderbyStatus = "sort";
	}


	// RESET BUTTON ******
	public List<Subscription> resetSubscriptionList(JsfPaginationBean paginationDao) {
		
		try {
			sf = SessionHelper.getConnection(); // provides the hibernate session factory
			session = sf.openSession(); 
			Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap(); // The sessionMap holds the data of particular session
			
			Criteria criteria = session.createCriteria(Subscription.class); // here criteria instance is defined to execute queries
	
			
			// Update the sessionMap with default values
			sessionMap.remove("insName"); 
			sessionMap.remove("payMode");
			sessionMap.remove("status");
			sessionMap.remove("error"); // To clear the error message
			
			paginationDao.setFirstRow(0);			
	
			resetSorting(); 		// When sorted after clicking on to the RESET button it will bring the table in original state 
	
			return criteria.list();		 // returns the reset list or original list
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
    
	// BACK BUTTON LOGIC *****
	public String backButton(JsfPaginationBean paginationDao) {

		try {
			
			Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap(); // The sessionMap holds the data of particular session
	
	
			// Update the sessionMap with default values
			sessionMap.remove("insName"); 
			sessionMap.remove("payMode");
			sessionMap.remove("status");
			sessionMap.remove("error");
	
			paginationDao.setFirstRow(0);
			
			resetSorting(); 		// When sorted after clicking on to the RESET button it will bring the table in original state
	
			return "Dmmmjsp.jsp?faces-redirect=true"; // returns the reset list or original list
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	// TRIMMING OF INSNAME ********
	public String trimInsName(String insName) {
		try {
			if(insName != null) {
				insName = insName.trim().replaceAll("\\s+", " ");
				Map<String,Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
				sessionMap.put("insName", insName);
			}
			return insName;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}