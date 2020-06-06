create database estudiantes;

use estudiantes;

-- primero las tablas sin FK
create table estudiante(
	id int primary key auto_increment,
    nombre varchar(50) not null,
    apellidos varchar(50) not null,
    activo bit not null default 1
);

-- ahora las que sí poseen FK
create table grupo(
	id int primary key auto_increment,
    capacidad int not null,
    nombreCurso varchar(50) not null
);

-- ahora las tablas con FK
create table estudiante_x_grupo(
	id int primary key auto_increment,
    idEstudiante int not null,
    idGrupo int not null,
    foreign key (idEstudiante) references estudiante(id),
    foreign key (idGrupo) references grupo(id)
);