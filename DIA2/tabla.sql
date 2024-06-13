CREATE TABLE persona (
    id INT PRIMARY KEY,
    nif VARCHAR(9),
    nombre VARCHAR(25),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25),
    direccion VARCHAR(50),
    telefono VARCHAR(9),
    fecha_nacimiento DATE,
    sexo ENUM('H', 'M'),
    tipo ENUM('A', 'P')
);

CREATE TABLE departamento (
    id INT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE profesor (
    id_profesor INT PRIMARY KEY,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

CREATE TABLE grado (
    id INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE curso_escolar (
    id INT PRIMARY KEY,
    anyo_inicio YEAR,
    anyo_fin YEAR
);

CREATE TABLE asignatura (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    creditos FLOAT,
    tipo ENUM('Obligatoria', 'Optativa'),
    curso TINYINT,
    cuatrimestre TINYINT,
    id_profesor INT,
    id_grado INT,
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor),
    FOREIGN KEY (id_grado) REFERENCES grado(id)
);

CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT,
    id_asignatura INT,
    id_curso_escolar INT,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES persona(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);
INSERT INTO persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo)
VALUES 
(1, '12345678A', 'Juan', 'Pérez', 'Gómez', 'Madrid', 'Calle Falsa 123', '600123456', '1980-01-01', 'H', 'P'),
(2, '87654321B', 'Ana', 'López', 'Martín', 'Barcelona', 'Avenida Siempreviva 742', '600654321', '1990-05-15', 'M', 'A');

INSERT INTO departamento (id, nombre)
VALUES 
(1, 'Matemáticas'),
(2, 'Informática');

INSERT INTO profesor (id_profesor, id_departamento)
VALUES 
(1, 1),
(2, 2);

INSERT INTO grado (id, nombre)
VALUES 
(1, 'Grado en Matemáticas'),
(2, 'Grado en Informática');

INSERT INTO curso_escolar (id, anyo_inicio, anyo_fin)
VALUES 
(1, 2023, 2024),
(2, 2024, 2025);

INSERT INTO asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado)
VALUES 
(1, 'Álgebra', 6.0, 'Obligatoria', 1, 1, 1, 1),
(2, 'Programación', 6.0, 'Obligatoria', 1, 1, 2, 2);

INSERT INTO alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar)
VALUES 
(2, 1, 1),
(2, 2, 1);
