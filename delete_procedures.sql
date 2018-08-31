                                  /* Procedimiento para eliminar usuarios */
DELIMITER $$ 
CREATE PROCEDURE delete_user(id int)
BEGIN
UPDATE usuarios SET estado_usuario = 'Eliminado' WHERE id_usuario = id;
END$$
