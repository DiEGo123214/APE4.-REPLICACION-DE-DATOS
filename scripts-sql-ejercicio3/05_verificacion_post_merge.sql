SELECT
    id,
    nombre,
    telefono,
    direccion,
    fecha_registro,
    CASE
        WHEN fecha_registro > NOW() - INTERVAL '1 minute' THEN '✅ ACTUALIZADO'
        ELSE '❌ Sin cambios'
    END AS estado
FROM paciente
ORDER BY id;
