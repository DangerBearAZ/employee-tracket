-- db employee_tracker
-- DROP DATABASE employee *Delte entire datbase
-- source db/db.sql;  *recreate DB and employee table 
-- source db/schema.sql; *runs this doc in mysql 
-- source db/seeds.sql; * seeds 


DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS roles;

CREATE TABLE roles (
    id INTEGER AUTO_INCREMENT PRIMARY KEY, 
    title VARCHAR(30) NOT NULL,
    salary DECIMAL(7,2) NOT NULL
);

CREATE TABLE employee ( 
id INTEGER AUTO_INCREMENT PRIMARY KEY, 
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
role_id INTEGER,
CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE SET NULL,
manager_id INTEGER NOT NULL
);


SELECT employee.*, roles.title
FROM employee
LEFT JOIN roles ON employee.role_id = roles.id;