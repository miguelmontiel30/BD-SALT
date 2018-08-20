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
		
		      
		      		/* Procedimiento para cargar el número de verificaciones del vehiculo*/
DELIMITER $$
CREATE procedure select_no_verificaciones(
	IN ID INT(4))
BEGIN		      
select count(*) AS no_verificaciones from verificaciones
  where id_vehiculo = ID;
END $$		  
		  
		  
		  	/* Procedimiento para cargar el gasto invertido en verificaciones del vehiculo*/
DELIMITER $$
CREATE procedure select_gasto_verificaciones(
	IN ID INT(4))
BEGIN		      
SELECT SUM(importe) as gasto FROM verificaciones WHERE id_vehiculo = ID;
END $$		  
		  
		  
		  	/* Procedimiento para cargar la próxima fecha de verificacion del vehiculo */
DELIMITER $$
CREATE procedure select_proxima_verificacion(
	IN ID INT(4))
BEGIN		      
SELECT proxima_fecha, DATEDIFF(CURDATE(), fecha_verificacion) as dias from verificaciones WHERE id_vehiculo = ID order by proxima_fecha ASC LIMIT 1;
END $$		
		
		  
		  /* Procedimiento para cargar los días trancurridos tras la ultima verificacion del vehiculo */
DELIMITER $$
CREATE procedure select_dias_verificacion(	
	IN FECHA DATE)
BEGIN		      
SELECT DATEDIFF(CURDATE(), FECHA)*-1 as dias;
END $$		
		  
	
		   /* Procedimiento para cargar los viajes en transcurso */
DELIMITER $$
CREATE procedure select_viajes_transcurso()
BEGIN		      
SELECT COUNT(*) AS viajes FROM viajes WHERE estado_viaje NOT IN('Eliminado','FINALIZADO');
END $$	
	
		  
		  /* Procedimiento para cargar el número de viajes que se han realizado en el mes */
DELIMITER $$
CREATE procedure select_viajes_transcurso()
BEGIN		
DECLARE mes INT;		  
DECLARE anio INT;		  
SELECT Date_format(CURDATE(), '%m') INTO @mes;
SELECT Date_format(CURDATE(), '%Y') INTO @anio;
SELECT COUNT(*) AS viajes FROM viajes WHERE estado_viaje <> 'Eliminado' AND MONTH(fecha_salida) = @mes AND YEAR(fecha_salida) = @anio ;
END$$		
		  
		  
		  		   /* Procedimiento para cargar total de usuarios en el sistema */
DELIMITER $$
CREATE procedure select_no_users()
BEGIN		      
SELECT COUNT(*) AS no_usuarios FROM usuarios WHERE estado_usuario = 'Activo';
END $$
		  
		  		
		  		/* Procedimiento para cargar total de vehiculos en el sistema */
DELIMITER $$
CREATE procedure select_no_vehiculos()
BEGIN		      
SELECT COUNT(*) AS no_vehiculos FROM vehiculos WHERE estado_vehiculo = 'Activo';
END $$
		  
		  
		  	/* Procedimiento para cargar total de viajes registrados en el sistema */
DELIMITER $$
CREATE procedure select_no_viajes()
BEGIN		      
SELECT COUNT(*) AS no_viajes FROM viajes WHERE estado_viaje <> 'Eliminado';
END $$
	
		  
	  		  /* Procedimiento para cargar total de gasto en verificaciones */
DELIMITER $$
CREATE procedure select_gasto_veri()
BEGIN		      
SELECT SUM(importe) AS gasto FROM verificaciones;
END $$
		  
		  
		  	  /* Procedimiento para cargar total de gasto en mantenimientos */
DELIMITER $$
CREATE procedure select_gasto_man()
BEGIN		      
SELECT SUM(importe) AS gasto FROM mantenimientos;
END $$
	
		  
		  	/* Procedimiento para cargar total de gasto en seguros */
DELIMITER $$
CREATE procedure select_gasto_seg()
BEGIN		      
SELECT SUM(monto_total) AS gasto FROM seguros;
END $$
		  
		  
		  		  /* Procedimiento para cargar los días faltantes para las proximas verificaciones */
DELIMITER $$
CREATE procedure select_proximas_verificaciones()
BEGIN		      
SELECT * FROM vista_proximas_verificaciones WHERE dias_restantes BETWEEN 0 AND 40;
END $$
