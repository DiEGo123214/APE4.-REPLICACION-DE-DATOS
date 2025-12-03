-- Creación de tabla: médicos
CREATE TABLE medico (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50),
    telefono VARCHAR(20),
    fecha_registro TIMESTAMP DEFAULT NOW()
);

-- Creación de tabla: pacientes
CREATE TABLE paciente (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    telefono VARCHAR(20),
    direccion VARCHAR(200),
    fecha_registro TIMESTAMP DEFAULT NOW()
);

-- Creación de tabla: consultas médicas
CREATE TABLE consulta (
    id SERIAL PRIMARY KEY,
    medico_id INTEGER REFERENCES medico(id),
    paciente_id INTEGER REFERENCES paciente(id),
    fecha_consulta TIMESTAMP DEFAULT NOW(),
    diagnostico TEXT,
    tratamiento TEXT,
    costo DECIMAL(10,2)
);
