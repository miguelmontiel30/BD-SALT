                                  /* Procedimiento para eliminar usuarios */
DELIMITER $$ 
CREATE PROCEDURE delete_user(id int)
BEGIN
DELETE FROM usuarios where id_usuario = id;
END$$
