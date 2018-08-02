                      /* Procedimiento de validación de usuarios para Login del sistema */
              
DELIMITER $$
CREATE PROCEDURE validacion_user(user varchar(20), pass varchar(25))
BEGIN
SELECT id_usuario,nombre,apellido,rol,foto_perfil FROM usuarios where correo = user and contrasenia = pass;
END $$

                      /*Procedimiento para cargar a los usuarios de la BD*/
DELIMITER $$
CREATE PROCEDURE select_users()
BEGIN
SELECT * FROM usuarios;
END $$                                                                

                      /* Procedimiento para cargar los conductores del sistema */
DELIMITER $$                                                                
CREATE PROCEDURE select_drivers()
BEGIN
SELECT * FROM usuarios WHERE rol = "Conductor";
END $$
                                                                
                                                                
                      /* Procedimiento para cargar los vehiculos */
DELIMITER $$                                                                
CREATE PROCEDURE select_cars()
BEGIN
SELECT * FROM vehiculos;
END $$                                                          
                                                                
                      /* Procedimiento para cargar los viajes Iniciados */
DELIMITER $$                                                                
CREATE PROCEDURE select_vista_viajes()
BEGIN
SELECT * FROM viajes WHERE estado_viaje = 'Iniciado' 
	OR ESTADO_VIAJE = 'Presupuestado' 
    	OR ESTADO_VIAJE = 'Primera revision';
END $$   
                                                                
                      /* Procedimiento para el rendimiento del vehiculo */
DELIMITER $$                                                                
CREATE PROCEDURE select_rendimiento(id INT(8))
BEGIN
SELECT rendimiento FROM vehiculos WHERE id_vehiculo = id;
END $$  

				/*Procedimiento para datos de revision final*/
DELIMITER $$
CREATE PROCEDURE select_revision_final(
idViaje INT(8))
    
BEGIN
	SELECT FECHA_SALIDA,MODELO_VEHICULO,CONDUCTOR,ID FROM vista_viajes WHERE ID = idViaje;
END $$
DELIMITER ;

				/*Procedimiento para seleccionar kilometraje del vehiculo */
DELIMITER $$                                                                
CREATE PROCEDURE select_kilometraje(
 IN idVehiculo INT(4))
BEGIN
SELECT kilometraje FROM vehiculos WHERE id_vehiculo = idVehiculo;
END $$  
DELIMITER ;
		   
		   
				   /* Procedimiento para seleccionar los datos para el detalle de viaje */
DELIMITER $$                                                                
CREATE PROCEDURE select_travel_detail(
	IN id_travel INT(8))
BEGIN
	SELECT * FROM vista_detalle_viaje WHERE id_viaje = id_travel;
END $$  
			 
			 
				/* Procedimiento para seleccionar los datos del presupuesto */
			 
DELIMITER $$                                                                
CREATE PROCEDURE select_presupuesto(
	IN id_travel INT(8))
BEGIN
	SELECT * FROM presupuestos WHERE id_viaje = id_travel;
END $$  

			 
				/* Procedimiento para seleccionar los datos de un solo vehículo */
			 
DELIMITER $$                                                                
CREATE PROCEDURE select_vehiculo(
	IN id_carro INT(8))
BEGIN
	SELECT * FROM vehiculos WHERE id_vehiculo = id_carro;
END $$  
