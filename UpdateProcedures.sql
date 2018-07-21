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
