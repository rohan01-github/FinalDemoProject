drop database if exists FinalDummy;

create database FinalDummy;

use FinalDummy;


#####################################################################################
drop table if exists Insurance_Details;

CREATE TABLE Insurance_Details (
    Insurance_id varchar(10) primary key,
    Insurance_Name VARCHAR(255),
    Type VARCHAR(255),
    PremiumStart DATE,
    PremiumEnd DATE,
    MinPeriod INT,
    MaxPeriod INT,
    LaunchDate DATE,
    Status VARCHAR(10)
);

 INSERT INTO Insurance_Details (Insurance_id, Insurance_Name, Type, PremiumStart, PremiumEnd, MinPeriod, MaxPeriod, LaunchDate, Status)
VALUES
    ('I001', 'Aditya Birla Activ Health Platinum Plan', 'Private', '2023-01-01', '2023-12-31', 1, 10, '2023-01-01', 'Active'),
    ('I002', 'Bharti AXA Smart Super Health Insurance Policy', 'Government', '2023-03-15', '2024-03-15', 1, 5, '2023-03-15', 'Active'),
    ('I003', 'Niva Bupa Heartbeat Health Insurance Plan', 'Private', '2023-02-01', '2033-02-01', 5, 30, '2023-02-01', 'Active'),
    ('I004', ' Ayushman Bharat - Pradhan Mantri Jan Arogya Yojana (PM-JAY)', 'Government', '2015-01-01', '2025-12-31', 1, 10, '2023-01-01', 'Active'),
    ('I005', 'Future Generali CritiCare Plan', 'Private', '2016-03-15', '2016-03-15', 1, 5, '2023-03-15', 'Active'),
    ('I006', 'Pradhan Mantri Suraksha Bima Yojana (PMSBY)', 'Government', '2015-02-01', '2025-02-01', 10, 30, '2023-02-01', 'Active');

###################################################################################

drop table if exists Insurance_Plans;

CREATE TABLE Insurance_Plans (
    Plan_id INT ,
    Insurance_id  varchar(5),
    Premium_Amount DECIMAL(10, 2),
    Coverage_Amount DECIMAL(10, 2),
    Benefits varchar(369)
    );

INSERT INTO Insurance_Plans (Insurance_id, Premium_Amount, Coverage_Amount, Benefits)
VALUES
    ('I001', 100, 10000, 'Dental Care'),
    ('I001',989, 30000, 'Maternity Care'),
     ('I001', 300, 200000, 'Surgery'),
     
       ('I002', 1000.00, 100000.00, 'Hospitalization'),
    ('I002', 200, 7500.00, 'Prescription Drugs'),
     ('I002', 800, 150000.00, 'Emergency Room'),
     
       ('I003', 600, 20000.00, 'Mental Health Services'),
    ('I003', 1200, 300000, 'Home Healthcare'),
     ('I003', 800, 20000, 'Chiropractic Care'),
     
     ('I004', 100, 10000, 'Dental Care'),
     
    ('I005',989, 30000, 'Maternity Care'),
    
     ('I006', 300, 200000, 'Surgery');

###################################################################################

drop table if exists recipient;

create table recipient(

UHID varchar(10) ,
Insurance_id varchar(10),
Plan_id int ,
firstName varchar(100),
lastName varchar(100)
);

insert into recipient values('UH001','I001',1,'Naman',' Mathur'),
('UH002','I003',8,'Tanmay','Singh'),
('UH003','I002',6,'Parv','Singh'),
('UH004','I001',1,'Yash','Soni');




###################################################################################

 
    #############################################################################



drop table if exists Recipient_History;

CREATE TABLE Recipient_History (
    Sno int primary key,
    Claim_Id int ,
    uhid varchar(10),
    Premium int,
	CoverageAmount int,
    claimedDate Date,
    benefitPayout DOUBLE,
    benefitRemaining DOUBLE,
    Incentive varchar(200),
    status enum('ACCEPTED','REJECTED','PENDING') default 'PENDING'
);

INSERT INTO Recipient_History(Sno,Claim_Id,uhid,Premium,CoverageAmount,claimedDate,benefitPayout,benefitRemaining,incentive,status)
VALUES(1,1,'UH001',5000,300000,'2022-09-22',105800,194200,'Treating of injuries caused due to accident','ACCEPTED'),
(2,2,'UH004',9500,600000,'2019-02-13',478000,122000,'Blood Cancer treatment','ACCEPTED'),
(3,3,'UH002',8000,400000,'2010-12-15',450000,170000,'Kidney failure due to which Dialysis is performed','ACCEPTED'),
(4,4,'UH003',10000,300000,'2022-06-09',63000,237000,'Laser Treatment has been performed','ACCEPTED'),
(5,1,'UH001',5000,300000,'2023-05-17',190000,4200,'Kidney Failure','ACCEPTED')  ;
    
###############################################################################################

drop table if exists subscriptions;

CREATE TABLE Subscriptions (
    Subscription_Id INT primary key,
    uhid varchar(10) ,
    Insurance_id VARCHAR(10),
    Insurance_Name varchar(100),
    Plan_id INT,
    Premium_Amount DECIMAL(10, 2),
    Coverage_Amount DECIMAL(10, 2),
    PayMode VARCHAR(20),
    email varchar(30),
    RegistrationDate DATE,
    Status enum ('ACTIVE','PENDING') default 'PENDING',
    FOREIGN KEY (Insurance_id) REFERENCES Insurance_Details(Insurance_id)
);   

insert into subscriptions value
(1,'UH001','I001','Aditya Birla Activ Health Platinum Plan',1,5000,300000,'Monthly','namanmathur@gmail.com','2020-06-10','ACTIVE'),
(2,'UH001','I002','Bharti AXA Smart Super Health Insurance Policy',4,8000,400000,'Quaterly','namanmathur@gmail.com','2020-04-30','ACTIVE'),
(3,'UH001','I003','Niva Bupa Heartbeat Health Insurance Plan',7,10000,600000,'Half-Yearly','namanmathur@gmail.com','2020-09-19','ACTIVE'),
(4,'UH002','I001','Aditya Birla Activ Health Platinum Plan',3,6500,500000,'Monthly','soniyash@gmail.com','2020-07-29','ACTIVE'),
(5,'UH003','I003','Niva Bupa Heartbeat Health Insurance Plan',9,11000,450000,'Yearly','tanmaysingh@gmail.com','2020-11-02','ACTIVE');

###########################################################################################

drop table if exists claim_history;

 Create table claim_history(
   ClaimHistoryId int auto_increment primary key,
   Claim_Id int,
   providerid varchar(50),
   Plan_id INT,
    UHID varchar(100),
    fromDate Date,
    toDate date,
    claimAmount decimal(9,2),
    status enum('ACCEPTED','REJECTED','PENDING') default 'PENDING',
    Comments varchar(200)
    ); 
    
    INSERT INTO claim_history (ClaimHistoryId, Claim_Id, providerid, Plan_id, UHID, fromDate, toDate, claimAmount, status, Comments)
VALUES 
(1, 1, 'PROV123', 1, 'UH001', '2023-01-15', '2023-01-20', 1500.00, 'PENDING', 'Initial assessment'),
(2, 2, 'PROV456', 4, 'UH002', '2023-02-10', '2023-02-15', 2500.00, 'ACCEPTED', 'Follow-up treatment'),
(3, 3, 'PROV789', 9, 'UH003', '2023-03-20', '2023-03-25', 1800.00, 'REJECTED', 'Insufficient documentation');

 
    


SELECT * FROM INSURANCE_DETAILS;

SELECT * FROM INSURANCE_PLANS;

SELECT * FROM RECIPIENT;

SELECT * FROM RECIPIENT_HISTORY;

SELECT * FROM SUBSCRIPTIONS;

SELECT * FROM CLAIM_HISTORY;

select * from subscriptions where uhid = 'UH001';
