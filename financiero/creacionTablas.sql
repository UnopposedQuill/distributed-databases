create database financiero;

use financiero;

-- primero las tablas sin FK
create table estado_morosidad(
	id int primary key auto_increment,
    descripcion varchar(30) not null
);

-- ahora las tablas con FK
create table morosidad_estudiante(
	id int primary key auto_increment,
    idEstudiante int not null,
    idEstadoMorosidad int not null,
    valor int not null,
    foreign key (idEstadoMorosidad) references estado_morosidad(id)
);

create table morosidad_profesor(
	id int primary key auto_increment,
    idProfesor int not null,
    idEstadoMorosidad int not null,
	valor int not null,
    foreign key (idEstadoMorosidad) references estado_morosidad(id)
);