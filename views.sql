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
	viajes.observaciones, viajes.estado_viaje, vehiculos.marca, vehiculos.modelo, vehiculos.placa,
	vehiculos.rendimiento, vehiculos.vigencia_tarjeta,
	vehiculos.kilometraje, usuarios.nombre
	FROM viajes
	INNER JOIN vehiculos
  ON vehiculos.id_vehiculo = viajes.id_vehiculo
  INNER JOIN usuarios
  ON usuarios.id_usuario = viajes.id_usuario;


CREATE OR REPLACE VIEW vista_proximas_verificaciones
AS SELECT vehiculos.id_vehiculo, vehiculos.marca, vehiculos.modelo, verificaciones.id_verificacion,
	  verificaciones.fecha_verificacion, DATEDIFF(verificaciones.proxima_fecha, CURDATE()) AS dias_restantes 
	  FROM verificaciones 
	  INNER JOIN vehiculos 
	  ON vehiculos.id_vehiculo = verificaciones.id_vehiculo 
	 ORDER BY proxima_fecha ASC;

						      
CREATE OR REPLACE VIEW vista_proximos_seguros
AS SELECT vehiculos.id_vehiculo, vehiculos.marca, vehiculos.modelo, seguro.id_seguro,
	  seguro.fecha_registro, DATE_ADD(seguro.fecha_pago, INTERVAL 1 YEAR) AS dias_restantes 
	  FROM seguro 
	  INNER JOIN vehiculos 
	  ON vehiculos.id_vehiculo = seguro.id_vehiculo 
	 ORDER BY seguro.fecha_pago ASC;
						      
						      
CREATE OR REPLACE VIEW vista_pendientes
AS SELECT viajes.id_viaje, viajes.destino, pendientes.pendiente 
	FROM pendientes  
	INNER JOIN viajes 
	ON viajes.id_viaje = pendientes.id_viaje
	WHERE pendientes.estado <> 'Solucionado';						     
						      
						      
