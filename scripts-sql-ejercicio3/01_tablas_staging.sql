CREATE TABLE paciente_staging (
    id INTEGER,
    nombre VARCHAR(100),
    fecha_nacimiento DATE,
    telefono VARCHAR(20),
    direccion VARCHAR(200),
    fecha_actualizacion TIMESTAMP DEFAULT NOW()
);

CREATE TABLE consulta_staging (
    id INTEGER,
    medico_id INTEGER,
    paciente_id INTEGER,
    fecha_consulta TIMESTAMP,
    diagnostico TEXT,
    tratamiento TEXT,
    costo DECIMAL(10,2)
);
