                          /* Procedimiento para cambiar contraseñas en la base de datos */
DELIMITER $$
CREATE PROCEDURE cambiar_contrasenia(
    IN id INT(4),
    IN pass VARCHAR(20))
BEGIN    
	UPDATE usuarios SET contrasenia = pass WHERE id_usuario = id;
END $$

                          /* Procedimiento para cambiar contraseñas en la base de datos */
DELIMITER $$
CREATE PROCEDURE update_user(
	IN id INT(4),
	IN name VARCHAR(25),
    	IN lname VARCHAR(25),
    	IN user_rol VARCHAR(15),
    	IN email VARCHAR(50))
BEGIN
	UPDATE usuarios set nombre = name, apellido = lname, rol = user_rol, 
    correo = email WHERE id_usuario = id;
END $$

			 
				/* Procedimiento para cambiar el kilometraje del vehiculo */
DELIMITER $$
CREATE PROCEDURE update_kilometraje(
    IN id INT(4),
    IN kilo INT(8))				
BEGIN    
	UPDATE vehiculos SET kilometraje = kilo WHERE id_vehiculo = id;
END $$
		
				/* Procedimiento para editar viajes */
DELIMITER $$
CREATE PROCEDURE update_travel(
    	IN id_vi INT(8),
   	IN f_salida date,
	IN dest VARCHAR(20),
	IN mot VARCHAR(35),
	IN edo VARCHAR(15),
	IN obs VARCHAR(100),
	IN id_ve INT(8),
	IN id_us INT(4));	
BEGIN    
	UPDATE viajes SET fecha_salida = f_salida, destino = dest, motivo = mot, observaciones = obs, id_vehiculo = id_ve,
		     id_usuario = id_us WHERE id_viaje = id_vi;
END $$
		     
		     				/* Procedimiento para cambiar el estado del viaje */
DELIMITER $$
CREATE PROCEDURE update_travel_status(
    IN id INT(4),
    IN edo VARCHAR(15))				
BEGIN    
	UPDATE viajes SET estado_viaje = edo WHERE id_viaje = id;
END $$
		     
				/*Procedimiento para actualizar tabla seguro */
DELIMITER $$
CREATE PROCEDURE update_seguro(
	IN fecha DATE,
    IN idVehiculo INT(4),
    IN total INT(10),
    IN foto VARCHAR(255))
BEGIN
	update seguro set fecha_pago = fecha, monto_total = total, foto_recibo = foto where id_vehiculo = idVehiculo;
END $$
DELIMITER ;

				#Procedimiento para actualizar vehiculo
DELIMITER $$
CREATE PROCEDURE update_vehiculo(
	IN idVehiculo INT(4),
    IN placas VARCHAR(8),
    IN rendi FLOAT,
    IN estado VARCHAR(25),
    IN numero VARCHAR(25),
    IN vigencia DATE,
    IN manteni VARCHAR(20),
    IN statusVe VARCHAR(15))
BEGIN
	UPDATE vehiculos SET placa = placas, rendimiento = rendi, estado_tarjeta = estado, numero_tarjeta = numero, vigencia_tarjeta = vigencia,
    periodo_mantenimiento = manteni, estado_vehiculo = statusVe
    WHERE id_vehiculo = idVehiculo;
END $$
DELIMITER ;
				#Procedimiento para actulaizar el stutus del vehiculo
DELIMITER $$
CREATE PROCEDURE update_status_vehiculo(
	IN idVehiculo INT(4))
BEGIN
	UPDATE vehiculos SET estado_vehiculo = 'Vendido' WHERE id_vehiculo = IdVehiculo;
END $$
DELIMITER ;