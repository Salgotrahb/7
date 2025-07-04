create database office;

use office;

CREATE TABLE employee (
    Id INT PRIMARY KEY,
    First_name VARCHAR(10),
    Last_name VARCHAR(10),
    Hourly_pay FLOAT,
    Job VARCHAR(20)
);

insert into employee 
( Id , First_name , Last_name, Hourly_pay ,Job)
values
( 1 , "Vivek" , "Khajuria" , 20.15 , "Manager"),
( 2 , "Harsh" , "Salgotra" , 10.15 , "Clerk"),
( 3 , "Roshan" , "KUmar" , 0.15 , "cashier"),
( 4 , "Aman" , "Singh" , 30.15 , "Keeper"),
( 5 , "Karan" , "Rajput" , 22.15 , "Cleaner");

SELECT 
    *
FROM
    employee;

CREATE VIEW employee_attendance AS
    SELECT 
        id, First_name
    FROM
        employee;

SELECT 
    *
FROM
    employee_attendance;

CREATE TABLE customer (
    customer_id INT,
    Name VARCHAR(20),
    Client_project VARCHAR(20),
    employee_id INT,
    FOREIGN KEY (employee_id)
        REFERENCES employee (Id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

insert into customer 
( customer_id , Name , Client_project , employee_id)
Values
(1 , "Ram Lal" , 3 , 2 ),
(2 , "shiv Sharma" , 2 , 1 ),
(3 , "Neeti Mohan" , 4 , 2 ),
(4 , "Sundar Pichai" , 1 , 3 );

SELECT 
    *
FROM
    customer;

CREATE VIEW customer_projects AS
    SELECT 
        name, client_project
    FROM
        customer;

SELECT 
    *
FROM
    customer_projects;


CREATE VIEW Work_sheet AS
    SELECT 
        employee.First_name AS employee_name,
        customer.Name AS customer_name,
        customer.client_project AS No_Of_Projects
    FROM
        customer
            JOIN
        employee ON employee.id = customer.employee_id;



SELECT 
    *
FROM
    work_sheet;

drop view work_sheet;