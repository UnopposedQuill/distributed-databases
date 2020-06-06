
use estudiantes;

/*
En mySQL si el procedimiento posee instrucciones que deben estar delimitadas tengo que 
cambiar el delimitador
*/
delimiter //

-- Necesito un SP que me indique si un estudiante existe, y está activo.
create procedure is_activo(inout returning int, idEstudiante int)
begin
	set returning = (select count(e.id) from estudiante e
    where e.id = idEstudiante and
    e.activo = 1);
end//

delimiter ;

call is_activo(1, @variable);
call is_activo(3);
/* 
4: Realice un procedimiento que obtenga los montos recaudados por tipo de carro
y tipo de rango de tarifa en un rango de fechas dada.
*/
create procedure recaudacion_por_tipo_carro(id_atributo int, fecha_inicial date, fecha_final date) 
begin
	if idAtributo is null
    then select 'Error: Expected idAtributo';
    end if;
	select sum(s.tarifaXkilometro*s.kimetrosARecorrer) from solicitud s
            inner join estado e on e.idEstado = s.idEstado
            inner join solicitud_vehiculo sxv on sxv.idSolicitud = s.idSolicitud
            inner join vehiculo v on v.idVehiculo = sxv.idVehiculo
            inner join atributo_vehiculo axv on v.idVehiculo = axv.idVehiculo
            where axv.idAtributo = idAtributo and e.descripcionEstado = 'Pagado'
            and (fechaInicial is null or s.fechaSolicitud > fecha_inicial)
            and (fechaFinal is null or s.fechaSolicitud < fecha_final);
end//

/* 
5: Realice un procedimiento que a la hora de facturarle a un cliente,
busque si es un cliente que ha solicitado mas de 5 servicios en el ultimo mes,
entonces obtiene un 5% de descuento sobre su tarifa.
*/
create procedure facturar_servicio(idSolicitud int)
begin
	if idSolicitud is null
    then select 'Error: Expected idSolicitud';
    end if;
	set @valorFacturado = 0, @cantidadSolicitudes = 0;
	set @clienteSolicitud = (select s.idCliente
							from solicitud s
                            where s.idSolicitud = idSolicitud);
    set @cantidadSolicitudes = (select count(s) from solicitud s
    where s.cliente = @clienteSolicitud and not s.idSolicitud = idSolicitud
    and s.fechaSolicitud > date_sub(now(), interval 1 month));
    if @cantidadSolicitudes > 5
    then
		select @valorFacturado = s.tarifaXkilometro*s.kimetrosARecorrer-(s.tarifaXkilometro*s.kimetrosARecorrer*0.05)
        from solicitud s where s.idSolicitud = idSolicitud;
	else
		select @valorFacturado = s.tarifaXkilometro*s.kimetrosARecorrer
        from solicitud s where s.idSolicitud = idSolicitud;
    end if;
	update solicitud s
    set solicitud.idEstado = 1
    where solicitud.idSolicitud = idSolicitud;
end//

/*
6- Realice un procedimiento que obtenga -por cliente, fechas, tipo de transporte (opcionales)-
todos los servicios reservados.
*/
create procedure get_reservados(idCliente int, idAtributo int, fechaInicio date, fechaFinal date)
begin
	select * from solicitud s
    where (idCliente is null or s.idCliente = idCliente)
    and (idAtributo is null or (exists(select * from restriccion r where r.idAtributo = idAtributo))) 
    and (fechaInicio is null or s.fechaSolicitud > fechaInicio)
    and (fechaFinal is null or s.fechaSolicitud < fechaFinal);
end//

delimiter ;
