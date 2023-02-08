/* Database schema to keep the structure of entire database. */

CREATE TABLE patients(id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, name VARCHAR(100) NOT NULL, date_of_birth DATE);

CREATE TABLE medical_histories (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, admitted_at TIMESTAMP, patient_id INT, status VARCHAR(50) , CONSTRAINT fk_patient_id FOREIGN KEY(patient_id) REFERENCES patients(id) ON DELETE CASCADE );

CREATE TABLE treatments (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, type VARCHAR(200) NOT NULL,name VARCHAR(200) NOT NULL);

CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_invoices
    FOREIGN KEY (invoice_id)
    REFERENCES invoices (id)
    ON DELETE CASCADE,
    CONSTRAINT fk_treatments
    FOREIGN KEY (treatment_id)
    REFERENCES treatments (id)
    ON DELETE CASCADE
    );

CREATE TABLE invoices (
    id INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_medical_histories
    FOREIGN KEY (medical_history_id)
    REFERENCES medical_histories (id)
    ON DELETE CASCADE
    );
    
CREATE TABLE med_histories_treatment (
    medical_history_id INT NOT NULL,
    treatment_id INT NOT NULL,
    PRIMARY KEY(medical_history_id, treatment_id),
    CONSTRAINT fk_medical_histories
    FOREIGN KEY (medical_history_id)
    REFERENCES medical_histories (id)
    ON DELETE CASCADE,
    CONSTRAINT fk_treatments
    FOREIGN KEY (treatment_id)
    REFERENCES treatments (id)
    ON DELETE CASCADE
    );


-- CREATE INDEXES ---

CREATE INDEX patient_id_med_histories ON medical_histories(patient_id ASC);

CREATE INDEX invoice_id_invoice_items ON invoice_items(invoice_id ASC);

CREATE INDEX treatment_id_invoice_items ON invoice_items(treatment_id ASC);

CREATE INDEX medical_history_id_invoices ON invoices(medical_history_id ASC);

CREATE INDEX treatment_id_med_histories_treatment_asc ON med_histories_treatment(treatment_id ASC);

CREATE INDEX medical_history_id_med_histories_treatment_asc ON med_histories_treatment(medical_history_id ASC); 