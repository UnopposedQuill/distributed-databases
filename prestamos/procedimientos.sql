
use Prestamos
go

-- Mecanismo para consultar todos los libros
create or alter procedure consultarLibros
as begin
	select L.id, L.titulo, L.ibsn from Libro L
end
go

-- Mecanismo para consultar los préstamos, null para todos, 1 para devueltos, 2 para activos
create or alter procedure consultarPrestamos @estadoPrestamo int
as begin
	select PE.idEstudiante, PE.FKLibro, PE.FKEstadoPrestamo, PE.fechaVencimiento from PrestamoEstudiante PE
	where (@estadoPrestamo is null or PE.FKEstadoPrestamo = @estadoPrestamo)
	union
	select PP.id, PP.FKLibro, PP.FKEstadoPrestamo, PP.fechaVencimiento from PrestamoProfesor PP
	where (@estadoPrestamo is null or PP.FKEstadoPrestamo = @estadoPrestamo)
end
go

-- Mecanismo para consultar los préstamos vencidos
create or alter procedure consultarPrestamosVencidos
as begin
	select PE.idEstudiante, PE.FKLibro, PE.FKEstadoPrestamo, PE.fechaVencimiento from PrestamoEstudiante PE
	where GETDATE() > PE.fechaVencimiento and PE.FKEstadoPrestamo = 2
	union
	select PP.id, PP.FKLibro, PP.FKEstadoPrestamo, PP.fechaVencimiento from PrestamoProfesor PP
	where GETDATE() > PP.fechaVencimiento and PP.FKEstadoPrestamo = 2
	
end
go

-- Mecanismo para prestar un libro a un estudiante, decidé separarlos por motivos de que los profesores tienen
-- detalles por debajo
create or alter procedure prestamoLibroEstudiante @idEstudiante int, @idLibro int, @fechaVencimiento date = null
as begin
	-- Primero revisar si es un estudiante activo
	declare @estudiante int = 0;-- la cantidad de estudiantes activos que poseen el mismo id
	select @estudiante = count(id) from openquery(MYSQL, 'select e.id from estudiantes.estudiante e where e.activo = 1;')
		where id = @idEstudiante;
	if @estudiante <= 0
	begin
		select 'Estudiante no activo o inexistente';
		return; -- estudiante no activo o no existe, termina
	end

	-- Existe el libro?
	if (select count(L.id) from Libro L where L.id = @idLibro) = 0
	begin
		select 'Libro inexistente';
		return; -- libro no existente
	end

	-- Revisar si es un moroso
	declare @deudas int = 0;-- la cantidad de deudas activas que poseen el mismo id de estudiante
	select @deudas = count(idEstudiante) from openquery(MYSQL, 'select me.idEstudiante from financiero.morosidad_estudiante me where me.idEstadoMorosidad <> 1;')
		where idEstudiante = @idEstudiante;
	if @deudas > 0
	begin
		select 'Estudiante Moroso';
		return; -- deudas no pagadas: moroso
	end

	-- Revisar si tiene préstamos vencidos
	if (select count(PE.id) from PrestamoEstudiante PE 
		where PE.idEstudiante = @idEstudiante and
		GETDATE() > PE.fechaVencimiento and PE.FKEstadoPrestamo = 2
		) > 0
	begin
		select 'Estudiante con préstamos vencidos';
		return; -- tiene préstamos vencidos
	end

	-- Todo está correcto, insertar
	insert into PrestamoEstudiante(idEstudiante, FKLibro, FKEstadoPrestamo, fechaVencimiento) values
		(@idEstudiante, @idLibro, 2, isnull(@fechaVencimiento,DATEADD(month, 1, GETDATE())));
end
go

-- mecanismo para prestar un libro a un profesor
create or alter procedure prestamoLibroProfesor @idProfesor int, @idLibro int, @fechaVencimiento date = null
as begin
	-- Primero revisar si es un estudiante activo
	declare @profesor int = 0;-- la cantidad de Profesores activos que poseen el mismo id
	select @profesor = count(id) from [Hr].dbo.[Profesor] P -- debido a que son bases homogéneas puedo usar este anclaje, es posible agregarlo como Linked Database
		where id = @idProfesor;
	if @profesor <= 0
	begin
		select 'Profesor no activo o inexistente';
		return; -- profesor no activo o no existe, termina
	end

	-- Existe el libro?
	if (select count(L.id) from Libro L where L.id = @idLibro) = 0
	begin
		select 'Libro inexistente';
		return; -- libro no existente
	end

	-- Revisar si es un moroso
	declare @deudas int = 0;-- la cantidad de deudas activas que poseen el mismo id de estudiante
	select @deudas = count(idProfesor) from openquery(MYSQL, 'select me.idProfesor from financiero.morosidad_profesor me where me.idEstadoMorosidad <> 1;')
		where idProfesor = @idProfesor;
	if @deudas > 0
	begin
		select 'Profesor Moroso';
		return; -- deudas no pagadas: moroso
	end

	-- Revisar si tiene préstamos vencidos
	if (select count(PP.id) from PrestamoProfesor PP 
		where PP.idProfesor = @idProfesor and
		GETDATE() > PP.fechaVencimiento and PP.FKEstadoPrestamo = 2
		) > 0
	begin
		select 'Profesor con préstamos vencidos';
		return; -- tiene préstamos vencidos
	end

	-- Todo está correcto, insertar
	insert into PrestamoProfesor(idProfesor, FKLibro, FKEstadoPrestamo, fechaVencimiento) values
		(@idProfesor, @idLibro, 2, isnull(@fechaVencimiento,DATEADD(month, 1, GETDATE())));
end
go


--select * from openquery(MYSQL, 'select e.id from estudiantes.estudiante e;');

/*
declare @status int;
set @status = 0;

exec ('call estudiantes.is_activo(?, ?)', @status output, 3) at MYSQL;
select @status as statusCheck
*/
