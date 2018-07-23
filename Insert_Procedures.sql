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
