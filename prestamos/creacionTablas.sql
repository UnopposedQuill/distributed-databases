
-- para la creación de la base de datos
create database Prestamos
go

use Prestamos
go

-- Primero las tablas sin referencias
create table Libro(
	id int primary key identity,
	titulo varchar(50),
	ibsn varchar(13),
);

create table EstadoPrestamo(
	id int primary key identity,
	descripcion nvarchar(20) not null
);

-- Ahora las tablas con referencias
create table PrestamoEstudiante(
	id int primary key identity,
	idEstudiante int not null,
	FKLibro int constraint FKPrestamoEstudiante_Libro references Libro(id) not null,
	FKEstadoPrestamo int constraint FKPrestamoEstudiante_EstadoPrestamo references EstadoPrestamo(id) not null
);

create table PrestamoProfesor(
	id int primary key identity,
	idProfesor int not null,
	FKLibro int constraint FKPrestamoProfesor_Libro references Libro(id) not null,
	FKEstadoPrestamo int constraint FKPrestamoProfesor_EstadoPrestamo references EstadoPrestamo(id) not null
);
