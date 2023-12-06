--Lenguaje DDL

DROP DATABASE IF EXIST proyectobd;
CREATE DATABASE proyectobd;
USE proyectoBD;

CREATE TABLE alumno (
    matricula INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    paterno VARCHAR(50) NOT NULL,
    materno VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    edad INT UNSIGNED CHECK (edad < 120)
);

CREATE TABLE periodo (
    cod_periodo INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_final DATE NOT NULL
);

CREATE TABLE area (
    cod_area INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE carrera (
    cod_carrera INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200) NOT NULL
);

CREATE TABLE materia (
    cod_materia INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    creditos INT UNSIGNED NOT NULL,
    bloque INT UNSIGNED NOT NULL,
    cod_area INT UNSIGNED NOT NULL,
    cod_carrera INT UNSIGNED NOT NULL,
    CONSTRAINT fk_area FOREIGN KEY (cod_area) REFERENCES area(cod_area) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_carrera FOREIGN KEY (cod_carrera) REFERENCES carrera(cod_carrera) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE grado_estudio (
    cod_grado_estudio INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE profesor (
    numero_personal INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    paterno VARCHAR(50) NOT NULL,
    materno VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    cod_grado_estudio INT UNSIGNED NOT NULL,
    CONSTRAINT fk_grado_estudio FOREIGN KEY (cod_grado_estudio) REFERENCES grado_estudio(cod_grado_estudio) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE oferta_academica (
    nrc INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    cod_periodo INT UNSIGNED NOT NULL,
    cod_materia INT UNSIGNED NOT NULL,
    numero_personal INT UNSIGNED NOT NULL,
    CONSTRAINT fk_periodo FOREIGN KEY (cod_periodo) REFERENCES periodo(cod_periodo) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_materia FOREIGN KEY (cod_materia) REFERENCES materia(cod_materia) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_profesor FOREIGN KEY (numero_personal) REFERENCES profesor(numero_personal) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE alumno_oferta_academica (
    matricula INT UNSIGNED NOT NULL,
    nrc INT UNSIGNED NOT NULL,
    calificacion INT UNSIGNED NOT NULL CHECK (calificacion <=10),
    PRIMARY KEY (matricula, nrc),
    FOREIGN KEY (matricula) REFERENCES alumno(matricula) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (nrc) REFERENCES oferta_academica(nrc) ON DELETE RESTRICT ON UPDATE CASCADE
);


--Lenguaje DML

INSERT INTO alumno (matricula, nombre, paterno, materno, email, edad) VALUES
(1, 'Pedro Manuel', 'Ruíz', 'Salazar', 'ruiz1@estudiante.uv.mx', 22),
(2, 'Paola Valentina', 'Sánchez', 'Ramírez', 'sanchez2@estudiante.uv.mx', 26),
(3, 'Luis Miguel', 'Torres', 'González', 'torres3@estudiante.uv.mx', 24),
(4, 'María Fernanda', 'Díaz', 'Vargas', 'diaz4@estudiante.uv.mx', 29),
(5, 'Alejandro Iván', 'Herrera', 'Flores', 'herrera5@estudiante.uv.mx', 21),
(6, 'Carolina Andrea', 'Castro', 'Morales', 'castro6@estudiante.uv.mx', 25),
(7, 'Javier Alonso', 'Ríos', 'Soto', 'rios7@estudiante.uv.mx', 27),
(8, 'Gabriela Nicole', 'Mora', 'Herrera', 'mora8@estudiante.uv.mx', 23),
(9, 'Andrés Eduardo', 'López', 'Silva', 'lopez9@estudiante.uv.mx', 28),
(10, 'Valeria Isabella', 'González', 'Salazar', 'gonzales10@estudiante.uv.mx', 22),
(11, 'Diego Esteban', 'Jiménez', 'Montoya', 'jimenez11@estudiante.uv.mx', 30),
(12, 'Adriana Guadalupe', 'Martínez', 'Castro', 'martinez12@estudiante.uv.mx', 26),
(13, 'Sebastián Alejandro', 'Rodríguez', 'Vega', 'rodriguez13@estudiante.uv.mx', 24),
(14, 'Paúl Arturo', 'Ramos', 'Vargas', 'ramos14@estudiante.uv.mx', 22),
(15, 'Natalia Sofía', 'Torres', 'Pérez', 'torres15@estudiante.uv.mx', 21),
(16, 'Francisco Javier', 'Flores', 'Mendoza', 'flores16@estudiante.uv.mx', 27),
(17, 'Alejandra Patricia', 'Vázquez', 'Ramírez', 'vazquez17@estudiante.uv.mx', 23),
(18, 'Manuel Enrique', 'Soto', 'García', 'soto18@estudiante.uv.mx', 28),
(19, 'Camila Elizabeth', 'Pérez', 'Morales', 'perez19@estudiante.uv.mx', 22),
(20, 'Ricardo Alonso', 'Cordero', 'Fernández', 'cordero20@estudiante.uv.mx', 30),
(21, 'Daniela Alejandra', 'Gutiérrez', 'López', 'gutierrez21@estudiante.uv.mx', 25),
(22, 'Héctor Alejandro', 'Salgado', 'Navarro', 'salgado22@estudiante.uv.mx', 26),
(23, 'María José', 'Moreno', 'Ríos', 'moreno23@estudiante.uv.mx', 24),
(24, 'Eduardo Antonio', 'Guerrero', 'Mendoza', 'guerrero24@estudiante.uv.mx', 29),
(25, 'Ana Gabriela', 'Ramírez', 'Vega', 'ramirez25@estudiante.uv.mx', 21),
(26, 'Miguel Ángel', 'Mendoza', 'Gómez', 'mendoza26@estudiante.uv.mx', 27),
(27, 'Sofía Alejandra', 'Carrillo', 'Pérez', 'carrillo27@estudiante.uv.mx', 23),
(28, 'José Luis', 'Herrera', 'García', 'herrera28@estudiante.uv.mx', 28),
(29, 'Isabella Fernanda', 'Pérez', 'Martínez', 'perez29@estudiante.uv.mx', 22),
(30, 'Gustavo Andrés', 'Gómez', 'Torres', 'gomez30@estudiante.uv.mx', 25);

INSERT INTO periodo (cod_periodo, nombre, fecha_inicio, fecha_final) VALUES
(1, 'febrero-julio 2023', '2023-02-08', '2023-07-08'),
(2, 'agosto 2023-enero 2024', '2023-08-08', '2024-01-08');

INSERT INTO area (cod_area, nombre) VALUES
(1, 'Área de Formación Básica General'),
(2, 'Área de Iniciación a la Diciplina'),
(3, 'Área de Formación Diciplinar'),
(4, 'Área de Formación de Elección Libre'),
(5, 'Área de Formación Terminal');

INSERT INTO carrera (cod_carrera, nombre, descripcion) VALUES
(1, 'Lic. en Ingeniería de Software', 'Formar expertos en desarrollo de software'),
(2, 'Lic. en Ingeniería de Ciberseguridad e Infraestructura de Cómputo', 'Formar experos en ciberseguridad'),
(3, 'Lic. en Ingeniería en Sistemas y Tecnologías de la Información', 'Formar expertos sistemas informáticos'),
(4, 'Lic. en Estadística', 'Formar expertos en estadística'),
(5, 'Lic. en Redes y Servicios de Cómputo', 'Formar expertos en redes y servicios de computo'),
(6, 'Lic. en Tecnologías Computacionales', 'Formar expertos en tecnologías computacionales');

INSERT INTO grado_estudio (cod_grado_estudio, nombre) VALUES
(1, 'Licenciatura'),
(2, 'Maestría'),
(3, 'Doctorado');

INSERT INTO profesor (numero_personal, nombre, paterno, materno, email, cod_grado_estudio) VALUES
(1, 'David Alberto', 'Pérez', 'Hernádez', 'perez1@uv.mx', 3),
(2, 'Juan Ramón', 'Rallo', 'Jiménez', 'rallo2@uv.mx', 3),
(3, 'Gustavo', 'Bueno', 'Martínez', 'bueno3@uv.mx', 3),
(4, 'María José', 'Sánchez', 'López', 'sanchez4@uv.mx', 3),
(5, 'Ana Gabriela', 'González', 'Fernández', 'gonzalez5@uv.mx', 2),
(6, 'Javier', 'Rodríguez', 'Serrano', 'rodriguez6@uv.mx', 2),
(7, 'Luisa', 'Gómez', 'Ortega', 'gomez7@uv.mx', 2),
(8, 'Roberto', 'López', 'Díaz', 'lopez8@uv.mx', 3),
(9, 'Carmen', 'Molina', 'Gutiérrez', 'molina9@uv.mx', 2),
(10, 'Sergio', 'Herrera', 'Fernández', 'herrera10@uv.mx', 2),
(11, 'Elena', 'Ramírez', 'Torres', 'ramirez11@uv.mx', 3),
(12, 'Pedro', 'Martínez', 'Herrero', 'martinez12@uv.mx', 3),
(13, 'Laura', 'Castro', 'García', 'castro13@uv.mx', 2),
(14, 'Francisco', 'Díaz', 'Vega', 'diaz14@uv.mx', 3),
(15, 'Silvia', 'Flores', 'Pérez', 'flores15@uv.mx', 3),
(16, 'Carlos', 'Garrido', 'Muñoz', 'garrido16@uv.mx', 2),
(17, 'Isabel', 'Cabrera', 'Soto', 'cabrera17@uv.mx', 3),
(18, 'Rafael', 'Mendoza', 'Navarro', 'mendoza18@uv.mx', 3),
(19, 'Lucía', 'Hidalgo', 'Ramos', 'hidalgo19@uv.mx', 2),
(20, 'Miguel Ángel', 'Guerrero', 'Salazar', 'guerrero20@uv.mx', 3);

INSERT INTO materia (cod_materia, nombre, descripcion, creditos, bloque, cod_area, cod_carrera) VALUES
(1, 'Lógica', 'Conceptos de lógica proposicional y lógica de primer orden ...', 8, 1, 2, 1),
(2, 'Procesos para ingenieria de software', 'Características del proceso de desarrollo de software...', 8, 2, 3, 1),
(3, 'Desarrollo agil de software', 'Prácticas ágiles de desarrollo de software...', 6, 7, 5, 1),
(4, 'Introducción a la ciberseguridad', 'Fundamentos de seguridad de la información...', 7, 1, 2, 2),
(5, 'Pentesting', 'Introducción a las pruebas de penetración...', 7, 5, 3, 2),
(6, 'Seguridad organizacional', 'Introducción a las pruebas de penetración para sistemas web...', 6, 7, 5, 2),
(7, 'Introducción al pensamiento computacional', 'Pensamiento computacional para la solución de problemas...', 9, 1, 2, 3),
(8, 'Gestión de proyectos de tecnologías de la información', 'Administración de proyectos en TI...', 8, 6, 3, 3),
(9, 'Computo en la nube', 'Fundamentos de cómputo en la nube...', 6, 7, 5, 3),
(10, 'Estadística descriptiva y exploratoria', 'Análisis exploratorio de datos...', 8, 1, 2, 4),
(11, 'Estadística bayesiana', 'Fundamentos de inferencia bayesiana...', 8, 6, 3, 4),
(12, 'Bioestadística', 'Introducción a la bioestadística...', 8, 8, 5, 4),
(13, 'Matemáticas discretas', 'Lógica, grafos, automátas, ...', 8, 2, 2, 5),
(14, 'Administración de proyectos de red', 'Introducción a la administración de proyectos en red...', 6, 7, 3, 5),
(15, 'Criptografía', 'Criptología, Criptografía y Criptoanálisis...', 6, 8, 5, 5),
(16, 'Tecnologías de información para la innovación', 'La Tecnología de la Información (TI) es una disciplina...', 7, 1, 2, 6),
(17, 'Sistemas operativos', 'Introducción a los sistemas operativos...', 9, 3, 3, 6),
(18, 'Administración de proyectos de software', 'descripcion', 6, 7, 5, 6),
(19, 'Lengua I', 'Inglés I...', 6, 1, 1, 1),
(20, 'Lengua II', 'Inglés II...', 6, 2, 1, 2),
(21, 'Pensamiento crítico', 'Resolución de problemáticas...', 6, 1, 1, 3),
(22, 'Literacidad digital', 'Desarrollo de competencias digitales...', 6, 2, 1, 4),
(23, 'Redacción de textos', 'Escritura de textos académicos...', 6, 1, 1, 5),
(24, 'Literacidad digital', 'Desarrollo de competencias digitales...', 6, 1, 1, 6),
(25, 'Sistemas políticos', 'Teoríá de sistemas comparados...', 6, 3, 4, 1),
(26, 'Piano', 'Aprender a tocar piano...', 4, 3, 4, 2),
(27, 'Genética', 'Introducción a la genética...', 6, 3, 4, 3),
(28, 'Historia de EUA', 'Historia de Estados Unidos...', 6, 4, 4, 4),
(29, 'Apreciació del cine', 'Ver y analizar películas...', 4, 4, 4, 5),
(30, 'Futbol', 'Jugar futbol...', 6, 3, 4, 6);

INSERT INTO oferta_academica (nrc, cod_periodo, cod_materia, numero_personal) VALUES
(1, 1, 1, 1),
(2, 1, 2, 10),
(3, 1, 3, 4),
(4, 1, 4, 3),
(5, 1, 5, 18),
(6, 1, 6, 9),
(7, 1, 7, 7),
(8, 1, 8, 6),
(9, 1, 9, 5),
(10, 1, 10, 8),
(11, 1, 11, 10),
(12, 1, 12, 13),
(13, 1, 13, 15),
(14, 1, 14, 14),
(15, 1, 15, 4),
(16, 1, 16, 20),
(17, 1, 17, 16),
(18, 1, 18, 12),
(19, 1, 19, 6),
(20, 1, 20, 20),
(21, 1, 21, 14),
(22, 1, 22, 1),
(23, 1, 23, 2),
(24, 1, 24, 17),
(25, 1, 25, 3),
(26, 1, 26, 9),
(27, 1, 27, 5),
(28, 1, 28, 12),
(29, 1, 29, 5),
(30, 1, 30, 14);

INSERT INTO alumno_oferta_academica (matricula, nrc, calificacion) VALUES
(1, 1, 9),
(1, 2, 8),
(1, 3, 8),
(2, 1, 7),
(2, 2, 9),
(2, 3, 10),
(3, 1, 3),
(3, 2, 7),
(3, 3, 7),
(4, 1, 6),
(4, 2, 4),
(4, 3, 6),
(5, 1, 10),
(5, 2, 10),
(5, 3, 10),
(6, 4, 3),
(6, 5, 4),
(6, 6, 7),
(7, 4, 10),
(7, 5, 9),
(7, 6, 9),
(8, 4, 8),
(8, 5, 7),
(8, 6, 9),
(9, 4, 10),
(9, 5, 8),
(9, 6, 8),
(10, 4, 6),
(10, 5, 5),
(10, 6, 7),
(11, 7, 10),
(11, 8, 9),
(11, 9, 8),
(12, 7, 6),
(12, 8, 7),
(12, 9, 8),
(13, 7, 8),
(13, 8, 9),
(13, 9, 8),
(14, 7, 10),
(14, 8, 10),
(14, 9, 9),
(15, 7, 4),
(15, 8, 3),
(15, 9, 6),
(16, 10, 7),
(16, 11, 3),
(16, 12, 8),
(17, 10, 10),
(17, 11, 9),
(17, 12, 8),
(18, 10, 4),
(18, 11, 6),
(18, 12, 8),
(19, 10, 8),
(19, 11, 6),
(19, 12, 9),
(20, 10, 10),
(20, 11, 10),
(20, 12, 9),
(21, 13, 7),
(21, 14, 8),
(21, 15, 6),
(22, 13, 6),
(22, 14, 6),
(22, 15, 5),
(23, 13, 7),
(23, 14, 9),
(23, 15, 8),
(24, 13, 10),
(24, 14, 8),
(24, 15, 8),
(25, 13, 9),
(25, 14, 7),
(25, 15, 7),
(26, 16, 6),
(26, 17, 7),
(26, 18, 8),
(27, 16, 6),
(27, 17, 7),
(27, 18, 6),
(28, 16, 3),
(28, 17, 7),
(28, 18, 8),
(29, 16, 7),
(29, 17, 4),
(29, 18, 9),
(30, 16, 8),
(30, 17, 8),
(30, 18, 9),
(1, 19, 8),
(2, 19, 6),
(3, 25, 7),
(4, 25, 10),
(6, 20, 10),
(7, 20, 3),
(8, 26, 4),
(9, 26, 8),
(11, 21, 10),
(12, 21, 8),
(13, 27, 6),
(14, 27, 3),
(16, 22, 6),
(17, 22, 9),
(18, 28, 7),
(19, 28, 8),
(21, 23, 4),
(22, 23, 6),
(23, 29, 9),
(24, 29, 8),
(26, 24, 7),
(27, 24, 8),
(28, 30, 9),
(29, 30, 8);
