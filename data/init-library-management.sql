-- LibraryManagement Database
-- DDL Script for Library Management System

DROP SCHEMA IF EXISTS LibraryManagement;
CREATE SCHEMA LibraryManagement;
USE LibraryManagement;

-- Table: authors
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255)
);

-- Table: genres
CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(255)
);

-- Table: users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255)
);

-- Table: books (depends on authors, genres)
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    publication_year YEAR,
    author_id INT,
    genre_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

-- Table: borrowed_books (depends on books, users)
CREATE TABLE borrowed_books (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- =============================================
-- Test Data
-- =============================================

-- Authors
INSERT INTO authors (author_name) VALUES ('Тарас Шевченко');
INSERT INTO authors (author_name) VALUES ('Ліна Костенко');

-- Genres
INSERT INTO genres (genre_name) VALUES ('Поезія');
INSERT INTO genres (genre_name) VALUES ('Роман');

-- Users
INSERT INTO users (username, email) VALUES ('ivan_petrenko', 'ivan@example.com');
INSERT INTO users (username, email) VALUES ('maria_koval', 'maria@example.com');

-- Books
INSERT INTO books (title, publication_year, author_id, genre_id) VALUES ('Кобзар', 1960, 1, 1);
INSERT INTO books (title, publication_year, author_id, genre_id) VALUES ('Маруся Чурай', 1979, 2, 2);

-- Borrowed books
INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES (1, 1, '2024-01-15', '2024-01-30');
INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES (2, 2, '2024-02-01', NULL);
