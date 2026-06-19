create database LEC_7
go 
create schema task_2
go 

USE LEC_7
GO

--1-Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
create table task_2.Employees
(
  ID int ,
  Name varchar(20),
  Salary decimal
)

--2-Add a new column named "Department" to the "Employees" table with data type varchar(50).
alter table task_2.Employees
add Department varchar(50)

--3-Remove the "Salary" column from the "Employees" table.
alter table task_2.Employees
drop column Salary 

--4-Rename the "Department" column in the "Employees" table to "DeptName".

execute sp_rename '[task_2].[Employees].Department','DeptName','column'

create table task_2.Projects
(
Project_ID int,
Project_Name varchar(20) 
)

ALTER TABLE task_2.Employees
ALTER COLUMN ID INT NOT NULL;

alter table task_2.Employees
add constraint PK_Employees
PRIMARY KEY (ID)

ALTER TABLE task_2.Employees
ADD CONSTRAINT UQ_Employees_Name 
UNIQUE(Name);

create table task_2.Customers(
Customer_ID int,
Frist_Name varchar(20),
Last_Name varchar(20),
Email varchar(20),
Status varchar(20)
)

ALTER TABLE task_2.Customers
ADD CONSTRAINT UQ_Customers_FristName_LastName 
UNIQUE(Frist_Name,Last_Name);

create table task_2.Orders(
Order_ID int,
Customer_ID int,
OrderDate datetime,
TotalAmount decimal
)

ALTER TABLE task_2.Orders
ADD CONSTRAINT CH_Con
check(TotalAmount > 0)

go 
create schema Sales
go 

ALTER SCHEMA Sales
TRANSFER task_2.Orders

SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'Orders';

execute sp_rename '[Sales].[Orders]','SalesOrders'

SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'SalesOrders';