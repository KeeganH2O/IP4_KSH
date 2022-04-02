USE henry;

#1.	listing the last and first names of authors (from author table)
SELECT lastName AS Last_Name, firstName AS First_Name
FROM author;

#2.	Retrieves the book titles and their genre
SELECT title AS Title, TYPE as Genre
FROM book;

#3.	Retrieve the publisherCode in the book table (each is listed once)
SELECT publisherCode AS Code
FROM book
Group By publisherCode;

#4.	Retrieve the title and price of each book in the book relation. Also includes a row of 25% discount of price (showing first 5 rows) 
SELECT title AS Title, price AS Price, ROUND(SUM(price * 0.75), 2) AS "25% Discount"
FROM book
GROUP BY title
LIMIT 5;

#5.	Retrieve the title and price for any book whose price is higher than $20.00 in the book relation.
SELECT title AS Title, price AS Price
FROM book
WHERE price > 20;

#6.Retrieve the publisherName of all publishers that are in New York only in the publisher relation.
SELECT publisherName AS "Publisher Name", city AS City
FROM publisher
WHERE city = "New York";

#7.	Retrieve the publisherName of all publishers that are not in New York in the publisher relation.
SELECT publisherName AS "Publisher Name", city AS City
FROM publisher
WHERE city != "New York";

#8.	Retrieve the bookCode and onHand for each book for which a branch has between 2 and 4 copies in the inventory relation.
SELECT bookCode AS Book_Code, onHand AS Available
FROM inventory
WHERE onHand BETWEEN 2 and 4;

#9 Finding the number of books each publisher published
SELECT publisher.publisherCode AS Publisher_Code, publisherName As Publisher_Name, COUNT(book.publisherCode) AS Count
FROM publisher, book
WHERE publisher.publisherCode = book.publisherCode AND publisher.publisherCode = "PE"
GROUP BY publisher.publisherCode;

#10 Finding the number of books under $20
SELECT count(title) AS Total_Books_Under_20
FROM book
WHERE price <= 20.00;

#11 Joining the publisher and book table into one big table
SELECT publisher.publisherCode AS Publisher_Code, publisher.publisherName AS Publisher_Name, city AS City, bookCode AS Book_Code, title AS Title, TYPE AS Book_Type, price AS Price, paperback AS Paperback
FROM publisher, book
WHERE publisher.publisherCode = book.publisherCode;

#12 rewrite above using JOIN ON
SELECT publisher.publisherCode AS Publisher_Code, publisher.publisherName AS Publisher_Name, city AS City, bookCode AS Book_Code, title AS Title, TYPE AS Book_Type, price AS Price, paperback AS Paperback
FROM publisher
JOIN book ON 
publisher.publisherCode = book.publisherCode;

#13 Retrieve the title from the book relation and the city from the publisher relation using a JOIN query. (Using Aliases)
SELECT book.title AS Title, publisher.city AS City 
FROM book
Join publisher On
publisher.publisherCode = book.publisherCode
ORDER BY book.title;

#14 retrive the columns title from book table and branchNum, onHand from inventory table (use aliases), order result by title. 
SELECT title AS Title, branchNum AS "Branch Number", onHand AS Available
FROM book, inventory
GROUP BY title, branchNum
ORDER BY Title, branchNum;

#15.	Retrieve the title from the book relation and compute the number of copies of the title that all branches have on hand.
# Name this computed column ‘Inventory’  Hint: You will need to join book and inventory and do an aggregate query. 
#Use aliases in your query.  Order the result by the total number of copies of the book in descending order. 
#Show the first two rows of your result. (5 points)

# Retrieve columns: title from book table and compute # of copies of the title from all branches (onHand) Use alias 'Inventory'. 
# order results by decending order of Inventory, limit results to 2 rows. 
SELECT book.title AS Title, SUM(onHand) AS Inventory
FROM book
JOIN inventory ON
book.bookCode = inventory.bookCode
GROUP BY title
ORDER BY Inventory DESC
LIMIT 2;

#16 retrieve the first name and last name from the 
# author relation and the title from the book relation for all paperback books in the book relation. 
#Order the result by the author last name and title.
SELECT lastName AS Last_Name, firstName AS First_Name, title AS Title
from author
JOIN wrote ON
author.authorNum = wrote.authorNum
JOIN book ON
wrote.bookCode = book.bookCode
WHERE paperback = "Y"
ORDER BY lastName, title;

#GROUP BY lastName, title
#ORDER BY lastName;

#BONUS BONUS BONUS
#Retrieve the title from the book relation and the author lastName from the author relation. 
#Order by author lastName. Use aliases in your query. This will involve JOINING the book, author and wrote relations.
SELECT title AS Title, lastName AS Last_Name
from author
JOIN wrote ON
author.authorNum = wrote.authorNum
JOIN book ON
wrote.bookCode = book.bookCode
ORDER BY lastName