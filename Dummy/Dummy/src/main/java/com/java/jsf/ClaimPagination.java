package com.java.jsf;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.faces.component.UICommand;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class ClaimPagination {

	private static final long serialVersionUID = 1L;
	private List<ClaimHistory> cdList;
	private Impl queryHelper;
	/**      
	 * pagination stuff
	 */
	private int totalRows;
	static private int firstRow;
	private int rowsPerPage;
	private int totalPages;
	private int pageRange;
	private Integer[] pages;
	private int currentPage;
	

	/**
	 * Creates a new instance of JsfPaginationBean
	 */
	public ClaimPagination() {
		queryHelper = new Impl();
		/**
		 * the below function should not be called in real world application
		 */
		// Set default values somehow (properties files?).
		rowsPerPage = 1; // Default rows per page (max amount of rows to be displayed at once).
		pageRange = 1; // Default page range (max amount of page links to be displayed at once).
	}

	public List<ClaimHistory> getClaimHistoryList(String uhid) throws ParseException{
		
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		sessionMap.put("uhid", uhid);
		System.out.println("List of Claims of this UHID is : " +uhid);
		if (cdList == null) {
			loadClaimHistory(uhid);
		}
		System.out.println("Size is : "+cdList.size());
		
		if(cdList.size()!=0) {		
			sessionMap.put("notFoundErr", " ");						
			sessionMap.put("ClaimHistoryList", cdList);
			System.out.println(cdList);
			return cdList;
		}else {
			sessionMap.put("notFoundErr", "Record Not Found");			
			return null;
		}
		
		
	}
	public void setCdList(List<ClaimHistory> cdList) {
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
	public int getPageRange() {
		return pageRange;
	}
	public void setPageRange(int pageRange) {
		this.pageRange = pageRange;
	}
	public Integer[] getPages() {
		return pages;
	}
	public void setPages(Integer[] pages) {
		this.pages = pages;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	private void loadClaimHistory(String uhid) throws ParseException{
		System.out.println("First Row  " +firstRow);
		System.out.println("Count  " +rowsPerPage);
		
		cdList = queryHelper.getListOfClaimHistory(uhid, firstRow, rowsPerPage);
		//cdList = queryHelper.getListOfSubscription(firstRow, rowsPerPage);
		
		System.out.println("ClaimHistory Count is  " +cdList);
		totalRows = queryHelper.countCHRows(uhid);
		//totalRows = queryHelper.countRows();
		System.out.println("Total Rows  " +totalRows);
		// Set currentPage, totalPages and pages.
		currentPage = (totalRows / rowsPerPage) - ((totalRows - firstRow) / rowsPerPage) + 1;
		totalPages = (totalRows / rowsPerPage) + ((totalRows % rowsPerPage != 0) ? 1 : 0);
		int pagesLength = Math.min(pageRange, totalPages);
		pages = new Integer[pagesLength];
		// firstPage must be greater than 0 and lesser than totalPages-pageLength.
		int firstPage = Math.min(Math.max(0, currentPage - (pageRange / 2)), totalPages - pagesLength);
		// Create pages (page numbers for page links).
		for (int i = 0; i < pagesLength; i++) {
			pages[i] = ++firstPage;
		}
		
		
	}
	// Paging actions
	// -----------------------------------------------------------------------------
	public void pageFirst() throws ParseException{
		page(0);
	}
	public void pageNext() throws ParseException{
		page(firstRow + rowsPerPage);
	}
	public void pagePrevious() throws ParseException{
		page(firstRow - rowsPerPage);
	}
	public void pageLast() throws ParseException{
		page(totalRows - ((totalRows % rowsPerPage != 0) ? totalRows % rowsPerPage : rowsPerPage));
	}
	public void page(ActionEvent event) throws ParseException{
		page(((Integer) ((UICommand) event.getComponent()).getValue() - 1) * rowsPerPage);
	}
	private void page(int firstRow) throws ParseException {
		Map<String, Object> sessionMap = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		this.firstRow = firstRow;
		String uhid = (String)sessionMap.get("uhid");
		loadClaimHistory(uhid);
	}
}