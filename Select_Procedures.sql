              /* Procedimiento de validación de usuarios para Login del sistema */
              
DELIMITER $$
CREATE PROCEDURE validacion_user(user varchar(20), pass varchar(25))
BEGIN
SELECT id_usuario,nombre,apellido,rol,foto_perfil FROM usuarios where correo = user and contrasenia = pass;
END $$

