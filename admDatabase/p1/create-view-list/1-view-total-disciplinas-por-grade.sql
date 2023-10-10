CREATE VIEW total_disciplinas_por_grade AS
SELECT g.idGrade, c.nome as nome_curso, COUNT(gd.idDisciplina) as total_disciplinas
FROM grade g
INNER JOIN grade_disciplina gd ON g.idGrade = gd.idGrade
INNER JOIN curso c ON c.idCurso = g.idCurso
GROUP BY g.idGrade, c.nome;
