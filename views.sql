					/* Vista para la tabla viajes */
					
CREATE OR REPLACE VIEW vista_viajes
AS SELECT viajes.id_viaje AS 'ID', viajes.fecha_salida AS 'FECHA_SALIDA', viajes.destino AS 'DESTINO',
	viajes.estado_viaje AS 'ESTADO_VIAJE', viajes.motivo AS 'MOTIVO', viajes.observaciones AS 'OBSERVACIONES',
	vehiculos.id_vehiculo AS 'ID_VEHICULO', vehiculos.modelo AS 'MODELO_VEHICULO', usuarios.id_usuario AS 'ID_USUARIO', usuarios.nombre AS 'CONDUCTOR'
	FROM viajes
	INNER JOIN vehiculos
  ON vehiculos.id_vehiculo = viajes.id_vehiculo
  INNER JOIN usuarios
  ON usuarios.id_usuario = viajes.id_usuario;

					/* Vista para los detalles del viaje */
					
CREATE OR REPLACE VIEW vista_detalle_viaje
AS SELECT viajes.id_viaje, viajes.fecha_salida, viajes.destino, viajes.motivo, 
	viajes.observaciones, vehiculos.marca, vehiculos.modelo, vehiculos.placa,
	vehiculos.rendimiento, vehiculos.vigencia_tarjeta,
	vehiculos.kilometraje, usuarios.nombre
	FROM viajes
	INNER JOIN vehiculos
  ON vehiculos.id_vehiculo = viajes.id_vehiculo
  INNER JOIN usuarios
  ON usuarios.id_usuario = viajes.id_usuario;
