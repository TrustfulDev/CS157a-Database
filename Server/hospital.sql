-- SQL CODE GOES HERE!!!! DELETE THE TEST CODE BELOW
CREATE TABLE HOSPITAL_WARD (
    Ward_ID INT PRIMARY KEY NOT NULL,
    Ward_Type VARCHAR(255),
    Current_Patients INT,
    Max_Patients INT
);

INSERT INTO HOSPITAL_WARD (Ward_ID, Ward_Type, Current_Patients, Max_Patients)
VALUES 
(201, 'Cardiology', 12, 20),
(202, 'Neurology', 8, 10), 
(203, 'Oncology', 16, 20),
(204, 'Orthopedics', 6, 10),
(205, 'Pediatrics', 20, 25);

CREATE TABLE MEDICAL_EQUIPMENT (
    Equipment_ID INT PRIMARY KEY NOT NULL,
    Equipment_Type VARCHAR(255),
    Amount INT,
    Ward_ID INT,
    FOREIGN KEY (Ward_ID) REFERENCES HOSPITAL_WARD (Ward_ID)
);

INSERT INTO MEDICAL_EQUIPMENT (Equipment_ID, Equipment_Type, Amount, Ward_ID)
VALUES
(3011, 'X-ray machine', 2, 201),
(302, 'Ultrasound machine', 1, 201),
(303, 'Defibrillator', 3, 203),
(304, 'Blood pressure monitor', 5, 204),
(305, 'Nebulizer', 2, 205);


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
       (605, 'Omeprazole', 'Take one pill by mouth once a day before a meal.', 'Used to treat gastroesophageal reflux disease (GERD) and other conditions caused by excess stomach acid.');
	   

CREATE TABLE PHARMACY (
    Pharmacy_ID INT PRIMARY KEY NOT NULL
);

INSERT INTO PHARMACY (Pharmacy_ID) VALUES
 (701), (702), (703), (704), (705);	   
 
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
    (703, 601, 75, 25, 60),
    (704, 604, 10, 5, 20);
 
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


INSERT INTO MEDICAL_STAFF (Staff_ID, Name, Occupation, Specialization, Ward_ID, Pharmacy_ID)
VALUES 
(101, 'Jacob Aguero ', 'Surgeon', 'Neurosurgery', 201, 701),
(102, 'Jane Smith', 'Doctor', 'Pediatric Nursing', 201, 701),
(103, 'Bob Johnson', 'Physician', 'Cardiology', 202, 703),
(104, 'Amy Lee', 'Surgeon', 'Orthopedic Surgery', 204, 702),
(105, 'Mark Wilson', 'Physician', 'Gastroenterology', 201, 701);

CREATE TABLE PATIENT (    
Patient_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Insurance VARCHAR(255),
    Staff_ID INT,
    Emergency_Contact VARCHAR(255),
    Medical_Condition VARCHAR(255),
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

INSERT INTO PATIENT (Patient_ID, Name, Insurance, Staff_ID, Emergency_Contact, Medical_Condition, Admission_Reason, Admission_Date, Discharge_Date, Discharge_Diagnosis, Ward_ID, Patient_Status)
VALUES 
(1, 'John Smith', 'Blue Cross', 101, 'Jane Doe', 'None', 'Chest pain', '2023-01-01',NULL, NULL, 201, 'Active'),
(2, 'Jane Doe', 'Aetna', 102, 'John Smith', 'Asthma', 'Shortness of breath', '2023-02-05', '2023-02-10', 'Bronchitis', 201, 'Inactive'),
(3, 'Mary Jones', 'Cigna', 103, 'Joe Johnson', 'Diabetes', 'High blood sugar', '2023-03-15', '2023-03-21', 'Type 2 diabetes', 201, 'Inactive'),
(4, 'Joe Johnson', 'Humana', 104, 'Mary Jones', 'High blood pressure', 'Headache', '2023-04-01', NULL, NULL, 202, 'Active'),
(5, 'Emily Brown', 'United Healthcare', 101, 'David Lee', 'None', 'Routine checkup', '2023-05-01', NULL, NULL, 204, 'Inactive');



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
(405, 5, 104, 8, 705);


CREATE TABLE PRESCRIBED_MEDICINE (
    Prescription_Serial_Number INT  NOT NULL,
    Medicine_ID INT,
    PRIMARY KEY (Prescription_Serial_Number, Medicine_ID),
    FOREIGN KEY (Prescription_Serial_Number) REFERENCES PRESCRIPTION (Prescription_Serial_Number) ,
    FOREIGN KEY (Medicine_ID) REFERENCES MEDICINE (Medicine_ID)
);

INSERT INTO PRESCRIBED_MEDICINE (Prescription_Serial_Number, Medicine_ID)
VALUES 
(401, 602), (402, 603), (404, 604), (404, 605), (405, 601);
