-- Create database
 create database librarydb;
use librarydb;
-- Books table
 create table books(book_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(255) NOT NULL,
author VARCHAR(255) NOT NULL,
genre VARCHAR(100),
published_year YEAR,
is_available BOOLEAN DEFAULT TRUE);
-- Members table
CREATE TABLE Members (member_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
email VARCHAR(255),
phone_number VARCHAR(15),
join_date DATE DEFAULT (current_date));
-- Librarians table
CREATE TABLE Librarians (
librarian_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
email VARCHAR(255),
phone_number VARCHAR(15),hire_date DATE DEFAULT (current_date));
-- Borrowing table
CREATE TABLE Borrowing (
loan_id INT AUTO_INCREMENT PRIMARY KEY,
book_id INT,
member_id INT,
borrow_date DATE DEFAULT (CURRENT_DATE),
return_date DATE,
librarian_id INT,
FOREIGN KEY (book_id) REFERENCES books(book_id),
FOREIGN KEY (member_id) REFERENCES Members(member_id),
FOREIGN KEY (librarian_id) REFERENCES Librarians(librarian_id)
);
#_insert_sample_data.sql
use librarydb;
-- Books
INSERT INTO Books (title, author, genre, published_year) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925),
('1984', 'George Orwell', 'Dystopian', 1949),
('To Kill a Mockingbird', 'Harper Lee', 'Classic', 1960);
-- Members
INSERT INTO Members (name, email, phone_number) VALUES
('Alen King', 'alenking@example.com', '1234567890'),
('Alece Hofman', 'alecehofman@example.com', '9876543210');
-- Librarians
INSERT INTO  Librarians(name, email, phone_number) VALUES
('Nail Horn', 'nail@example.com', '4567891230'),
('Garden McGraw', 'garden@example.com', '7894561230');
-- 1. Borrow a Book
INSERT INTO Borrowing (book_id, member_id, librarian_id)
VALUES (1, 1, 1);
-- 2. Return a Book
UPDATE Books SET is_available = FALSE WHERE book_id = 1;
UPDATE Borrowing SET return_date = CURRENT_DATE WHERE loan_id = 1;
UPDATE Books SET is_available = TRUE WHERE book_id = 1;
-- 3. List available books
SELECT * FROM Books WHERE is_available = TRUE;
-- 4. Member Loan History
SELECT m.name, b.title, br.borrow_date, br.return_date
FROM Borrowing br
JOIN Members m ON br.member_id = m.member_id
JOIN Books b ON br.book_id = b.book_id
WHERE m.member_id = 1;
-- 5. Overdue books (>14 days)
SELECT m.name, b.title, br.borrow_date
FROM Borrowing br
JOIN Members m ON br.member_id = m.member_id
JOIN Books b ON br.book_id = b.book_id
WHERE br.return_date IS NULL
AND br.borrow_date < CURRENT_DATE - INTERVAL 14 DAY;
-- 6. Books by 'George Orwell'
SELECT title, genre, published_year
FROM Books
WHERE author = 'George Orwell';
-- 7. Books published after 2000
SELECT title, author, published_year
FROM Books
WHERE published_year > 2000;
-- 8. Total books in library
SELECT COUNT(*) AS total_books FROM Books;
-- 9. Members who borrowed '1984'
SELECT m.name, br.borrow_date, br.return_date
FROM Borrowing br
JOIN Members m ON br.member_id = m.member_id
JOIN Books b ON br.book_id = b.book_id
WHERE b.title = '1984';
-- 10. Borrowing history for member 1
SELECT b.title, br.borrow_date, br.return_date
FROM Borrowing br
JOIN Books b ON br.book_id = b.book_id
WHERE br.member_id = 1;
 -- 11. Available Fiction books
SELECT title, author, published_year
FROM Books
WHERE genre = 'Fiction' AND is_available = TRUE;
-- 12. Total books borrowed per member
SELECT m.name, COUNT(br.loan_id) AS total_books_borrowed
FROM Borrowing br
JOIN Members m ON br.member_id = m.member_id
GROUP BY m.name;
-- 13. Overdue books not returned (>30 days)
SELECT m.name, b.title, br.borrow_date
FROM Borrowing br
JOIN Members m ON br.member_id = m.member_id
JOIN Books b ON br.book_id = b.book_id
WHERE br.return_date IS NULL
AND br.borrow_date < CURRENT_DATE - INTERVAL 30 DAY;
-- 14. Top librarians by borrowings
SELECT l.name, COUNT(br.loan_id) AS total_borrowings
FROM Borrowing br
JOIN Librarians l ON br.librarian_id = l.librarian_id
GROUP BY l.name
ORDER BY total_borrowings DESC;
-- 15. Currently borrowed books
SELECT m.name, b.title, br.borrow_date
FROM Borrowing br
JOIN Members m ON br.member_id = m.member_id
JOIN Books b ON br.book_id = b.book_id
WHERE br.return_date IS NULL;






















