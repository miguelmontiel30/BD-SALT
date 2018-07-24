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
CREATE PROCEDURE select_travels()
BEGIN
SELECT * FROM viajes WHERE estado_viaje = 'Iniciado';
END $$   
