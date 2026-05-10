-- Default database for enurce15/Municipality-Administrator-Citizen
-- Database name used by Code/DB/dbHelper.php: abq
-- Import this file in phpMyAdmin or run with:
-- /Applications/XAMPP/xamppfiles/bin/mysql -u root < abq_default.sql

DROP DATABASE IF EXISTS abq;
CREATE DATABASE abq CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE abq;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS complaint;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS request;
DROP TABLE IF EXISTS citizen;
DROP TABLE IF EXISTS admin;
DROP TABLE IF EXISTS employee;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE admin (
    adminid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    password VARCHAR(100) NOT NULL,
    phone VARCHAR(50),
    email VARCHAR(150) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE employee (
    munid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    department VARCHAR(150)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE citizen (
    citizenid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    password VARCHAR(100) NOT NULL,
    phone VARCHAR(50),
    email VARCHAR(150) NOT NULL UNIQUE,
    nrMembers INT DEFAULT 1,
    admin_id INT,
    CONSTRAINT fk_citizen_admin
        FOREIGN KEY (admin_id) REFERENCES admin(adminid)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE payment (
    paymentid INT AUTO_INCREMENT PRIMARY KEY,
    admin_id INT,
    citizen_id INT,
    date DATE,
    status VARCHAR(50) DEFAULT 'Pending',
    description TEXT,
    amount DECIMAL(10,2) DEFAULT 0.00,
    CONSTRAINT fk_payment_admin
        FOREIGN KEY (admin_id) REFERENCES admin(adminid)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_payment_citizen
        FOREIGN KEY (citizen_id) REFERENCES citizen(citizenid)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE request (
    requestid INT AUTO_INCREMENT PRIMARY KEY,
    citizen_id INT,
    admin_id INT,
    type VARCHAR(100),
    documents VARCHAR(255),
    description TEXT,
    status VARCHAR(50) DEFAULT 'Pending',
    date DATE,
    CONSTRAINT fk_request_admin
        FOREIGN KEY (admin_id) REFERENCES admin(adminid)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_request_citizen
        FOREIGN KEY (citizen_id) REFERENCES citizen(citizenid)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE complaint (
    complaintid INT AUTO_INCREMENT PRIMARY KEY,
    citizen_id INT,
    admin_id INT,
    type VARCHAR(150),
    body TEXT,
    date DATE,
    CONSTRAINT fk_complaint_admin
        FOREIGN KEY (admin_id) REFERENCES admin(adminid)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_complaint_citizen
        FOREIGN KEY (citizen_id) REFERENCES citizen(citizenid)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Default login accounts from the project README / sample users
INSERT INTO admin (adminid, name, surname, address, password, phone, email) VALUES
(1, 'Admin', 'Test', 'Municipality Building', '111', '3550000001', 'admintest@gmail.com');

INSERT INTO employee (munid, name, surname, password, email, department) VALUES
(1, 'Erida', 'Nurce', 'Erida123', 'enurce15@epoka.edu.al', 'Municipality Representative');

INSERT INTO citizen (citizenid, name, surname, address, password, phone, email, nrMembers, admin_id) VALUES
(1, 'Citizen', 'Test', 'Building A, Tirana', 'Admin1234', '3550000002', 'a2@gmail.com', 4, 1);

INSERT INTO payment (admin_id, citizen_id, date, status, description, amount) VALUES
(1, 1, CURDATE(), 'Pending', 'Monthly municipality tax', 50.00),
(1, 1, CURDATE(), 'Paid', 'Parking service payment', 25.00);

INSERT INTO request (citizen_id, admin_id, type, documents, description, status, date) VALUES
(1, 1, 'Parking Permit', 'sample-document.pdf', 'Request for parking permit.', 'Pending', CURDATE()),
(1, 1, 'Reconstruction Permit', 'sample-permit.pdf', 'Request for reconstruction permission.', 'Approved', CURDATE());

INSERT INTO complaint (citizen_id, admin_id, type, body, date) VALUES
(1, 1, 'Maintenance', 'Street light near the building is not working.', CURDATE());

SELECT 'Database abq created successfully with default users.' AS message;
