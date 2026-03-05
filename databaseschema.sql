-- Employee Table
CREATE TABLE IF NOT EXISTS Employee (
    employee_id VARCHAR(50) PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    slack_id VARCHAR(100)
);

-- Project Table
CREATE TABLE IF NOT EXISTS Project (
    project_code VARCHAR(50) PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    status VARCHAR(50)
);

-- Project Employee Junction Table
CREATE TABLE IF NOT EXISTS Project_Employee (
    project_code VARCHAR(50) REFERENCES Project(project_code),
    emp_code VARCHAR(50) REFERENCES Employee(employee_id),
    PRIMARY KEY (project_code, emp_code)
);

-- User Table
CREATE TABLE IF NOT EXISTS Users (
    id SERIAL PRIMARY KEY,
    employee_id VARCHAR(50) REFERENCES Employee(employee_id),
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) DEFAULT '12345678',
    failed_attempts INT DEFAULT 0,
    locked_until TIMESTAMP,
    UNIQUE(employee_id)
);

-- Timesheet Table
CREATE TABLE IF NOT EXISTS Timesheet (
    id SERIAL PRIMARY KEY,
    emp_id VARCHAR(50) REFERENCES Employee(employee_id),
    emp_name VARCHAR(100),
    project_code VARCHAR(50) REFERENCES Project(project_code),
    project_name VARCHAR(255),
    date DATE NOT NULL,
    hours DECIMAL(4,2),
    project_status VARCHAR(20) DEFAULT '0'
);

ALTER TABLE Timesheet ADD COLUMN IF NOT EXISTS "Phase" VARCHAR(100);
ALTER TABLE Timesheet ADD COLUMN IF NOT EXISTS project_status VARCHAR(20) DEFAULT '0';


-- Migration section (placeholder for future changes)

