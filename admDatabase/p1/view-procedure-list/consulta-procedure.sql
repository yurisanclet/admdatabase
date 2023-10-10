SET @dep_id = "d005";
SET @ano = 1986;

CALL ObterInfoDepartamento(@dep_id, @ano, @total_pessoas, @gasto_total, @functionario_mais_caro);

SELECT @numero_dep, @ano, @total_pessoas, @gasto_total, @functionario_mais_caro;