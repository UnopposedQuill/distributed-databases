
use Hr
go

-- Procedimiento 1

create or alter procedure distanciaCasas @idCasa1 int, @idCasa2 int
as
begin
	select (select C.ubicacion from Casa C where C.id = @idCasa1).STDistance(
		(select C.ubicacion from Casa C where C.id = @idCasa2)
	);
end
go

exec distanciaCasas 1, 2 --10
exec distanciaCasas 1, 4 --40
exec distanciaCasas 1, null --NULL
exec distanciaCasas null, null --NULL
exec distanciaCasas null, 1 --NULL
go

-- Procedimiento 2
create or alter procedure vecinos @idCasa int, @distanciaCorte int
as
begin
	select C.id, C.ubicacion.ToString() from Casa C
	where (select C.ubicacion from Casa C where C.id = @idCasa).STDistance(C.ubicacion) < @distanciaCorte
	and C.id != @idCasa
end
go

exec vecinos 1, 50;
go

-- Procedimiento 3
create or alter procedure comercioMasCercano @idCasa int, @idTipoComercio int
as
begin
	select top(1) E.id from Establecimiento E
	where E.FKTipoEstablecimiento = @idTipoComercio
	order by E.ubicacion.STDistance((select C.ubicacion from Casa C where C.id = @idCasa))
end
go

exec comercioMasCercano 2, 3