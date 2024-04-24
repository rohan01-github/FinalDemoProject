<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
<head>
	<style>
body {
	
	font-family: "Poppins";
	background-size: cover;
	background-image: url("image 1.jpg");
}

.form2 {
	font-family: "Poppins";
	color: #FF0000;
	max-width: 300px;
	margin: 0 auto;
	padding: 10px;
	background-color: rgba(0, 0, 0, 0.7);
	/* Black background with 70% opacity */
	border-radius: 6px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	/* border: 2px solid #000; */
} 

.form3 {
	font-family: "Poppins";
	color: #FF0000;
	max-width: 900px;
	margin: 0 auto;
	padding: 10px;
	background-color: rgba(0, 0, 0, 0.7);
	/* Black background with 70% opacity */
	border-radius: 3px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	/* border: 2px solid #000; */
} 
.h1 {
	font-size: 40px;
	color: white;
	text-align: center;
	font-family: Monospace;
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

table{
	border: 2px solid #000000;
	border-radius: 12px;
	text-align: center;
	font-weight: bold;
}
.decoration{
	text-decoration: none;
}

td{
	border-radius: 5px;
	color: white;
	background-color: rgba(0,0,0,0.6);
} 
th{
	background-color: #d5dedc;
	border-radius: 10px;
	padding: 5px;
	text-size: 6px;
	text-align: center;
	color: white;
	font-family: Courier;
}

.paginationbutton {
	background-color: white;
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
	background-color: grey;
}

.paginationbutton:disabled {
            background-color: #c4c2bb;
            color: #999;
            cursor: not-allowed;
        }
 
.backbutton {
	background-color: white;
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
	background-color: grey;
}

</style>
</head>
    <body>
</head>
<body>
	<h:form>
	<center>
			<h2>
				<h:outputText value="My Subscriptions" styleClass="h1"/>
			</h2>
	
                <h:dataTable value="#{paginationDao.getSubscriptionList(uhid)}" var="i" border="1"
                		rendered="#{not empty paginationDao.getSubscriptionList(uhid)}">
			
				
				<h:column>
				<f:facet name="header">
					<h:commandLink action="#{impl.sortbySubscriptionNo()}" value="Subscription No" style="color: black"
					 styleClass="decoration">
					 <p id="arr1" style="display: inline; margin: 0;">&#11165;</p>
						<p id="arr2" style="display: inline; margin: 0;">&#11167;</p>
						</h:commandLink>
				</f:facet>
				<h:outputText value="#{i.subId}" />
			</h:column>
			
				<h:column>
					<f:facet name="header">
					<h:outputLabel value="Insurance No" style="color: black"/></f:facet>
					<h:outputText value="#{i.insId}" />
				</h:column>
				
				<h:column>
					<f:facet name="header">
					<h:outputLabel value="Insurance Name" style="color: black"/></f:facet>
					<h:outputText value="#{i.insName}" />
				</h:column>
				
				<h:column>
					<f:facet name="header">
					<h:outputLabel value="Plan No" style="color: black"/></f:facet>
					<h:outputText value="#{i.planId}" />
				</h:column>
				
				<h:column>
				<f:facet name="header">
					<h:commandLink action="#{impl.sortbyPremiumAmount()}" value="Premium Amount" style="color: black"
					 styleClass="decoration">
					 <p id="arr1" style="display: inline; margin: 0;">&#11165;</p>
						<p id="arr2" style="display: inline; margin: 0;">&#11167;</p>
						</h:commandLink>
				</f:facet>
				<h:outputText value="#{i.premium}" />
			</h:column>
			
				
				<h:column>
				<f:facet name="header">
					<h:commandLink action="#{impl.sortbyCovAmount()}" value="Coverage Amount" style="color: black"
					 styleClass="decoration">
					 <p id="arr1" style="display: inline; margin: 0;">&#11165;</p>
						<p id="arr2" style="display: inline; margin: 0;">&#11167;</p>
						</h:commandLink>
				</f:facet>
				<h:outputText value="#{i.covAmount}" />
			</h:column>
			
				<h:column>
					<f:facet name="header">
					<h:outputLabel value="PayMode" style="color: black"/></f:facet>
					<h:outputText value="#{i.payMode}" />
				</h:column>
			  	<h:column>
					<f:facet name="header">
					<h:outputLabel value="Email" style="color: black"/></f:facet>
					<h:outputText value="#{i.email}" />
				</h:column>  
				
			
				<h:column>
				<f:facet name="header">
					<h:commandLink action="#{impl.sortbyRegDate()}" value="Registration Date" style="color: black"
					 styleClass="decoration">
					 <p id="arr1" style="display: inline; margin: 0;">&#11165;</p>
						<p id="arr2" style="display: inline; margin: 0;">&#11167;</p>
						</h:commandLink>
				</f:facet>
				<h:outputText value="#{i.regDate.toString().substring(0,10)}" />
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
			<br></br>
			
			
			 <h:panelGroup rendered="#{not empty paginationDao.getSubscriptionList(uhid)}">
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
            <h:outputText value="Page: #{paginationDao.currentPage} / #{paginationDao.totalPages}" 
            		style="color:'white'"/>
            
			<br></br>
		
			<h:commandButton action="Dashboard" value="Back" styleClass="backbutton"/> 
			<h:outputText value="&nbsp;" escape="false"/>
			<h:commandButton action="ShowClaimHistory" value="Claim History" styleClass="backbutton"/>
			
			</h:panelGroup>
			
			<h:panelGroup rendered="#{empty paginationDao.getSubscriptionList(uhid)}">
				<div class="form2">
				<h:outputText value="Uh oh... :(" rendered="#{empty paginationDao.getSubscriptionList(uhid)}" /> <br>
				<h:outputText value="You have not taken any policies yet!" rendered="#{empty paginationDao.getSubscriptionList(uhid)}" />
                       <h:commandLink action="SubscribeNow" value="Subscribe Now" />
                       <br></br>
                       <h:commandButton action="Dashboard" value="Back" styleClass="backbutton"/>
             	</div>
             </h:panelGroup>
		
			 
			 </center>
	</h:form>
</body>
	</html>
</f:view>