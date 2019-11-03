CREATE TABLE salaries (
	salary INT,
    emp_no VARCHAR,
	from_date DATE,
	to_date DATE,
    PRIMARY KEY (salary),
	FOREIGN KEY (emp_no) REFERENCES dept_emp(emp_no)
);

CREATE TABLE employees (
	last_name VARCHAR,
    first_name VARCHAR,
	emp_no VARCHAR,
	birth_date DATE,
	gender VARCHAR(1),
	hire_date DATE,
    PRIMARY KEY (last_name),
	FOREIGN KEY (emp_no) REFERENCES dept_emp(emp_no)
);

CREATE TABLE titles (
	title VARCHAR,
	emp_no VARCHAR,
	from_date DATE,
	to_date DATE,
    PRIMARY KEY (title),
	FOREIGN KEY (emp_no) REFERENCES dept_emp(emp_no)
);

CREATE TABLE dept_manager (
	from_date DATE,
	dept_no VARCHAR,
	emp_no VARCHAR,
	to_date DATE,
    PRIMARY KEY (from_date),
	FOREIGN KEY (emp_no) REFERENCES dept_emp(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT* FROM departments;

DROP TABLE salaries;

CREATE TABLE salaries (
	salary INT,
    emp_no INT,
	from_date DATE,
	to_date DATE,
    PRIMARY KEY (salary)
);

SELECT * FROM salaries;

DROP TABLE salaries;

Drop Table dept_emp;
Drop Table dept_manager;
Drop Table employees;
Drop Table titles;

CREATE TABLE employees (
	last_name VARCHAR(200),
    first_name VARCHAR(200),
	emp_no INT,
	birth_date DATE,
	gender VARCHAR(1),
	hire_date DATE,
    PRIMARY KEY (emp_no)
);

drop table employees;

drop table employees;

CREATE TABLE employees (
	emp_no INT,
	birth_date DATE,
	first_name VARCHAR(200),
	last_name VARCHAR(200),
    gender VARCHAR(1),
	hire_date DATE,
    PRIMARY KEY (emp_no)
);

Drop table salaries;
DROP TABLE salaries; 

CREATE TABLE salaries (
	emp_no INT,
	salary INT,
	from_date DATE,
	to_date DATE,
    PRIMARY KEY (emp_no)
);

ALTER TABLE salaries
ADD COLUMN salary_id SERIAL;

SELECT * FROM salaries;
SELECT * FROM salaries;
ALTER TABLE salaries DROP CONSTRAINT salaries_pkey;

SELECT * FROM salaries;
ALTER TABLE salaries 
ADD PRIMARY KEY (salary_id);

ALTER TABLE salaries 
ADD CONSTRAINT emp_no_fkey FOREIGN KEY (emp_no) REFERENCES employees (emp_no);

Select * From salaries;

CREATE TABLE titles (
	emp_no INT,
	title VARCHAR(200),
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


ALTER TABLE titles
ADD COLUMN titles_id SERIAL;

Select * from titles;
ALTER TABLE titles 
ADD PRIMARY KEY (titles_id);

Select * from titles;

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

Select * from dept_manager;

Alter table dept_manager
ADD Column dept_manager_id SERIAL;

ALTER TABLE dept_manager
ADD PRIMARY KEY (dept_manager_id);

SELECT * from dept_manager;

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

Alter table dept_emp
ADD Column dept_emp_id SERIAL;

ALTER TABLE dept_emp
ADD PRIMARY KEY (dept_emp_id);

SELECT * From dept_emp;

SELECT * FROM departments;

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salary
FROM employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no;

SELECT * from employees;

SELECT * FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salary
FROM employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no;

SELECT departments.dept_name, dept_manager.dept_no, dept_manager.from_date, dept_manager.to_date, employees.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN employees ON employees.emp_no=dept_manager.emp_no 
	Inner JOIN departments ON departments.dept_no=dept_manager.dept_no;

SELECT emp_no, last_name, first_name
FROM employees; 

SELECT emp_no, last_name, first_name
from employees
Where emp_no IN
	(Select dept_no
	 from dept_emp where dept_no IN
		(select dept_name 
		from departments)
	 );
	 
	 
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;


SELECT last_name, first_name
FROM employees
WHERE first_name= 'Hercules' and last_name LIKE 'B%';

SELECT dept_no
FROM departments
WHERE dept_name='Sales';

SELECT employees.first_name, employees.last_name, dept_emp.emp_no, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name= 'Sales';

SELECT employees.first_name, employees.last_name, dept_emp.emp_no, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name= 'Sales' OR departments.dept_name='Development';

SELECT last_name, COUNT(last_name) as last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;






