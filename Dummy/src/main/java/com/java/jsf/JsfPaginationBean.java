package com.java.jsf;

import java.util.List;
import java.util.Map;

import javax.faces.context.FacesContext;

public class JsfPaginationBean {

	//private static final long serialVersionUID = 1L;	// Here serialVersionUID provides control to programmer which version of class is not compatible
	private List<Subscription> cdList;		// cdList variables holds the list of data records retrieved from DB
	private Impl queryHelper;				// instance of Impl is created
	/**      
	 * pagination stuff
	 */
	private int totalRows;		// This represents the total rows of data records which is available
	static private int firstRow ;	// It represents the firstRow of the currentPage
	private int rowsPerPage;		// calculates no. of rows per page.
	private int totalPages;			
	//private int pageRange;		
	//private Integer[] pages;	
	private int currentPage;
	

	/**
	 * Creates a new instance of JsfPaginationBean
	 */
	public JsfPaginationBean() {
		queryHelper = new Impl();	 
		/**
		 * the below function should not be called in real world application
		 */
		// Set default values somehow (properties files?).
		rowsPerPage = 5; // Default rows per page (max amount of rows to be displayed at once).
		//pageRange = 10; 
	}

	public List<Subscription> getSubscriptionList(String uhid,String insName,String payMode,String status) {
		try {
			// sessionMap is used to store data in the user's session.
			Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();	// Here sessionMap holds the data of particular user session
			sessionMap.put("uhid", uhid);
			sessionMap.put("insName", insName);
			sessionMap.put("payMode", payMode);
			sessionMap.put("status", status);
			System.out.println("List of Insurance of this UHID is : " +uhid);
			cdList=null;		// Taking cdList as null by default
			if (cdList == null) {
				loadSubscription(uhid,insName,payMode,status);
			}
			System.out.println("Size is : "+cdList.size());
			
			if(cdList.size()!=0) {	
				sessionMap.remove("error");
				sessionMap.put("SubscriptionList", cdList);	//<>--
				System.out.println("Real cdList Size is "+ cdList);
				return cdList;
			}else {
				sessionMap.put("error", "No Record Found!");			
				return null;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return null;	
	}
	
	public void setCdList(List<Subscription> cdList) {
		this.cdList = cdList;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getFirstRow() {
		return firstRow;
	}
	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}
	public int getRowsPerPage() {
		return rowsPerPage;
	}
	public void setRowsPerPage(int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
//	public Integer[] getPages() {
//		return pages;
//	}
//	public void setPages(Integer[] pages) { 
//		this.pages = pages;
//	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	private void loadSubscription(String uhid,String insName,String payMode,String status){
		System.out.println("First Row  " +firstRow);
		System.out.println("Count  " +rowsPerPage);
		
		try {
			cdList = queryHelper.getListOfSubscription(uhid, insName, payMode, status, firstRow, rowsPerPage);	// Here queryHelper helps in interaction with the data source
			
			System.out.println("Subscription Count is  " +cdList);
			totalRows = queryHelper.countRows(uhid,insName,payMode,status);
	
			System.out.println("Total Rows  " +totalRows);
			// Set currentPage, totalPages and pages.
			
			currentPage = (totalRows / rowsPerPage) - ((totalRows - firstRow) / rowsPerPage) + 1;
			totalPages = (totalRows / rowsPerPage) + ((totalRows % rowsPerPage != 0) ? 1 : 0);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


	// Paging actions
	// -----------------------------------------------------------------------------
	public void pageFirst()  {
		page(0);
	}
	public void pageNext() {	
		page(firstRow + rowsPerPage);
	}
	public void pagePrevious() {
		page(firstRow - rowsPerPage);
	}
	public void pageLast(){
		page(totalRows - ((totalRows % rowsPerPage != 0) ? totalRows % rowsPerPage : rowsPerPage));
	}
//	public void page(ActionEvent event) throws ParseException{
//		page(((Integer) ((UICommand) event.getComponent()).getValue() - 1) * rowsPerPage);
//	}
	private void page(int firstRow){
		try {
			Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
			this.firstRow = firstRow;
			System.out.println("Here FirstRow is : "+firstRow);
			String uhid = (String)sessionMap.get("uhid");
			String insName = (String)sessionMap.get("insName");
			String payMode = (String)sessionMap.get("payMode");
			String status = (String)sessionMap.get("status");
			loadSubscription(uhid,insName,payMode,status);		// Here loadSubcription is called to refresh subscription list based on pagination settings
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}