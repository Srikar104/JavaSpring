CREATE TABLE Employee (
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  job_start_date DATE,
  salary DECIMAL(10, 2)
);

Select * from Employee;

ALTER TABLE Employee 
ADD department VARCHAR(50);

INSERT INTO Employee(first_name, last_name, job_start_date, salary, department)
Values
('Srikar Reddy', 'Gundam', '2022-04-28', '120000', 'Angular'),
('Mohana Krishna', 'Hero', '2023-01-24', '125000', 'Java'),
('Mani Kandan', 'Zukerburg', '2021-12-29', '118000', 'AWS'),
('Akhil', 'Peacock', '2023-02-21', '128000', 'Devops');
	
Select MAX(salary) AS highest_salary from Employee;

SELECT *
FROM Employee
WHERE job_start_date >= DATE_SUB(NOW(), INTERVAL 6 MONTH);

SELECT department, COUNT(*) AS employee_count
FROM Employee
GROUP BY department;

Select * from Consultant_Details;

INSERT INTO Consultant_Details (id, lead_id, first_name, last_name, email_address, phone_number)
VALUES
    (1, 101, 'Srikar', 'Gundam', 'srikar@example.com', '+1 123-456-7890'),
    (2, 102, 'Akhil', 'Peacock', 'akhil@example.com', '+1 987-654-3210'),
    (3, 103, 'Rohith', 'CIS', 'rohith@example.com', '+1 555-555-5555'),
    (4, 104, 'Prem', 'NC', 'prem@example.com', '+1 111-222-3333'),
    (5, 105, 'Bharath', 'Naga', 'bharath@example.com', '+1 444-444-4444');
    
INSERT INTO Lead_Details (id, first_name, last_name, email_address, phone_number)
VALUES
    (1, 'Jagadish', 'Snr', 'jagadish@example.com', '+1 123-456-7890'),
    (2, 'Prem', 'Legend', 'prem@example.com', '+1 987-654-3210'),
    (3, 'Tejan', 'Rockzzz', 'tejan@example.com', '+1 555-555-5555'),
    (4, 'Spandana', 'Reddy', 'spandana@example.com', '+1 111-222-3333');
    
INSERT INTO Submission_Update (id, submission_id, update_text, created_date)
VALUES 
  ('1001', '123', 'Update 1', '2023-07-17 09:30:00'),
  ('1002', '321', 'Update 2', '2023-07-17 14:45:00'),
  ('1003', '765', 'Update 3', '2023-07-17 10:15:00');
  
SELECT * FROM Consultant_Details;

UPDATE Consultant_Details
SET email_address = 'srikarreddy@gmail.com'
WHERE id = '1';

SELECT * FROM Submission;

INSERT INTO Submission (id, consultant_id, submission_date, vendor_company, vendor_name, vendor_email_address, vendor_phone_number, implementation_partner, client_name, pay_rate, submission_status, submission_type, city, state, zip)
VALUES
    (1, 1, '2023-07-18', 'Vendor Company 1', 'Vendor 1', 'vendor1@example.com', '+1 111-111-1111', 'Implementation Partner 1', 'Client Name 1', 100, 'Submitted', 'Type 1', 'City 1', 'State 1', '12345'),
    (2, 2, '2023-07-19', 'Vendor Company 2', 'Vendor 2', 'vendor2@example.com', '+1 222-222-2222', 'Implementation Partner 2', 'Client Name 2', 120, 'In Progress', 'Type 2', 'City 2', 'State 2', '23456');


SELECT consultant_id, COUNT(*) AS total_submissions
FROM Submission
GROUP BY consultant_id;

SELECT consultant_id, DATE(submission_date) AS submission_day, COUNT(*) AS total_submissions
FROM Submission
GROUP BY consultant_id, DATE(submission_date);

