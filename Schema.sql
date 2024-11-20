
CREATE TABLE departments (
  dept_no VARCHAR(10) PRIMARY KEY,
  dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE dept_emp (
  emp_no_dept_no VARCHAR(10) PRIMARY KEY,
  emp_no INT,
  dept_no VARCHAR(10)
);

CREATE TABLE dept_manager (
  emp_no_dept_no VARCHAR(10) PRIMARY KEY,
  dept_no VARCHAR(10),
  emp_no INT
);

CREATE TABLE employees (
  emp_no INT NOT NULL PRIMARY KEY,
  emp_title_id VARCHAR(10) NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  sex VARCHAR(10) NOT NULL,
  hire_date DATE NOT NULL
);

CREATE TABLE salaries (
  emp_no INT PRIMARY KEY,
  salary INT
);

CREATE TABLE titles (
  title_id VARCHAR(10) PRIMARY KEY,
  title VARCHAR(30)
);

ALTER TABLE dept_emp ADD FOREIGN KEY (dept_no) REFERENCES departments (dept_no);

ALTER TABLE employees ADD FOREIGN KEY (emp_no) REFERENCES salaries (emp_no);

ALTER TABLE employees ADD FOREIGN KEY (emp_title_id) REFERENCES titles (title_id);

ALTER TABLE employees ADD FOREIGN KEY (emp_no) REFERENCES dept_emp (emp_no);

ALTER TABLE dept_emp ADD FOREIGN KEY (emp_no_dept_no) REFERENCES dept_manager (emp_no_dept_no);


