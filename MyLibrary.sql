CREATE DATABASE MyLibrary;
USE MyLibrary;
CREATE TABLE [dbo].[book_categories] (
    [id] INT NOT NULL PRIMARY KEY,
    [category] NVARCHAR(255) NOT NULL
);

CREATE TABLE [dbo].[branches] (
    [id] INT NOT NULL PRIMARY KEY,
    [branch] NVARCHAR(255) NOT NULL
);

CREATE TABLE [dbo].[student_categories] (
    [cat_id] INT NOT NULL PRIMARY KEY,
    [category] NVARCHAR(512) NOT NULL,
    [max_allowed] TINYINT NOT NULL
);

CREATE TABLE [dbo].[users] (
    [id] INT NOT NULL PRIMARY KEY,
    [name] NVARCHAR(255) NOT NULL,
    [username] NVARCHAR(512) NOT NULL,
    [password] NVARCHAR(255) NOT NULL,
    [verification_status] TINYINT NOT NULL DEFAULT 0,
    [remember_token] NVARCHAR(MAX) NOT NULL
);

CREATE TABLE [dbo].[students] (
    [student_id] INT NOT NULL PRIMARY KEY,
    [first_name] NVARCHAR(512) NOT NULL,
    [last_name] NVARCHAR(512) NOT NULL,
    [approved] TINYINT NOT NULL DEFAULT 0,
    [rejected] TINYINT NOT NULL DEFAULT 0,
    [category] TINYINT NOT NULL,
    [roll_num] NVARCHAR(15) NOT NULL,
    [branch] TINYINT NOT NULL DEFAULT 0,
    [year] INT NOT NULL,
    [books_issued] TINYINT NOT NULL DEFAULT 0,
    [email_id] NVARCHAR(512) NOT NULL
);

CREATE TABLE [dbo].[books] (
    [book_id] INT NOT NULL PRIMARY KEY,
    [title] NVARCHAR(1000) NOT NULL,
    [author] NVARCHAR(1000) NOT NULL,
    [description] NVARCHAR(MAX) NOT NULL,
    [category_id] INT NOT NULL,
    [added_by] INT NOT NULL,
    [added_at_timestamp] DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE TABLE [dbo].[book_issue] (
    [issue_id] INT NOT NULL PRIMARY KEY,
    [book_id] INT NOT NULL,
    [available_status] TINYINT NOT NULL DEFAULT 1,
    [added_by] INT NOT NULL,
    [added_at_timestamp] DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE TABLE [dbo].[book_issue_log] (
    [id] INT NOT NULL PRIMARY KEY,
    [book_issue_id] INT NOT NULL,
    [student_id] INT NOT NULL,
    [issue_by] INT NOT NULL,
    [issued_at] NVARCHAR(50) NOT NULL,
    [return_time] NVARCHAR(50) NOT NULL,
    [time_stamp] DATETIME NOT NULL DEFAULT GETDATE()
);

--book cat

INSERT INTO [dbo].[book_categories] (id, category)
VALUES
(1, 'Fiction'),
(2, 'Classic Literature'),
(3, 'Dystopian'),
(4, 'Fantasy'),
(5, 'Historical'),
(6, 'Epic Poetry'),
(7, 'Science Fiction'),
(8, 'Biography'),
(9, 'Mystery'),
(10, 'Self-Help');

--branch

INSERT INTO [dbo].[branches] (id, branch)
VALUES
(1, 'Main Library'),
(2, 'Science Branch'),
(3, 'Arts Branch');

--stud cat

INSERT INTO [dbo].[student_categories] (cat_id, category, max_allowed)
VALUES
(1, 'Undergraduate', 5),
(2, 'Graduate', 7),
(3, 'Staff', 10),
(4, 'Alumni', 2);

--user

INSERT INTO [dbo].[users] (id, name, username, password, verification_status, remember_token)
VALUES
(1, 'Admin User', 'admin', 'hashed_password_here', 1, ''),
(2, 'Librarian John', 'johnl', 'hashed_password_here', 1, ''),
(3, 'Librarian Jane', 'janej', 'hashed_password_here', 1, '');

--insert book

INSERT INTO [dbo].[books] (book_id, title, author, description, category_id, added_by)
VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'A classic novel set in the Jazz Age.', 2, 1),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'A novel about racial injustice.', 1, 1),
(3, '1984', 'George Orwell', 'A dystopian novel about totalitarian regime.', 3, 2),
(4, 'Pride and Prejudice', 'Jane Austen', 'A romantic novel of manners.', 2, 2),
(5, 'The Catcher in the Rye', 'J.D. Salinger', 'A story about teenage angst and alienation.', 1, 1),
(6, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy adventure preceding Lord of the Rings.', 4, 3),
(7, 'Moby Dick', 'Herman Melville', 'A sailor’s narrative of obsession and revenge.', 5, 2),
(8, 'War and Peace', 'Leo Tolstoy', 'A historical novel set during Napoleonic Wars.', 5, 3),
(9, 'The Odyssey', 'Homer', 'Ancient Greek epic poem.', 6, 1),
(10, 'Crime and Punishment', 'Fyodor Dostoevsky', 'Psychological novel about guilt and redemption.', 2, 2),
(11, 'The Divine Comedy', 'Dante Alighieri', 'Epic poem describing afterlife journey.', 6, 3),
(12, 'The Brothers Karamazov', 'Fyodor Dostoevsky', 'Philosophical novel about morality.', 2, 2),
(13, 'Brave New World', 'Aldous Huxley', 'Dystopian novel about a controlled future.', 3, 1),
(14, 'Jane Eyre', 'Charlotte Brontë', 'A gothic novel and coming-of-age story.', 2, 3),
(15, 'Animal Farm', 'George Orwell', 'Satirical allegory on Soviet communism.', 3, 1),
(16, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Epic fantasy trilogy.', 4, 3),
(17, 'The Grapes of Wrath', 'John Steinbeck', 'Story of Dust Bowl migration.', 1, 2),
(18, 'Wuthering Heights', 'Emily Brontë', 'Gothic novel about passion and revenge.', 2, 2),
(19, 'Frankenstein', 'Mary Shelley', 'Early science fiction about a created monster.', 7, 3),
(20, 'The Iliad', 'Homer', 'Ancient Greek epic poem of the Trojan War.', 6, 1);

--insert student

INSERT INTO [dbo].[students] (student_id, first_name, last_name, approved, rejected, category, roll_num, branch, year, books_issued, email_id)
VALUES
(1, 'Alice', 'Smith', 1, 0, 1, 'R001', 1, 2, 0, 'alice.smith@example.com'),
(2, 'Bob', 'Johnson', 1, 0, 2, 'R002', 2, 3, 1, 'bob.johnson@example.com'),
(3, 'Charlie', 'Williams', 1, 0, 1, 'R003', 1, 1, 0, 'charlie.williams@example.com'),
(4, 'David', 'Brown', 0, 1, 3, 'R004', 3, 2, 0, 'david.brown@example.com'),
(5, 'Eva', 'Jones', 1, 0, 2, 'R005', 2, 4, 2, 'eva.jones@example.com'),
(6, 'Frank', 'Garcia', 1, 0, 1, 'R006', 1, 3, 0, 'frank.garcia@example.com'),
(7, 'Grace', 'Miller', 1, 0, 2, 'R007', 2, 1, 1, 'grace.miller@example.com'),
(8, 'Hannah', 'Davis', 1, 0, 3, 'R008', 3, 2, 0, 'hannah.davis@example.com'),
(9, 'Ian', 'Martinez', 0, 1, 1, 'R009', 1, 4, 0, 'ian.martinez@example.com'),
(10, 'Jane', 'Rodriguez', 1, 0, 2, 'R010', 2, 3, 1, 'jane.rodriguez@example.com'),
(11, 'Kyle', 'Wilson', 1, 0, 1, 'R011', 1, 2, 0, 'kyle.wilson@example.com'),
(12, 'Laura', 'Anderson', 1, 0, 3, 'R012', 3, 1, 0, 'laura.anderson@example.com'),
(13, 'Mike', 'Thomas', 1, 0, 2, 'R013', 2, 3, 2, 'mike.thomas@example.com'),
(14, 'Nina', 'Taylor', 1, 0, 1, 'R014', 1, 4, 1, 'nina.taylor@example.com'),
(15, 'Oscar', 'Moore', 0, 1, 2, 'R015', 2, 1, 0, 'oscar.moore@example.com'),
(16, 'Paula', 'Jackson', 1, 0, 3, 'R016', 3, 2, 0, 'paula.jackson@example.com'),
(17, 'Quinn', 'Martin', 1, 0, 1, 'R017', 1, 3, 1, 'quinn.martin@example.com'),
(18, 'Rachel', 'Lee', 1, 0, 2, 'R018', 2, 1, 0, 'rachel.lee@example.com'),
(19, 'Steve', 'Perez', 1, 0, 3, 'R019', 3, 4, 0, 'steve.perez@example.com'),
(20, 'Tina', 'White', 1, 0, 1, 'R020', 1, 2, 2, 'tina.white@example.com'),
(21, 'Uma', 'Harris', 1, 0, 2, 'R021', 2, 3, 0, 'uma.harris@example.com'),
(22, 'Victor', 'Sanchez', 1, 0, 1, 'R022', 1, 1, 1, 'victor.sanchez@example.com'),
(23, 'Wendy', 'Clark', 0, 1, 3, 'R023', 3, 2, 0, 'wendy.clark@example.com'),
(24, 'Xander', 'Ramirez', 1, 0, 2, 'R024', 2, 4, 0, 'xander.ramirez@example.com'),
(25, 'Yara', 'Lewis', 1, 0, 1, 'R025', 1, 3, 1, 'yara.lewis@example.com'),
(26, 'Zach', 'Robinson', 1, 0, 3, 'R026', 3, 1, 0, 'zach.robinson@example.com'),
(27, 'Amy', 'Walker', 1, 0, 2, 'R027', 2, 2, 0, 'amy.walker@example.com'),
(28, 'Brian', 'Young', 1, 0, 1, 'R028', 1, 4, 1, 'brian.young@example.com'),
(29, 'Clara', 'Allen', 1, 0, 3, 'R029', 3, 3, 0, 'clara.allen@example.com'),
(30, 'Derek', 'King', 1, 0, 2, 'R030', 2, 1, 0, 'derek.king@example.com');

--insert book issue

INSERT INTO [dbo].[book_issue] (issue_id, book_id, available_status, added_by)
VALUES
(1, 1, 0, 1),
(2, 2, 0, 1),
(3, 3, 0, 1),
(4, 4, 0, 1),
(5, 5, 0, 1),

--book issue log

INSERT INTO [dbo].[book_issue_log] (id, book_issue_id, student_id, issue_by, issued_at, return_time)
VALUES
(1, 1, 1, 1, '2025-08-01', '2025-08-31'),
(2, 2, 2, 1, '2025-08-01', '2025-08-31'),
(3, 3, 3, 1, '2025-08-01', '2025-08-31'),
(4, 4, 4, 1, '2025-08-01', '2025-08-31'),
(5, 5, 5, 1, '2025-08-01', '2025-08-31'),






