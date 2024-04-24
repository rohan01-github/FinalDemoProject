<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
	<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Form</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="ContactStyle.css">
</head>
<body>
<body>
	<div class="navbar">
		<a href="Dmmmjsp.jsf">Home</a>
	</div>
	<div class="contact-section">
		<div class="contact-info">
			<div>
				<i class="fa fa-home"></i> Address,City,Country
			</div>
			<div>
				<i class="fa fa-envelope"></i> contact@email.com
			</div>
			<div>
				<i class="fa fa-phone"></i> +00 0000 000 000
			</div>
			<div>
				<i class="fa fa-clock-o"></i></i>Mon - Fri 8.00 AM to 5.00 PM
			</div>
			<h2>Contact Us</h2>
			<div class="contact-form">

				<div class="contact">

					<h:form>
						<h:outputLabel value="Enter Name : " />
						<h:inputText styleClass="text-box" value="#{contactData.name}" />
						<h:outputLabel value="Enter Email : " />
						<h:inputText styleClass="text-box" value="#{contactData.mail}" />
						<h:outputLabel value="Enter Message : " />
						<h:inputText styleClass="text-box" value="#{contactData.message}" />
						<h:commandButton action="#{contactImpl.sendMail(contactData)}"
							value="Send" styleClass="send-btn" />
					</h:form>
				</div>
			</div>
		</div>
</body>
	</html>
</f:view>