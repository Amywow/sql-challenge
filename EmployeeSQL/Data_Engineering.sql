--Data Engineering
--Delete table if it exists
drop table if exists titles ;
drop table if exists depatments ;
drop table if exists salaries ;
drop table if exists dept_emp ;
drop table if exists dept_manager ;
drop table if exists employees ;

--Create new tables
CREATE TABLE titles (
	title_id VARCHAR(225) NOT NULL,
	title VARCHAR(225) NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE departments (
	dept_no VARCHAR(225) NOT NULL,
	dept_name VARCHAR(225) NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title VARCHAR(225) NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles (title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(225) NOT NULL,
	last_name VARCHAR(225) NOT NULL, 
	sex VARCHAR(225),
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
	
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL,
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(225) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(225) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no)
);