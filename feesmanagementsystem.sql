CREATE DATABASE FeesManagement;
USE FeesManagement;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Students (student_id, first_name, last_name, email, phone_number, department_id) VALUES
(1, 'Janarthini', 'Srinivasan', 'jana@example.com', '9864323441', 1),
(2, 'Gomathi', 'Murugan', 'gomathi@example.com', '9876544321', 2),
(3, 'Moulidharan', 'Thirumoorthy', 'mouli@example.com', '8901234567', 3),
(4, 'Madhanraj', 'Sekar', 'madhan@example.com', '9014567823', 4),
(5, 'Udhay', 'Kumar', 'udhay@example.com', '7890112234', 1),
(6, 'Thamyanthi', 'Jayaprakash', 'thamaya@example.com', '6789012345', 2),
(7, 'Devisri', 'Sadhasivam', 'devi@example.com', '7890123456', 3),
(8, 'Jayasri', 'Seenu', 'Jaya@example.com', '8901234567', 4),
(9, 'Dhanush', 'Ponnusamy', 'dhanush@example.com', '9012345678', 1),
(10, 'Arun', 'Senthil', 'arun@example.com', '8901234567', 2);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    department_head VARCHAR(100)
);

INSERT INTO Departments (department_id, department_name, department_head)
VALUES 
(1, 'Computer Science and Engineering', 'Dr. A. Kumar'),
(2, 'Electrical and Electronics Engineering', 'Dr. B. Sharma'),
(3, 'Mechanical Engineering', 'Dr. C. Patel'),
(4, 'Civil Engineering', 'Dr. D. Reddy'),
(5, 'Electronics and Communication Engineering', 'Dr. E. Nair'),
(6, 'Information Technology', 'Dr. F. Singh'),
(7, 'Chemical Engineering', 'Dr. G. Menon'),
(8, 'Biomedical Engineering', 'Dr. H. Iyer'),
(9, 'Computer science Engineering', 'Dr. I. Gupta'),
(10, 'Information Engineering', 'Dr. J. Desai');

CREATE TABLE Programs (
    program_id INT PRIMARY KEY,
    program_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
INSERT INTO Programs (program_id, program_name, department_id) VALUES
(1, 'Bachelor of Computer Science', 1),
(2, 'Bachelor of Information Technology', 1),
(3, 'Bachelor of Mechanical Engineering', 2),
(4, 'Bachelor of Civil Engineering', 3),
(5, 'Bachelor of Electrical Engineering', 4),
(6, 'Bachelor of Electronics Engineering', 5),
(7, 'Bachelor of Business Administration', 6),
(8, 'Bachelor of Arts in English', 7),
(9, 'Bachelor of Science in Physics', 8),
(10, 'Bachelor of Science in Chemistry', 8);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    program_id INT,
    course_fee DECIMAL(10,2),
    FOREIGN KEY (program_id) REFERENCES Programs(program_id)
);

INSERT INTO Courses (course_id, course_name, program_id, course_fee) VALUES
(1, 'Data Structures', 1, 15000.00),
(2, 'Operating Systems', 1, 15000.00),
(3, 'Web Development', 2, 14000.00),
(4, 'Database Management Systems', 2, 14000.00),
(5, 'Thermodynamics', 3, 16000.00),
(6, 'Fluid Mechanics', 4, 16000.00),
(7, 'Circuit Analysis', 5, 15000.00),
(8, 'Digital Electronics', 6, 15000.00),
(9, 'Principles of Management', 7, 12000.00),
(10, 'Modern Physics', 9, 13000.00);

CREATE TABLE Semesters (
    semester_id INT PRIMARY KEY,
    semester_name VARCHAR(50)
);
INSERT INTO Semesters (semester_id, semester_name) VALUES
(1, 'Semester 1'),
(2, 'Semester 2'),
(3, 'Semester 3'),
(4, 'Semester 4'),
(5, 'Semester 5'),
(6, 'Semester 6'),
(7, 'Semester 7'),
(8, 'Semester 8'),
(9, 'Summer Term 1'),
(10, 'Summer Term 2');

CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (semester_id) REFERENCES Semesters(semester_id)
);
INSERT INTO Enrollment (enrollment_id, student_id, course_id, semester_id, enrollment_date) VALUES
(1, 101, 1, 1, '2024-08-01'),
(2, 102, 2, 1, '2024-08-01'),
(3, 103, 3, 2, '2024-01-15'),
(4, 104, 4, 2, '2024-01-15'),
(5, 105, 5, 3, '2024-08-01'),
(6, 106, 6, 3, '2024-08-01'),
(7, 107, 7, 4, '2024-01-15'),
(8, 108, 8, 4, '2024-01-15'),
(9, 109, 9, 5, '2023-08-01'),
(10, 110, 10, 5, '2023-08-01');

CREATE TABLE Fees (
    fee_id INT PRIMARY KEY,
    fee_type VARCHAR(100),
    amount DECIMAL(10,2)
);
INSERT INTO Fees (fee_id, fee_type, amount) VALUES
(1, 'Tuition Fee', 50000.00),
(2, 'Lab Fee', 10000.00),
(3, 'Library Fee', 5000.00),
(4, 'Sports Fee', 2000.00),
(5, 'Exam Fee', 3000.00),
(6, 'Hostel Fee', 20000.00),
(7, 'Transport Fee', 10000.00),
(8, 'Caution Deposit', 5000.00),
(9, 'Medical Fee', 1000.00),
(10, 'Student Activity Fee', 1500.00);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    fee_id INT,
    payment_date DATE,
    amount_paid DECIMAL(10,2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (fee_id) REFERENCES Fees(fee_id)
);
INSERT INTO Payments (payment_id, student_id, fee_id, payment_date, amount_paid) VALUES
(1, 101, 1, '2024-08-05', 50000.00),
(2, 101, 2, '2024-08-10', 10000.00),
(3, 102, 1, '2024-08-06', 50000.00),
(4, 102, 3, '2024-08-11', 5000.00),
(5, 103, 1, '2024-01-20', 50000.00),
(6, 103, 4, '2024-01-25', 2000.00),
(7, 104, 1, '2024-01-21', 50000.00),
(8, 104, 5, '2024-01-26', 3000.00),
(9, 105, 1, '2024-08-05', 50000.00),
(10, 106, 6, '2024-08-15', 20000.00);

CREATE TABLE Payment_Status (
    payment_status_id INT PRIMARY KEY,
    payment_id INT,
    status VARCHAR(50),
    FOREIGN KEY (payment_id) REFERENCES Payments(payment_id)
);
INSERT INTO Payment_Status (payment_status_id, payment_id, status) VALUES
(1, 1, 'Completed'),
(2, 2, 'Pending'),
(3, 3, 'Completed'),
(4, 4, 'Pending'),
(5, 5, 'Completed'),
(6, 6, 'Completed'),
(7, 7, 'Completed'),
(8, 8, 'Pending'),
(9, 9, 'Completed'),
(10, 10, 'Pending');

CREATE TABLE Scholarships (
    scholarship_id INT PRIMARY KEY,
    scholarship_name VARCHAR(100),
    amount DECIMAL(10,2)
);
INSERT INTO Scholarships (scholarship_id, scholarship_name, amount) VALUES
(1, 'Merit Scholarship', 20000.00),
(2, 'Sports Scholarship', 15000.00),
(3, 'Need-Based Scholarship', 10000.00),
(4, 'STEM Scholarship', 25000.00),
(5, 'Arts Scholarship', 18000.00),
(6, 'Women in Engineering Scholarship', 22000.00),
(7, 'Community Service Scholarship', 12000.00),
(8, 'International Student Scholarship', 30000.00),
(9, 'Leadership Scholarship', 17000.00),
(10, 'Academic Excellence Scholarship', 20000.00);

CREATE TABLE Student_Scholarships (
    student_scholarship_id INT PRIMARY KEY,
    student_id INT,
    scholarship_id INT,
    awarded_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (scholarship_id) REFERENCES Scholarships(scholarship_id)
);
INSERT INTO Student_Scholarships (student_scholarship_id, student_id, scholarship_id, awarded_date) VALUES
(1, 1, 1, '2024-01-15'),
(2, 2, 2, '2024-02-20'),
(3, 3, 3, '2024-03-05'),
(4, 4, 4, '2024-04-10'),
(5, 5, 5, '2024-05-12'),
(6, 6, 6, '2024-06-18'),
(7, 7, 7, '2024-07-22'),
(8, 8, 8, '2024-08-01'),
(9, 9, 9, '2024-08-15'),
(10, 10, 10, '2024-09-10');


CREATE TABLE Exam_Fees (
    exam_fee_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester_id INT,
    exam_fee DECIMAL(10,2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (semester_id) REFERENCES Semesters(semester_id)
);
INSERT INTO Exam_Fees (exam_fee_id, student_id, course_id, semester_id, exam_fee) VALUES
(1, 1, 1, 1, 1500.00),
(2, 2, 2, 2, 1600.00),
(3, 3, 3, 3, 1700.00),
(4, 4, 4, 4, 1800.00),
(5, 5, 5, 1, 1900.00),
(6, 6, 6, 2, 2000.00),
(7, 7, 7, 3, 2100.00),
(8, 8, 8, 4, 2200.00),
(9, 9, 1, 1, 2300.00),
(10, 10, 2, 2, 2400.00);


CREATE TABLE Penalties (
    penalty_id INT PRIMARY KEY,
    student_id INT,
    penalty_reason VARCHAR(255),
    penalty_amount DECIMAL(10,2),
    penalty_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
INSERT INTO Penalties (penalty_id, student_id, penalty_reason, penalty_amount, penalty_date) VALUES
(1, 1, 'Late Payment', 100.00, '2024-01-25'),
(2, 2, 'Library Fine', 50.00, '2024-02-15'),
(3, 3, 'Late Enrollment', 150.00, '2024-03-10'),
(4, 4, 'Damage to Property', 200.00, '2024-04-05'),
(5, 5, 'Violation of Code of Conduct', 250.00, '2024-05-20'),
(6, 6, 'Attendance Shortfall', 300.00, '2024-06-30'),
(7, 7, 'Exam Malpractice', 400.00, '2024-07-15'),
(8, 8, 'Late Submission of Assignment', 80.00, '2024-08-10'),
(9, 9, 'Parking Violation', 60.00, '2024-09-01'),
(10,10,'Exam Malpractice',400.00,'2024-06-10');

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    payment_id INT,
    transaction_date DATE,
    transaction_mode VARCHAR(50),
    FOREIGN KEY (payment_id) REFERENCES Payments(payment_id)
);
INSERT INTO Transactions (transaction_id, payment_id, transaction_date, transaction_mode) VALUES
(1, 1, '2024-08-15', 'Credit Card'),
(2, 2, '2024-08-16', 'Bank Transfer'),
(3, 3, '2024-08-17', 'Debit Card'),
(4, 4, '2024-08-18', 'Cash'),
(5, 5, '2024-08-19', 'Online Payment'),
(6, 6, '2024-08-20', 'Credit Card'),
(7, 7, '2024-08-21', 'Bank Transfer'),
(8, 8, '2024-08-22', 'Debit Card'),
(9, 9, '2024-08-23', 'Cash'),
(10, 10, '2024-08-24', 'Online Payment');

SELECT s.first_name, s.last_name, d.department_name
FROM Students s
JOIN Departments d ON s.department_id = d.department_id;

SELECT s.first_name, s.last_name, SUM(p.amount_paid) AS total_paid
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id;

SELECT s.first_name, s.last_name
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
JOIN Payment_Status ps ON p.payment_id = ps.payment_id
WHERE ps.status = 'Pending';

SELECT s.first_name, s.last_name, sch.scholarship_name, sch.amount
FROM Students s
JOIN Student_Scholarships ss ON s.student_id = ss.student_id
JOIN Scholarships sch ON ss.scholarship_id = sch.scholarship_id;

SELECT s.first_name, s.last_name, SUM(p.penalty_amount) AS total_penalty
FROM Students s
JOIN Penalties p ON s.student_id = p.student_id
GROUP BY s.student_id;

SELECT s.first_name, s.last_name, c.course_name, sem.semester_name
FROM Students s
JOIN Enrollment e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Semesters sem ON e.semester_id = sem.semester_id
WHERE c.course_name = 'Data Structures' AND sem.semester_name = 'Semester 1';

SELECT s.first_name, s.last_name, f.fee_type, p.amount_paid, p.payment_date
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
JOIN Fees f ON p.fee_id = f.fee_id
WHERE s.student_id = 1;

SELECT s.first_name, s.last_name
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
JOIN Fees f ON p.fee_id = f.fee_id
WHERE f.fee_type = 'Tuition Fee';

SELECT p.program_name, SUM(sch.amount) AS total_scholarship
FROM Programs p
JOIN Students s ON p.program_id = s.program_id
JOIN Student_Scholarships ss ON s.student_id = ss.student_id
JOIN Scholarships sch ON ss.scholarship_id = sch.scholarship_id
WHERE p.program_name = 'B.Tech'
GROUP BY p.program_name;

SELECT t.transaction_id, t.transaction_date, t.transaction_mode, s.first_name, s.last_name
FROM Transactions t
JOIN Payments p ON t.payment_id = p.payment_id
JOIN Students s ON p.student_id = s.student_id
WHERE t.transaction_mode