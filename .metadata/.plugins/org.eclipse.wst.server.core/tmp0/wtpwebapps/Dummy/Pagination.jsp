<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%> 
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%> 


<f:view>
<html>
    <head>
        <style>
			/* Define your CSS styles here */
			body {
				font-family: Arial, sans-serif;
				background-color: #f0f0f0;
			}

			h2 {
				color: #333;
			}

			table {
				width: 100%;
				border-collapse: collapse;
				margin-top: 20px;
			}

			table, th, td {
				border: 1px solid #333;
			}

			th {
				background-color: #333;
				color: #fff;
				padding: 10px;
			}

			td {
				padding: 10px;
			}
		</style>
    </head>
    <body>
        <h:form>
        <center>
                <h2><h:outputText value="Subscription Records"/></h2>
            </center>
        <h:dataTable value="#{paginationDao.subscriptionList}" var="e" border="3">
        	    <h:column>
                    <f:facet name="header">
                    	<h:outputLabel value="Subscription No" />
                    </f:facet>
                    <h:outputText value="#{e.subId}"/>
                </h:column>
                    <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="UHID" />
                    </f:facet>
                    <h:outputText value="#{e.uhid}"/>
                </h:column>
                 <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="Insurance Id" />
                    </f:facet>
                    <h:outputText value="#{e.insId}"/>
                </h:column>
                    <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="Insurance Name" />
                    </f:facet>
                    <h:outputText value="#{e.insName}"/>
                </h:column>
                    <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="Plan Id" />
                    </f:facet>
                    <h:outputText value="#{e.planId}"/>
                </h:column>
                    <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="Premium Amount" />
                    </f:facet>
                    <h:outputText value="#{e.premium}"/>
                </h:column>
                <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="Coverage Amount" />
                    </f:facet>
                    <h:outputText value="#{e.covAmount}"/>
                </h:column>
                <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="PayMode" />
                    </f:facet>
                    <h:outputText value="#{e.payMode}"/>
                </h:column>
                <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="Email" />
                    </f:facet>
                    <h:outputText value="#{e.email}"/>
                </h:column>
                <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="Registration Date" />
                    </f:facet>
                    <h:outputText value="#{e.regDate}"/>
                </h:column>
                <h:column>
                     <f:facet name="header">
                    	<h:outputLabel value="Status" />
                    </f:facet>
                    <h:outputText value="#{e.status}"/>
                </h:column>
        </h:dataTable>
        <br></br>
        <center>
         <!--The paging buttons-->
            <h:commandButton value="first" action="#{paginationDao.pageFirst}"
                             disabled="#{paginationDao.firstRow == 0}" />
            <h:outputText value="&nbsp;" escape="false"/>                 
            <h:commandButton value="prev" action="#{paginationDao.pagePrevious}"
                             disabled="#{paginationDao.firstRow == 0}" />
            <h:outputText value="&nbsp;" escape="false"/>
            <h:commandButton value="next" action="#{paginationDao.pageNext}"
                             disabled="#{paginationDao.firstRow + paginationDao.rowsPerPage >= paginationDao.totalRows}" />
            <h:outputText value="&nbsp;" escape="false"/>
            <h:commandButton value="last" action="#{paginationDao.pageLast}"
                             disabled="#{paginationDao.firstRow + paginationDao.rowsPerPage >= paginationDao.totalRows}" />
            <h:outputText value="&nbsp;" escape="false"/>
            <h:outputText value="Page #{paginationDao.currentPage} / #{paginationDao.totalPages}" />
            <br />
            </center>
        </h:form>
    </body>
</html>
</f:view>