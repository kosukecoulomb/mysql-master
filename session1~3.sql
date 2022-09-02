use artdata;
show tables;
CREATE TABLE artist(
	id int not null auto_increment primary key,
	name varchar(255) not null,
	category varchar(255)
);
show tables;
show columns from artist;
DROP table artist;
show tables;
show databases;
DROP DATABASE artdata;
show databases;
CREATE DATABASE sales;
USE sales;
CREATE TABLE users(
	id int not null auto_increment primary key,
    name varchar(30),
    age int);
INSERT INTO users(id,name,age) VALUES(1,'takahashi',31);
SELECT * FROM users;
INSERT INTO users VALUES(2,'suzuki',37),(3,'sato',21);
CREATE TABLE item(
	id int not null auto_increment primary key,
    item_name varchar(20),
    price int);
INSERT INTO item(id,item_name,price)
VALUES(1,'TV',100000),(2,'smartphone',80000),(3,'camera',50000);
show columns from item;
SELECT * FROM item;
ALTER TABLE users ADD frequency varchar(10) not null;
DESC users;
UPDATE users SET frequency = 'still';
SELECT * FROM users;
UPDATE users SET age = 32 WHERE id = 1;