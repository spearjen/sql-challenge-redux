--Data Analysis, 1: List the employee number, last name, first name, sex, and salary.
SELECT employees.emp_no as "Employee Number",
	employees.last_name as "Last Name",
	employees.first_name as "First Name",
	employees.sex as "Sex Assigned at Birth",
	salaries.salary as "Salary"
FROM employees
	INNER JOIN salaries ON
	employees.emp_no=salaries.emp_no
ORDER BY "Salary" DESC, "Sex Assigned at Birth" ASC, "Employee Number" DESC;
	
--Data Analysis, 2: List the first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name as "First Name", employees.last_name as "Last Name", employees.hire_date as "Hire Date"
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date ASC, "Last Name" ASC;

--Data Analysis, 3: List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no as "Department Number", departments.dept_name as "Department Name", dept_emp.emp_no as "Employee Number", employees.last_name as "Last Name", employees.first_name as "First Name"
FROM departments
	JOIN dept_emp
	ON (departments.dept_no = dept_emp.dept_no)
	JOIN employees
	ON (dept_emp.emp_no = employees.emp_no)
	JOIN titles
	ON (employees.emp_title = titles.title_id)
WHERE title = 'Manager'
ORDER BY "Department Number" ASC, "Last Name" ASC;

--Data Analysis, 4: List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no as "Employee Number", employees.last_name as "Last Name", employees.first_name as "First Name", departments.dept_name as "Department"
FROM departments
	JOIN dept_emp
	ON (departments.dept_no = dept_emp.dept_no)
	JOIN employees
	ON (dept_emp.emp_no = employees.emp_no)
ORDER BY "Department" ASC, "Last Name" ASC;

--Data Analysis, 5: List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name as "First Name", employees.last_name as "Last Name", employees.sex as "Sex Assigned at Birth"
FROM employees
WHERE first_name='Hercules' 
AND last_name LIKE 'B%'
ORDER BY "Last Name"ASC, "Sex Assigned at Birth" ASC;

--Data Analysis, 6: List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no as "Employee Number", employees.last_name as "Last Name", employees.first_name as "First Name", departments.dept_name as "Department"
FROM departments
	JOIN dept_emp
	ON (departments.dept_no = dept_emp.dept_no)
	JOIN employees
	ON (dept_emp.emp_no = employees.emp_no)
WHERE dept_name='Sales'
ORDER BY "Last Name" ASC, "First Name" ASC;

--Data Analysis, 7: List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no as "Employee Number", employees.last_name as "Last Name", employees.first_name as "First Name", departments.dept_name as "Department"
FROM departments
	JOIN dept_emp
	ON (departments.dept_no = dept_emp.dept_no)
	JOIN employees
	ON (dept_emp.emp_no = employees.emp_no)
WHERE dept_name = 'Sales' 
OR dept_name = 'Development'
ORDER BY dept_name ASC, "Last Name" ASC, "First Name" ASC;
	
--Data Analysis, 8: In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name as "Unique Last Name", 
COUNT (last_name) as "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY COUNT (*) DESC;