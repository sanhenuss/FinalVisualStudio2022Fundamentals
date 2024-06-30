--Creación de la base de datos
CREATE DATABASE dbFinal
USE dbFinal

-- Creación de la tabla Grado
CREATE TABLE Grado (
    GradoID INT IDENTITY(1,1) PRIMARY KEY,
    Nivel VARCHAR(50) NOT NULL
);

-- Creación de la tabla Seccion
CREATE TABLE Seccion (
    SeccionID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    GradoID INT NOT NULL,
    CONSTRAINT FK_Seccion_Grado FOREIGN KEY (GradoID) REFERENCES Grado(GradoID)
);

-- Creación de la tabla Curso
CREATE TABLE Curso (
    CursoID INT IDENTITY(1,1) PRIMARY KEY,
    GradoID INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    CONSTRAINT FK_Curso_Grado FOREIGN KEY (GradoID) REFERENCES Grado(GradoID)
);

-- Creación de la tabla Alumno
CREATE TABLE Alumno (
    AlumnoID INT IDENTITY(1000,1) PRIMARY KEY,
    Nombres VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Sexo VARCHAR(1) NOT NULL,
    FechaNacimiento DATE NOT NULL
);

-- Creación de la tabla Notas
CREATE TABLE Notas (
    NotaID INT IDENTITY(1,1) PRIMARY KEY,
    AlumnoID INT NOT NULL,
    CursoID INT NOT NULL,
    Nota INT NOT NULL,
    CONSTRAINT FK_Notas_Alumno FOREIGN KEY (AlumnoID) REFERENCES Alumno(AlumnoID),
    CONSTRAINT FK_Notas_Curso FOREIGN KEY (CursoID) REFERENCES Curso(CursoID)
);

-- Creación de la tabla Matricula
CREATE TABLE Matricula (
    MatriculaID INT IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE NOT NULL,
    GradoID INT NOT NULL,
    SeccionID INT NOT NULL,
    AlumnoID INT NOT NULL,
    CONSTRAINT FK_Matricula_Grado FOREIGN KEY (GradoID) REFERENCES Grado(GradoID),
    CONSTRAINT FK_Matricula_Seccion FOREIGN KEY (SeccionID) REFERENCES Seccion(SeccionID),
    CONSTRAINT FK_Matricula_Alumno FOREIGN KEY (AlumnoID) REFERENCES Alumno(AlumnoID)
);

-------------------------------------------------------------------------------------------------------

-- 1. Insertar registros en la tabla Grado
INSERT INTO Grado (Nivel) VALUES ('Primero'), ('Segundo'), ('Tercero'), ('Cuarto'), ('Quinto');

-- 2. Insertar registros en la tabla Seccion
INSERT INTO Seccion (Nombre, GradoID) VALUES ('A', 1), ('B', 2), ('C', 3), ('D', 4), ('E', 5);

-- 3. Insertar registros en la tabla Curso
INSERT INTO Curso (Nombre, GradoID) VALUES ('Matemáticas', 1), ('Lenguaje', 2), ('Ciencias', 3), ('Historia', 4), ('Geografía', 5);

-- 4. Insertar registros en la tabla Alumno
INSERT INTO Alumno (Nombres, Apellidos, Direccion, Sexo, FechaNacimiento) VALUES
('Juan', 'Perez', 'Calle 1', 'M', '2005-01-01'),
('Maria', 'Gomez', 'Calle 2', 'F', '2006-02-02'),
('Carlos', 'Lopez', 'Calle 3', 'M', '2007-03-03'),
('Ana', 'Rodriguez', 'Calle 4', 'F', '2008-04-04'),
('Luis', 'Garcia', 'Calle 5', 'M', '2009-05-05');

-- 5. Insertar registros en la tabla Matricula
INSERT INTO Matricula (Fecha, GradoID, SeccionID, AlumnoID) VALUES
('2023-01-01', 1, 1, 1),
('2023-01-01', 2, 2, 2),
('2023-01-01', 3, 3, 3),
('2023-01-01', 4, 4, 4),
('2023-01-01', 5, 5, 5);

-- 6. Insertar registros en la tabla Notas
INSERT INTO Notas (AlumnoID, CursoID, Nota) VALUES
(1, 1, 90),
(2, 2, 85),
(3, 3, 80),
(4, 4, 75),
(5, 5, 70);
