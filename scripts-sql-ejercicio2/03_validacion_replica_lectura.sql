SELECT COUNT(*) FROM consulta;

-- Consultas por médico
SELECT
    m.nombre AS medico,
    m.especialidad,
    COUNT(c.id) AS total_consultas,
    AVG(c.costo) AS costo_promedio,
    SUM(c.costo) AS ingreso_total
FROM medico m
LEFT JOIN consulta c ON m.id = c.medico_id;

-- Consultas por paciente
SELECT
    p.nombre,
    p.telefono,
    COUNT(c.id) AS num_consultas,
    MAX(c.fecha_consulta) AS ultima_consulta,
    SUM(c.costo) AS gasto_total
FROM paciente p
LEFT JOIN consulta c ON p.id = c.paciente_id
GROUP BY p.id, p.nombre, p.telefono
HAVING COUNT(c.id) > 0
ORDER BY num_consultas DESC;
