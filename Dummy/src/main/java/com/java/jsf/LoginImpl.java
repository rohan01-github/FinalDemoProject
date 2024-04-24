package com.java.jsf;

import java.util.Map;
import java.util.Random;

import javax.faces.context.FacesContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;




public class LoginImpl {
	SessionFactory sf;
	Session session;
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
			sessionMap.put("loggedRecipient",  login.getUserName());
			System.out.println(login.getUserName());
//			sessionMap.put("uhid", login.getUhId());
			
			System.out.println(sessionMap.put("uhid", login.getUhid()));
			sf = SessionHelper.getConnection();
			session = sf.openSession();
			cr = session.createCriteria(Login.class);
			cr.add(Restrictions.eqOrIsNull("userName", login.getUserName()));
			Login recipientFound = (Login) cr.uniqueResult();
			sessionMap.put("recipientFound", recipientFound);
			sessionMap.put("uhid", recipientFound.getUhid());
			System.out.println("Sessionfactory");
			System.out.println(sessionMap.put("uhid", recipientFound.getUhid()));
			return "Dmmmjsp.jsp?faces-redirect=true";
		}else {
			sessionMap.put("errorMessage", "Invalid Credentials....");
			return "LoginPage.jsp?faces-redirect=true";
			}
	}
	
	public String obtainUhid() {
		 Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sf = SessionHelper.getConnection();
		session=sf.openSession();
		String userName=(String) sessionMap.get("loggedRecipient");
	//	String userName="smruti";
		Criteria cr=session.createCriteria(Patient.class);
		cr.add(Restrictions.eq("userName",userName));                    
		Patient obj=(Patient) cr.uniqueResult();
		sessionMap.put("Uhid", obj.getUhid());
		System.out.println(obj.getUhid());
		
		return obj.getUhid();
	}
	
	public String loginDAO(Login login) {
		Map<String,Object> sessionMap =
				FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		System.out.println("Inside login");
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Criteria cr = session.createCriteria(Login.class);
		cr.add(Restrictions.eq("userName",login.getUserName()));
		cr.add(Restrictions.eq("passWord",login.getPassWord()));		
		cr.setProjection(Projections.rowCount());
		long count = (long) cr.uniqueResult();
		sessionMap.put("userName", login.getUserName());
		String uhid=obtainUhid();
		if(count == 1) {
			System.out.println(uhid);
			sessionMap.put("uhid", uhid);
			return"Dmmmjsp.jsp?faces-redirect=true";
		}
		
		else {
			
			sessionMap.put("passWordErr4", "Enter a valid UserName and Password.");
			return "LoginPage.jsp?faces-redirect=true";
		}
	}
	public Patient ShowPatientDetails() {

		sf = SessionHelper.getConnection();
		session=sf.openSession();
	String uhid=obtainUhid();
		Criteria cr=session.createCriteria(Patient.class);
		cr.add(Restrictions.eq("uhid",uhid));
	Patient patientListt= (Patient) cr.uniqueResult();		
	System.out.println( "Patient"+patientListt);
		return patientListt;
	}


	public String logout() {
		return "LoginPage.jsp?faces-redirect=true";
	}


}
