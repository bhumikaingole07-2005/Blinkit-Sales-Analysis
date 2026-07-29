-- ============================================================
--   HEALTHCARE ANALYTICS PROJECT
--   Clean SQL File | MySQL 8.0 Compatible
--   No Duplicate Values | Proper Semicolons
-- ============================================================

CREATE DATABASE IF NOT EXISTS healthcare_db;
USE healthcare_db;

-- ============================================================
-- DROP TABLES (Safe Reset)
-- ============================================================
DROP TABLE IF EXISTS billing;
DROP TABLE IF EXISTS medical_records;
DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS medicines;
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS departments;

-- ============================================================
-- TABLE: departments
-- ============================================================
CREATE TABLE departments (
    dept_id       VARCHAR(10)  PRIMARY KEY,
    dept_name     VARCHAR(100) NOT NULL,
    head_doctor   VARCHAR(100),
    total_beds    INT
);

-- ============================================================
-- TABLE: doctors
-- ============================================================
CREATE TABLE doctors (
    doctor_id        VARCHAR(10)  PRIMARY KEY,
    doctor_name      VARCHAR(100) NOT NULL,
    specialization   VARCHAR(100),
    dept_id          VARCHAR(10),
    experience_yrs   INT,
    phone            VARCHAR(15),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- ============================================================
-- TABLE: patients
-- ============================================================
CREATE TABLE patients (
    patient_id      VARCHAR(10)  PRIMARY KEY,
    patient_name    VARCHAR(100) NOT NULL,
    age             INT          NOT NULL,
    gender          VARCHAR(10)  NOT NULL,
    blood_group     VARCHAR(5)   NOT NULL,
    phone           VARCHAR(15),
    city            VARCHAR(50),
    admission_date  DATE
);

-- ============================================================
-- TABLE: appointments
-- ============================================================
CREATE TABLE appointments (
    appointment_id    VARCHAR(10)  PRIMARY KEY,
    patient_id        VARCHAR(10),
    doctor_id         VARCHAR(10),
    appointment_date  DATE,
    status            VARCHAR(20),
    diagnosis         VARCHAR(200),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id)  REFERENCES doctors(doctor_id)
);

-- ============================================================
-- TABLE: medical_records
-- ============================================================
CREATE TABLE medical_records (
    record_id      VARCHAR(10)  PRIMARY KEY,
    patient_id     VARCHAR(10),
    doctor_id      VARCHAR(10),
    diagnosis      VARCHAR(200),
    prescription   VARCHAR(300),
    test_name      VARCHAR(100),
    test_result    VARCHAR(50),
    record_date    DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id)  REFERENCES doctors(doctor_id)
);

-- ============================================================
-- TABLE: billing
-- ============================================================
CREATE TABLE billing (
    bill_id         VARCHAR(10)  PRIMARY KEY,
    patient_id      VARCHAR(10),
    appointment_id  VARCHAR(10),
    total_amount    DECIMAL(10,2),
    paid_amount     DECIMAL(10,2),
    payment_status  VARCHAR(20),
    payment_date    DATE,
    FOREIGN KEY (patient_id)     REFERENCES patients(patient_id),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- ============================================================
-- TABLE: medicines
-- ============================================================
CREATE TABLE medicines (
    medicine_id     VARCHAR(10)  PRIMARY KEY,
    medicine_name   VARCHAR(100),
    category        VARCHAR(50),
    stock_qty       INT,
    price_per_unit  DECIMAL(8,2),
    expiry_date     DATE
);

-- ============================================================
-- DATA: departments
-- ============================================================
INSERT INTO departments VALUES ('D001', 'Cardiology',       'Dr. Ramesh Khanna', 30);
INSERT INTO departments VALUES ('D002', 'Neurology',        'Dr. Shalini Reddy', 25);
INSERT INTO departments VALUES ('D003', 'Orthopedics',      'Dr. Vikram Bose',   20);
INSERT INTO departments VALUES ('D004', 'Pediatrics',       'Dr. Anita Sharma',  35);
INSERT INTO departments VALUES ('D005', 'General Medicine', 'Dr. Mohan Lal',     50);
INSERT INTO departments VALUES ('D006', 'Dermatology',      'Dr. Priti Jain',    15);
INSERT INTO departments VALUES ('D007', 'Oncology',         'Dr. Suresh Nair',   20);

-- ============================================================
-- DATA: doctors
-- ============================================================
INSERT INTO doctors VALUES ('DR001', 'Dr. Ramesh Khanna',  'Cardiologist',       'D001', 15, '9900112233');
INSERT INTO doctors VALUES ('DR002', 'Dr. Shalini Reddy',  'Neurologist',        'D002', 12, '9900223344');
INSERT INTO doctors VALUES ('DR003', 'Dr. Vikram Bose',    'Orthopedic Surgeon', 'D003', 10, '9900334455');
INSERT INTO doctors VALUES ('DR004', 'Dr. Anita Sharma',   'Pediatrician',       'D004',  8, '9900445566');
INSERT INTO doctors VALUES ('DR005', 'Dr. Mohan Lal',      'General Physician',  'D005', 20, '9900556677');
INSERT INTO doctors VALUES ('DR006', 'Dr. Priti Jain',     'Dermatologist',      'D006',  6, '9900667788');
INSERT INTO doctors VALUES ('DR007', 'Dr. Suresh Nair',    'Oncologist',         'D007', 18, '9900778899');

-- ============================================================
-- DATA: patients
-- ============================================================
INSERT INTO patients VALUES ('PID001', 'Rahul Sharma',   28, 'Male',   'B+',  '9876543210', 'Pune',       '2024-01-05');
INSERT INTO patients VALUES ('PID002', 'Priya Mehta',    35, 'Female', 'A+',  '9123456780', 'Mumbai',     '2024-01-10');
INSERT INTO patients VALUES ('PID003', 'Amit Verma',     45, 'Male',   'O+',  '9988776655', 'Delhi',      '2024-01-15');
INSERT INTO patients VALUES ('PID004', 'Sunita Patil',   52, 'Female', 'AB+', '9765432100', 'Nagpur',     '2024-02-01');
INSERT INTO patients VALUES ('PID005', 'Ravi Kulkarni',  60, 'Male',   'A-',  '9654321098', 'Pune',       '2024-02-10');
INSERT INTO patients VALUES ('PID006', 'Anjali Singh',   22, 'Female', 'B-',  '9543210987', 'Nashik',     '2024-02-18');
INSERT INTO patients VALUES ('PID007', 'Deepak Joshi',   38, 'Male',   'O-',  '9432109876', 'Mumbai',     '2024-03-01');
INSERT INTO patients VALUES ('PID008', 'Kavita Desai',   48, 'Female', 'AB-', '9321098765', 'Aurangabad', '2024-03-12');
INSERT INTO patients VALUES ('PID009', 'Manoj Yadav',    55, 'Male',   'B+',  '9210987654', 'Pune',       '2024-03-20');
INSERT INTO patients VALUES ('PID010', 'Sneha Nair',     30, 'Female', 'O+',  '9109876543', 'Kolhapur',   '2024-04-05');
INSERT INTO patients VALUES ('PID011', 'Vikram Rao',     42, 'Male',   'A+',  '9087654321', 'Pune',       '2024-04-15');
INSERT INTO patients VALUES ('PID012', 'Pooja Gupta',    27, 'Female', 'B+',  '8976543210', 'Mumbai',     '2024-05-02');
INSERT INTO patients VALUES ('PID013', 'Suresh Pandey',  65, 'Male',   'O+',  '8865432109', 'Nagpur',     '2024-05-10');
INSERT INTO patients VALUES ('PID014', 'Meera Iyer',     33, 'Female', 'A-',  '8754321098', 'Pune',       '2024-05-22');
INSERT INTO patients VALUES ('PID015', 'Arun Kumar',     50, 'Male',   'AB+', '8643210987', 'Delhi',      '2024-06-01');

-- ============================================================
-- DATA: appointments
-- ============================================================
INSERT INTO appointments VALUES ('APT001', 'PID001', 'DR001', '2024-01-06',  'Completed', 'Hypertension');
INSERT INTO appointments VALUES ('APT002', 'PID002', 'DR002', '2024-01-11',  'Completed', 'Migraine');
INSERT INTO appointments VALUES ('APT003', 'PID003', 'DR003', '2024-01-16',  'Completed', 'Knee Pain');
INSERT INTO appointments VALUES ('APT004', 'PID004', 'DR005', '2024-02-02',  'Completed', 'Fever and Cough');
INSERT INTO appointments VALUES ('APT005', 'PID005', 'DR001', '2024-02-11',  'Completed', 'Heart Arrhythmia');
INSERT INTO appointments VALUES ('APT006', 'PID006', 'DR004', '2024-02-19',  'Pending',   'Child Allergy');
INSERT INTO appointments VALUES ('APT007', 'PID007', 'DR006', '2024-03-02',  'Completed', 'Eczema');
INSERT INTO appointments VALUES ('APT008', 'PID008', 'DR007', '2024-03-13',  'Completed', 'Breast Cancer Checkup');
INSERT INTO appointments VALUES ('APT009', 'PID009', 'DR001', '2024-03-21',  'Cancelled', 'Chest Pain');
INSERT INTO appointments VALUES ('APT010', 'PID010', 'DR005', '2024-04-06',  'Completed', 'Diabetes');
INSERT INTO appointments VALUES ('APT011', 'PID011', 'DR002', '2024-04-16',  'Completed', 'Epilepsy');
INSERT INTO appointments VALUES ('APT012', 'PID012', 'DR003', '2024-05-03',  'Pending',   'Back Pain');
INSERT INTO appointments VALUES ('APT013', 'PID013', 'DR005', '2024-05-11',  'Completed', 'BP Monitoring');
INSERT INTO appointments VALUES ('APT014', 'PID014', 'DR006', '2024-05-23',  'Completed', 'Psoriasis');
INSERT INTO appointments VALUES ('APT015', 'PID015', 'DR007', '2024-06-02',  'Completed', 'Lung Cancer Screening');

-- ============================================================
-- DATA: medical_records
-- ============================================================
INSERT INTO medical_records VALUES ('REC001', 'PID001', 'DR001', 'Hypertension',          'Amlodipine 5mg',         'ECG',            'Abnormal',  '2024-01-06');
INSERT INTO medical_records VALUES ('REC002', 'PID002', 'DR002', 'Migraine',               'Sumatriptan 50mg',       'MRI Brain',      'Normal',    '2024-01-11');
INSERT INTO medical_records VALUES ('REC003', 'PID003', 'DR003', 'Knee Pain',              'Diclofenac Gel',         'X-Ray Knee',     'Moderate',  '2024-01-16');
INSERT INTO medical_records VALUES ('REC004', 'PID004', 'DR005', 'Fever and Cough',        'Paracetamol 500mg',      'CBC',            'Normal',    '2024-02-02');
INSERT INTO medical_records VALUES ('REC005', 'PID005', 'DR001', 'Heart Arrhythmia',       'Metoprolol 25mg',        'Holter Monitor', 'Abnormal',  '2024-02-11');
INSERT INTO medical_records VALUES ('REC006', 'PID006', 'DR004', 'Child Allergy',          'Cetirizine 5mg',         'Allergy Panel',  'Positive',  '2024-02-19');
INSERT INTO medical_records VALUES ('REC007', 'PID007', 'DR006', 'Eczema',                 'Hydrocortisone Cream',   'Skin Biopsy',    'Positive',  '2024-03-02');
INSERT INTO medical_records VALUES ('REC008', 'PID008', 'DR007', 'Breast Cancer Checkup',  'Awaited',                'Mammography',    'Clear',     '2024-03-13');
INSERT INTO medical_records VALUES ('REC009', 'PID009', 'DR001', 'Chest Pain',             'Aspirin 75mg',           'Stress Test',    'Normal',    '2024-03-21');
INSERT INTO medical_records VALUES ('REC010', 'PID010', 'DR005', 'Diabetes',               'Metformin 500mg',        'HbA1c',          'High',      '2024-04-06');
INSERT INTO medical_records VALUES ('REC011', 'PID011', 'DR002', 'Epilepsy',               'Levetiracetam 500mg',    'EEG',            'Abnormal',  '2024-04-16');
INSERT INTO medical_records VALUES ('REC012', 'PID012', 'DR003', 'Back Pain',              'Muscle Relaxant',        'MRI Spine',      'Disc Bulge','2024-05-03');
INSERT INTO medical_records VALUES ('REC013', 'PID013', 'DR005', 'BP Monitoring',          'Telmisartan 40mg',       'BP Test',        'High',      '2024-05-11');
INSERT INTO medical_records VALUES ('REC014', 'PID014', 'DR006', 'Psoriasis',              'Calcipotriene Cream',    'Skin Patch',     'Positive',  '2024-05-23');
INSERT INTO medical_records VALUES ('REC015', 'PID015', 'DR007', 'Lung Cancer Screening',  'Oncology Referral',      'CT Scan',        'Suspicious','2024-06-02');

-- ============================================================
-- DATA: billing
-- ============================================================
INSERT INTO billing VALUES ('BIL001', 'PID001', 'APT001', 1500.00, 1500.00, 'Paid',    '2024-01-06');
INSERT INTO billing VALUES ('BIL002', 'PID002', 'APT002', 2000.00, 2000.00, 'Paid',    '2024-01-11');
INSERT INTO billing VALUES ('BIL003', 'PID003', 'APT003', 1800.00, 1000.00, 'Partial', '2024-01-16');
INSERT INTO billing VALUES ('BIL004', 'PID004', 'APT004',  800.00,  800.00, 'Paid',    '2024-02-02');
INSERT INTO billing VALUES ('BIL005', 'PID005', 'APT005', 2500.00, 2500.00, 'Paid',    '2024-02-11');
INSERT INTO billing VALUES ('BIL006', 'PID006', 'APT006',  600.00,    0.00, 'Pending', NULL);
INSERT INTO billing VALUES ('BIL007', 'PID007', 'APT007', 1200.00, 1200.00, 'Paid',    '2024-03-02');
INSERT INTO billing VALUES ('BIL008', 'PID008', 'APT008', 3000.00, 3000.00, 'Paid',    '2024-03-13');
INSERT INTO billing VALUES ('BIL009', 'PID009', 'APT009', 1500.00,    0.00, 'Pending', NULL);
INSERT INTO billing VALUES ('BIL010', 'PID010', 'APT010',  900.00,  900.00, 'Paid',    '2024-04-06');
INSERT INTO billing VALUES ('BIL011', 'PID011', 'APT011', 2200.00, 1100.00, 'Partial', '2024-04-16');
INSERT INTO billing VALUES ('BIL012', 'PID012', 'APT012', 1700.00,    0.00, 'Pending', NULL);
INSERT INTO billing VALUES ('BIL013', 'PID013', 'APT013',  700.00,  700.00, 'Paid',    '2024-05-11');
INSERT INTO billing VALUES ('BIL014', 'PID014', 'APT014', 1300.00, 1300.00, 'Paid',    '2024-05-23');
INSERT INTO billing VALUES ('BIL015', 'PID015', 'APT015', 4000.00, 4000.00, 'Paid',    '2024-06-02');

-- ============================================================
-- DATA: medicines
-- ============================================================
INSERT INTO medicines VALUES ('MED001', 'Paracetamol 500mg',    'Analgesic',        500,  2.50, '2026-06-01');
INSERT INTO medicines VALUES ('MED002', 'Amlodipine 5mg',       'Antihypertensive', 200,  5.00, '2025-12-01');
INSERT INTO medicines VALUES ('MED003', 'Metformin 500mg',      'Antidiabetic',     300,  4.50, '2026-03-01');
INSERT INTO medicines VALUES ('MED004', 'Sumatriptan 50mg',     'Antimigraine',     100, 18.00, '2025-09-01');
INSERT INTO medicines VALUES ('MED005', 'Metoprolol 25mg',      'Beta Blocker',     150,  6.00, '2025-11-01');
INSERT INTO medicines VALUES ('MED006', 'Cetirizine 10mg',      'Antihistamine',    400,  3.00, '2026-01-01');
INSERT INTO medicines VALUES ('MED007', 'Levetiracetam 500mg',  'Antiepileptic',     80, 22.00, '2025-08-01');
INSERT INTO medicines VALUES ('MED008', 'Telmisartan 40mg',     'Antihypertensive', 180,  7.50, '2026-04-01');
INSERT INTO medicines VALUES ('MED009', 'Diclofenac Gel 30g',   'Anti-inflammatory',250, 35.00, '2025-10-01');
INSERT INTO medicines VALUES ('MED010', 'Hydrocortisone Cream', 'Steroid',          120, 28.00, '2025-07-01');

-- ============================================================
-- RESULT QUERIES FOR POWER BI
-- ============================================================

-- 1. Total Patients by City
SELECT city, COUNT(*) AS total_patients
FROM patients
GROUP BY city
ORDER BY total_patients DESC;

-- 2. Appointment Status Breakdown
SELECT status, COUNT(*) AS total
FROM appointments
GROUP BY status;

-- 3. Revenue Summary KPI
SELECT
    SUM(total_amount)                                        AS total_billed,
    SUM(paid_amount)                                         AS total_collected,
    SUM(total_amount - paid_amount)                          AS total_pending,
    ROUND(SUM(paid_amount) / SUM(total_amount) * 100, 2)    AS collection_pct
FROM billing;

-- 4. Doctor-wise Appointment Count
SELECT
    d.doctor_name,
    d.specialization,
    dp.dept_name,
    COUNT(a.appointment_id) AS total_appointments
FROM doctors d
LEFT JOIN appointments a  ON d.doctor_id = a.doctor_id
LEFT JOIN departments dp  ON d.dept_id   = dp.dept_id
GROUP BY d.doctor_id, d.doctor_name, d.specialization, dp.dept_name
ORDER BY total_appointments DESC;

-- 5. Monthly Revenue Trend
SELECT
    DATE_FORMAT(payment_date, '%Y-%m') AS month,
    SUM(paid_amount)                   AS monthly_revenue
FROM billing
WHERE payment_status IN ('Paid', 'Partial')
GROUP BY month
ORDER BY month;

-- 6. Full Patient Report (Main Power BI Table)
SELECT
    p.patient_id,
    p.patient_name,
    p.age,
    p.gender,
    p.blood_group,
    p.city,
    a.appointment_id,
    a.appointment_date,
    a.status            AS appointment_status,
    a.diagnosis,
    d.doctor_name,
    dp.dept_name        AS department,
    b.total_amount,
    b.paid_amount,
    (b.total_amount - b.paid_amount) AS due_amount,
    b.payment_status
FROM patients p
JOIN appointments a  ON p.patient_id     = a.patient_id
JOIN doctors d       ON a.doctor_id      = d.doctor_id
JOIN departments dp  ON d.dept_id        = dp.dept_id
JOIN billing b       ON a.appointment_id = b.appointment_id
ORDER BY a.appointment_date;

-- 7. Age Group Distribution
SELECT
    CASE
        WHEN age BETWEEN 0  AND 17 THEN '0-17 Child'
        WHEN age BETWEEN 18 AND 35 THEN '18-35 Young'
        WHEN age BETWEEN 36 AND 55 THEN '36-55 Middle Age'
        ELSE '56 Plus Senior'
    END AS age_group,
    COUNT(*) AS total_patients
FROM patients
GROUP BY age_group
ORDER BY total_patients DESC;

-- 8. Gender Distribution
SELECT
    gender,
    COUNT(*) AS total_patients,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM patients), 1) AS percentage
FROM patients
GROUP BY gender;

-- 9. Top Diagnoses
SELECT
    diagnosis,
    COUNT(*) AS total_cases
FROM appointments
WHERE status = 'Completed'
GROUP BY diagnosis
ORDER BY total_cases DESC;

-- 10. Pending Payments
SELECT
    p.patient_name,
    p.phone,
    p.city,
    b.total_amount,
    b.paid_amount,
    (b.total_amount - b.paid_amount) AS due_amount,
    b.payment_status
FROM billing b
JOIN patients p ON b.patient_id = p.patient_id
WHERE b.payment_status IN ('Pending', 'Partial')
ORDER BY due_amount DESC;

-- 11. Medicine Stock Alert
SELECT
    medicine_name,
    category,
    stock_qty,
    price_per_unit,
    expiry_date,
    CASE
        WHEN stock_qty < 100 THEN 'CRITICAL'
        WHEN stock_qty < 150 THEN 'LOW'
        ELSE 'OK'
    END AS stock_status
FROM medicines
ORDER BY stock_qty ASC;

-- 12. Doctor Performance
SELECT
    d.doctor_name,
    dp.dept_name,
    SUM(CASE WHEN a.status = 'Completed' THEN 1 ELSE 0 END) AS completed,
    SUM(CASE WHEN a.status = 'Pending'   THEN 1 ELSE 0 END) AS pending,
    SUM(CASE WHEN a.status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled,
    COUNT(*) AS total
FROM doctors d
JOIN appointments a  ON d.doctor_id = a.doctor_id
JOIN departments dp  ON d.dept_id   = dp.dept_id
GROUP BY d.doctor_id, d.doctor_name, dp.dept_name
ORDER BY completed DESC;

-- 13. Department Wise Summary
SELECT
    dp.dept_name,
    dp.head_doctor,
    dp.total_beds,
    COUNT(a.appointment_id) AS total_appointments
FROM departments dp
LEFT JOIN doctors d      ON dp.dept_id   = d.dept_id
LEFT JOIN appointments a ON d.doctor_id  = a.doctor_id
GROUP BY dp.dept_id, dp.dept_name, dp.head_doctor, dp.total_beds
ORDER BY total_appointments DESC;

-- 14. Test Results Summary
SELECT
    test_name,
    test_result,
    COUNT(*) AS total_cases
FROM medical_records
GROUP BY test_name, test_result
ORDER BY test_name;

-- 15. Overall KPI Summary (Power BI Cards)
SELECT
    (SELECT COUNT(*)          FROM patients)                          AS total_patients,
    (SELECT COUNT(*)          FROM doctors)                           AS total_doctors,
    (SELECT COUNT(*)          FROM appointments)                      AS total_appointments,
    (SELECT COUNT(*)          FROM appointments WHERE status = 'Completed') AS completed_appointments,
    (SELECT SUM(total_amount) FROM billing)                           AS total_revenue,
    (SELECT SUM(paid_amount)  FROM billing)                           AS total_collected,
    (SELECT COUNT(*)          FROM medicines WHERE stock_qty < 150)   AS low_stock_medicines;

