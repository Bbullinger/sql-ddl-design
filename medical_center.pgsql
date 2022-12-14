DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;


CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    department TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL

);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    disorder TEXT NOT NULL

);
CREATE TABLE doctors_patients (
    doctor_id INTEGER REFERENCES doctors,
    patient_id INTEGER REFERENCES patients
);

CREATE TABLE patient_diagnosis (
    patient_id INTEGER REFERENCES patients,
    diagnosis_id INTEGER REFERENCES diagnosis

);


INSERT INTO doctors (first_name,last_name,department)
VALUES
('Scott','Rogge','Cardiology'),
('Steve','Anisman','Pulmonology'),
('Dmitri','Belov','Neurology');

INSERT INTO patients (first_name,last_name)
VALUES
('Eric','Sanford'),
('Brandon','Bullinger'),
('Troy','Burek');

INSERT INTO diagnosis (disorder)
VALUES
('Lactose Intolerance'),
('Carpal Tunnel'),
('Procrastination');

INSERT INTO doctors_patients (doctor_id,patient_id)
VALUES
(1,1),
(1,2),
(1,3),
(2,2),
(3,1),
(3,2);

INSERT INTO patient_diagnosis(patient_id, diagnosis_id)
VALUES
(1,1),
(2,2),
(3,3),
(2,1),
(3,2);