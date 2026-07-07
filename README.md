# Municipality Administrator Citizen Management System

## 📌 Project Overview

The **Municipality Administrator Citizen Management System** is a web-based application designed to manage communication and services between municipality administrators, employees, and citizens. The system provides a simple digital platform where citizens can log in, submit requests, make complaints, and view payment-related information. Municipality administrators and employees can manage citizen data, handle service requests, process complaints, and maintain municipal records.

This project is useful for improving the efficiency of municipality services by reducing manual paperwork and providing a centralized platform for citizen service management.

---

## 🎯 Objectives

The main objectives of this project are:

- To provide an online platform for municipality service management.
- To allow citizens to submit requests and complaints digitally.
- To help administrators manage citizens, employees, payments, requests, and complaints.
- To reduce manual record keeping and improve service tracking.
- To provide role-based access for Admin, Citizen, and Municipality Employee.

---

## 🧩 Main Modules

### 1. Citizen Module

The citizen module allows registered citizens to access municipality services online.

### Features

- Citizen login
- View personal profile
- Submit service requests
- Submit complaints
- View payment details
- Track request status

---

### 2. Administrator Module

The administrator module is used by municipality administrators to manage the overall system.

### Features

- Admin login
- Manage citizen records
- Manage municipality employees
- View and handle citizen requests
- View and handle complaints
- Manage payment records
- Maintain municipality-related information

---

### 3. Municipality Employee Module

The employee module allows municipality staff members to access assigned tasks and manage citizen-related services.

### Features

- Employee login
- View assigned requests
- Manage complaints
- Support administrative operations
- Update service-related information

---

## 🛠️ Technologies Used

### Frontend

- PHP

### Backend

- PHP

### Database

- MySQL / MariaDB

### Server

- Apache Server using XAMPP

### Tools

- XAMPP
- phpMyAdmin
- VS Code
- GitHub

---

## 🗂️ Project Structure

```text
Municipality-Administrator-Citizen/
│
├── Code/
│   ├── Controller/
│   │   └── Contains PHP controller files for handling application logic
│   │
│   ├── Model/
│   │   └── Contains PHP model files for database-related operations
│   │
│   ├── View/
│   │   └── Contains frontend PHP pages for Admin, Citizen, and Employee
│   │
│   └── DB/
│       └── Contains database connection file
│
└── README.md
```

---

# 🚀 Steps to Run the Project

Follow the steps below to run the **Municipality Administrator Citizen Management System** on your local machine using XAMPP.

## 📥 1. Download or Clone the Project

Clone the repository using Git or download the ZIP file from GitHub.

```bash
git clone <repository-link>
```

Or download the ZIP file and extract it.

---

## 📂 2. Move Project to XAMPP htdocs Folder

After downloading or cloning the project:

1. Open **This PC**
2. Go to:

```text
C:\xampp\htdocs\
```

3. Copy and paste the complete project folder inside the `htdocs` directory.

Final project path should look like:

```text
C:\xampp\htdocs\Municipality-Administrator-Citizen\
```

---

## ▶️ 3. Start Apache and MySQL in XAMPP

1. Open the **XAMPP Control Panel**
2. Start the following services:

- Apache
- MySQL

Make sure both services show a green status.

---

## 🗄️ 4. Import the Database

1. Open your browser and go to:

```text
http://localhost/phpmyadmin
```

2. Click on **New** and create a new database.

Example:

```text
municipality_db
```

3. Import the SQL file provided in the project.

### Steps

- Select the created database
- Click on **Import**
- Choose the `.sql` file from the project folder
- Click **Go**

---

## ⚙️ 5. Configure Database Connection

Open the database connection file inside:

```text
Code/DB/
```

Update the database credentials if required.

Example configuration:

```php
$host = "localhost";
$user = "root";
$password = "";
$database = "municipality_db";
```

---

## 🌐 6. Run the Project

Open your browser and enter:

```text
http://localhost/Municipality-Administrator-Citizen/
```

The project should now run successfully.

---

## 📌 Requirements

- PHP 7.x or above
- XAMPP
- Apache Server
- MySQL / MariaDB
- Modern Web Browser

---

## ✅ Project Status

The project is successfully configured to run locally using XAMPP and phpMyAdmin. 

---

## 👨‍💻 Author

Developed and modified for Software Engineering Project purposes.
