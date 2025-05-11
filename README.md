# Clinic Booking System Database

## Project Title
Clinic Booking System Database

## Description
This project implements a Clinic Booking System using MySQL to manage various aspects of a healthcare clinic. The system allows for efficient management of:
- Patient Information: Personal details, contact information, and medical history.
- Doctor Information: Personal details, specialization, and department affiliations.
- Appointments: Allows patients to book appointments with doctors, track status, and manage scheduling.
- Departments: Defines different departments (e.g., General Medicine, Orthopedics) available at the clinic.
- Rooms: Tracks room availability and assigns rooms for appointments.

The goal is to create a database system that helps healthcare providers manage clinic operations more effectively, providing both patients and healthcare providers with an efficient system for booking and managing appointments.

## How to Run/Setup the Project (Import SQL)

### Step 1: Import SQL File into MySQL
1. Download the brighton.sql` file from the repository.
2. Open your MySQL client (e.g., MySQL Workbench, phpMyAdmin, or any SQL terminal).
3. Run the following command to import the SQL file:
   ```sql
   SOURCE /path/to/brighton.sql;
   Step 2: Connect to the Database
Use MySQL Workbench, phpMyAdmin, or any MySQL client to connect to the ClinicBookingSystem database.

After successfully importing the SQL, you can run queries and interact with the data stored in the database.

Step 3: Interact with the Tables
You can now use SQL queries to perform actions like:

Viewing available appointments

Adding new patients or doctors

Updating appointment statuses

Checking room availability

