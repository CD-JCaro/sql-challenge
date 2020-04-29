-- make sure everything loaded in correctly
select * from "titles"
limit 10;

select * from "employees"
limit 10;

select * from "salaries"
limit 10;

select * from "dept_manager"
limit 10;

select * from "dept_emp"
limit 10;

select * from "departments"
limit 10;
----------------------------------


-- get employee number, last name, first name, sex, and salary
select employees.emp_no, employees.first_name, employees.last_name, sex, s.salary
from employees
join salaries as s
	on employees.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
select emp_no, last_name, hire_date
from employees
where extract(year from hire_date) = 1986;

-- List the manager of each department: department number, department name, the manager's employee number, last name, first name.
select dept.dept_no, dept.dept_name, depman.emp_no, emp.last_name, emp.first_name
from departments as dept
join dept_manager as depman 
	on dep.dept_no = depman.dept_no
join employees as emp
	on depman.emp_no = emp.emp_no;

-- List the department of each employee: employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees as emp
join dept_emp as depemp 
	on depemp.emp_no = emp.emp_no
join departments as dept 
	on depemp.dept_no = dept.dept_no;
	
--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex from employees
where first_name = 'Hercules'
and last_name like 'B%';

--List employees in the Sales department: employee number, last name, first name, and department name.

select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees as emp
join dept_emp as depemp 
	on depemp.emp_no = emp.emp_no
join departments as dept 
	on depemp.dept_no = dept.dept_no and dept.dept_name = 'Sales';
	
--List employees Sales and Development departments, including their employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees as emp
join dept_emp as depemp 
	on depemp.emp_no = emp.emp_no
join departments as dept 
	on depemp.dept_no = dept.dept_no and (dept.dept_name = 'Sales' or dept.dept_name = 'Development');

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "Count"
from employees
group by last_name
order by "Count" desc;


