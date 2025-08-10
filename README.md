📚 MyLibrary – Database Management System
MyLibrary is a sample Library Management Database project designed for academic learning in Database Management Systems (DBMS).
It demonstrates a complete library data model with categories, books, students, staff, branches, and borrowing activities using MySQL.

🚀 Features
Database Structure
Book categories
Library branches
Student categories & borrowing limits
Students and library staff
Books and authors
Book issue and return tracking
Sample Data
10+ book categories
3 library branches
4 student membership categories
30 student records
20 books with details
Book issue and return log
Operations Supported
Insert, update, delete, and retrieve data
Track issued and returned books
Manage borrowing limits
Record book availability
Branch-wise management

📂 Database Schema Overview
Tables:
book_categories – Stores book genres/categories.
branches – Stores library branch details.
student_categories – Defines membership types and max allowed books.
users – Stores librarian/admin accounts.
students – Stores student details and borrowing info.
books – Stores book details.
book_issue – Tracks current book availability.
book_issue_log – Logs issued/returned books with dates.

🛠️ How to Use
Install MySQL Server.
Open your MySQL client (e.g., MySQL Workbench, phpMyAdmin, or terminal).
Copy the SQL code from mylibrary.sql into the SQL editor.
Run the script to create the database, tables, and insert sample data.
Start running queries such as:
sql
Copy
Edit
-- Show all available books
SELECT * FROM books;
-- Show all students who borrowed books
SELECT s.first_name, s.last_name, b.title, l.issued_at
FROM students s
JOIN book_issue_log l ON s.student_id = l.student_id
JOIN book_issue i ON l.book_issue_id = i.issue_id
JOIN books b ON i.book_id = b.book_id;

🎯 Purpose
This project was created as part of a DBMS Course Project to:
Understand database design principles
Practice DDL & DML SQL queries
Demonstrate real-world library system functionality
