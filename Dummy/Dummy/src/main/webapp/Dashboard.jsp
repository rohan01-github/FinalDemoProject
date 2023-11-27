<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>JSP Page</title>
	</head>
	<body>
		<h:form>
		<center>
                   <h2> Welcome to Sunshine Hospital </h2> 
                   
                   <h:outputText value="#{loggedCustomer}" />
                    <br/><br/>
			
			<h:commandLink action="ShowSubscription" value="ShowSubscription" /><br>
</center>
				
		</h:form>
	</body>
	</html>
</f:view>
