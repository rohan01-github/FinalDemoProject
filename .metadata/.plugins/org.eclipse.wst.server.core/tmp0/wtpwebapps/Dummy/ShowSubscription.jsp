<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
<head>
	<style>
body {
	font-family: Monospace;
	background-size: cover;
	background-color: #d9ded3;
}
 
.h1 {
	font-size: 40px;
	color: #ffffff;
	text-align: center;
	font-family: Candara;
	-webkit-animation: glow 1s ease-in-out infinite alternate;
	-moz-animation: glow 1s ease-in-out infinite alternate;
	animation: glow 1s ease-in-out infinite alternate;
}

.body {
	text-align: center;
}
 
.form {
	margin: 40px auto;
	border-radius: 5px;
	width: 95%;
}
 
.dataTable {
	width: 85%;
	border-collapse: collapse;
	margin-top: 30px;
	padding: 30%;
	background-color: rgba(255, 255, 255, 0.7);
	text-align: center;
	border: 3px solid #a6706c;
}

table{
	border: 2px solid;
	border-radius: 10px;
}
td{
	border-radius: 5px;
} 
th{
	background-color: #20bd3a;
	border-radius: 5px;
	padding: 5px;
	text-size: 6px;
	text-align: center;
	color: white;
	font-family: Courier;
}

.paginationbutton {
	background-color: #20bd3a;
	font-family: Monospace;
	font-size: 14px;
	border-color: black;
	padding: 8px 16px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 12px;
	transition: background-color 0.3s ease;
	color: black;
}
 
.paginationbutton:hover {
	background-color: #258034;
}

.pagination button:disabled {
            background-color: grey;
            color: #999;
            cursor: not-allowed;
        }
 
.backbutton {
	background-color: #20bd3a;
	color: black;
	border-color: black;
	padding: 5px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	font-family: Monospace;
	margin: 0;
	cursor: pointer;
	border-radius: 12px;
}
 
.backbutton:hover {
	background-color: #258034;
}
 
 

</style>
</head>
    <body>
</head>
<body>
	<h:form>
	<center>
	
			<h2>
				<h:outputText value="Subscription Information" />
			</h2>
	
                <h:dataTable value="#{paginationDao.getSubscriptionList(uhid)}" var="i" border="3">
			
				
				<h:column>
				<f:facet name="header">
					<h:commandLink action="#{impl.sortbySubscriptionNo()}" value="Subscription No" style="color: black"/>
				</f:facet>
				<h:outputText value="#{i.subId}" />
			</h:column>
				
				<h:column>
				<f:facet name="header">
					<h:commandLink action="#{impl.sortbyInsuranceNo()}" value="Insurance No" style="color: black"/>
				</f:facet>
				<h:outputText value="#{i.insId}" />
			</h:column>
				
				<h:column>
				<f:facet name="header">
					<h:commandLink action="#{impl.sortbyInsuranceName()}" value="Insurance Name" style="color: black"/>
				</f:facet>
				<h:outputText value="#{i.insName}" />
			</h:column>
			
			<h:column>
				<f:facet name="header">
					<h:commandLink action="#{impl.sortbyPlanNo()}" value="Plan No" style="color: black"/>
				</f:facet>
				<h:outputText value="#{i.planId}" />
			</h:column>
			
				<h:column>
					<f:facet name="header">
					<h:outputLabel value="Start Premium" style="color: black"/></f:facet>
					<h:outputText value="#{i.premium}" />
				</h:column>
				<h:column>
					<f:facet name="header">
					<h:outputLabel value="End Premium" style="color: black"/></f:facet>
					<h:outputText value="#{i.covAmount}" />
				</h:column>
				<h:column>
					<f:facet name="header">
					<h:outputLabel value="PayMode" style="color: black"/></f:facet>
					<h:outputText value="#{i.payMode}" />
				</h:column>
				<h:column>
					<f:facet name="header">
					<h:outputLabel value="Email Period" style="color: black"/></f:facet>
					<h:outputText value="#{i.email}" />
				</h:column>
								
				<h:column>
				<f:facet name="header">
					<h:commandLink action="#{impl.sortbyRegistrationDate()}" value="Registration Date" style="color: black"/>
				</f:facet>
				<h:outputText value="#{i.regDate}" />
			</h:column>
				
				<h:column>
					<f:facet name="header">
					<h:outputLabel value="Status" style="color: black"/></f:facet>
					<h:outputText value="#{i.status}" />
				</h:column>
				
				
			</h:dataTable>
			</center>
			<br><br/>
			<center>
         <!--The paging buttons-->
         
            <h:commandButton value="First" action="#{paginationDao.pageFirst}" styleClass="paginationbutton"
                             disabled="#{paginationDao.firstRow == 0}" />
            <h:outputText value="&nbsp;" escape="false"/>                 
            <h:commandButton value="Prev" action="#{paginationDao.pagePrevious}" styleClass="paginationbutton"
                             disabled="#{paginationDao.firstRow == 0}" />
            <h:outputText value="&nbsp;" escape="false"/>
            <h:commandButton value="Next" action="#{paginationDao.pageNext}" styleClass="paginationbutton"
                             disabled="#{paginationDao.firstRow + paginationDao.rowsPerPage >= paginationDao.totalRows}" />
            <h:outputText value="&nbsp;" escape="false"/>
            <h:commandButton value="Last" action="#{paginationDao.pageLast}" styleClass="paginationbutton"
                             disabled="#{paginationDao.firstRow + paginationDao.rowsPerPage >= paginationDao.totalRows}" />
            <h:outputText value="&nbsp;" escape="false"/>
            <br></br>
            <h:outputText value="Page: #{paginationDao.currentPage} / #{paginationDao.totalPages}" />
            
           
			<br></br>
			
			<h:commandButton action="ShowRecipient" value="Back" styleClass="backbutton"/>
			 </center>
	</h:form>
</body>
	</html>
</f:view>
