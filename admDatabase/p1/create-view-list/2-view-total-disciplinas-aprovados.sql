CREATE VIEW total_disciplina_aprovados AS 
SELECT a.nome, ag.idGrade, COUNT(h.idDisciplina) as qtd_disciplinas_aprovadas
FROM aluno a
INNER JOIN aluno_grade ag ON ag.idAluno = a.idAluno
INNER JOIN historico h ON h.matricula = ag.matricula
WHERE h.status IN ( "aprovado", "concluido") AND ag.integralizado = 0
GROUP BY a.nome, ag.idGrade;
