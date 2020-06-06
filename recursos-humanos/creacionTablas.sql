
-- para la creación de la base de datos
create database Hr
go


use Hr
go

-- Primero las tablas sin referencias
create table Profesor(
	id int primary key identity,
    nombre varchar(50) not null,
    apellidos varchar(50) not null,
	plaza varchar(50) not null,
    activo bit not null default 1
);

-- Ahora las tablas con referencias
create table Diploma(
	id int primary key identity,
	descripcion nvarchar(20) not null,
	FKProfesor int constraint FKDiploma_Profesor references Profesor(id) not null,
);
