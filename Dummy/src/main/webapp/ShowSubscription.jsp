<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>


<f:view>
	<html>
<head>
<style>
body {
	background-size: cover;
	background-image: url("hospital.webp");
	overflow: hidden;
}

.h1 {
	font-size: 40px;
	color: black;
	text-align: center;
	font-family: Georgia;
	margin-top: 10px;
}

.body {
	text-align: center;
}

.form {
	margin: 40px auto;
	border-radius: 5px;
	width: 95%;
}

table {
	border: 2px solid #000000;
	border-radius: 12px;
	text-align: center;
	font-weight: bold;
	width: 100%;
}

.decoration {
	text-decoration: none;
}

td {
	border-radius: 8px;
	color: black;
	padding: 10px;
	font-family: Monaco;
	font-size: 13px;
}

th {
	background-color: #30d1ac;
	border-radius: 10px;
	padding: 5px;
	font-size: 16px;
	text-align: center;
	font-family: Monaco;
	co lor: white;
}

.paginationbutton {
	background-color: white;
	font-family: Georgia;
	font-weight: bold;
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
	font-family: Georgia;
	font-weight: bold;
	margin: 0;
	cursor: pointer;
	border-radius: 12px;
	margin-top: 8px;
}

.backbutton:hover {
	background-color: grey;
}

.search-container {
	display: flex;
	align-items: center;
	margin-inline-start: 271px;
}

.search {
	width: 250px;
	border: 1px solid #555;
	padding: 9px 4px 9px 4px;
	background-color: rgba(255, 255, 255, 1.2);
	border-radius: 8px;
	border-width: 2px;
}

.searchButton {
	background-color: #73A580;
	font-family: Georgia;
	font-weight: bold;
	font-size: 14px;
	border-color: black;
	margin-left: 5px;
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

.resetButton {
	background-color: wheat;
	font-family: Georgia;
	font-weight: bold;
	font-size: 14px;
	border-color: black;
	margin-left: 5px;
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

.searchButton:hover, .resetButton:hover {
	background-color: grey;
}

.arrow {
	display: inline-block;
	transition: color 0.3s ease; /* Smooth transition effect */
	/* Animation for blinking effect */
	animation: blink 1s infinite;
}

.arrow:hover {
	color: red; /* Changing of color on hover */
}

</style>

<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepickr.css">

<script>
	function handleSearchInput(event) {
		const pressedKey = event.key;
		if (pressedKey === '%' || pressedKey === '_') {
			event.preventDefault();
		}
	}
</script>

</head>
<body>
</head>
<body>
	<h:form>

		<center>

			<div style="margin-top: 30px; font-size: 70px;">
				<h:outputText value="My Subscriptions" styleClass="h1" />
			</div>
			<br>

			<div class="search-container">

				<div>
					<h:outputText value="Insurance Name"
						style="font-size: 16px; font-family: Georgia; font-weight: bold; margin-inline-start: -133px;" />
					&nbsp;<br>

					<h:inputText styleClass="search" value="#{insName}" 
						autocomplete="off" onkeypress="handleSearchInput(event)"  />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>

				</div>
				<div>
					<h:outputText value="PayMode"
						style="font-size: 16px; font-family: Georgia; font-weight: bold; margin-inline-start: -84px;" />
					&nbsp;<br>

					<h:selectOneMenu value="#{payMode}"
						style="border-radius: 8px; padding: 9px; border-width: 2px;">
						<f:selectItem itemLabel="Select PayMode" itemValue="" />
						<f:selectItem itemLabel="Monthly" itemValue="Monthly" />
						<f:selectItem itemLabel="Quarterly" itemValue="Quarterly" />
						<f:selectItem itemLabel="Half-Yearly" itemValue="Half-Yearly" />
						<f:selectItem itemLabel="Yearly" itemValue="Yearly" />
					</h:selectOneMenu>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<div>
					<h:outputText value="Status"
						style="font-size: 16px; font-family: Georgia; font-weight: bold; margin-inline-start: -70px;" />
					&nbsp;<br>

					<h:selectOneMenu value="#{status}"
						style="border-radius: 8px; padding: 9px; border-width: 2px;">
						<f:selectItem itemLabel="Select Status" itemValue="" />
						<f:selectItem itemLabel="Active" itemValue="Active" />
						<f:selectItem itemLabel="Inactive" itemValue="Inactive" />
					</h:selectOneMenu>
					&nbsp;&nbsp;&nbsp;&nbsp;
				</div>				
				
				<div>
					<h:outputText value="" />
					<br>
					<h:commandButton
						action="#{searchController.searchInsuranceName(uhid,insName,payMode,status)}"
						styleClass="searchButton" value="Search" />
					&nbsp;&nbsp;&nbsp;&nbsp; <br>
				</div>
			</div>
			<h:commandButton action="#{impl.resetSubscriptionList(paginationDao)}"
				styleClass="resetButton" value="Reset" />
			<br>
			<h:outputText value="#{error}" style="color: red; margin-inline-start: 14px " />
			&nbsp; <br>


			<%-- Main dataTable Starts Here --%>

			<h:dataTable id="dataTable"
				value="#{paginationDao.getSubscriptionList(uhid,insName,payMode,status)}"	
				var="i" border="1"
				rendered="#{not empty paginationDao.getSubscriptionList(uhid,insName,payMode,status)}">

				<h:column>
					<f:facet name="header">
						<h:outputLabel value="Insurance No" style="color: black">
							<div>
								<h:commandLink action="#{impl.sortbyInsuranceNo()}"
									style="color: black" styleClass="decoration">
									<span class="arrow">&#11165;</span>
									<span class="arrow">&#11167;</span>
								</h:commandLink>
							</div>
						</h:outputLabel>
					</f:facet>
					<h:outputText value="#{i.insId}" />
				</h:column>

				<h:column>
					<f:facet name="header">
						<h:outputLabel value="Insurance Name" style="color: black">
							<div>
								<h:commandLink action="#{impl.sortbyInsuranceName()}"
									style="color: black" styleClass="decoration">
									<span class="arrow">&#11165;</span>
									<span class="arrow">&#11167;</span>
								</h:commandLink>
							</div>
						</h:outputLabel>
					</f:facet>
					<h:outputText value="#{i.insName}" />
				</h:column>

				<h:column>
					<f:facet name="header">
						<h:outputLabel value="Plan No" style="color: black">
							<div>
								<h:commandLink action="#{impl.sortbyPlanNo()}"
									style="color: black" styleClass="decoration">
									<span class="arrow">&#11165;</span>
									<span class="arrow">&#11167;</span>
								</h:commandLink>
							</div>
						</h:outputLabel>
					</f:facet>
					<h:outputText value="#{i.planId}" />
				</h:column>

				<h:column>
					<f:facet name="header">
						<h:outputLabel value="Premium Amount" style="color: black">
							<div>
								<h:commandLink action="#{impl.sortbyPremiumAmount()}"
									style="color: black" styleClass="decoration">
									<span class="arrow">&#11165;</span>
									<span class="arrow">&#11167;</span>
								</h:commandLink>
							</div>
						</h:outputLabel>
					</f:facet>
					<h:outputText value="#{i.premium}">
					   <f:convertNumber pattern="###0.00" />		
					</h:outputText>
				</h:column>


				<h:column>
					<f:facet name="header">
						<h:outputLabel value="Coverage Amount" style="color: black">
							<div>
								<h:commandLink action="#{impl.sortbyCovAmount()}"
									style="color: black" styleClass="decoration">
									<span class="arrow">&#11165;</span>
									<span class="arrow">&#11167;</span>
								</h:commandLink>
							</div>
						</h:outputLabel>
					</f:facet>
					<h:outputText value="#{i.covAmount}">
					  	<f:convertNumber pattern="###0.00" />	
					</h:outputText>
				</h:column>
				
				<h:column>
					<f:facet name="header">
						<h:outputLabel value="PayMode" style="color: black">
							<div>
								<h:commandLink action="#{impl.sortbyPayMode()}"
									style="color: black" styleClass="decoration">
									<span class="arrow">&#11165;</span>
									<span class="arrow">&#11167;</span>
								</h:commandLink>
							</div>
						</h:outputLabel>
					</f:facet>
					<h:outputText value="#{i.payMode}" />
				</h:column>
				

				<h:column>
					<f:facet name="header">
						<h:outputLabel value="Registration Date" style="color: black">
							<div>
								<h:commandLink action="#{impl.sortbyRegDate()}"
									style="color: black" styleClass="decoration">
									<span class="arrow">&#11165;</span>
									<span class="arrow">&#11167;</span>
								</h:commandLink>
							</div>
						</h:outputLabel>
					</f:facet>
					<h:outputText value="#{i.regDate.toString().substring(0,10)}" />
				</h:column>

				<h:column>
					<f:facet name="header">
						<h:outputLabel value="End Date" style="color: black">
							<div>
								<h:commandLink action="#{impl.sortbyEndDate()}"
									style="color: black" styleClass="decoration">
									<span class="arrow">&#11165;</span>
									<span class="arrow">&#11167;</span>
								</h:commandLink>
							</div>
						</h:outputLabel>
					</f:facet>
					<h:outputText value="#{i.endDate.toString().substring(0,10)}" />
				</h:column>
 
 				<h:column>
					<f:facet name="header">
						<h:outputLabel value="Status" style="color: black">
							<div>
								<h:commandLink action="#{impl.sortbyStatus()}"
									style="color: black" styleClass="decoration">
									<span class="arrow">&#11165;</span>
									<span class="arrow">&#11167;</span>
								</h:commandLink>
							</div>
						</h:outputLabel>
					</f:facet>
					<h:outputText value="#{i.status}" />
				</h:column>
 

			</h:dataTable>

			<div style="margin-top: 13px;">

				<h:panelGroup
					rendered="#{not empty paginationDao.getSubscriptionList(uhid,insName,payMode,status)}">
					<!--The paging buttons-->

					<h:commandButton value="First" action="#{paginationDao.pageFirst}"
						styleClass="paginationbutton"
						disabled="#{paginationDao.firstRow == 0}" />
					<h:outputText value="&nbsp;" escape="false" />
					<h:commandButton value="Prev"
						action="#{paginationDao.pagePrevious}"
						styleClass="paginationbutton"
						disabled="#{paginationDao.firstRow == 0}" />
					<h:outputText value="&nbsp;" escape="false" />
					<h:commandButton value="Next" action="#{paginationDao.pageNext}"
						styleClass="paginationbutton"
						disabled="#{paginationDao.firstRow + paginationDao.rowsPerPage >= paginationDao.totalRows}" />
					<h:outputText value="&nbsp;" escape="false" />
					<h:commandButton value="Last" action="#{paginationDao.pageLast}"
						styleClass="paginationbutton"
						disabled="#{paginationDao.firstRow + paginationDao.rowsPerPage >= paginationDao.totalRows}" />
					<h:outputText value="&nbsp;" escape="false" />
					<div style="margin-top: 10px;">
						<h:outputText
							value="Page: #{paginationDao.currentPage} / #{paginationDao.totalPages}"
							style="font-weight: bold; font-family: Georgia;	font-weight: bold;" />
					</div>

					<h:commandButton action="#{impl.backButton(paginationDao)}"
						styleClass="backbutton" value="Back" />

					<h:outputText value="&nbsp;" escape="false" />
				</h:panelGroup>
			</div>
		</center>

	</h:form>
</body>
	</html>
</f:view>