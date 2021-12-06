ALTER TABLE suppliers
ADD count_id int NOT NULL,
ADD prod_id int NOT NULL,
ADD FOREIGN KEY (count_id) REFERENCES countries (count_id),
ADD FOREIGN KEY (prod_id) REFERENCES products (prod_id);

ALTER TABLE clients
ADD COLUMN count_id int NOT NULL;

UPDATE clients
SET count_id = (
SELECT count_id
FROM countries
WHERE count_name = 'France');

ALTER TABLE clients
ADD FOREIGN KEY (count_id) REFERENCES countries (count_id);

CREATE TABLE employees (
emp_id int AUTO_INCREMENT NOT NULL,
emp_name varchar(50),
emp_surname varchar(50),
emp_adress varchar(200),
emp_zipcode varchar(5),
emp_email varchar(50),
emp_tel varchar(10),
count_id int NOT NULL,
PRIMARY KEY (emp_id),
FOREIGN KEY (count_id) REFERENCES countries (count_id)
);
