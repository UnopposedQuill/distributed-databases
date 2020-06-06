
-- para la creación de la base de datos
/*
create database Prestamos
go
*/

use Prestamos
go

-- Primero las tablas sin referencias
create table TipoEstablecimiento(
	id int primary key identity,
	descripcion nvarchar(20) not null
);

create table Avenida(
	id int primary key identity,
	ubicacion geometry not null, -- LineString
	nombre nvarchar(20) not null
);

-- Ahora las tablas con referencias
create table Calle(
	id int primary key identity,
	ubicacion geometry not null, -- LineString
	nombre nvarchar(20) not null,
	FKAvenida int constraint FKCalle_Avenida references Avenida(id) not null,
);

create table Establecimiento(
	id int primary key identity,
	ubicacion geometry not null, -- Point
	nombre nvarchar(40) not null,
	FKCalle int constraint FKEstablecimiento_Calle references Calle(id) not null,
	FKTipoEstablecimiento int constraint FKTipoEstablecimiento_Establecimiento references TipoEstablecimiento(id) not null,
);

create table Casa(
	id int primary key identity,
	ubicacion geometry not null, -- Point
	numeroCasa int not null,
	FKCalle int constraint FKCasa_Calle references Calle(id) not null,
);
