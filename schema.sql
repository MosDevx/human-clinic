/* Database schema to keep the structure of entire database. */

CREATE TABLE patients(id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, name VARCHAR(100) NOT NULL, date_of_birth DATE);

CREATE TABLE medical_histories (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, admitted_at TIMESTAMP, patient_id INT, status VARCHAR(50) , CONSTRAINT fk_patient_id FOREIGN KEY(patient_id) REFERENCES patients(id) ON DELETE CASCADE );

CREATE TABLE treatments (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, type VARCHAR(200) NOT NULL,name VARCHAR(200) NOT NULL);