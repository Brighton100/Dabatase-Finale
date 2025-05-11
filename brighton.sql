-- Create the database
CREATE DATABASE ClinicBookingSystem;

-- Use the database
USE ClinicBookingSystem;

-- 1. Table for storing patient information
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary Key
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Table for storing doctor information
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary Key
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    department_id INT, -- Foreign Key
    specialization VARCHAR(100),
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE SET NULL -- Foreign Key
);

-- 3. Table for storing appointment information
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary Key
    patient_id INT, -- Foreign Key
    doctor_id INT, -- Foreign Key
    appointment_date DATETIME NOT NULL,
    room_id INT, -- Foreign Key
    status ENUM('Scheduled', 'Completed', 'Canceled') DEFAULT 'Scheduled',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id) ON DELETE SET NULL
);

-- 4. Table for storing departments
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary Key
    department_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- 5. Table for storing room information
CREATE TABLE Rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary Key
    room_number VARCHAR(10) NOT NULL UNIQUE,
    room_type VARCHAR(50),
    is_occupied BOOLEAN DEFAULT FALSE
);

-- Insert some sample departments
INSERT INTO Departments (department_name, description)
VALUES
    ('General Medicine', 'General health care and consultations'),
    ('Orthopedics', 'Bone and joint care'),
    ('Pediatrics', 'Children’s health care'),
    ('Cardiology', 'Heart-related care');

-- Sample data for patients (Kenyan Names, Phone, Email, Address)
INSERT INTO Patients (first_name, last_name, dob, phone, email, address)
VALUES
    ('Brighton', 'Ochieng', '1985-06-15', '0742327151', 'ochiengbrighton109@gmail.com', '123 Kimathi St, Nairobi, Kenya'),
    ('Jane', 'Mwangi', '1990-12-25', '0712345678', 'janemwangi@email.com', '456 Moi Avenue, Nairobi, Kenya');

-- Sample data for doctors (Kenyan Names, Phone, Email)
INSERT INTO Doctors (first_name, last_name, department_id, specialization, phone, email)
VALUES
    ('Dr. Mike', 'Ochieng', 1, 'General Medicine', '0723456789', 'dr.mikeochieng@email.com'),
    ('Dr. Linda', 'Njoroge', 2, 'Orthopedics', '0734567890', 'dr.lindanjoroge@email.com');

-- Sample data for rooms
INSERT INTO Rooms (room_number, room_type, is_occupied)
VALUES
    ('101', 'Consultation Room', FALSE),
    ('102', 'Operation Room', FALSE);

-- Sample data for appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, room_id)
VALUES
    (1, 1, '2025-05-12 09:00:00', 1),
    (2, 2, '2025-05-13 14:00:00', 2);
