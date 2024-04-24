DROP DATABASE IF EXISTS FINALDUMMY;

CREATE DATABASE FINALDUMMY;

USE FINALDUMMY;


##############################################################################################################################################

DROP TABLE IF EXISTS PROVIDER_DETAILS;

CREATE TABLE Provider_Details (
    providerid varchar(50) PRIMARY KEY, 
    FirstName varchar(50) ,
    LastName varchar(50) ,
    DateOfBirth DATE,
    Enrollmentdate DATE,
    email varchar(50),
    LicenseNumber varchar(20),
    Qualification varchar(100),
    username varchar(50),
    password varchar(50),
    status varchar(50) default 'APPLIED' ,
    phoneno varchar(50),
    gender ENUM ('MALE', 'FEMALE','OTHERS'),
    speciality varchar(255),
    address varchar(255),
    IsActive varchar(20),
    comments varchar(255),
    security_question varchar(255),
    security_answer varchar(255)
);

INSERT INTO Provider_Details (
    providerid, FirstName, LastName, DateOfBirth, Enrollmentdate, email, LicenseNumber, Qualification,
    username, password, status, phoneno, gender, speciality, address, IsActive, comments,
    security_question, security_answer
)
VALUES
    ('PROV123', 'John', 'Doe', '1980-05-15', '2023-01-01', 'john.doe@example.com', 'MD12345',
     'Internal Medicine Specialist', 'johndoe', 'password123', 'ACTIVE', '123-456-7890', 'MALE',
     'Internal Medicine', '123 Main St, Cityville', 'YES', 'Excellent doctor',
     'What is your favorite color?', 'Blue'),

    ('PROV456', 'Jane', 'Smith', '1985-08-22', '2023-01-05', 'jane.smith@example.com', 'DDS67890',
     'Dentist', 'janesmith', 'password456', 'ACTIVE', '456-789-0123', 'FEMALE',
     'Dentistry', '456 Oak St, Townsville', 'YES', 'Needs additional documentation',
     'What is the name of your first pet?', 'Fluffy'),

    ('PROV789', 'Mike', 'Johnson', '1976-03-10', '2023-01-10', 'mike.johnson@example.com', 'OD34567',
     'Optometrist', 'mikejohnson', 'password789', 'ACTIVE', '789-012-3456', 'MALE',
     'Ophthalmology', '789 Pine St, Villagetown', 'YES', 'Experienced eye specialist',
     'What is your mother\'s maiden name?', 'Smith'),
    
    ('PROV102', 'Emily', 'Williams', '1988-11-28', '2023-01-15', 'emily.williams@example.com', 'MD67890',
     'Allergy and Immunology Specialist', 'emilywilliams', 'passwordABC', 'ACTIVE', '012-345-6789', 'FEMALE',
     'Allergy and Immunology', '234 Cedar St, Hamletville', 'YES', 'Incomplete application',
     'What is the city of your birth?', 'London');

#######################################################################################################################################################

DROP TABLE IF EXISTS PATIENT_ENROLLMENT;

CREATE TABLE patient_enrollment (
    UHID varchar(50) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    dob DATE,
    Gender ENUM('MALE', 'FEMALE', 'OTHER'),
    userName VARCHAR(50),
    Phoneno VARCHAR(50),
    email VARCHAR(200),
    status VARCHAR(50),
    address varchar(1000),
    medHistory Varchar(1000),
    countryCode VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postalCode VARCHAR(20),
    country VARCHAR(100),
    permanentAddress VARCHAR(1000),
    permanentCity VARCHAR(100),
    permanentState VARCHAR(100),
    permanentPostalCode VARCHAR(20),
    permanentCountry VARCHAR(100),
    securityQuestion varchar(300),
    securityAnswer varchar(300)
);

INSERT INTO PATIENT_ENROLLMENT
VALUES ('IN0001','NAMAN','MATHUR','1997-03-18','MALE','naman123','9203084033','namanmathur@gmail.com','ACTIVE','PL-10, 9TH STREET, BACK GATE','SKIN-INFECTI0N',
	'+91','BANGALORE','KARNATAKA','560066','INDIA','PL-10, 9TH STREET, BACK GATE','BANGALORE','KARNATAKA','560066','INDIA','What is your hobby ?','Cricket'),

	('IN0002','YASH','SONI','1998-01-08','MALE','soniYash','8809289371','soniyash@gmail.com','ACTIVE','PL-290/990, SHAM-NAGAR, MOTTI CHOWK','NONE',
	'+91','MUMBAI','MAHARASHTRA','450062','INDIA','PL-290/990, SHAM-NAGAR, MOTTI CHOWK','MUMBAI','MAHARASHTRA','450062','INDIA','What is your pet name ?','Tom'),

	('IN0003','TANMAY','SINGH','1996-06-06','MALE','tanmay1','6798500123','tanmaysingh@gmail.com','ACTIVE','SURYA HOMES, MALAMYAM COLONY, MG-ROAD','ELBOW-FRACTURE',
	'+91','AHMEDABAD','GUJRAT','300035','INDIA','PL-290/990, SHAM-NAGAR, MOTTI CHOWK','MUMBAI','MAHARASHTRA','450062','INDIA','What is your school name ?','DPS'),

	('IN0004','PARV','SINGH','1996-06-06','MALE','PARV101','7890123647','parv@gmail.com','ACTIVE','PL-364, JAYRAM COLONY, CONNAUGHT PLACE','THROAT-INFECTION',
	'+91','DELHI','NEW DELHI','100829','INDIA','PL-290/990, SHAM-NAGAR, MOTTI CHOWK','MUMBAI','MAHARASHTRA','450062','INDIA','What is your hobby ?','Video Games');


##########################################################################################################################################################

DROP TABLE IF EXISTS PATIENT_APPOINTMENT;

create table Patient_Appointment(
appointmentId varchar(20) primary key,
providerid varchar(50),
UHID varchar(50),
FirstName VARCHAR(50),
LastName VARCHAR(50),
AppointmentDate Date,
StartTime varchar(50),
EndTime varchar(50),
reason varchar(50),
otp varchar(20),
cancel_reason varchar(100),
Status enum('CONFIRMED','PENDING','CANCELLED','VISITED'),
Department varchar(300),
reasonForCancel varchar(500),
FOREIGN KEY (providerid) REFERENCES Provider_Details(providerid),
FOREIGN KEY (UHID) REFERENCES patient_enrollment(UHID)
);


INSERT INTO Patient_Appointment (appointmentId, providerid, UHID, FirstName, LastName, AppointmentDate, StartTime, EndTime, reason, otp, cancel_reason, Status, Department, reasonForCancel)
VALUES
    ('APP001', 'PROV123', 'IN0001', 'NAMAN', 'MATHUR', '2023-01-15', '09:00 AM', '10:00 AM', 'General Checkup', '1234', NULL, 'CONFIRMED', 'Internal Medicine', NULL),
    
    ('APP002', 'PROV456', 'IN0002', 'YASH', 'SONI', '2023-02-10', '02:30 PM', '03:30 PM', 'Dental Exam', '5678', NULL, 'PENDING', 'Dentistry', NULL),
    
    ('APP003', 'PROV789', 'IN0003', 'TANMAY', 'SINGH', '2023-03-20', '11:15 AM', '12:15 PM', 'Eye Checkup', '9012', 'Doctor unavailable', 'CANCELLED', 'Ophthalmology', 'Doctor had an emergency');


###########################################################################################################################################################

DROP TABLE IF EXISTS PRESCRIPTION;

create table Prescription
( 
prescription_Id varchar(30) primary key,
appointmentId varchar(20),
providerid varchar(50),
UHID varchar(50),
Symptoms varchar(100),
medicine varchar(100),
Dosage varchar(50),
Prescribed_Date  Timestamp default current_Timestamp ,
Instructions varchar(200),
foreign key (appointmentId) references patient_appointment(appointmentId),
foreign key (providerid) references Provider_Details(providerid),
foreign key(UHID) references patient_enrollment(UHID)
);


-- Insert data into Prescription table
INSERT INTO Prescription (prescription_Id, appointmentId, providerid, UHID, Symptoms, medicine, Dosage, Prescribed_Date, Instructions)
VALUES
    ('PS001', 'APP001', 'PROV123', 'IN0001', 'Fever and cough', 'Paracetamol', '1 tablet every 6 hours', '2023-01-15', 'Take after food'),

    ('PS002', 'APP002', 'PROV456', 'IN0001', 'Allergy symptoms', 'Cetirizine', '1 tablet daily', '2023-02-10 ', 'No specific instructions'),

    ('PS003', 'APP003', 'PROV789', 'IN0003', 'Headache', 'Aspirin', '1 tablet is needed', '2023-03-20 ', 'Avoid alcohol');


######################################################################################################################################################

DROP TABLE IF EXISTS INSURANCE_DETAILS;

CREATE TABLE Insurance_Details (
    Insurance_id varchar(10) primary key,
    Insurance_Name VARCHAR(255),
    Type VARCHAR(255),
    PremiumStart DATE,
    PremiumEnd DATE,
    LaunchDate DATE,
    Status VARCHAR(10)
);

 INSERT INTO Insurance_Details (Insurance_id, Insurance_Name, Type, PremiumStart, PremiumEnd, LaunchDate, Status)
VALUES
    ('I001', 'Aditya Birla Activ Health Platinum Plan', 'Private', '2013-01-01', '2013-12-31', '2012-12-01', 'Active'),
    ('I002', 'Bharti AXA Smart Super Health Insurance Policy', 'Government', '2013-02-15', '2014-01-01', '2012-12-01', 'Active'),
    ('I003', 'Niva Bupa Heartbeat Health Insurance Plan', 'Private', '2013-03-15', '2014-01-01', '2013-02-01', 'Active'),
    ('I004', 'Ayushman Bharat Pradhan Mantri Jan Arogya Yojana (PMJAY)', 'Government', '2015-01-01', '2025-12-31', '2014-12-01', 'Active'),
    ('I005', 'Future Generali CritiCare Plan', 'Private', '2016-03-15', '2017-02-15',  '2015-12-01', 'Active'),
    ('I006', 'Pradhan Mantri Suraksha Bima Yojana (PMSBY)', 'Government', '2016-10-10', '2026-09-10', '2016-05-01', 'Active'),
    ('I007', 'Reliance Nippon General Insurance Plan', 'Private', '2017-04-10', '2018-03-10', '2017-02-01', 'Active'),
    ('I008', 'HDFC ERGO Health Suraksha Gold Plan', 'Private', '2019-04-12', '2020-03-12', '2018-08-01', 'Active'),
    ('I009', 'ICICI Lombard Complete Health Insurance', 'Private', '2023-06-01', '2033-06-01', '2023-01-01', 'Active'),
    ('I010', 'SBI Health Insurance Arogya Premier Policy', 'Private', '2023-09-01', '2024-09-01', '2023-05-15', 'Active'),
    ('I011', 'Max Bupa Health Companion Individual Plan', 'Private', '2023-11-15', '2024-11-15', '2023-07-15', 'Active');


#########################################################################################################################################################

DROP TABLE IF EXISTS INSURANCE_PLANS;

CREATE TABLE Insurance_Plans (
    Plan_id INT PRIMARY KEY AUTO_INCREMENT,
    Insurance_id  varchar(5),
    Premium_Amount DECIMAL(10, 2),
    Coverage_Amount DECIMAL(10, 2),
    Disease_covered varchar(369),
    FOREIGN KEY (Insurance_id) REFERENCES Insurance_Details(Insurance_id)
    );

INSERT INTO Insurance_Plans (Plan_id,Insurance_id, Premium_Amount, Coverage_Amount, Disease_Covered)
VALUES
(1,'I001', 5000, 300000, 'Dental Care'),
(2,'I001',2500, 350000, 'Maternity Care'),
(3,'I001', 3000, 200000, 'Surgery'),

(4,'I002', 1000, 100000, 'Hospitalization'),
(5,'I002', 2700, 75000, 'Prescription Drugs'),
(6,'I002', 3900, 150000, 'Emergency Room'),

(7,'I003', 6000, 450000, 'Mental Health Services'),
(8,'I003', 2500, 230000, 'Home Healthcare'),
(9,'I003', 3000, 90000, 'Chiropractic Care'),

(10,'I004', 100, 10000, 'Dental Care'),

(11, 'I005', 500, 25000, 'Physiotherapy'),

(12, 'I006', 1500, 120000, 'Vision Care'),

(13, 'I007', 900, 80000, 'Diagnostic Tests'),
(14, 'I007', 1200, 100000, 'Ambulance Services'),

(15, 'I008', 800, 60000, 'Dermatology'),
(16, 'I008', 1100, 90000, 'Orthopedic Care'),

(17, 'I009', 700, 40000, 'Nutritional Counseling'),

(18,'I010',6000,700000,'Neuro Care'),
(19,'I010',4500,475000,'Cancer Protect'),

(20,'I011',3750,350000,'Cardiovascular Care');

	
##########################################################################################################################################################

DROP TABLE IF EXISTS SUBSCRIPTIONS;

CREATE TABLE Subscriptions (
    Subscription_Id INT primary key,
    uhid varchar(50) ,
    Insurance_id VARCHAR(10),
    Insurance_Name varchar(100),
    Plan_id INT,
    Premium_Amount DECIMAL(10, 2),
    Coverage_Amount DECIMAL(10, 2),
    PayMode VARCHAR(20),
    email varchar(30),
    RegistrationDate DATE,
    endDate Date,
    Status enum ('Active','Inactive') default 'Inactive',
    FOREIGN KEY (Insurance_id) REFERENCES Insurance_Details(Insurance_id),
    FOREIGN KEY (UHID) REFERENCES PATIENT_ENROLLMENT(UHID),
    FOREIGN KEY (Plan_id) REFERENCES Insurance_Plans(Plan_id)
);  


insert into subscriptions value
(1,'IN0001','I001','Aditya Birla Activ Health Platinum Plan',1,5000,300000,'Monthly','namanmathur@gmail.com','2013-04-10','2014-03-10','Inactive'),
(2,'IN0001','I002','Bharti AXA Smart Super Health Insurance Policy',4,1000,100000,'Quarterly','namanmathur@gmail.com','2013-09-15','2014-08-15','Inactive'),
(3,'IN0001','I003','Niva Bupa Heartbeat Health Insurance Plan',7,6000,450000,'Half-Yearly','namanmathur@gmail.com','2014-04-10','2015-03-10','Inactive'),
--
(4,'IN0002','I001','Aditya Birla Activ Health Platinum Plan',3,3000,200000,'Monthly','soniyash@gmail.com','2014-07-29','2015-06-29','Inactive'),
--
(5,'IN0003','I003','Niva Bupa Heartbeat Health Insurance Plan',9,3000,90000,'Yearly','tanmaysingh@gmail.com','2014-11-02','2015-10-02','Inactive'),
--
(6, 'IN0001', 'I004', 'Ayushman Bharat Pradhan Mantri Jan Arogya Yojana (PMJAY)', 10, 100, 10000, 'Monthly', 'namanmathur@gmail.com', '2015-04-05', '2025-03-05','Active'),
(7, 'IN0001', 'I005', 'Future Generali CritiCare Plan', 11, 500, 25000, 'Monthly', 'namanmathur@gmail.com', '2016-08-14','2026-07-14','Active'),
(8, 'IN0001', 'I007', 'Reliance Nippon General Insurance Plan', 14, 1200, 100000, 'Yearly', 'namanmathur@gmail.com', '2017-06-18', '2027-05-18','Active'),
(9, 'IN0001', 'I008', 'HDFC ERGO Health Suraksha Gold Plan', 15, 800, 60000, 'Monthly', 'namanmathur@gmail.com', '2018-12-05', '2019-11-05','Inactive'),
(10, 'IN0001', 'I006', 'Pradhan Mantri Suraksha Bima Yojana (PMSBY)', 12, 1500, 120000, 'Quarterly', 'namanmathur@gmail.com', '2022-11-30','2032-10-30','Active'),
(11, 'IN0001', 'I009', 'ICICI Lombard Complete Health Insurance', 17, 700, 40000, 'Quarterly', 'namanmathur@gmail.com', '2023-02-12', '2033-01-12','Active'),
(12, 'IN0001', 'I010', 'SBI Health Insurance - Arogya Premier Policy', 19, 4500, 475000, 'Half-Yearly', 'namanmathur@gmail.com', '2023-07-20', '2024-06-20','Active'),
(13, 'IN0001', 'I011', 'Max Bupa Health Companion Individual Plan', 20, 3750, 350000, 'Monthly', 'namanmathur@gmail.com', '2023-10-08', '2024-09-08','Active');

########################################################################################################################################################


DROP TABLE IF EXISTS AUTHENTICATION;


create table authentication(
	authId int primary key auto_increment,
	uhid varchar(50),
	username varchar(300),
	password varchar(300),
	email varchar(300),
	otp varchar(300)	
 );
 
 INSERT INTO AUTHENTICATION
 VALUES(1,'IN0001','naman123','c7d5cb3f18aa5b5f598babf62c924b17','namanmathur@gmail.com','91209'), 
 (2,'IN0002','soniYash','c916d142f0dc7f9389653a164f1d4e9d','soniyash@gmail.com','38492'),
 (3,'IN0003','tanmay1','202cb962ac59075b964b07152d234b70','tanmaysingh@gmail.com','29831'),
 (4,'IN0004','parv101','7dcde6c5d964d02734d14450d9308de1','parvsingh@gmail.com','67891');

###########################################################################################################################################################

SELECT * FROM AUTHENTICATION;

## 7dcde6c5d964d02734d14450d9308de1 = Satyaprakash@1234
## c7d5cb3f18aa5b5f598babf62c924b17 = rAHUL@123


select * from subscriptions where uhid = 'IN0001';

select * from subscriptions;

desc subscriptions;



select *  from subscriptions
where coverage_amount=(select max(coverage_amount) from subscriptions);




