insert into `conductor` values
(1, 'Jose Ramirez',   100001, '1987-03-12 18:25:12'),
(2, 'Juan Paloverde', 100002, '1987-04-02 15:03:21'),
(3, 'Pablo Escoba',   100003, '1989-05-27 08:55:40'),
(4, 'Manfred Soto',   100004, '1990-07-10 19:46:27');

insert into `tipovehiculo` values 
(1, 'Volkswagen'),
(2, 'Beetle'),
(3, 'Coccinelle');

insert into `atributo` values 
(1, '4x4'),
(2, 'mini'),
(3, 'microbus'),
(4, '3 pasageros'),
(5, '4 pasageros'),
(6, '5 pasageros'),
(7, 'Apto_discapacitados');

insert into `estado` values 
(1, 'Pagado'),
-- (2, 'Espera-Reservacion'),
(3, 'Espera'),
(4, 'Pendiente'),
(5, 'Viajando');

insert into `tiposolicitud` values
(1, 'Normal'),
(2, 'Reserva');

insert into `cliente` values 
(1, 'David Espinoza'),
(2, 'Alicia Salazar'),
(3, 'Paul Gutierrez');
-- 
insert into `vehiculo` values 
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 3, 4);

insert into `atributo_vehiculo` values 
(1, 4, 1),
(2, 2, 1),
(3, 5, 2),
(4, 6, 3),
(5, 2, 4),
(6, 7, 4);

-- para los demas implementar los procedimientos