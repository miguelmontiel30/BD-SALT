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
