-- 	List the employee number, last name, first name, sex, and salary of each employee

SELECT employees.emp_no, last_name, first_name, sex, salaries.salary
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986

SELECT employees.emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN to_date('1986-12-31','YYYY-MM-DD') 
                    AND to_date('1988-01-01','YYYY-MM-DD')

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
	
SELECT dept_manager.emp_no,
	dept_manager.dept_no, 
	departments.dept_name, 
	employees.emp_no,
	employees.last_name,
	employees.first_name
FROM dept_manager
LEFT JOIN departments ON 
dept_manager.dept_no = departments.dept_no;
LEFT JOIN employees ON
dept_manager.emp_no = employees.emp_no

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name 

SELECT employees.emp_no,
employees.last_name,
employees.first_name,
dept_emp.dept_no,
departments.dept_name
FROM employees 
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

SELECT first_name,
last_name,
sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name

SELECT dept_emp.dept_no,
employees.emp_no,
employees.first_name,
employees.last_name
FROM employees
LEFT JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name

SELECT dept_emp.dept_no,
employees.emp_no,
employees.first_name,
employees.last_name,
departments.dept_name
FROM employees
LEFT JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names

SELECT employees.last_name, COUNT(*) AS count_last_names
FROM employees
GROUP by last_name
ORDER by count_last_names DESC;
