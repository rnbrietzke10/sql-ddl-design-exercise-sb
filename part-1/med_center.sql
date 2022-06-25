DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\c med_center

CREATE TABLE medical_center (
    id SERIAL PRIMARY KEY,
    hospital_name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone_number VARCHAR(11) NOT NULL

);

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(11) NOT NULL,
    hosptial_id INTEGER REFERENCES med_center ON DELETE CASCADE
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone_number VARCHAR(11) NOT NULL,
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    condition_name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    diagnosis_date DATE NOT NULL,
    treatment_description TEXT
);


CREATE TABLE diagnosis_patient_doctor (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    doctor_id INTEGER REFERENCES doctors, -- Look at what to do on delete
    diagnosis_id INTEGER REFERENCES diagnosis
);