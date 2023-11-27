package com.java.jsf;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

public class Impl implements DAO{

	SessionFactory sf;
	Session session;
	
	private String uhid;
	
	public String getUhid() {
		return uhid;
	}
	public void setUhid(String uhid) {
		this.uhid = uhid;
	}
	
	//LOGIN 
	public String loginDao(Login login) {
		 Map<String, Object> sessionMap =
					FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		String encPass = EncryptPassword.getCode(login.getPassWord());
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Criteria cr = session.createCriteria(Login.class);
		cr.add(Restrictions.eqOrIsNull("userName", login.getUserName()));
		cr.add(Restrictions.eqOrIsNull("passWord", encPass.trim()));
		System.out.println(encPass.trim());
		cr.setProjection(Projections.rowCount());
		long count = (long)cr.uniqueResult();
		session.close();
		sf.close();

		if(count==1) {
			sessionMap.put("loggedCustomer",  login.getUserName());
			System.out.println(login.getUserName());
//			sessionMap.put("uhid", login.getUhId());
			
			System.out.println(sessionMap.put("uhid", login.getUhid()));
			sf = SessionHelper.getConnection();
			session = sf.openSession();
			cr = session.createCriteria(Login.class);
			cr.add(Restrictions.eqOrIsNull("userName", login.getUserName()));
			Login customerFound = (Login) cr.uniqueResult();
			sessionMap.put("customerFound", customerFound);
			sessionMap.put("uhid", customerFound.getUhid());
			System.out.println("Sessionfactory");
			System.out.println(sessionMap.put("uhid", customerFound.getUhid()));
			return "Dashboard.jsp?faces-redirect=true";
		}else {
			sessionMap.put("errorMessage", "Invalid Credentials....");
			return "Login.jsp?faces-redirect=true";
			}
	}
	
	
	// RECIPIENT LIST
	public List<Recipient> showRecipient(){
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Criteria cr = session.createCriteria(Recipient.class);
		return cr.list();
	}
	
	// SUBSCRIPTION LIST
//	@Override
//	public List<Subscription> showSubscription() {
//		sf = SessionHelper.getConnection();
//		session = sf.openSession();
//		Criteria cr = session.createCriteria(Subscription.class);
//		return cr.list();
//	}
	
	// SUBSCRIPTION LIST BY UHID
	public String getSubcription(String uhid) {
		
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Map<String,Object> sessionMap =
				FacesContext.getCurrentInstance().getExternalContext().getSessionMap();	
		Criteria cr = session.createCriteria(Subscription.class);
		cr.add(Restrictions.eq("uhid", uhid));
		List<Subscription> insDList=cr.list();
		sessionMap.put("insDList", insDList);

		return "ShowSubscription.jsp?faces-redirect=true";		
}

	// -----------------------------------------------------------------------------------
//	public String searchRecipientDetailsDao() {
//		Map<String, Object> sessionMap =
//						FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
//		 String recipientLoggedIn = (String)sessionMap.get("loggedCustomer");
//			sf = SessionHelper.getConnection();
//			session = sf.openSession();
//			Criteria criteria = session.createCriteria(Subscription.class);
//			
//			criteria.add(Restrictions.eq("uhid", recipientLoggedIn));
//			Subscription recipientData = (Subscription) criteria.uniqueResult();
//		//	sessionMap.put("customerFound", customerData);
//			List<Subscription> insDList=criteria.list();
//			sessionMap.put("insDList", insDList);
//			return "RecipientInfo.jsp?faces-redirect=true";
//		}
	
	//------------------------------------------------------------------------------------------------------
	
	// SUBSCRIPTION PAGINATION
	public List<Subscription> getListOfSubscription(String uhid, int firstRow, int rowCount) throws ParseException{
		Map<String,Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		SessionFactory sf = SessionHelper.getConnection();
	    Session session = sf.openSession();
	    Criteria criteria = session.createCriteria(Subscription.class);
	    criteria.add(Restrictions.eq("uhid", uhid));
	//    System.out.println("uhid is "+uhid);
	   System.out.println("Order by Subscription No "+orderbySubscriptionNo);
	    
	    // SORTED BY SUB NO
	    if(orderbySubscriptionNo.equals("asc")) {
	    	System.out.println("Order by Subscription No "+orderbySubscriptionNo);
		criteria.addOrder(Order.asc("subId"));
		}else if(orderbySubscriptionNo.equals("desc")){
			criteria.addOrder(Order.desc("subId"));
		}
		else{
			System.out.println("done");
		}
	    criteria.setFirstResult(firstRow);
	    criteria.setMaxResults(rowCount);
	    List<Subscription> subList = criteria.list();
	    System.out.println("list from impl : "+subList);
	    return subList;
	}
	
	
	public int countRows(String uhid) {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		SessionFactory sf = SessionHelper.getConnection();
		Session session = sf.openSession();
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(Subscription.class);
			if (criteria != null) {
				criteria.add(Restrictions.eq("uhid", uhid));
				return criteria.list().size();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public String redirectToShowSubscription(String uhid) throws ParseException {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.put("uhid", uhid);
		return "ShowSubscription.jsp?faces-redirect=true";
	}
	
	// CLAIM HISTORY LIST
	@Override
	public List<ClaimHistory> showClaimHistory() {
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Criteria cr = session.createCriteria(ClaimHistory.class);
		return cr.list();
	}
	
	// CLAIM HISTORY LIST BY UHID
	public String getClaimHistory(String uhid) {
		
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Map<String,Object> sessionMap =
				FacesContext.getCurrentInstance().getExternalContext().getSessionMap();	
		Criteria cr = session.createCriteria(ClaimHistory.class);
		cr.add(Restrictions.eq("uhid", uhid));
		List<Subscription> cList=cr.list();
		sessionMap.put("cList", cList);

		return "ShowClaimHistory.jsp?faces-redirect=true";		
}
	
	// CLAIM HISTORY PAGINATION
	public List<ClaimHistory> getListOfClaimHistory(String uhid, int firstRow, int rowCount) throws ParseException{
		Map<String,Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		SessionFactory sf = SessionHelper.getConnection();
	    Session session = sf.openSession();
	    Criteria criteria = session.createCriteria(ClaimHistory.class);
	    criteria.add(Restrictions.eq("uhid", uhid));
	//    System.out.println("uhid is "+uhid);
	    if(orderbyClaimHistoryId.equals("asc")) {
	    	System.out.println("Order by Claim History Id "+orderbyClaimHistoryId);
			criteria.addOrder(Order.asc("claimHistoryId"));
		}else if(orderbyClaimHistoryId.equals("desc")){
			criteria.addOrder(Order.desc("claimHistoryId"));
		}
		else {
			System.out.println("done");
		}
	    criteria.setFirstResult(firstRow);
	    criteria.setMaxResults(rowCount);
	    List<ClaimHistory> chList = criteria.list();
	    System.out.println("list from impl : "+chList);
	    return chList;
	}
	
	public int countCHRows(String uhid) {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		SessionFactory sf = SessionHelper.getConnection();
		Session session = sf.openSession();
		try {
			session.beginTransaction();
			Criteria criteria = session.createCriteria(ClaimHistory.class);
			if (criteria != null) {
				criteria.add(Restrictions.eq("uhid", uhid));
				return criteria.list().size();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public String redirectToShowClaimHistory(String uhid) throws ParseException {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.put("uhid", uhid);
		return "ShowClaimHistory.jsp?faces-redirect=true";
	}
	
	
	
	// SORTING of SUBSCRIPTION ################################################
	static String orderbySubscriptionNo = "sort";
	static String orderbyUHID = "sort";
	static String orderbyInsuranceNo = "sort";
	static String orderbyInsuranceName = "sort";
	static String orderbyPlanNo = "sort";
	static String orderbyStartPremium = "sort";
	static String orderbyEndPremium = "sort";
	static String orderbyPayMode = "sort";
	static String orderbyEmail = "sort";
	static String orderbyRegistrationDate = "sort";
	static String orderbyStatus = "sort";
	
	public String sortbySubscriptionNo() {
		System.out.println("orderbySubscriptionNo : "+orderbySubscriptionNo);
		if(orderbySubscriptionNo.length()==4) {
			orderbySubscriptionNo = "asc";
		}else if(orderbySubscriptionNo.equals("asc")) {
			orderbySubscriptionNo = "desc";
		}
		return "ShowSubscription.jsp?faces-redirect=true";
	}

	
	// SORTING by CLAIM HISTORY ################################################
	static String orderbyClaimHistoryId = "sort";
	static String orderbyClaimId = "sort";
	static String orderbyProviderId = "sort";
	static String orderbyPlanId = "sort";
	static String orderbyUhid = "sort";
	static String orderbyFromDate= "sort";
	static String orderbyToDate = "sort";
	static String orderbyClaimAmount = "sort";
	static String orderbySTATUS = "sort";
	static String orderbyComments = "sort";
	
	public String sortbyClaimHistoryId() {
		System.out.println("orderbyClaimHistoryId : "+orderbyClaimHistoryId);
		if(orderbyClaimHistoryId.length()==4) {
			orderbyClaimHistoryId = "asc";
		}else if(orderbyClaimHistoryId.equals("asc")) {
			orderbyClaimHistoryId = "desc";
		}
		return "ShowClaimHistory.jsp?faces-redirect=true";
	}

	
	// SEARCH BUTTON for search Subscription	
	
	public List<Subscription> searchSubscription(int subId, String insId, int planId) {
		System.out.println("SubId "+subId);
		System.out.println("InsId  " +insId);
		System.out.println("PlanId  " +planId);
		 sf = SessionHelper.getConnection();
         session = sf.openSession();
        Map<String,Object> sessionMap = 
        		FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
        
        Criteria criteria = session.createCriteria(Subscription.class);
        
        if (subId > 0) {
            System.out.println("Hey");
            criteria.add(Restrictions.eq("subId", subId));
            sessionMap.put("subId", subId);
            System.out.println(subId);
        }
        if (insId.length() > 0) {
        	System.out.println("Hi");
        	criteria.add(Restrictions.eq("insId", insId));
            sessionMap.put("insId",insId );
            System.out.println(insId);
        }
        if (planId > 0) {
            System.out.println("Hello");
            criteria.add(Restrictions.eq("planId", planId));
            sessionMap.put("planId", planId);
            System.out.println(planId);
        }
        
        List<Subscription> subList = criteria.list();
        System.out.println(subList);
        return subList ;
//        System.out.println(patientList);
//        sessionMap.put("patientList ", patientList);
//        return "PatientSearchShow.jsp?faces-redirect=true";
	}


}
