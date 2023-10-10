SELECT 
    a.nome, 
    tdg.nome_curso,
    CASE
        WHEN tda.qtd_disciplinas_aprovadas < tdg.total_disciplinas THEN 'Não'
        ELSE 'Sim'
    END AS integralizado
FROM aluno a
INNER JOIN total_disciplina_aprovados tda ON tda.nome = a.nome
INNER JOIN total_disciplinas_por_grade tdg ON tdg.idGrade = tda.idGrade;
