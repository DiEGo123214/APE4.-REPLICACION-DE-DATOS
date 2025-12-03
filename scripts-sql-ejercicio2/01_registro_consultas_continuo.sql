CREATE OR REPLACE FUNCTION registro_consultas_continuo()
RETURNS VOID AS $$
BEGIN
    INSERT INTO consulta (medico_id, paciente_id, diagnostico, tratamiento, costo)
    SELECT
        (RANDOM() * 2 + 1)::INT,
        (RANDOM() * 2 + 1)::INT,
        'Consulta automatizada',
        'Tratamiento estándar',
        (RANDOM() * 100 + 20)::NUMERIC(10,2)
    FROM generate_series(1,5);
END;
$$ LANGUAGE plpgsql;
