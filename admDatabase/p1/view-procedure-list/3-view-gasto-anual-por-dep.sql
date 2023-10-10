CREATE OR REPLACE VIEW gasto_anual_por_departamento AS 
SELECT
    d.dept_no,
    d.dept_name,
    YEAR(s.from_date) as ano, 
    SUM(s.salary) as total_gasto
FROM departments d
INNER JOIN dept_emp dm ON dm.dept_no = d.dept_no
INNER JOIN employees em ON em.emp_no = dm.emp_no
INNER JOIN salaries s ON s.emp_no = em.emp_no
GROUP BY d.dept_no, d.dept_name, ano;
