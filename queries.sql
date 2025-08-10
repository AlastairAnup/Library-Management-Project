--Insert a new student
INSERT INTO [dbo].[students] 
(student_id, first_name, last_name, approved, rejected, category, roll_num, branch, year, books_issued, email_id)
VALUES
(31, 'Henry', 'Baker', 1, 0, 2, 'R031', 2, 2, 0, 'henry.baker@example.com');

--Insert a new book
INSERT INTO [dbo].[books] 
(book_id, title, author, description, category_id, added_by)
VALUES
(21, 'Meditations', 'Marcus Aurelius', 'Stoic philosophy classic.', 10, 2);

--Delete a student by ID
DELETE FROM [dbo].[students]
WHERE student_id = 4; -- removes David Brown


--Delete a book by title
DELETE FROM [dbo].[books]
WHERE title = 'The Catcher in the Rye';

--Update a student’s email
UPDATE [dbo].[students]
SET email_id = 'alice.newemail@example.com'
WHERE student_id = 1;

--Update a book’s availability
UPDATE [dbo].[book_issue]
SET available_status = 1
WHERE issue_id = 5; -- Mark as available

--Select all books in a specific category
SELECT b.book_id, b.title, b.author, c.category
FROM [dbo].[books] b
JOIN [dbo].[book_categories] c ON b.category_id = c.id
WHERE c.category = 'Dystopian';

--Select students with more than 1 book issued
SELECT student_id, first_name, last_name, books_issued
FROM [dbo].[students]
WHERE books_issued > 1;

--List all book issues with student and librarian names
SELECT bil.id AS LogID, s.first_name + ' ' + s.last_name AS StudentName,
       u.name AS IssuedBy, b.title AS BookTitle, bil.issued_at, bil.return_time
FROM [dbo].[book_issue_log] bil
JOIN [dbo].[students] s ON bil.student_id = s.student_id
JOIN [dbo].[users] u ON bil.issue_by = u.id
JOIN [dbo].[book_issue] bi ON bil.book_issue_id = bi.issue_id
JOIN [dbo].[books] b ON bi.book_id = b.book_id;

--Find all overdue books (return_time before today)
SELECT bil.id AS LogID, s.first_name, s.last_name, b.title, bil.return_time
FROM [dbo].[book_issue_log] bil
JOIN [dbo].[students] s ON bil.student_id = s.student_id
JOIN [dbo].[book_issue] bi ON bil.book_issue_id = bi.issue_id
JOIN [dbo].[books] b ON bi.book_id = b.book_id
WHERE CAST(bil.return_time AS DATE) < CAST(GETDATE() AS DATE);

--




