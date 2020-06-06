
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
