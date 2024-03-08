-- Data Analysis (20 points)
-- List the employee number, last name, first name, sex, and salary of each employee (2 points)

SELECT e.emp_no AS "Employee Number",e.last_name AS "Last Name",
		e.first_name AS "First Name", e.sex, s.salary AS "Salary"
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no 

-- List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)

SELECT first_name AS "First Name" , last_name AS "Last Name",
	   hire_date AS "Hire Date"
FROM employees
WHERE hire_date LIKE '%1986'
ORDER BY emp_no;
		
-- List the manager of each department along with their department number, 
--department name, employee number, last name, and first name (2 points)

SELECT de.dept_name AS "Department Name", d.emp_no AS "Employee No.",
		e.last_name AS "Last Name" , e.first_name As "First Name"
FROM dept_manager AS d
JOIN employees AS e
ON d.emp_no = e.emp_no
JOIN departments AS de
ON d.dept_no = de.dept_no
ORDER BY "Department Name" ASC ;

-- List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name (2 points)

SELECT d.dept_no AS "Department No.", d.emp_no AS "Employee No.",
		e.last_name AS "Last Name" , e.first_name As "First Name",
		de.dept_name AS "Department Name"
FROM employees AS e
JOIN dept_emp AS d
ON d.emp_no = e.emp_no
JOIN departments AS de
ON d.dept_no = de.dept_no
ORDER BY "Department Name" ASC ;

-- List first name, last name, and sex of each employee whose first name is 
--Hercules and whose last name begins with the letter B (2 points)

SELECT first_name AS "First Name", last_name AS "Last Name",
		sex as " Sex"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number,
--last name, and first name (2 points)

SELECT e.emp_no, e.last_name
    	 e.first_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';


-- List each employee in the Sales and Development departments, including their employee number,
--last name, first name, and department name (4 points)


SELECT e.emp_no AS "Employer Number",e.last_name AS "Last Name", 
		e.first_name AS "First Name" ,d.dept_name AS "Department Name"
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no= de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales','Development');

-- List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name) (4 points)

SELECT last_name AS "Last Name" , count(last_name) AS "Frequency count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency count" DESC;