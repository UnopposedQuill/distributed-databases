use Prestamos
go

insert into EstadoPrestamo(descripcion) values
	('Prestado'),
	('Devuelto');

insert into Libro(titulo, ibsn) values
	('Titulo Prueba', '123456789123'),
	('Titulo Prueba 2', '123456789123');

insert into PrestamoEstudiante(idEstudiante, FKLibro, FKEstadoPrestamo, fechaVencimiento) values
	(1, 1, 1, '2020-06-07'),
	(1, 1, 1, '2020-06-04'),
	(1, 1, 2, '2019-06-04'),
	(2, 1, 2, '2019-06-04'),
	(5, 1, 2, '2019-06-04');

insert into PrestamoProfesor(idProfesor, FKLibro, FKEstadoPrestamo, fechaVencimiento) values
	(1, 1, 1, '2020-07-07'),
	(4, 1, 1, '2020-06-04'),
	(4, 1, 2, '2020-06-04'),
	(4, 1, 1, '2020-07-07');