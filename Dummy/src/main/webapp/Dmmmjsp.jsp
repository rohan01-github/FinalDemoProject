<%@page contentType="text/html"%>

<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>


<f:view>
	<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hospital</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/style11.css">
<link rel="stylesheet" href="css/style12.css">
<link rel="stylesheet" href="css/style13.css">
<style>
/* Add your styles here */

* {
  margin: -3px;
  padding: 0;
  box-sizing: border-box;
}

.navbar a {
    float: left;
    font-size: 16px;
    color: black;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
.footer {
	background-color: #333;
	color: #fff;
	padding: 20px;
	text-align: center;
	position: fixed;
	bottom: 0;
	width: 100%;
}
 
body {
    font-family: 'FontAwesome';
    font-size: 16px;
    color: #bb3636;
    background-image: url(Background.jpg);
    background-size: cover;
}
 
body, html {
  width: 100%;
  height: 100%;
background-color: white;
}
 
 
.container {
  width: 100%;
  height: 117%;
  position: relative;
  background: #355C7D;
  /* fallback for old browsers */
   background: -webkit-linear-gradient(to right,#051c30, #6C5B7B, #355C7D);
  /* Chrome 10-25, Safari 5.1-6 */
   background: linear-gradient(to right,#051c30, #6C5B7B, #355C7D);
  /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
   overflow: hidden;
}
 
.button-container {
	display: flex;
	justify-content: flex-end;
	margin-top: 20px;
}
 
.button-container input[type="button"] {
	padding: 10px 20px;
	    margin: 0 6px 13px;
	font-size: 16px;
	cursor: pointer;
	background-color: #d33636;
	color: #fff;
	border: none;
	border-radius: 5px;
}
 
.button-container input[type="button"]:hover {
	background-color: #45a049;
}
 
.fa-user {
	color: #00fff5;
	margin-left: 1116px;
	position: relative;
	top:-24px;
	cursor: pointer;
	width: 10px
}
 
/* .navbar a { */
/*     float: left; */
/*     font-size: 16px; */
/*     color: white; */
/*     text-align: center; */
/*     padding: 14px 16px; */
/*     text-decoration: none; */
/* } */
 
.popup {
    display: none;
    position: absolute;
    top: 32%;
    left: 76%;
    transform: translate(-50%, -50%);
    padding: 20px;
    background-color: #fff;
    border: 11px solid #ccc;
    border-radius: 12px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    z-index: 1000;
    width: 300px;
    transition: opacity 0.3s ease-in-out;
}
 
 
.popup button {
    background-color: #4CAF50;
    color: white;
    margin-top: 10px;
    padding: 7px;
    border: none;
    cursor: pointer;
}
 
h2 {
	color: #2ea528;
	font-weight: 800;
	margin-left: 10px;
}
 
 
.container1 {
    width: 100%;
    height: 52%;
    position: relative;
    background: #0a2a45;
    overflow: hidden;
}
 
.container {
	/* width: 100%;
	height: 50%;
	position: relative;
	background: #355C7D;
	overflow: hidden;
	padding: 15px; */
	height: 50%;
	padding: 15px;
}
 
.container img {
	width: 107%;
	height: 159%;
	object-fit: cover;
	position: absolute;
	margin: auto;
	top: 116px;
	bottom: 0;
	left: 0;
	right: 0;
	animation: fade 20s;
	left: 1px;
}
 
h7 {
	color: #c836d3;
	font-size: 52px;
}
 
p {
	font-size: 20px;
	color: white;
}
 
.summary-container {
	text-align: center;
}
 
.summary {
	font-size: 20px;
	color: #c836d3;
	margin-bottom: 22px;
}
 
.btn1 {
	font-size: 18px;
	padding: 10px 20px;
	background-color: #45a049;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
}
 
.success {
	color: blue;
	background-color: white;
	border-radius: 13px;
	padding: 9px;
	margin-top: 5px;
	margin-bottom: 15px;
	margin-right: 20px;
	margin-left: 23px;
}
 
.divclass {margin	
}
 
a {
  color: #00fff5;
  text-decoration: none;
}
 
.imageCon {
	height: 293px;
	width: 385px;
}
 
 
element.style {
}
li {
    margin-bottom: 10px;
    margin-left: 51px;
}
 
navigation{
	color: black;
}
</style>
</head>
<body>

	<div class="button-container">


		<div class="Logo">
			<img alt="images" src="healthcarelogo.png"
				style="width: 80px; height: 51px;">
		</div>



		<input type="button" value="Emergency 1078"> <input
			type="button" value="Lifeline 1860-500-1078">
	</div>

	<div>

		<div class="navbar">
			<div>
				<a href="#home">Home</a> <a href="hospitalHistory.jsf">History</a>

				<div class="dropdown">
					<button class="dropbtn">
						Providers <i class="fa fa-caret-down"></i>
					</button>
					<div class="dropdown-content">
						<a href="searchProviders.jsf">SearchProviders</a>
					</div>
				</div>

				<div class="dropdown">
					<button class="dropbtn">
						Insurance <i class="fa fa-caret-down"></i>
					</button>
					<div class="dropdown-content" >
						<a href="ShowSubscription.jsf">Subscription</a>
					</div>
				</div>

				<div class="dropdown">
					<button class="dropbtn">
						Action <i class="fa fa-caret-down"></i>
					</button>
					<div class="dropdown-content">
						<a href="search and viewClaims.jsf">Search and View Claims</a>
					</div>
				</div>

				<div class="dropdown">
					<button class="dropbtn">
						Appointment <i class="fa fa-caret-down"></i>
					</button>
					<div class="dropdown-content">
						<a href="makeAppointment.jsf">Book An Appointment</a> <a
							href="appointmentDetails.jsf">Appointment Details</a>
					</div>
				</div>



				<a href="contact.jsf">Contact</a> <a href="hello.jsf">About Us</a>
			</div>
<style>
			.icons{
			border: 1px solid white;
			max-width: 41px;
    margin-top: -35px;
    margin-left: 88%;
    border-radius: 28px
			}
			.log_button{
			
			}
			</style>
<div>
			<div>
			            <img alt="Icons" src="icon.png" onclick="openForm()" class="icons">
			</div>
			

			<div id="myPopup" class="popup">
			<!-- <span>Name: Smruti Prangya Rath</span><br> <span>Age: 21</span><br>
			<span>Phone No: 878887887</span><br> <span>Address:
				Cuttack</span><br> -->
			<h:outputLabel value="uhid:" />
                    <h:outputText value="#{loginImpl.ShowPatientDetails().uhid}" /><br/>
				<h:outputLabel value="FirstName:" />
                    <h:outputText value="#{loginImpl.ShowPatientDetails().firstName}" /><br/>
                    <h:outputLabel value="LastName:" />
                    <h:outputText value="#{loginImpl.ShowPatientDetails().lastName}" /><br/>
                    <h:outputLabel value="PhoneNo:" />
                    <h:outputText value="#{loginImpl.ShowPatientDetails().phone_no}" /><br/>
                    <h:outputLabel value="Email:" />
                    <h:outputText value="#{loginImpl.ShowPatientDetails().email}" /><br/>
			<button onclick="closeForm()">Close</button>
		</div>

			<div class="log_button">
				<a href="Login.jsf" class="btn success"
					style="margin-top: -25px; color: black">Log out</a>
			</div>
		</div>

	</div>

	<section>

		<div class="container">

			<div style="margin-right: 50px;"></div>
			<div class="contain_img">
				<img alt="#" src="images/img3.png"
					style="width: 450px; margin-left: 65%;">
			</div>
			<h7>Hello There!</h7>
			<h1 class="hospital-title">WELCOME TO SAI HOSPITAL</h1>
			<section>
				<h2>Take the world's best quality Treatment</h2>

			</section>
			<p>Always caring about your health, We are here to help you!</p>
			<div class="imgeCon"
				style="position: relative; float: right; top: -284px; right: 9px;">
				<img src="img/containerImage.jpg" class="imageCon">
			</div>
		</div>


		<script src="js/script.js"></script>
	</section>

	<div class="container1" style="color: #ffffff;">

		<section>
			<h2 style="margin-left: 15px;">Understanding Hospital Management
				Systems</h2>
			<p class="scroll-p" style="margin-left: 15px;">Hospital
				Management Systems are comprehensive software solutions designed to
				automate and streamline the day-to-day operations of a healthcare
				facility. From patient registration and appointment scheduling to
				billing and inventory management, HMS integrates various functions
				into a unified platform.</p>
		</section>
		<div class="summary-container">
			<p class="summary" style="margin-left: 15px;">This is a brief
				summary of what you can learn more about.</p>
			<a href="hello.jsp" class="#">Learn More</a> <br> <br>
		</div>

		<div class="divclass">
			<a href="makeAppointment.jsf">
				<button class="btn success">Book Appointment</button>
			</a> <a href="confermation.jsf">
				<button class="btn success">Update Appointment</button>
			</a> <a href="makeAppointment.jsf">
				<button class="btn success">Pending Appointments</button>
			</a> <a href="makeAppointment.jsf">
				<button class="btn success">Previous Appointments</button>
			</a> <a href="makeAppointment.jsf">
				<button class="btn success">Search Appointments</button>
			</a> <a href="makeAppointment.jsf">
				<button class="btn success">Cancelled Appointments</button>
			</a>

		</div>

	</div>

	<section>
		<h2>Key Features and Benefits</h2>
		<ul>
			<li><strong>Patient Information Management:</strong> HMS enables
				healthcare providers to maintain accurate and up-to-date patient
				records. From demographics to medical history, all information is
				easily accessible, ensuring quick and informed decision-making.</li>
			<li><strong>Appointment Scheduling:</strong> Efficient
				appointment scheduling is critical for managing patient flow. HMS
				allows staff to schedule, reschedule, and track appointments
				seamlessly, reducing waiting times and improving patient
				satisfaction.</li>
			<li><strong>Billing and Invoicing:</strong> HMS automates the
				billing process, generating accurate invoices for services rendered.
				This not only reduces billing errors but also enhances financial
				transparency for both patients and the hospital.</li>
			<li><strong>Inventory Management:</strong> Tracking and managing
				medical supplies and equipment is simplified with HMS. Automated
				alerts for low stock levels prevent shortages, ensuring that
				healthcare providers have the necessary resources at all times.</li>
			<li><strong>Electronic Health Records (EHR):</strong> The
				transition from paper records to electronic health records has been
				a transformative aspect of HMS. EHRs streamline data retrieval,
				minimize errors, and support better collaboration among healthcare
				professionals.</li>
			<li><strong>Analytics and Reporting:</strong> Hospital
				administrators can leverage analytics tools within HMS to gain
				insights into hospital performance. Data-driven decisions contribute
				to resource optimization and improved patient outcomes.</li>
		</ul>
	</section>

	<section>
		<div>
			<h2>Explore our Centres Of Clinical Excellence</h2>
			<p>learn about the world class health care we provide</p>
		</div>
	</section>



	<footer>
		<div class="footer-content">
			<div class="footer-section">
				<h3>Quick Links</h3>
				<ul>
					<li><a href="MenuPage.xhtml">Home</a></li>
					<li><a href="#">Features</a></li>
					<li><a href="hello.jsp">About Us</a></li>
					<li><a href="contact.jsf">Contact</a></li>
				</ul>
			</div>

			<div class="footer-section">
				<h3>Contact Us</h3>
				<p>Email: info@hospitalmanagementsystem.com</p>
				<p>Phone: +91 123-456-7890</p>
				<p>Address: Kundahalli, EPIP Zone, Whitefield, Banglore</p>
			</div>

			<div class="footer-section">
				<h3>Connect with Us</h3>
				<a href="#" class="social-icon"><i
					class="fa-solid fa-magnifying-glass"></i></a> <a href="#"
					class="social-icon"><i class="fab fa-twitter"></i></a> <a href="#"
					class="social-icon"><i class="fab fa-linkedin"></i></a> <a href="#"
					class="social-icon"><i class="fab fa-instagram"></i></a>
			</div>
		</div>
		<p class="footer-bottom">&copy; 2023 Your Hospital Management
			System. All rights reserved.</p>
	</footer>

	<script>
		function openForm() {
			var popup = document.getElementById("myPopup");
			popup.style.display = "block";
		}

		function closeForm() {
			var popup = document.getElementById("myPopup");
			popup.style.display = "none";
		}
	</script>
</body>
	</html>
</f:view>