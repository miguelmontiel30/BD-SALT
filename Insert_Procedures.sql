                                             /* Procedimiento para insertar USUARIOS */
DELIMITER $$
CREATE PROCEDURE insert_user(
    IN name varchar(25), 
    last_name varchar(25),
	rol VARCHAR(15),
	email VARCHAR(25),
	pass VARCHAR(20))
DETERMINISTIC
BEGIN
    INSERT INTO usuarios(nombre,apellido,rol,correo,contrasenia)
    VALUES(name,last_name,rol,email,pass);
END$$
		     
		     
					/* Procedimiento para insertar viajes */
DELIMITER $$
CREATE PROCEDURE insert_travel(
    IN f_salida date, 
       dest varchar(20),
       mot VARCHAR(35),       
	obs VARCHAR(50),
	id_ve int(8),
	id_us int(4))
BEGIN
    INSERT INTO viajes(fecha_salida,destino,motivo,estado_viaje,
		       observaciones,id_vehiculo,id_usuario)
    VALUES(f_salida,dest,mot,'Iniciado',obs,id_ve,id_us);
END$$


/*Procedimiento para insertar vehiculos con imagen */

DELIMITER $$
CREATE PROCEDURE agregarVehiculoImagen (
	IN foto VARCHAR(255),
    IN marcaVehi VARCHAR(20), 
    IN modeloVehi VARCHAR(20), 
    IN numSerie VARCHAR(25), 
    IN anio VARCHAR(4), 
    IN placaVehi VARCHAR(8), 
    IN tanque INT(4), 
    IN combustible VARCHAR(9), 
    IN rendiVehi FLOAT, 
    IN numTarjeta VARCHAR(25), 
    IN estTarjeta VARCHAR(25), 
    IN vijeTarjeta DATE, 
    IN km INT(8), 
    IN manteVehi VARCHAR(20), 
    IN estadoVehi VARCHAR(15))  
BEGIN
	INSERT INTO vehiculos(imagen_vehiculo,marca,modelo,no_serie,anio,placa,capacidad_tanque,tipo_combustible,
    rendimiento,numero_tarjeta,estado_tarjeta,vigencia_tarjeta,kilometraje,periodo_mantenimiento,estado_vehiculo)
    
    VALUES(foto,marcaVehi,modeloVehi,numSerie,anio,placaVehi,tanque,combustible,
    rendiVehi,numTarjeta,estTarjeta,vijeTarjeta,km,manteVehi,estadoVehi);
END$$

DELIMITER $$
			  
			  
					/* Procedimiento para insertar presupuestos */
DELIMITER $$
CREATE PROCEDURE insert_presupuesto(
	IN dist INT(5), 
	precio_c FLOAT,
	total_c FLOAT,       
	litros_C FLOAT,
    vale_c TINYINT(4),
    n_vale INT(4),
    t_casetas INT(2),
    g_casetas FLOAT,
    n_personas INT(2),
    t_hotel FLOAT,
    t_comida FLOAT,
    t_biaticos FLOAT,
    t_presupuesto FLOAT,
	id_via int(8))
BEGIN
    INSERT INTO presupuestos(distancia,precio_combustible,total_combustible,litros_combustible,vale_gasolina,no_vale,
                            total_casetas,gasto_casetas,no_personas,hotel,comida,total_biaticos, total_presupuesto,id_viaje)
	VALUES(dist,precio_c,total_c,litros_c,vale_c,n_vale,t_casetas,g_casetas,n_personas,t_hotel,t_comida,t_biaticos,
	       t_presupuesto,id_via);
END$$
