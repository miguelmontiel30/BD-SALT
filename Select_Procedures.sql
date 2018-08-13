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
			
			
			/* Procedimiento para seleccionar los datos de la primera revisión de vehículo */
			 
DELIMITER $$                                                                
CREATE PROCEDURE select_primera_revision(
	IN id_travel INT(8))
BEGIN
	SELECT * FROM revision_vehiculo WHERE id_viaje = id_travel;
END $$  

			 
			 /* Procedimiento para seleccionar los datos de la segunda revisión de vehículo */
			 
DELIMITER $$                                                                
CREATE PROCEDURE select_segunda_revision(
	IN id_travel INT(8))
BEGIN
	SELECT * FROM revision_final WHERE id_viaje = id_travel;
END $$  
			 
			/* Procedimiento para cargar las verificaciones de los vehiculos */			 
DELIMITER $$                                                                
CREATE PROCEDURE select_verificaciones(
	IN id_carro INT(4))
BEGIN
	SELECT verificaciones.foto_factura, verificaciones.fecha_verificacion,
		verificaciones.proveedor, verificaciones.importe, verificaciones.descripcion, usuarios.nombre
	FROM verificaciones  
	INNER JOIN usuarios
  	ON usuarios.id_usuario = verificaciones.id_usuario
    WHERE id_vehiculo = id_carro;
END $$  

				/*Procedimineto para cargar la tabla de seguro */

DELIMITER $$
CREATE PROCEDURE select_seguro(
	IN idVehiculo INT(4))
BEGIN
	SELECT no_poliza, aseguradora,fecha_pago,fecha_registro,foto_poliza,monto_total,periodo_pago,modelo
    FROM seguro
    INNER JOIN vehiculos on vehiculos.id_vehiculo = seguro.id_vehiculo where vehiculos.id_vehiculo = idVehiculo;
END $$
DELIMITER ;

				/*Procedimiento para mostrar la proxima fecha */
DELIMITER $$
CREATE procedure select_fecha(
	IN cadena VARCHAR(25),
    IN IdVehiculo INT(4))
BEGIN

IF strcmp(cadena, 'Mensual') = 0 THEN
SELECT DATE_ADD(fecha_pago, INTERVAL 1 MONTH) AS proximo_pago FROM seguro WHERE id_vehiculo = idVehiculo;
END IF;

IF strcmp(cadena, 'Anual') = 0 THEN
SELECT DATE_ADD(fecha_pago, INTERVAL 1 YEAR) AS proximo_pago FROM seguro WHERE id_vehiculo = idVehiculo;
END IF;

IF strcmp(cadena, 'Trimestral') = 0 THEN
SELECT DATE_ADD(fecha_pago, INTERVAL 3 MONTH) AS proximo_pago FROM seguro WHERE id_vehiculo = idVehiculo;
END IF;

IF strcmp(cadena, 'Semestral') = 0 THEN
SELECT DATE_ADD(fecha_pago, INTERVAL 6 MONTH) AS proximo_pago FROM seguro WHERE id_vehiculo = idVehiculo;
END IF;
END $$
DELIMITER ;