DROP DATABASE IF EXISTS henry;

CREATE DATABASE henry;

use henry;

CREATE TABLE author 
(authorNum DECIMAL(2,0) PRIMARY KEY,
lastName CHAR(12),
firstName CHAR(10) );

CREATE TABLE publisher 
(publisherCode CHAR(3) PRIMARY KEY,
publisherName CHAR(25),
city CHAR(20) );

CREATE TABLE book 
(bookCode CHAR(4) PRIMARY KEY,
title CHAR(40),
publisherCode CHAR(3),
TYPE CHAR(3),
price DECIMAL(4,2),
paperback CHAR(1),
foreign key(publisherCode) references publisher(publisherCode) );

CREATE TABLE branch 
(branchNum DECIMAL(2,0) PRIMARY KEY,
branchName CHAR(50),
branchLocation CHAR(50),
numEmployees DECIMAL(2,0) );

CREATE TABLE inventory 
(bookCode CHAR(4),
branchNum DECIMAL(2,0),
onHand DECIMAL(2,0),
PRIMARY KEY (bookCode, branchNum),
foreign key (bookCode) references book(bookCode),
foreign key (branchNum) references branch(branchNum) );

CREATE TABLE wrote 
(bookCode CHAR(4),
authorNum DECIMAL(2,0),
sequence DECIMAL(1,0),
PRIMARY KEY (bookCode, authorNum),
foreign key (bookCode) references book(bookCode),
foreign key (authorNum) references author(authorNum) );
