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
	<h2>Recipient Login</h2>
	
	<h:outputText value="UserName : " />
	<h:inputText id="userName" value="#{login.userName}" /><br/><br/>
	<h:outputText value="Password : " />
	<h:inputText id="passWord" value="#{login.passWord}" /><br/><br/>
	<h:commandButton action="#{impl.loginDao(login)}" value="Login" /><br/><br/>
	<h:outputText value="#{errorMessage}"/><br/><br/>
	<br/><br/>
	</center>
	</h:form>
	
	</body>
	</html>
</f:view>
