MERGE INTO paciente AS target
USING paciente_staging AS source
ON target.id = source.id

WHEN MATCHED THEN
    UPDATE SET
        nombre = source.nombre,
        telefono = source.telefono,
        direccion = source.direccion,
        fecha_registro = CASE
            WHEN target.nombre != source.nombre THEN NOW()
            ELSE target.fecha_registro
        END

WHEN NOT MATCHED THEN
    INSERT (id, nombre, fecha_nacimiento, telefono, direccion, fecha_registro)
    VALUES (
        source.id,
        source.nombre,
        source.fecha_nacimiento,
        source.telefono,
        source.direccion,
        NOW()
    );
