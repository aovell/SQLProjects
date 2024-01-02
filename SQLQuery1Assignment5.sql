CREATE table PATIENT(patient_id int identity primary key,patient_name varchar (25),
patient_address varchar(250),patient_contact VARCHAR(15),patient_city VARCHAR(25));

INSERT INTO PATIENT VALUES
('Blake','106 Clark St.','9894534323','Atlanta'),
('Clair','345 Wyning Dr.','8765431584','Rome'),
('Megan','289 Batman Ln.','8763123434','Woodstock'),
('Clark','America Dr.','9897681633','Atlanta'),
('Ryan','473 Boston Rd.','9894354323','Roswell ');
SELECT * FROM PATIENT;

CREATE table BED(bed_id CHAR(5) primary key,floor_no INT);
INSERT INTO BED VALUES
('101',1),
('102',1),
('103',1),
('104',1),
('201',2);
SELECT * FROM PATIENT;

CREATE table BEDPATIENT(bed_id CHAR(5),patient_id int);
INSERT INTO BEDPATIENT VALUES('101',3),
('201',1),
('104',5),
('202',6),
('204',7);
SELECT * FROM BEDPATIENT;

/*SQL SELECT STATEMENT*/
SELECT P.patient_id, P.patient_name,B.bed_id AS BED 
FROM BEDPATIENT BP JOIN PATIENT P 
ON BP.patient_id=P.patient_id JOIN BED B ON BP.bed_id=B.bed_id

SELECT * FROM PATIENT;
CREATE TABLE TREATMENT(treatment_id CHAR(2) PRIMARY KEY,treatment_name VARCHAR(25));
INSERT INTO TREATMENT VALUES
('CA','Cardiology'),
('EN','ENT'),
('OT','Orthopedic'),
('PD','Pediatric');
SELECT * FROM TREATMENT;
 
CREATE TABLE PATIENTTREATMENT(patient_id int,treatment_id CHAR(2)) ;
INSERT INTO PATIENTTREATMENT VALUES
(1,'CA'),
(6,'PD'),
(5,'EN'),
(3,'OT'),
(2,'EN');
SELECT * FROM PATIENTTREATMENT;
/*SQL SELECT STATEMENT*/
SELECT PT.patient_id,P.patient_name,T.treatment_name 
FROM PATIENTTREATMENT PT JOIN PATIENT P 
ON PT.patient_id=P.patient_id JOIN TREATMENT T ON PT.treatment_id=T.treatment_id;


SELECT * FROM PATIENT;
CREATE TABLE TEST(test_id CHAR(2),TEST VARCHAR(25));
INSERT INTO TEST VALUES
('BS','Blood Sugar'),
('BP','Blood Pressure'),
('EC','ECG'),
('BD','Bone Density');
SELECT * FROM TEST;

CREATE TABLE PATIENTTEST(patient_id int,test_id CHAR(2));
INSERT INTO PATIENTTEST VALUES
(1,'EC'),
(6,'BS'),
(5,'BP'),
(3,'BD'),
(2,'BP');
SELECT * FROM PATIENTTEST;
/*SQL SELECT STATEMENT*/
SELECT PT.patient_id,P.patient_name,T.TEST 
FROM PATIENTTEST PT JOIN PATIENT P 
ON PT.patient_id=P.patient_id JOIN TEST T ON PT.test_id=T.test_id;


SELECT * FROM PATIENT;
create table EMPLOYEE(Employee_id CHAR(3) primary key,Employee_name varchar (25),
Employee_address varchar(250),Employee_contact VARCHAR(15),Employee_position VARCHAR(25),Employee_dept VARCHAR(25));
 
INSERT INTO EMPLOYEE VALUES('D01','Smith','222 Leming St.','9897628823','Doctor','Cardiology');
INSERT INTO EMPLOYEE VALUES('D02','Evans','141 William Dr.','9857622323','Doctor','Pediatric');
INSERT INTO EMPLOYEE VALUES('N01','Adams','356 Cameron Rd.','9893744323','Nurse','Cardiology');
INSERT INTO EMPLOYEE VALUES('N03','Crowder','116 Harper Ln.','9898528923','Nurse','Orthopedic');
INSERT INTO EMPLOYEE VALUES('P04','Phils','445 Carnegie St.','9890927353','Pharmacist','Pharmacy');
SELECT * FROM EMPLOYEE;
 
CREATE TABLE PATIENTEMPLOYEE(patient_id int,Employee_id CHAR(5));
INSERT INTO PATIENTEMPLOYEE VALUES(1,'D01');
INSERT INTO PATIENTEMPLOYEE VALUES(1,'N01');
INSERT INTO PATIENTEMPLOYEE VALUES(5,'P04');
INSERT INTO PATIENTEMPLOYEE VALUES(3,'N03');
INSERT INTO PATIENTEMPLOYEE VALUES(2,'D03');
SELECT * FROM PATIENTEMPLOYEE;
/*SQL SELECT STATEMENT*/
SELECT PE.patient_id,P.patient_name,E.Employee_name AS EMPLOYEE,E.Employee_position AS DESIGNATION,E.Employee_dept AS DESIGNATION 
FROM PATIENTEMPLOYEE PE JOIN PATIENT P 
ON PE.patient_id=P.patient_id JOIN EMPLOYEE E ON PE.Employee_id=E.Employee_id
WHERE E.Employee_position IN('DOCTOR','NURSE');



/*SQL SELECT STATEMENT*/
SELECT patient_id, patient_name AS PATIENT,patient_address ADDRESS,patient_contact CONTACT,patient_city CITY 
FROM PATIENT 
ORDER BY patient_name;


/*SQL SELECT STATEMENT*/
SELECT PT.patient_id,P.patient_name,T.TEST,P.patient_city AS CITY 
FROM PATIENTTEST PT JOIN PATIENT P 
ON PT.patient_id=P.patient_id JOIN TEST T ON PT.test_id=T.test_id 
WHERE P.patient_city='Atlanta';


/*SQL SELECT STATEMENT*/
SELECT PT.patient_id,P.patient_name,P.patient_city,T.treatment_id
FROM PATIENTTREATMENT PT JOIN PATIENT P 
ON PT.patient_id=P.patient_id JOIN TREATMENT T ON PT.treatment_id=T.treatment_id
WHERE P.patient_city IN('Woodstock','Roswell');
