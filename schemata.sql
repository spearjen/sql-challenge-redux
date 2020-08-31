--Create table schemas
CREATE TABLE departments (
	dept_no VARCHAR (10) PRIMARY KEY,
	dept_name VARCHAR (30) NOT NULL);
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR (10) NOT NULL,
	PRIMARY KEY (emp_no,dept_no));
CREATE TABLE dept_manager (
	dept_no VARCHAR (10) PRIMARY KEY NOT NULL,
	emp_no INT NOT NULL);
CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title VARCHAR (30) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR (30) NOT NULL,
	last_name VARCHAR (30) NOT NULL,
	sex VARCHAR (10) NOT NULL,
	hire_date DATE NOT NULL);
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY NOT NULL,
	salary MONEY NOT NULL);
CREATE TABLE titles (
	title_id VARCHAR (10) PRIMARY KEY NOT NULL,
	title VARCHAR (30) NOT NULL);