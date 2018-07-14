USE SALT;

#Procedimientos

#Registro de usuarios

DROP PROCEDURE IF EXISTS agregarUsuarios;
DELIMITER $$
CREATE PROCEDURE agregarUsuarios(
	IN nomUsuario VARCHAR(25),
    IN apeUsuario VARCHAR(25),
    IN rolUsuario VARCHAR(15),
    IN contraUsuario VARCHAR(20))
    
BEGIN
	INSERT INTO usuarios(nombre,apellido,rol,contrasenia,foto_perfil)
    VALUES(nomUsuario,apeUsuario,rolUsuario,contraUsuario,null);
END $$
DELIMITER ;

CALL agregarUsuarios('Sergio','Marquez','Administrador','admin');
CALL agregarUsuarios('Miguel','Ortega','Supervisor','super');
CALL agregarUsuarios('Roberto','Garcia','Conductor','rober');

#Actualización de usuarios

DROP PROCEDURE IF EXISTS updateUsuarios;
DELIMITER $$
CREATE PROCEDURE update_user(
	IN id INT(4),
	IN name VARCHAR(25),
    IN lname VARCHAR(25),
    IN user_rol VARCHAR(15),
    IN email VARCHAR(50),
    IN pass VARCHAR(20))
BEGIN
	UPDATE usuarios set nombre = name, apellido = lname, rol = user_rol, 
    correo = email, contrasenia = pass WHERE id_usuario = id;
END $$
DELIMITER ;

CALL updateUsuarios(0002,'Miguel','Ortega','Supervisor','super');

#Eliminar usuarios

DROP PROCEDURE IF EXISTS eliminarUsuarios;
DELIMITER $$
CREATE PROCEDURE eliminarUsuarios(
	IN idUser INT(4))
BEGIN
	DELETE FROM usuarios WHERE id_usuario = idUser;
END $$
DELIMITER ;

CALL eliminarUsuarios(0004);

#Busqueda de usuario

DROP PROCEDURE IF EXISTS validarUsuario;
DELIMITER $$
CREATE PROCEDURE validarUsuario(
	IN nombreUser VARCHAR(25),
    IN passUser VARCHAR(25))
    
BEGIN
	SELECT nombre,rol FROM usuarios WHERE nombre = nombreUser and contrasenia = passUser;
END $$
DELIMITER ;

CALL validarUsuario('Sergio','admin');
