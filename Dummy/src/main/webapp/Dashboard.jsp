<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital</title>
    
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
     
<script src="script.js" defer></script>
     
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #F5F5AD;
            color: #333;
        }

        header {
            background-color: #0d2b3e;
            color: #fff;
            text-align: center;
            padding: 10px;
            border-radius: 20px;
        }

        .navbar {
            background-color: #333;
            overflow: hidden;
            border-radius: 14px;
            margin-left:10px;
        }

        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .dropdown {
            float: left;
            overflow: hidden;
        }

        .dropdown .dropbtn {
            font-size: 16px;
            border: none;
            outline: none;
            color: #fff;
            padding: 14px 16px;
            background-color: inherit;
            font-family: inherit;
            margin: 0;
        }

        .navbar a:hover, .dropdown:hover .dropbtn {
            background-color: #ddd;
            color: black;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            float: none;
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .hospital-title {
            font-size: 36px;
            margin: 10px 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 24px;
            overflow: hidden;
        }
        .container2{
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 24px;
            overflow: hidden;
        }
        

        .user-icon {
            margin-left: 1150px;
            width: 17px;
            height: 39px;
            background-color: none;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 40px;
            color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
<!-- -->
.btn.success {
    background-color: #4CAF50; 
    color: white; 
    padding: 10px 20px; 
    border-color: black; 
    border-radius: 8px;
    cursor: pointer; 
    margin: 5px; 
}
.btn.success:hover {
    background-color: #45a049; /* Darker green on hover */
}

        
.footer {
    background-color: #333; /* Adjust background color as needed */
    color: #fff; /* Adjust text color as needed */
    padding: 20px; /* Add padding to the footer */
    text-align: center; /* Center-align text */
}

.footer-content {
    display: flex;
    justify-content: space-between;
    max-width: 1200px;
    margin: 0 auto;
}

.footer-section {
    flex: 1;
    margin-right: 20px; /* Add margin between sections */
}

.footer-section:last-child {
    margin-right: 0; /* Remove margin for the last section */
}

.footer-section h3 {
    margin-bottom: 10px; /* Add space below heading */
}

.footer-section ul {
    list-style: none;
    padding: 0;
}

.footer-section a {
	margin-bottom: 2px;
    text-decoration: none;
    color: black; /* Adjust link color as needed */
}
.footer-section a:hover {
	color: blue; /* Change the link color on hover */	
}

.social-icon {
                font-size: 24px; /* Change the icon size */
                color: black; /* Change the icon color */
                margin-right: 10px; /* Adjust spacing between icons */
            }

.footer-bottom {
  text-align: center;
  margin-top: 20px;
  font-size: 14px;
}
   section {
  margin-bottom: 20px;
}

h2 {
  color: #333;
}

article {
  max-width: 1000px;
  margin: 20px auto;
  padding: 20px;
  background-color: #ffffff57;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  border-radius: 24px;
}

.logout-btn {
    background-color: #fff;
    color: #333;
    padding: 8px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    margin-left: none; 
    font-size: 12px;
    float: inline-end;
}

.logout-btn:hover {
    background-color: #eee;
}

    </style>
</head>
<body>

    <header>
        <h1>Welcome to Sai Hospital</h1>
    </header>

    <div class="navbar">
        <a href="#home">Home</a>
        <div class="dropdown">
            <button class="dropbtn">Providers <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
                <a href="searchProviders.jsf">Search Providers</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropbtn">Insurance <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
                <a href="ShowSubscription.jsf">My Subscription</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropbtn">Action <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
                <a href="Search and ViewClaims.jsf">Search and View Claims</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropbtn">Appointment <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
                <a href="makeAppointment.jsf">Make An Appointment</a>
                <a href="appointmentDetails.jsf">Appointment Details</a>
            </div>
        </div>

    <div style="display: flex; align-items: center; justify-content: space-between; width: 100%;">
        <div class="user-icon">
            <!-- Move the user icon here -->
            <i class="fas fa-user" style="font-size: 24px; color: #fff;"></i>
        </div>

        <h:form>
            <div>
                <h:commandButton value="Logout" action="#{loginImpl.logout(logout)}" styleClass="logout-btn"/>
            </div>
        </h:form>
    </div>
</div>

<div class="container2">
    <h1 class="hospital-title">Hello</h1>
    <section>
        <h2> <h:outputText value="#{loggedRecipient}" /></h2>
        <p>Always caring about your health, We are here to help you!</p>
    </section>
</div>

    <div class="container" style="color: #ffffff; background-image: url('containerImage.jpg'); background-size: cover; background-position: center; background-repeat: no-repeat;">
        <center>
            <article>

                <section>
                    <h2 style="font-weight: bold;">Understanding Hospital Management Systems</h2>
                    <p class="scroll-p" style="color: black;">Hospital Management Systems are comprehensive software solutions designed to automate and streamline the day-to-day operations of a healthcare facility. From patient registration and appointment scheduling to billing and inventory management, HMS integrates various functions into a unified platform.</p>
                </section>

                    <section>
                        <h2 style="font-weight: bold;">Key Features and Benefits</h2>
                        <ul>
                            <li style="color: black;"><strong style="color: black;">Patient Information Management:</strong> HMS enables healthcare providers to maintain accurate and up-to-date patient records. From demographics to medical history, all information is easily accessible, ensuring quick and informed decision-making.</li>
                            <li style="color: black;"><strong style="color: black;">Appointment Scheduling:</strong> Efficient appointment scheduling is critical for managing patient flow. HMS allows staff to schedule, reschedule, and track appointments seamlessly, reducing waiting times and improving patient satisfaction.</li>
                            <li style="color: black;"><strong style="color: black;">Billing and Invoicing:</strong> HMS automates the billing process, generating accurate invoices for services rendered. This not only reduces billing errors but also enhances financial transparency for both patients and the hospital.</li>
                            <li style="color: black;"><strong style="color: black;">Inventory Management:</strong> Tracking and managing medical supplies and equipment is simplified with HMS. Automated alerts for low stock levels prevent shortages, ensuring that healthcare providers have the necessary resources at all times.</li>
                            <li style="color: black;"><strong style="color: black;">Electronic Health Records (EHR):</strong> The transition from paper records to electronic health records has been a transformative aspect of HMS. EHRs streamline data retrieval, minimize errors, and support better collaboration among healthcare professionals.</li>
                            <li style="color: black;"><strong style="color: black;">Analytics and Reporting:</strong> Hospital administrators can leverage analytics tools within HMS to gain insights into hospital performance. Data-driven decisions contribute to resource optimization and improved patient outcomes.</li>
                        </ul>
                    </section>

                <div class="summary-container">
                    <p class="summary" style="color: black;">This is a brief summary of what you can learn more about.</p>
                    <a href="hello.jsp" class="btn1">Learn More</a> <br> <br>
                </div>

                <div class="divclass">
                    <button class="btn success">Book Appointment</button>
                    <button class="btn success">Confirm Appointment</button>
                    <button class="btn success">Consult Online</button>
                    <button class="btn success">Buy Medicine</button>
                    <button class="btn success">Find Hospital</button>
                    <button class="btn success">View Health Record</button>
                </div>

                <section>

                    <div>

                        <h2 style="font-weight: bold;">Explore our Centres Of Clinical Excellence</h2>
                        <p style="color: black;">Learn about the world-class health care we provide</p>

                    </div>

                </section>

            </article>
        </center>
    </div>

<footer>
    <div class="footer-content">
        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="MenuPage.jsp">Home</a></li>
                <li><a href="#">Features</a></li>
                <li><a href="hello.jsp">About Us</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
        </div>

        <div class="footer-section">
            <h3>Contact Us</h3>
            <p>Email: info@hospitalmanagementsystem.com</p>
            <p>Phone: +91 123-456-7890</p>
            <p>Address: Kundahalli, EPIP Zone, Whitefield, Bangalore</p>
        </div>

        <div class="footer-section">
   			 <h3>Connect with Us</h3>
   			 <a href="#" class="social-icon"><i class="fa-solid fa-magnifying-glass"></i></a>
    		<a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
    		<a href="#" class="social-icon"><i class="fab fa-linkedin"></i></a>
   			 <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
		</div>

    </div>
    <p class="footer-bottom">&copy; 2023 Your Hospital Management System. All rights reserved.</p>
</footer>

</body>
</html>
</f:view>