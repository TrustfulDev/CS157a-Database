-- ALL TRIGGERS do not work for heroku & cleardb sadly. It requires us to pay. It will work everywhere else.
CREATE TABLE HOSPITAL_WARD (
    Ward_ID INT PRIMARY KEY NOT NULL,
    Ward_Type VARCHAR(255),
    Current_Patients INT,
    Max_Patients INT,
	Current_Staff INT,
    CHECK (Current_Staff > 0)
);

INSERT INTO HOSPITAL_WARD (Ward_ID, Ward_Type, Current_Patients, Max_Patients,Current_Staff)
VALUES 
(201, 'Cardiology', 5, 20,3),
(202, 'Neurology', 3, 10,3), 
(203, 'Oncology', 3, 20,3),
(204, 'Orthopedics', 4, 10,3),
(205, 'Pediatrics', 0, 25,3);

CREATE TABLE MEDICAL_EQUIPMENT (
    Equipment_ID INT PRIMARY KEY NOT NULL,
    Equipment_Type VARCHAR(255),
    Amount INT,
    Ward_ID INT,
    FOREIGN KEY (Ward_ID) REFERENCES HOSPITAL_WARD (Ward_ID)
);

INSERT INTO MEDICAL_EQUIPMENT (Equipment_ID, Equipment_Type, Amount, Ward_ID)
VALUES
(301, 'X-ray machine', 20, 201),
(302, 'Ultrasound machine', 100, 201),
(303, 'Defibrillator', 30, 203),
(304, 'Blood pressure monitor', 50, 204),
(305, 'Nebulizer', 21, 205),
(306, 'ECG machine', 4, 201),
(307, 'Surgical table', 10, 202),
(308, 'Oxygen concentrator', 30, 202),
(309, 'Syringe pump', 500, 203),
(310, 'Pulse oximeter', 50, 204),
(311, 'Infant incubator', 200, 204),
(312, 'Ventilator', 400, 205),
(313, 'Patient bed', 290, 201),
(314, 'Surgical lights', 30, 202),
(315, 'Anesthesia machine', 20, 203),
(316, 'Autoclave', 10, 203),
(317, 'Surgical microscope', 1, 204),
(318, 'Blood warmer', 2, 204),
(319, 'Dialysis machine', 2, 205);



CREATE TABLE MEDICINE (
    Medicine_ID INT PRIMARY KEY NOT NULL,
    Medicine_Name VARCHAR(255),
    Instructions VARCHAR(255),
    Medicine_Description VARCHAR(255)
);

INSERT INTO MEDICINE (Medicine_ID, Medicine_Name, Instructions, Medicine_Description)
VALUES
	   (601, 'Amoxicillin', 'Take one pill by mouth every 12 hours for 7 days.', 'Antibiotic used to treat bacterial infections.'),
       (602, 'Ibuprofen', 'Take one pill by mouth every 4-6 hours as needed for pain or fever.', 'Pain reliever and fever reducer.'),
       (603, 'Lisinopril', 'Take one pill by mouth once a day.', 'Used to treat high blood pressure.'),
       (604, 'Metformin', 'Take one pill by mouth twice a day with meals.', 'Used to treat type 2 diabetes.'),
       (605, 'Omeprazole', 'Take one pill by mouth once a day before a meal.', 'Used to treat gastroesophageal reflux disease (GERD) and other conditions caused by excess stomach acid.'),
	   (606, 'Acetaminophen', 'Take one pill by mouth every 4-6 hours as needed for pain or fever.', 'Pain reliever and fever reducer.'),
	   (607, 'Aspirin', 'Take one pill by mouth once a day with a full glass of water. Do not take more than directed by your doctor.', 'Used to reduce pain, inflammation, and fever, and to prevent blood clots.'),
       (608, 'Azithromycin', 'Take all pills in the prescribed dose at once. Repeat after 7 days if necessary', 'Antibiotic used to treat bacterial infections.'),
       (609, 'Cephalexin', 'Take one pill by mouth every 6 hours with or without food for 7-14 days.', 'Antibiotic used to treat bacterial infections.'),
       (610, 'Codeine', 'Take one pill by mouth every 4-6 hours as needed for pain relief.', 'Opioid pain medication.'),
	   (611, 'Diazepam', 'Take one pill by mouth 1-4 times daily as needed for anxiety relief.', 'Benzodiazepine used to treat anxiety disorders and muscle spasms.'),
	   (612, 'Furosemide', 'Take one pill by mouth once or twice daily as directed by your doctor.', 'Used to treat fluid retention (edema) caused by heart failure, kidney disease, or liver disease.'),
	   (613, 'Hydrochlorothiazide', 'Take one pill by mouth once daily with or without food.', 'Used to treat high blood pressure and fluid retention (edema).'),
	   (614, 'Levothyroxine', 'Take one pill by mouth every day on an empty stomach at least 30 minutes before breakfast.', 'Used to treat hypothyroidism (low thyroid hormone levels).'),
	   (615, 'Lorazepam', 'Take one pill by mouth 1-3 times daily as directed by your doctor.', 'Benzodiazepine used to treat anxiety disorders.'),
	   (616, 'Morphine', 'Take one pill by mouth every 4-6 hours as needed for pain relief.', 'Opioid pain medication.'),
	   (617, 'Naproxen', 'Take one pill by mouth every 8-12 hours as needed for pain relief.', 'Nonsteroidal anti-inflammatory drug (NSAID) used to treat pain and inflammation.'),
	   (618, 'Oxycodone', 'Take one pill by mouth every 4-6 hours as needed for pain relief.', 'Opioid pain medication.'),
	   (619, 'Prednisone', 'Take one pill by mouth once daily with food.', 'Used to treat inflammatory conditions such as arthritis and asthma.'),
	   (620, 'Simvastatin', 'Take one pill by mouth once daily at bedtime.', 'Used to lower cholesterol levels in the blood and prevent heart disease.');
	   

CREATE TABLE PHARMACY (
    Pharmacy_ID INT PRIMARY KEY NOT NULL,
	Pharmacy_Name VARCHAR(255)
);

INSERT INTO PHARMACY (Pharmacy_ID,Pharmacy_Name) VALUES
 (701,'San Luis Pharmacy'), (702,'Safe Haven Pharmacy'), (703,'Edgeworth Liability Pharmacy'), (704, 'Wright and Co Pharmacy'), (705,'Evergreen Valley Pharmacy');	   
 
 CREATE TABLE MEDICINE_INVENTORY (
    Pharmacy_ID INT NOT NULL,
    Medicine_ID INT NOT NULL,
    In_Stock INT,
    Min_Before_Restock INT,
    Restock_Amount INT,
    PRIMARY KEY (Pharmacy_ID, Medicine_ID),
    FOREIGN KEY (Pharmacy_ID) REFERENCES PHARMACY (Pharmacy_ID),
    FOREIGN KEY (Medicine_ID) REFERENCES MEDICINE (Medicine_ID)
);

INSERT INTO MEDICINE_INVENTORY (Pharmacy_ID, Medicine_ID, In_Stock, Min_Before_Restock, Restock_Amount)
VALUES
(701, 601, 50, 20, 50),
(702, 602, 100, 30, 75),
(702, 603, 25, 15, 40),
(703, 604, 75, 25, 60),
(704, 605, 10, 5, 20),
(701, 606, 20, 10, 40),
(702, 607, 30, 15, 50),
(703, 608, 40, 20, 60),
(704, 609, 50, 25, 70),
(705, 610, 60, 30, 80),
(701, 611, 70, 35, 90),
(702, 612, 80, 40, 100),
(703, 613, 90, 45, 110),
(704, 614, 100, 50, 120),
(705, 615, 110, 55, 130),
(701, 616, 120, 60, 140),
(702, 617, 130, 65, 150),
(703, 618, 140, 70, 160),
(704, 619, 150, 75, 170),
(705, 620, 160, 80, 180);
 
 CREATE TABLE MEDICAL_STAFF (
    Staff_ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(255),
    Occupation VARCHAR(255) NOT NULL,
    Specialization VARCHAR(255) NOT NULL,
    Ward_ID INT,
    Pharmacy_ID INT,
    FOREIGN KEY (Ward_ID) REFERENCES HOSPITAL_WARD (Ward_ID),
    FOREIGN KEY (Pharmacy_ID) REFERENCES PHARMACY (Pharmacy_ID)
);

CREATE TRIGGER update_ward_staff_count_remove
AFTER DELETE ON MEDICAL_STAFF
FOR EACH ROW
BEGIN
    UPDATE HOSPITAL_WARD
    SET Current_Staff = (SELECT COUNT(*) FROM MEDICAL_STAFF WHERE Ward_ID = NEW.Ward_ID)
    WHERE Ward_ID = NEW.Ward_ID;
END;

CREATE TRIGGER update_ward_staff_count_insert
AFTER INSERT ON MEDICAL_STAFF
FOR EACH ROW
BEGIN
    UPDATE HOSPITAL_WARD
    SET Current_Staff = (SELECT COUNT(*) FROM MEDICAL_STAFF WHERE Ward_ID = NEW.Ward_ID)
    WHERE Ward_ID = NEW.Ward_ID;
END;

CREATE TRIGGER update_ward_staff_count_
AFTER UPDATE ON MEDICAL_STAFF
FOR EACH ROW
BEGIN
    UPDATE HOSPITAL_WARD
    SET Current_Staff = (SELECT COUNT(*) FROM MEDICAL_STAFF WHERE Ward_ID = NEW.Ward_ID)
    WHERE Ward_ID = NEW.Ward_ID;
END;

INSERT INTO MEDICAL_STAFF (Staff_ID, Name, Occupation, Specialization, Ward_ID, Pharmacy_ID)
VALUES
(101, 'Jacob Aguero', 'Surgeon', 'Neurosurgery', 201, 701),
(102, 'Jane Smith', 'Doctor', 'Pediatric Nursing', 202, 701),
(103, 'Bob Johnson', 'Physician', 'Cardiology', 203, 703),
(104, 'Amy Lee', 'Surgeon', 'Orthopedic Surgery', 204, 702),
(105, 'Mark Wilson', 'Physician', 'Gastroenterology', 205, 701),
(106, 'Sarah Brown', 'Doctor', 'Dermatology', 201, 702),
(107, 'David Miller', 'Doctor', 'Oncology', 202, 701),
(108, 'Michael Clark', 'Receptionist', 'Front_Desk', 203, NULL),
(109, 'Emily Davis', 'Receptionist', 'Front_Desk', 204, NULL),
(110, 'Oliver Green', 'Doctor', 'Endocrinology', 205, 703),
(111, 'Sophia Hernandez', 'Janitor', 'Cleaning', 201, NULL),
(112, 'Avery Jackson', 'Doctor', 'Psychiatry', 202, 703),
(113, 'Ethan Clark', 'Doctor', 'Internal Medicine', 203, 702),
(114, 'Isabella Wright', 'Doctor', 'Obstetrics and Gynecology', 204, 701),
(115, 'Liam Hernandez', 'Doctor', 'Urology', 205, 702);

CREATE TABLE PATIENT (    
Patient_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Insurance VARCHAR(255),
    Staff_ID INT,
    Emergency_Contact VARCHAR(255),
    Admission_Reason VARCHAR(255),
    Admission_Date DATE,
    Discharge_Date DATE,
    Discharge_Diagnosis VARCHAR(255),
    Ward_ID INT,
    Patient_Status VARCHAR(255)  CHECK (Patient_Status IN ('Active', 'Inactive')),
    FOREIGN KEY (Staff_ID) REFERENCES MEDICAL_STAFF (Staff_ID),
    FOREIGN KEY (Ward_ID) REFERENCES HOSPITAL_WARD (Ward_ID),
    CHECK (Discharge_Date >= Admission_Date)
);


CREATE TRIGGER chk_staff_id_count
BEFORE INSERT ON PATIENT
FOR EACH ROW
BEGIN
    SELECT RAISE(ABORT, 'Cannot insert more than 1000 records with the same Staff_ID')
    WHERE (SELECT COUNT(*) FROM PATIENT WHERE Staff_ID = NEW.Staff_ID) >= 1000;
END;	

CREATE TRIGGER chk_ward_id_count
BEFORE UPDATE ON PATIENT
FOR EACH ROW
BEGIN
    SELECT RAISE(ABORT, 'Cannot insert more than active patients with the same ward max capacity')
    WHERE (SELECT COUNT(*) FROM PATIENT WHERE Ward_ID = NEW.Ward_ID AND Patient_Status = 'Active') >
	(SELECT Max_Patients FROM HOSPITAL_WARD WHERE Ward_ID = NEW.Ward_ID);
END;

CREATE TRIGGER chk_ward_id_count_insert
BEFORE INSERT ON PATIENT
FOR EACH ROW
BEGIN
    SELECT RAISE(ABORT, 'Cannot insert more than active patients with the same ward max capacity')
    WHERE (SELECT COUNT(*) FROM PATIENT WHERE Ward_ID = NEW.Ward_ID AND Patient_Status = 'Active') >
	(SELECT Max_Patients FROM HOSPITAL_WARD WHERE Ward_ID = NEW.Ward_ID);
END;

CREATE TRIGGER update_ward_patient_count_insert
AFTER INSERT ON PATIENT
FOR EACH ROW
BEGIN
    UPDATE HOSPITAL_WARD
    SET Current_Patients = (SELECT COUNT(*) FROM PATIENT WHERE Ward_ID = NEW.Ward_ID AND Patient_Status = 'Active')
    WHERE Ward_ID = NEW.Ward_ID;
END;

CREATE TRIGGER update_ward_patient_count
AFTER UPDATE ON PATIENT
FOR EACH ROW
BEGIN
    UPDATE HOSPITAL_WARD
    SET Current_Patients = (SELECT COUNT(*) FROM PATIENT WHERE Ward_ID = NEW.Ward_ID AND Patient_Status = 'Active')
    WHERE Ward_ID = NEW.Ward_ID;
END;

CREATE TRIGGER check_ward_insert
BEFORE INSERT ON PATIENT
FOR EACH ROW
BEGIN
	SELECT RAISE(ABORT, 'The doctor and patient wards are different')
	WHERE (SELECT COUNT(*) FROM MEDICAL_STAFF WHERE Staff_ID = NEW.Staff_ID AND Ward_id = NEW.Ward_id = 0);
END;

CREATE TRIGGER check_ward
BEFORE UPDATE ON PATIENT
FOR EACH ROW
BEGIN
	SELECT RAISE(ABORT, 'The doctor and patient wards are different')
	WHERE (SELECT COUNT(*) FROM MEDICAL_STAFF WHERE Staff_ID = NEW.Staff_ID AND Ward_id = NEW.Ward_id = 0);
END;

INSERT INTO PATIENT (Patient_ID, Name, Insurance, Staff_ID, Emergency_Contact, Admission_Reason, Admission_Date, Discharge_Date, Discharge_Diagnosis, Ward_ID, Patient_Status)
VALUES
(1, 'John Smith', 'Blue Cross', 101, 'Jane Doe', 'Chest pain', '2022-01-01',NULL, NULL, 201, 'Active'),
(2, 'Jane Doe', 'Aetna', 102, 'John Smith', 'Shortness of breath', '2022-02-05', '2022-02-10', 'Bronchitis', 202, 'Inactive'),
(3, 'Mary Jones', 'Cigna', 103, 'Joe Johnson', 'High blood sugar', '2022-03-15', '2022-03-21', 'Type 2 diabetes', 203, 'Inactive'),
(4, 'Joe Johnson', 'Humana', 104, 'Mary Jones', 'Headache', '2022-04-01', NULL, NULL, 204, 'Active'),
(5, 'Emily Brown', 'United Healthcare', 101, 'David Lee', 'Routine checkup', '2022-05-01', NULL, NULL, 201, 'Active'),
(6, 'Joe Swanson', 'Humana', 104, 'Mary Jones', 'Headache', '2022-04-01', NULL, NULL, 204, 'Active'),
(7, 'Avery Jackson', 'Aetna', 102, 'Olivia Lee', 'Fractured Arm', '2022-05-02', '2022-05-10', 'Broken Bone', 202, 'Inactive'),
(8, 'Ethan Clark', 'Blue Cross', 101, 'Avery Jackson', 'Fever', '2022-06-01', NULL, NULL, 201, 'Active'),
(9, 'Isabella Wright', 'Cigna', 103, 'Oliver White', 'Migraine', '2022-07-15', '2022-07-18', 'Migraine', 203, 'Inactive'),
(10, 'Liam Hernandez', 'Humana', 104, 'Ella Gonzalez', 'Chest Pain', '2022-08-05', '2022-08-09', 'Heartburn', 204, 'Inactive'),
(11, 'Emma Smith', 'United Healthcare', 101, 'Michael Thompson', 'Sore Throat', '2022-09-02', NULL, NULL, 201, 'Active'),
(12, 'Daniel Lee', 'Aetna', 102, 'Mia Davis', 'Fever', '2022-10-01', NULL, NULL, 202, 'Active'),
(13, 'Chloe Baker', 'Blue Cross', 101, 'Liam Hernandez', 'Broken Arm', '2022-11-15', '2022-11-20', 'Broken Bone', 201, 'Inactive'),
(14, 'Sophia Mitchell', 'Cigna', 103, 'William Nelson', 'High Blood Pressure', '2022-12-01', NULL, NULL, 203, 'Active'),
(15, 'Henry Perez', 'Humana', 104, 'Evelyn Martinez', 'Cough', '2023-01-05', '2023-01-10', 'Flu', 204, 'Inactive');


CREATE TABLE PRESCRIPTION (
    Prescription_Serial_Number INT PRIMARY KEY NOT NULL,
    Patient_ID INT,
    Staff_ID INT,
    Refills_Left INT CHECK (Refills_Left >= 0 AND Refills_Left <= 10),
    Pharmacy_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES PATIENT (Patient_ID),
    FOREIGN KEY (Staff_ID) REFERENCES MEDICAL_STAFF (Staff_ID) ,
    FOREIGN KEY (Pharmacy_ID) REFERENCES PHARMACY (Pharmacy_ID)
);


INSERT INTO PRESCRIPTION (Prescription_Serial_Number, Patient_ID, Staff_ID, Refills_Left, Pharmacy_ID) VALUES
(401, 1, 102, 6, 701),
(402, 2, 104, 0, 701),
(403, 3, 105, 10, 703),
(404, 4, 102, 4, 704),
(405, 5, 104, 8, 705),
(406, 6, 101, 2, 702),
(407, 7, 103, 1, 703),
(408, 9, 105, 5, 701),
(409, 11, 101, 3, 704),
(410, 13, 104, 0, 702),
(411, 15, 102, 6, 705);

CREATE TABLE MEDICAL_CONDITION (    
	Patient_ID INT NOT NULL,
    Condition_Name VARCHAR(255) NOT NULL,
    Previous_Admission_Reason VARCHAR(255),
    Previous_Prescription_ID INT,
    Diagnosis_Date DATE,
    Notes VARCHAR(255),
	PRIMARY KEY (Patient_ID,Condition_Name),
    FOREIGN KEY (Patient_ID) REFERENCES PATIENT (Patient_ID),
	FOREIGN KEY (Previous_Prescription_ID) REFERENCES PRESCRIPTION (Prescription_Serial_Number)
);

CREATE TRIGGER check_patient_prescription_insert
BEFORE INSERT ON MEDICAL_CONDITION
FOR EACH ROW
BEGIN
	SELECT RAISE(ABORT, 'Incorrect prescription, does not match with patient')
	WHERE NEW.Patient_ID != (SELECT Patient_ID FROM Prescription WHERE Prescription_Serial_Number= NEW.Previous_Prescription_ID);
END;

CREATE TRIGGER check_patient_prescription_
BEFORE UPDATE ON MEDICAL_CONDITION
FOR EACH ROW
BEGIN
	SELECT RAISE(ABORT, 'Incorrect prescription, does not match with patient')
		WHERE NEW.Patient_ID != (SELECT Patient_ID FROM Prescription WHERE Prescription_Serial_Number= NEW.Previous_Prescription_ID);
END;


INSERT INTO MEDICAL_CONDITION (Patient_ID, Condition_Name, Previous_Admission_Reason, Previous_Prescription_ID, Diagnosis_Date, Notes) 
VALUES
(1, 'Asthma', 'Breathing Problems', 401, '2023-05-01', 'Chronic coughing and wheezing.'),
(2, 'Pneumonia', 'Shortness of breath and fever', 402, '2023-05-01', 'Chest pain and difficulty breathing.'),
(2, 'Asthma', 'Breathing Problems', 402, '2023-05-01', 'Chronic coughing and wheezing.'),
(3, 'Type 2 Diabetes', 'High blood sugar', 403, '2023-05-01', 'Numbness in hands and feet.'),
(4, 'Migraine', 'Headache', 404, '2023-05-01', 'Sensitivity to light and sound.'),
(5, 'Hypertension', 'Routine checkup', 405, '2023-05-01', 'High blood pressure.'),
(5, 'Anemia', 'Routine checkup', 405, '2023-05-01', 'Fatigue and weakness.'),
(6, 'Migraine', 'Headache', 406, '2023-05-01', 'Nausea and vomiting.'),
(7, 'Fractured Arm', 'Injury', NULL, '2023-05-01', 'Pain and swelling in arm.'),
(8, 'Fever', 'Infection', NULL, '2023-05-01', 'Body aches and chills.'),
(9, 'Migraine', 'Headache', 408, '2023-05-01', 'Sensitivity to light and sound.'),
(10, 'Heartburn', 'Chest pain', NULL, '2023-05-01', 'Burning sensation in chest.'),
(10, 'GERD', 'Heartburn', NULL, '2023-05-01', 'Acid reflux and difficulty swallowing.'),
(11, 'Pharyngitis', 'Sore throat', 409, '2023-05-01', 'Difficulty swallowing and fever.'),
(12, 'Fever', 'Infection', NULL, '2023-05-01', 'Body aches and chills.'),
(12, 'Strep Throat', 'Fever and sore throat', NULL, '2023-05-01', 'Difficulty swallowing and swollen lymph nodes.'),
(13, 'Broken Arm', 'Injury', 410, '2023-05-01', 'Pain and swelling in arm.'),
(14, 'Hypertension', 'High blood pressure', NULL, '2023-05-01', 'Headaches and fatigue.'),
(15, 'Influenza', 'Cough and fever', 411, '2023-05-01', 'Body aches and fatigue.');



CREATE TABLE PRESCRIBED_MEDICINE (
    Prescription_Serial_Number INT  NOT NULL,
    Medicine_ID INT,
    PRIMARY KEY (Prescription_Serial_Number, Medicine_ID),
    FOREIGN KEY (Prescription_Serial_Number) REFERENCES PRESCRIPTION (Prescription_Serial_Number) ,
    FOREIGN KEY (Medicine_ID) REFERENCES MEDICINE (Medicine_ID)
);

INSERT INTO PRESCRIBED_MEDICINE (Prescription_Serial_Number, Medicine_ID)
VALUES
(401, 602), (402, 603),(403,601), (404, 604), (404, 605), (405, 601), (406, 606), (407, 607), (408, 608), (408, 609), 
(409, 610), (410, 611), (410, 612), (411, 613), (411, 614);

CREATE VIEW PRESCRIPTION_VIEW_MEDICINE AS
SELECT prescriptions.Prescription_Serial_Number, prescriptions.Staff_ID, prescriptions.Patient_ID,
	   prescriptions.Refills_Left, pharm.Pharmacy_Name, premed.Medicine_ID, med.Medicine_Name,
	   med.Instructions, med.Medicine_Description
FROM PRESCRIPTION prescriptions
LEFT JOIN PRESCRIBED_MEDICINE premed
ON premed.Prescription_Serial_Number = prescriptions.Prescription_Serial_Number
LEFT JOIN MEDICINE med 
ON med.Medicine_ID = premed.Medicine_ID
LEFT JOIN PHARMACY pharm 
ON pharm.Pharmacy_ID = prescriptions.Pharmacy_ID
ORDER BY prescriptions.Prescription_Serial_Number;

CREATE VIEW WARD_EQUIPMENT AS
SELECT ward.Ward_ID, ward.Ward_Type, equip.Equipment_ID, equip.Equipment_Type, equip.Amount
FROM HOSPITAL_WARD ward
LEFT JOIN MEDICAL_EQUIPMENT equip
ON ward.Ward_ID = equip.Ward_ID
ORDER BY ward.Ward_ID;
	
CREATE VIEW STAFF_PATIENT AS
SELECT patients.Patient_ID, patients.Name, patients.Insurance, patients.Emergency_Contact,
	   patients.Admission_Reason, patients.Admission_Date, cond.Condition_Name, cond.Notes
FROM PATIENT patients
LEFT JOIN MEDICAL_STAFF staff 
ON staff.Staff_ID = 101
LEFT JOIN MEDICAL_CONDITION cond
ON cond.Patient_ID = patients.Patient_ID
WHERE patients.Staff_ID = 101
ORDER BY patients.Patient_ID;

SELECT * FROM PRESCRIPTION_VIEW_MEDICINE;

SELECT * FROM WARD_EQUIPMENT;

SELECT * FROM STAFF_PATIENT;
