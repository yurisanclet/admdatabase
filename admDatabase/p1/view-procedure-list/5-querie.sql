SELECT 
	cp.funcionario_id,
	cp.departamento,
	cp.salario,
	cp.total_gasto,
	cp.porcentagem
FROM custo_total_salario_porcentagem cp
WHERE cp.porcentagem >= 1 AND cp.porcentagem <= 10
GROUP BY cp.funcionario_id;