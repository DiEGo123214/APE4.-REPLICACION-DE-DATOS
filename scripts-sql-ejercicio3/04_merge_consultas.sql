MERGE INTO consulta AS target
USING (
    SELECT cs.*, p.id AS paciente_existe, m.id AS medico_existe
    FROM consulta_staging cs
    LEFT JOIN paciente p ON cs.paciente_id = p.id
    LEFT JOIN medico m ON cs.medico_id = m.id
    WHERE p.id IS NOT NULL AND m.id IS NOT NULL
) AS source
ON target.id = source.id

WHEN MATCHED THEN
    UPDATE SET
        diagnostico = source.diagnostico,
        tratamiento = source.tratamiento,
        costo = source.costo

WHEN NOT MATCHED THEN
    INSERT (medico_id, paciente_id, fecha_consulta, diagnostico, tratamiento, costo)
    VALUES (
        source.medico_id,
        source.paciente_id,
        source.fecha_consulta,
        source.diagnostico,
        source.tratamiento,
        source.costo
    );
