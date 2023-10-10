DELIMITER //
CREATE OR REPLACE PROCEDURE ObterInfoDepartamento(
    IN dep_id CHAR(10),
    IN ano INT,
    OUT total_pessoas INT,
    OUT gasto_total DECIMAL(10),
    OUT funcionario_mais_caro VARCHAR(255)
)
BEGIN
    WITH total_funcionarios_por_departamento AS (
         SELECT 
             COUNT(DISTINCT de.emp_no) as total_pessoas,
            de.dept_no as departamento_id
         FROM dept_emp de
         INNER JOIN employees em ON em.emp_no = de.emp_no
         WHERE de.dept_no = dep_id AND YEAR(de.from_date) = ano
    ),
    funcionario_mais_caro AS (
        SELECT
            ctsp.nome_funcionario,
            ctsp.departamento_id as departamento_id
        FROM custo_total_salario_porcentagem ctsp
        WHERE ctsp.departamento_id = dep_id AND ctsp.ano = ano
        ORDER BY ctsp.salario DESC
        LIMIT 1
    )
    
    SELECT
        tfpd.total_pessoas,
        ctsp.total_gasto,
        fmc.nome_funcionario INTO total_pessoas, gasto_total, funcionario_mais_caro
    FROM custo_total_salario_porcentagem ctsp
    INNER JOIN funcionario_mais_caro fmc ON fmc.departamento_id = ctsp.departamento_id
    INNER JOIN total_funcionarios_por_departamento tfpd ON tfpd.departamento_id = ctsp.departamento_id
    LIMIT 1;
END //
DELIMITER ;
