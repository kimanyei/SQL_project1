CREATE TABLE student (
   student_id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(20),
   major VARCHAR (20) DEFAULT 'undecided' 
);
DESCRIBE student;
DROP TABLE student;
ALTER TABLE student ADD gpa DECIMAL(3,2);
ALTER TABLE student DROP COLUMN gpa;
INSERT INTO student(student_id,name) VALUES(3,'Claire');
SELECT * FROM student;
INSERT INTO student VALUES(5,'Mike','Computer Science');

INSERT INTO student (name,major)VALUES('Jack','Biology');

INSERT INTO student (name,major)VALUES('Kate','Sociology');

INSERT INTO student (name,major)VALUES('Claire','Chemistry');
INSERT INTO student (name,major)VALUES('Jack','Biology');

INSERT INTO student (name,major)VALUES('Mike','Computer Science');

UPDATE student
SET major='Bio'
WHERE major='Biology';

UPDATE student
SET major='Comp Sci'
WHERE major='Computer Science';

UPDATE student
SET major='Comp Sci'
WHERE student_id=4;

UPDATE student
SET major='Biochemistry'
WHERE major='Bio' OR major= 'Chemistry';

UPDATE student
SET name='Tom', major='undecided'
WHERE student_id=4



SELECT * FROM student;
DELETE FROM student
WHERE name = 'Tom'  AND major = 'undecided';

SELECT * FROM student;

DELETE FROM student
WHERE student_id =5;
SELECT * FROM student;

SELECT name FROM student;

SELECT student.name,student.major FROM student;

SELECT name FROM student
ORDER BY name DESC;

SELECT * FROM student
ORDER BY major,student_id;

SELECT * FROM student
ORDER BY student_id
LIMIT 3;

SELECT * FROM student
WHERE major='Biochemistry';

SELECT * FROM student
WHERE major='Biochemistry' OR major='Sociology';

SELECT * FROM student
WHERE major <> 'Biochemistry';

SELECT * FROM student
WHERE name IN ('Claire','Jack','Mike');

SELECT * FROM student
WHERE major IN ('Sociology','Biochemistry') AND student_id>2;

DROP TABLE student;

DESCRIBE TABLE student;

CREATE TABLE employee (
 emp_id INT PRIMARY KEY,
 first_name VARCHAR(40),
 last_name VARCHAR(40),
 birth_day DATE,
 sex varchar(1),
 salary INT,
 super_id INT,
 branch_id INT
)
 




 CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client(
    client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id)
    ON DELETE SET NULL

);

CREATE TABLE works_with(
    emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY(emp_id,client_id),
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);


CREATE TABLE branch_supplier(
    branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);
--corporate
INSERT INTO employee VALUES(100,'David','Wallace','1967-11-17','M','250000',NULL,NULL);
INSERT INTO branch VALUES(1,'Corparate',100,'2006-02-09');







UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;
INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);
SELECT * FROM employee;


INSERT INTO employee VALUES (102,'Michael','Scott','1964-03-15','M',75000,100,NULL)


INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

SELECT * FROM employee;

INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;


INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');


INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

SELECT * FROM employee;
SELECT * FROM branch;
SELECT * FROM works_with;
SELECT * FROM client;
SELECT * FROM branch_supplier;

SELECT* FROM employee
ORDER BY salary DESC;

SELECT * FROM employee
ORDER BY sex, first_name, last_name;

SELECT * FROM employee
LIMIT 5;

SELECT first_name,last_name
FROM employee;

SELECT first_name AS forename, last_name AS surname
FROM employee;

SELECT DISTINCT sex
FROM employee;

SELECT COUNT(emp_id)
FROM employee;

SELECT COUNT(super_id)
FROM employee;

SELECT COUNT(emp_id)
FROM employee
WHERE sex ='F' AND birth_day >'1971-01-01';

SELECT * FROM employee;

SELECT AVG(salary)
FROM employee
WHERE sex ='M';

SELECT SUM(salary)
FROM employee;

SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;

SELECT SUM(total_sales), emp_id
FROM works_with
GROUP BY emp_id;

SELECT SUM (total_sales), client_id
FROM works_with
GROUP BY client_id;
--wildcards
SELECT *
FROM client
WHERE client_name LIKE '%LLC';

SELECT *
FROM client
WHERE client_name LIKE '%Ex';

SELECT*
FROM branch_supplier
WHERE supplier_name LIKE '%Lab%';

SELECT *
FROM employee
WHERE birth_day LIKE '%10%';

SELECT *
FROM employee
WHERE birth_day LIKE '____-10%';

SELECT *
FROM client
WHERE client_name LIKE '%school%';
--UNIONS--

SELECT first_name AS Company_names
FROM employee
UNION
SELECT branch_name
FROM branch
UNION
SELECT client_name
FROM client;

SELECT client_name , branch_id
FROM client
UNION
SELECT supplier_name, branch_id
FROM branch_supplier;

SELECT SUM (salary)
FROM employee
UNION
SELECT SUM(total_sales)
FROM works_with;

SELECT salary
FROM employee
UNION
SELECT total_sales
FROM works_with;

---must be similar data type,must be same number of columns

--JOINS-
INSERT INTO branch VALUES (4, 'Bufallo',NULL,NULL);
SELECT * FROM branch;

SELECT employee.emp_id , employee.first_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

SELECT employee.emp_id , employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;

SELECT employee.emp_id , employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id;

--NESTED QUERIES--
SELECT emp_id, total_sales
FROM works_with
WHERE total_sales >30000;

SELECT first_name, last_name
FROM employee
WHERE emp_id IN(
  SELECT emp_id
  FROM works_with
  WHERE total_sales >30000
);  

SELECT branch.branch_id
FROM branch
WHERE branch.mgr_id = 102;
--finding clients served by michael scott branch

SELECT client.client_name
FROM client
WHERE client.branch_id IN(
    SELECT branch.branch_id 
    FROM branch
    WHERE branch.mgr_id = 102);

  --DELETING FROM TABLE--
   --on delete set nuul-replaces deleted value with null,
   --on delete cascade-deletes the rows associated  with deleted value,Used when the foreign key is a PRIMARY KEY
  DELETE
  FROM employee
  WHERE emp_id = 102;  
  SELECT *FROM employee;

  SELECT * FROM branch;

  DELETE FROM branch
  WHERE branch_id= 2;
  SELECT * FROM branch;
  --TRIGGERS--

  CREATE TABLE trigger_test(
   message VARCHAR(100));

DELIMITER $$
CREATE
    TRIGGER my_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES('added new employee');
    END$$
DELIMITER ;

INSERT INTO employee 
VALUES(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);


SELECT * FROM trigger_test;

DELIMITER $$

CREATE 
   TRIGGER my_trigger1 BEFORE INSERT
   ON employee
   FOR EACH ROW BEGIN
       INSERT INTO trigger_test VALUES('NEW.first_name');
END$$  

DELIMITER;


INSERT INTO employee 
VALUES (110,'Kevin','Malone','1978-02-19','M', 69000, 106, 3);

DELIMITER $$

CREATE 
   TRIGGER my_trigger2 BEFORE INSERT
   ON employee
   FOR EACH ROW BEGIN
       INSERT INTO trigger_test VALUES(NEW.first_name);
END$$  

DELIMITER;
INSERT INTO employee 
VALUES (111,'Kev','Malone','1978-02-19','M', 69000, 106, 3);

DELIMITER $$

CREATE 
   TRIGGER my_trigger3 BEFORE INSERT
   ON employee
   FOR EACH ROW BEGIN
       IF NEW.sex = 'M' THEN
              INSERT INTO trigger_test VALUES ('Added male employee');
       ELSEIF NEW.sex ='F' THEN
              INSERT INTO trigger_test VALUES ('Added female employee');
       ELSE 
              INSERT INTO trigger_test VALUES ('Added other employee');
       END IF;               
    
END$$  

DELIMITER;

INSERT INTO employee
VALUES(112, 'Pam', 'Beesly', '1988-02-19', 'F', 69000, 106, 3);

SELECT * FROM trigger_test;

--ER DIAGRAMS;ENTITY RELATIONSHIP DIAGRAMS
--entity-object we want to model and store info about
--attributes-specific pieces of information about an entity
--primark key-atribute that uniquely indentifies an entry
--composite attributes-attributes that can be broken upto 2
--multivalued attribute-attribute that can have more than 1 value
--deriver attribute-derived from other attributes
--mutiple entities-you can define more than 1 entities in a diagram
  --relationships-defines a relationship between 2 entities
  --total participation-all members participate in the relationship
  --partial participation-not all members participate
  --relationship attribute-attribute about the relationship
--relationship cardinality-number of instance of an entity from a relation that can be associated with the relation 
--1:1 ,1:N ,N:M
--weak entity-entity that can not be uniquely identified by its attributes alone
--identfying relationship-relationship that serves to uniqely identify the weak entity
--weak entity must have total participation
 