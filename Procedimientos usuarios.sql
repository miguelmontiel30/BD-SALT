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
CREATE PROCEDURE updateUsuarios(
	IN IdUser INT(4),
	IN nomUser VARCHAR(25),
    IN apeUser VARCHAR(25),
    IN rolUser VARCHAR(15),
    IN contraUser VARCHAR(20))
BEGIN
	UPDATE usuarios set nombre = nomUser, apellido = apeUser, rol = rolUser, 
    contrasenia = contraUser WHERE id_usuario = IdUser;
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