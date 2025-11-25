CREATE DATABASE hospital_beds_management;
USE hospital_beds_management;

CREATE DATABASE Hospital;
RENAME TABLE hospital_beds_management.patients TO hospital.patients;
RENAME TABLE hospital_beds_management.services_weekly TO hospital.services_weekly;
RENAME TABLE hospital_beds_management.staff TO hospital.staff;
RENAME TABLE hospital_beds_management.staff_schedule TO hospital.staff_schedule;

DROP DATABASE hospital_beds_management;

SELECT * FROM Patients;
SELECT * FROM Services_Weekly;
SELECT * FROM Staff;
SELECT * FROM Staff_Schedule;

DROP DATABASE IF EXISTS hospital;

CREATE DATABASE hospital
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE hospital;

-- 1. Patients Table
CREATE TABLE patients (
    patient_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    arrival_date DATE,
    departure_date DATE,
    service VARCHAR(50),
    satisfaction INT
);

-- 2. Services Weekly Table
CREATE TABLE services_weekly (
    week INT,
    month INT,
    service VARCHAR(50),
    available_beds INT,
    patients_request INT,
    patients_admitted INT,
    patients_refused INT,
    patient_satisfaction INT,
    staff_morale INT,
    event VARCHAR(100)
);

-- 3. Staff Table
CREATE TABLE staff (
    staff_id VARCHAR(50) PRIMARY KEY,
    staff_name VARCHAR(100),
    role VARCHAR(50),
    service VARCHAR(50)
);

-- 4. Staff Schedule Table
CREATE TABLE staff_schedule (
    week INT,
    staff_id VARCHAR(50),
    staff_name VARCHAR(100),
    role VARCHAR(50),
    service VARCHAR(50),
    present TINYINT(1),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

