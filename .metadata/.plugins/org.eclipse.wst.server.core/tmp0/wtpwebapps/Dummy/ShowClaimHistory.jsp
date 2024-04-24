<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>JSP Page</title>
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
            background-color: #ddd;
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
		<h:form>
			<center>
				<h2>
					<h:outputText value="Claim History Information" />
				</h2>
</center>
<center>
				<h:dataTable value="#{claimPage.getClaimHistoryList(uhid)}" var="i" border="3">
				<h:column>
				<f:facet name="header">
					<h:commandLink action="#{impl.sortbyClaimHistoryId()}" value="Claim History Id" style="color: black"/>
				</f:facet>
				<h:outputText value="#{i.claimHistoryId}" />
			</h:column>
				
				<h:column>
				<f:facet name="header">
					<h:commandLink action="#{impl.sortbyClaimId()}" value="Claim Id" style="color: black"/>
				</f:facet>
				<h:outputText value="#{i.claimId}" />
			</h:column>
					
					<h:column>
				<f:facet name="header">
					<h:commandLink action="#{impl.sortbyProviderId()}" value="Provider No" style="color: black"/>
				</f:facet>
				<h:outputText value="#{i.providerId}" />
			</h:column>
					
					<h:column>
				<f:facet name="header">
					<h:commandLink action="#{impl.sortbyPlanId()}" value="Plan Id" style="color: black"/>
				</f:facet>
				<h:outputText value="#{i.planId}" />
			</h:column>
					
					<h:column>
						<f:facet name="header">
							<h:outputLabel value="UHID" style="color: black"/>
						</f:facet>
						<h:outputText value="#{i.uhid}" />
					</h:column>
					<h:column>
				<f:facet name="header">
					<h:commandLink action="#{impl.sortbyFromDate()}" value="From Date" style="color: black"/>
				</f:facet>
				<h:outputText value="#{i.fromDate}" />
			</h:column>
					<h:column>
				<f:facet name="header">
					<h:commandLink action="#{impl.sortbyToDate()}" value="To Date" style="color: black"/>
				</f:facet>
				<h:outputText value="#{i.toDate}" />
			</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputLabel value="Claim Amount" style="color: black"/>
						</f:facet>
						<h:outputText value="#{i.claimAmount}" />
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputLabel value="Status" style="color: black"/>
						</f:facet>
						<h:outputText value="#{i.status}" />
					</h:column>
					<h:column>
						<f:facet name="header">
							<h:outputLabel value="Comments" style="color: black"/>
						</f:facet>
						<h:outputText value="#{i.comments}" />
					</h:column>
					</h:dataTable>
					<br></br>
					</center>
					<center>
         <!--The paging buttons-->
            <h:commandButton value="First" action="#{claimPage.pageFirst}" styleClass="paginationbutton"
                             disabled="#{claimPage.firstRow == 0}" />
            <h:outputText value="&nbsp;" escape="false"/>                 
            <h:commandButton value="Prev" action="#{claimPage.pagePrevious}" styleClass="paginationbutton"
                             disabled="#{claimPage.firstRow == 0}" />
            <h:outputText value="&nbsp;" escape="false"/>
            <h:commandButton value="Next" action="#{claimPage.pageNext}" styleClass="paginationbutton"
                             disabled="#{claimPage.firstRow + claimPage.rowsPerPage >= claimPage.totalRows}" />
            <h:outputText value="&nbsp;" escape="false"/>
            <h:commandButton value="Last" action="#{claimPage.pageLast}" styleClass="paginationbutton"
                             disabled="#{claimPage.firstRow + claimPage.rowsPerPage >= claimPage.totalRows}" />
            <h:outputText value="&nbsp;" escape="false"/>
            <br></br>
            <h:outputText value="Page #{claimPage.currentPage} / #{claimPage.totalPages}" />
            <br />
           
			<br></br>
			<h:commandButton action="ShowRecipient" value="Back" styleClass="backbutton"/>
			 </center>
			
		</h:form>
	</body>
	</html>
</f:view>
