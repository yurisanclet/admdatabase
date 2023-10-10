CREATE OR REPLACE VIEW custo_total_salario_porcentagem AS
SELECT
    em.emp_no as funcionario_id,
    d.dept_name as departamento,
    d.dept_no as departamento_id,
    CONCAT(em.first_name, ' ', em.last_name) as nome_funcionario,
    YEAR(s.from_date) as ano,
    s.salary as salario,
    s.salary*10000/gd.total_gasto AS porcentagem,
    gd.total_gasto
FROM salaries s
INNER JOIN employees em ON s.emp_no = em.emp_no
INNER JOIN dept_emp de ON em.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
INNER JOIN gasto_anual_por_departamento gd ON gd.ano = YEAR(s.from_date) AND d.dept_name = gd.dept_name
ORDER BY funcionario_id;