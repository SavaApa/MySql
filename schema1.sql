CREATE TABLE my_schema.employees (
    employeeid INT AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(255) CHECK (phone LIKE '+%')
);

ALTER TABLE my_schema.employees
	ADD COLUMN salary NUMERIC(9, 2);
    
ALTER TABLE my_schema.employees
	MODIFY COLUMN salary INT;

ALTER TABLE my_schema.employees
    CHANGE COLUMN fname first_name VARCHAR(255) NOT NULL;
    
ALTER TABLE my_schema.employees
	DROP COLUMN phone;

ALTER TABLE my_schema.employees
    ADD COLUMN department VARCHAR(255) NOT NULL;