              -- >> SAL_BW_Project_1: SQL Insights <<--

CREATE DATABASE Books;

USE Books;


CREATE TABLE books (
    title TEXT,
    price DECIMAL(6,2),
    availability VARCHAR(100),
    rating INT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/books_cleaned.csv'
INTO TABLE books
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(title, price, availability, rating);


SELECT * 
FROM books;

-- Checking the count of books --
SELECT 
    COUNT(*)
FROM
    books;


-- ** Average rating of books ** -- 
SELECT 
    AVG(rating) AS average_rating
FROM
    books;


-- ** Retrieve the total number of books for each rating (e.g., 1-star, 2-star, etc..) ** --
SELECT 
    rating, COUNT(*) AS total_books
FROM
    books
GROUP BY rating
ORDER BY rating ASC;


-- ** List the top 5 most expensive books. ** --
SELECT 
    title, price
FROM
    books
ORDER BY price DESC
LIMIT 5;


-- ** Books that are available ** -- 
SELECT 
    availability, COUNT(*) AS Total_Books
FROM
    Books
GROUP BY availability;

-- Filtering books between price 30 and 50 ** --
SELECT 
    title, price
FROM
    Books
WHERE
    price BETWEEN 30 AND 50
ORDER BY price DESC
LIMIT 10;


-- ** Highest rated cheap books ** -- 
SELECT 
    title, price, availability, rating
FROM
    Books
WHERE
    rating = 5
ORDER BY price ASC
LIMIT 5;


-- ** Ranking books by price using window function ** -- 
SELECT 
       title, 
       price, 
       availability, 
       rating, 
       RANK() OVER (ORDER BY price DESC) AS books_ranked
FROM Books
WHERE rating = 5
LIMIT 10;


