SELECT
    em.emp_no,
    CONCAT(em.first_name, ' ', em.last_name) as employee,
    s.salary,
    YEAR(s.from_date) as ano
FROM salaries s 
INNER JOIN employees em ON em.emp_no = s.emp_no;
