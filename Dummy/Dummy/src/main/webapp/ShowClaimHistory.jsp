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
	background-image: url("hospital.webp");
	
}
 
.h1 {
	font-size: 40px;
	color: #000000;
	text-align: center;
	font-family: Monospace;
	-webkit-animation: glow 1s ease-in-out infinite alternate;
	-moz-animation: glow 1s ease-in-out infinite alternate;
	animation: glow 1s ease-in-out infinite alternate;
}

@-webkit-keyframes glow {
  from {
    text-shadow: 0 0 3px #ffffff, 0 0 7px #ffffff, 0 0 10px #ffffff, 0 0 15px #ffffff, 0 0 20px #ffffff, 0 0 25px #ffffff, 0 0 30px #ffffff;
  }
  to {
    text-shadow: 0 0 3px #2aebb7, 0 0 7px #2aebb7, 0 0 10px #2aebb7, 0 0 15px #2aebb7, 0 0 20px #2aebb7, 0 0 25px #2aebb7, 0 0 30px #2aebb7;
  }
}

.body {
	text-align: center;
}
 
.form {
	margin: 40px auto;
	border-radius: 5px;
	width: 95%;
}
 
table{
	border: 2px solid;
	border-radius: 10px;
	text-align: center;
	font-weight: bold;
}
.decoration{
	text-decoration: none;
}

td{
	border-radius: 5px;
} 
th{
	background-color: #30d1ac;
	border-radius: 8px;
	padding: 5px;
	text-size: 6px;
	text-align: center;
	color: white;
	font-family: Courier;
}

.paginationbutton {
	background-color: #30d1ac;
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
	background-color: #179674;
}

.paginationbutton:disabled {
            background-color: #8ae2ed;
            color: #999;
            cursor: not-allowed;
        }
 
.backbutton {
	background-color: #30d1ac;
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
	background-color: #179674;
}
 
 

</style>
	</head>
	<body>
		<h:form>
			<center>
				<h2>
					<h:outputText value="Claim History Information" styleClass="h1"/>
				</h2>
</center>
<center>
				<h:dataTable value="#{claimPage.getClaimHistoryList(uhid)}" var="i" border="3">
				<h:column>
				<f:facet name="header">
					<h:commandLink action="#{impl.sortbyClaimHistoryId()}" value="Claim History Id" style="color: black"
					styleClass="decoration">
					<p id="arr1" style="display: inline; margin: 0;">&#11165;</p>
						<p id="arr2" style="display: inline; margin: 0;">&#11167;</p>
					</h:commandLink>
				</f:facet>
				<h:outputText value="#{i.claimHistoryId}" />
			</h:column>
				
				<h:column>
						<f:facet name="header">
							<h:outputLabel value="Claim Id" style="color: black"/>
						</f:facet>
						<h:outputText value="#{i.claimId}" />
					</h:column>
					
					<h:column>
						<f:facet name="header">
							<h:outputLabel value="Provider Id" style="color: black"/>
						</f:facet>
						<h:outputText value="#{i.providerId}" />
					</h:column>
					
					<h:column>
						<f:facet name="header">
							<h:outputLabel value="Plan Id" style="color: black"/>
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
							<h:outputLabel value="From Date" style="color: black"/>
						</f:facet>
						<h:outputText value="#{i.fromDate.toString().substring(0,10)}" />
					</h:column>
					
					<h:column>
						<f:facet name="header">
							<h:outputLabel value="To Date" style="color: black"/>
						</f:facet>
						<h:outputText value="#{i.toDate.toString().substring(0,10)}" />
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
			<h:commandButton action="ShowSubscription" value="Back" styleClass="backbutton"/>
			 </center>
			
		</h:form>
	</body>
	</html>
</f:view>
