-- DROP TABLE IF EXISTS salaries;
-- DROP TABLE IF EXISTS dept_manager;
-- DROP TABLE IF EXISTS dept_emp;
-- DROP TABLE IF EXISTS employees;
-- DROP TABLE IF EXISTS titles;
-- DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR NOT NULL);
	
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no));
	
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no));

CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id)REFERENCES titles(title_id));
	
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
	
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR NOT NULL);
