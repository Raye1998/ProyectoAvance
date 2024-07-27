CREATE DATABASE Hospital;
GO

USE Hospital;
GO

CREATE TABLE Personas(
    Id INT PRIMARY KEY,
	Codigo VARCHAR(255) UNIQUE NOT NULL,
    Nombre1 VARCHAR(50) NOT NULL,
	Nombre2 VARCHAR(50),
    Apellido1 VARCHAR(50) NOT NULL,
	Apellido2 VARCHAR(50)
);

CREATE TABLE Pais(
    Id INT PRIMARY KEY,
    IdPais INT REFERENCES Pais(Id),
	Nombre VARCHAR(255) UNIQUE NOT NULL,
	Habilitado BIT
);

CREATE TABLE Sucursales(
    Id INT PRIMARY KEY,
	Nombre VARCHAR(255) UNIQUE NOT NULL,
	IdPais INT REFERENCES Pais(Id),
	Habilitado BIT
);

CREATE TABLE Especialidades(
    Id INT PRIMARY KEY,
	Nombre VARCHAR(255) UNIQUE NOT NULL,
	Descripcion VARCHAR(255),
	Habilitado BIT
);

CREATE TABLE Medicinas(
    Id INT PRIMARY KEY,
	Nombre VARCHAR(255) UNIQUE NOT NULL,
	Descripcion VARCHAR(255),
	Habilitado BIT
);

CREATE TABLE Examenes(
    Id INT PRIMARY KEY,
	Nombre VARCHAR(255) UNIQUE NOT NULL,
	Descripcion VARCHAR(255),
	Habilitado BIT
);

CREATE TABLE Horarios(
    Id INT PRIMARY KEY,
	Nombre VARCHAR(255) UNIQUE NOT NULL,
	HoraInicio VARCHAR(50) NOT NULL,
	HoraFin VARCHAR(50) NOT NULL,
	Habilitado BIT
);

CREATE TABLE Tratamientos(
    Id INT PRIMARY KEY,
	Nombre VARCHAR(255) UNIQUE NOT NULL,
	Descripcion VARCHAR(255),
	IdMedicinas INT REFERENCES Medicinas(Id),
	Habilitado BIT
);

CREATE TABLE Enfermedades(
    Id INT PRIMARY KEY,
	Nombre VARCHAR(255) UNIQUE NOT NULL,
	Descripcion VARCHAR(255),
	Habilitado BIT
);

CREATE TABLE TratamientosEnfermedades(
    Id INT PRIMARY KEY,
	IdTratamientos INT REFERENCES Tratamientos(Id),
	IdEnfermedades INT REFERENCES Enfermedades(Id),
);

CREATE TABLE Medicos(
    Id INT PRIMARY KEY,
	IdPersonas INT REFERENCES Personas(Id),
	IdEspecialidades INT REFERENCES Especialidades(Id),
	IdSucursales INT REFERENCES Sucursales(Id),
	IdHorarios INT REFERENCES Horarios(Id)
);

CREATE TABLE PreClinica(
    Id INT PRIMARY KEY,
	Edad VARCHAR(255) NOT NULL,
	PresionArterial VARCHAR(255) NOT NULL,
	Peso VARCHAR(255) NOT NULL,
	Altura VARCHAR(255) NOT NULL,
);

CREATE TABLE Expedientes(
    Id INT PRIMARY KEY,
	IdExamenes INT REFERENCES Examenes(Id),
	IdTratamientos INT REFERENCES Tratamientos(Id),
	IdPreClinica INT REFERENCES PreClinica(Id)
);

CREATE TABLE Pacientes(
    Id INT PRIMARY KEY,
	IdPersonas INT REFERENCES Personas(Id),
	IdExpedientes INT REFERENCES Expedientes(Id)
);

CREATE TABLE Citas(
    Id INT PRIMARY KEY,
	IdPacientes INT REFERENCES Pacientes(Id),
	IdMedicos INT REFERENCES Medicos(Id),
	Fecha DATE
);