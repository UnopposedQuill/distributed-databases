use Hr
go

insert into TipoEstablecimiento(descripcion) values
	('Farmacia'),
	('Panadería'),
	('Pulpería');

insert into Avenida(nombre, ubicacion) values 
	('Brown Field', geometry::STGeomFromText('LINESTRING (-100 100, 0 0)', 0)),
	('Westerfield', geometry::STGeomFromText('LINESTRING (-100 -100, 0 0)', 0)),
	('Pepper Wood', geometry::STGeomFromText('LINESTRING (-100 0, 0 0)', 0)),
	('Manufacturers', geometry::STGeomFromText('LINESTRING (100 100, 0 0)', 0)),
	('Transport', geometry::STGeomFromText('LINESTRING (100 -100, 0 0)', 0));

insert into Calle(nombre, FKAvenida, ubicacion) values 
	('Fulton', 1, geometry::STGeomFromText('LINESTRING (0 0, -100 100)', 0)),
	('Glacier Hill', 2, geometry::STGeomFromText('LINESTRING (0 0, -100 -100)', 0)),
	('Burning Wood', 3, geometry::STGeomFromText('LINESTRING (0 0, -100 0)', 0)),
	('Chive', 4, geometry::STGeomFromText('LINESTRING (0 0, 100 100)', 0)),
	('Harbort', 5, geometry::STGeomFromText('LINESTRING (0 0,100 -100)', 0));

insert into Casa(numeroCasa, FKCalle, ubicacion) values
	(17,5, geometry::STGeomFromText('POINT (20 -20)', 0)),
	(16,5, geometry::STGeomFromText('POINT (30 -20)', 0)),
	(18,1, geometry::STGeomFromText('POINT (-20 20)', 0)),
	(14,2, geometry::STGeomFromText('POINT (-20 -20)', 0)),
	(18,5, geometry::STGeomFromText('POINT (20 -40)', 0)),
	(14,2, geometry::STGeomFromText('POINT (-40 -10)', 0)),
	(9,1, geometry::STGeomFromText('POINT (-20 60)', 0)),
	(11,4, geometry::STGeomFromText('POINT (60 60)', 0)),
	(11,2, geometry::STGeomFromText('POINT (-80 -60)', 0)),
	(11,5, geometry::STGeomFromText('POINT (40 -40)', 0)),
	(13,2, geometry::STGeomFromText('POINT (-50 -50)', 0)),
	(19,1, geometry::STGeomFromText('POINT (-50 50)', 0)),
	(19,5, geometry::STGeomFromText('POINT (50 -60)', 0)),
	(15,3, geometry::STGeomFromText('POINT (-40 10)', 0)),
	(12,2, geometry::STGeomFromText('POINT (-75 -75)', 0));

insert into Establecimiento(nombre, FKCalle, FKTipoEstablecimiento, ubicacion) values
	('Ziemann Group',1,1, geometry::STGeomFromText('POINT (20 -25)', 0)),
	('Greenfelder, Streich and Gleichner',5,2, geometry::STGeomFromText('POINT (25 -25)', 0)),
	('Denesik, Heller and MacGyver',4,1, geometry::STGeomFromText('POINT (30 30)', 0)),
	('McKenzie-Hane',2,2, geometry::STGeomFromText('POINT (-25 -25)', 0)),
	('Veum, Wilderman and Wolff',1,1, geometry::STGeomFromText('POINT (-55 55)', 0)),
	('Ullrich LLC',3,3, geometry::STGeomFromText('POINT (-35 0)', 0)),
	('Keebler-Bergstrom',2,2, geometry::STGeomFromText('POINT (-35 -35)', 0)),
	('Stiedemann Group',5,2, geometry::STGeomFromText('POINT (37 -37)', 0)),
	('Kassulke and Mann',2,1, geometry::STGeomFromText('POINT (-38 -38)', 0)),
	('Thompson Group',5,1, geometry::STGeomFromText('POINT (38 38)', 0)),
	('Schiller-Brakus',3,2, geometry::STGeomFromText('POINT (-38 38)', 0)),
	('Johnson Inc',1,3, geometry::STGeomFromText('POINT (-59 59)', 0)),
	('Paucek-Cormier',4,3, geometry::STGeomFromText('POINT (59 59)', 0)),
	('Rowe-Kunze',4,2, geometry::STGeomFromText('POINT (58 58)', 0)),
	('Skiles, Wunsch and Balistreri',4,3, geometry::STGeomFromText('POINT (68 68)', 0)),
	('Witting-Daniel',5,1, geometry::STGeomFromText('POINT (68 -68)', 0)),
	('Hauck-Lindgren',5,1, geometry::STGeomFromText('POINT (68 -65)', 0)),
	('Harber-Gerhold',3,1, geometry::STGeomFromText('POINT (-64 0)', 0)),
	('Barrows Inc',4,3, geometry::STGeomFromText('POINT (46 46)', 0)),
	('Powlowski Inc',1,3, geometry::STGeomFromText('POINT (-46 46)', 0));
