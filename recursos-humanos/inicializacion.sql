use Hr
go

insert into Profesor(nombre, apellidos, plaza, activo) values
	('Profesor', 'Prueba', 'Cartago', 1),
	('Profesor', 'Prueba 2', 'Cartago', 1),
	('Profesor', 'Otra Sede', 'Otra sede', 1),
	('Profesor', 'Otra Sede 2', 'Otra sede', 1),
	('Profesor', 'Otra Sede 3', 'Otra sede', 1);


select P.id, P.nombre, P.apellidos, ROW_NUMBER() over(Partition by P.plaza order by P.id asc) as 'Row Number' from Profesor P