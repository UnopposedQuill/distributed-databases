
use financiero;

insert into estado_morosidad(descripcion) values
	('Pagada'),
    ('Pendiente'),
    ('Vencida');

insert into morosidad_estudiante(idEstudiante, idEstadoMorosidad, valor) values
	(1, 1, 5000),
    (1, 1, 3000),
    (1, 1, 200),
    (1, 2, 200),
    (1, 2, 200),
    (2, 3, 200),
    (3, 1, 2000),
    (4, 1, 2000);
    
insert into morosidad_profesor(idProfesor, idEstadoMorosidad, valor) values
	(5, 2, 2000),
    (3, 1, 200),
    (3, 2, 200);