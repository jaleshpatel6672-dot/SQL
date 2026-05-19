CREATE database Assignment;

use Assignment;

create table Contact(
	contactID int,
    CompanyID int,
    FirstName varchar(45),
    LastName varchar(45),
    Street varchar(45),
    City varchar(45),
    State varchar(3),
    Zip varchar(10),
    IsMain boolean,
    Email varchar(45),
    Phone varchar(12)
);

create table Employee(
	EmployeeID int,
    FirstName varchar(45),
    LastName varchar(45),
    Salary decimal(10,2),
    Hiredate date,
    JobTitle varchar(25),
    Email varchar(45),
    Phone varchar(12)
);

create table ContactEmployee(
	ContactEmployeeID int,
    ContactID int,
    EmployeeID int,
    ContactDate date,
    Description varchar(100)
);

create table Company(
	CompanyID int,
    CompanyName varchar(45),
    Street varchar(45),
    City varchar(45),
    State varchar(3),
    Zip varchar(10)
);

INSERT INTO Contact
(ContactID, CompanyID, FirstName, LastName, Street, City, State, Zip, IsMain, Email, Phone)
VALUES
(1, 101, 'John', 'Smith', '12 Park Street', 'New York', 'NY', '10001', TRUE, 'john.smith@gmail.com', '9876543210'),

(2, 102, 'Emma', 'Johnson', '45 Lake Road', 'Chicago', 'IL', '60007', FALSE, 'emma.johnson@gmail.com', '9876543211'),

(3, 103, 'Michael', 'Brown', '78 Green Ave', 'Houston', 'TX', '77001', TRUE, 'michael.brown@gmail.com', '9876543212'),

(4, 104, 'Sophia', 'Davis', '22 Sunset Blvd', 'Los Angeles', 'CA', '90001', TRUE, 'sophia.davis@gmail.com', '9876543213'),

(5, 105, 'Daniel', 'Wilson', '90 River Street', 'Miami', 'FL', '33101', FALSE, 'daniel.wilson@gmail.com', '9876543214'),

(6, 106, 'Olivia', 'Taylor', '11 Hill Road', 'Seattle', 'WA', '98101', TRUE, 'olivia.taylor@gmail.com', '9876543215');


INSERT INTO Company
(CompanyID, CompanyName, Street, City, State, Zip)
VALUES
(101, 'TechNova Solutions', '12 Innovation Park', 'New York', 'NY', '10001'),

(102, 'GreenLeaf Marketing', '45 Lake View Road', 'Chicago', 'IL', '60007'),

(103, 'Bright Future Ltd', '78 Business Avenue', 'Houston', 'TX', '77001'),

(104, 'Skyline Enterprises', '22 Sunset Street', 'Los Angeles', 'CA', '90001'),

(105, 'OceanWave Corp', '90 River Road', 'Miami', 'FL', '33101'),

(106, 'NextGen Systems', '11 Hill Drive', 'Seattle', 'WA', '98101');

INSERT INTO Employee
(EmployeeID, FirstName, LastName, Salary, HireDate, JobTitle, Email, Phone)
VALUES
(1, 'James', 'Anderson', 55000.00, '2021-03-15', 'Sales Manager', 'james.anderson@marketco.com', '9876500001'),

(2, 'Sophia', 'Miller', 48000.00, '2022-06-10', 'Marketing Executive', 'sophia.miller@marketco.com', '9876500002'),

(3, 'William', 'Taylor', 62000.00, '2020-01-20', 'HR Manager', 'william.taylor@marketco.com', '9876500003'),

(4, 'Olivia', 'Brown', 45000.00, '2023-02-05', 'Data Analyst', 'olivia.brown@marketco.com', '9876500004'),

(5, 'Liam', 'Wilson', 70000.00, '2019-11-18', 'Project Manager', 'liam.wilson@marketco.com', '9876500005'),

(6, 'Emma', 'Davis', 53000.00, '2021-08-25', 'Business Analyst', 'emma.davis@marketco.com', '9876500006');

INSERT INTO ContactEmployee
(ContactEmployeeID, ContactID, EmployeeID, ContactDate, Description)
VALUES
(1, 1, 1, '2024-01-10', 'Initial business meeting'),

(2, 2, 2, '2024-01-15', 'Marketing campaign discussion'),

(3, 3, 4, '2024-02-05', 'Data analysis consultation'),

(4, 4, 5, '2024-02-20', 'Project planning session'),

(5, 5, 3, '2024-03-01', 'HR policy discussion'),

(6, 6, 6, '2024-03-12', 'Business growth strategy meeting');

UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Liam'
AND LastName = 'Wilson';

select * from Employee;

UPDATE Company
set CompanyName = "Urban Outfitters"
where  CompanyName = "Skyline Enterprises";

select * from Company;
select * from ContactEmployee;
select * from Employee;
select * from Contact;

DELETE ce
FROM ContactEmployee ce
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Employee e ON ce.EmployeeID = e.EmployeeID
WHERE c.FirstName = 'Emma' AND c.LastName = 'Johnson'
  AND e.FirstName = 'Sophia' AND e.LastName = 'Miller';
  
select
	c.companyname,
    concat(e.firstname," ", e.lastname)
from company as c
join contact as co on c.companyID = co.companyID
join contactemployee as ce on co.contactID = ce.contactID
join employee as e on ce.employeeid = e.employeeid
where c.companyname = "Bright Future Ltd";

/* Answer 8 */
/* Significance of % and _ in the LIKE statement.
 Ans : % (percent sign): Matches zero or more characters.
	 Example:
	  SELECT * FROM Employee WHERE FirstName LIKE 'J%';
      Finds names starting with "J" (e.g., John, James, Julia).
      _ (underscore): Matches exactly one character.
	 Example:
      SELECT * FROM Employee WHERE FirstName LIKE 'J_n';
      Finds names like "Jon" or "Jan" but not "John".
*/


/* Answer 9 */
/* Normalization in Databases
 Ans : Definition: A process of structuring a relational database to minimize redundancy and dependency.
       Goals:
             Avoid duplicate data.
			 Ensure data integrity.
             Simplify maintenance.
       Normal Forms:
			 1NF: Each column holds atomic values (no repeating groups).
             2NF: Every non-key attribute depends on the whole primary key.
             3NF: No transitive dependencies (non-key attributes depend only on the key).
	   Example: Instead of storing company details in every contact row, you separate them into a Company table and link via CompanyID.
*/

/* Answer 10 */
/* What does a JOIN in MySQL mean?
 Ans : - JOIN means Combines rows from two or more tables based on related columns.
       - Its Purpose is Retrieve meaningful combined data without duplicating storage.
      Example:
             SELECT e.FirstName, e.LastName, c.CompanyName
             FROM Employee e
             JOIN ContactEmployee ce ON e.EmployeeID = ce.EmployeeID
             JOIN Contact c ON ce—
*/

/* Answer 11 */
/*DDL, DCL, and DML in MySQL.
Ans : - DDL (Data Definition Language): Defines and modifies database structure.
          Commands: CREATE, ALTER, DROP.
          Example: Creating tables or changing schema.
	  - DML (Data Manipulation Language): Deals with data inside tables.
          Commands: INSERT, UPDATE, DELETE, SELECT.
          Example: Adding or updating employee records.
	  - DCL (Data Control Language): Manages access rights and permissions.
          Commands: GRANT, REVOKE.
          Example: Allowing or restricting user privileges.
   Together, they cover structure, data handling, and security in MySQL.

/* Answer 12 */
/*Role of MySQL JOIN Clause.
Ans : - The JOIN clause links rows from two or more tables using related columns.
      - It allows retrieval of connected data without duplicating storage.
	  - Essential for relational databases where information is spread across multiple tables.
      - Makes queries more powerful and efficient by combining data in one result set.

Common Types of Joins :
- INNER JOIN.
   Returns rows with matching values in both tables.
   Example: Shows only the records where both tables share a match.
- LEFT JOIN.
   Returns all rows from the left table, plus matching rows from the right.
   Example: Keeps everything from the left table, adds matches from the right.
- RIGHT JOIN.
   Returns all rows from the right table, plus matching rows from the left.
   Example: Keeps everything from the right table, adds matches from the left.
- FULL JOIN. (emulated with UNION in MySQL)
   Returns all rows when there is a match in either table.
   Example: Combines all rows from both tables, matched or unmatched.
- CROSS JOIN.
   Returns the Cartesian product (all possible combinations).
   Example: Pairs every row in one table with every row in the other.
*/
  
