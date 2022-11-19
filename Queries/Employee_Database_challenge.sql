SELECT em.emp_no, 
	   em.first_name, 
	   em.last_name,
	   ti.title,
	   ti.from_date,
	   ti.to_date
INTO retirement_titles
FROM employees AS em
LEFT JOIN titles AS ti
ON em.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952_01_01' AND '1955_12_31')
ORDER BY emp_no;

select * from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date='9999-01-01'
ORDER BY emp_no, to_date DESC;

select * from unique_titles;

SELECT COUNT(*), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(*) DESC;

SELECT * FROM retiring_titles;
DROP TABLE retiring_titles;

SELECT DISTINCT ON (em.emp_no)
	   em.emp_no, 
	   em.first_name, 
	   em.last_name,
	   em.birth_date,
	   dt.from_date,
	   dt.to_date,
	   ti.title
INTO Mentorship_eligibility
FROM employees AS em
LEFT JOIN dept_emp AS dt
ON em.emp_no = dt.emp_no
LEFT JOIN titles as ti 
ON em.emp_no = ti.emp_no
WHERE (dt.to_date='9999-01-01') AND (em.birth_date BETWEEN '1965_01_01' AND '1965_12_31')
ORDER BY emp_no;
