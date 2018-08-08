                                       /* Tabla para trigger de actualización de kilometraje */
CREATE TABLE actualizacion_kilometraje(
	id_actualizacion int(10) zerofill auto_increment primary key not null,    
  id_vehiculo INT(8) ZEROFILL NULL,
	anterior_kilometraje INT(8) NULL,
  nuevo_kilometraje INT(8) NULL,
  fecha_cambiado DATE);                                       
                                       
                                       /* Trigger de actualización de kilometraje */                                                                             
CREATE TRIGGER kilometraje_bu
AFTER UPDATE ON vehiculos
FOR EACH ROW
INSERT INTO actualizacion_kilometraje(
	id_actualizacion, 
  id_vehiculo, 
	anterior_kilometraje,
	nuevo_kilometraje,    
  fecha_cambiado) VALUES
('', OLD.id_vehiculo, OLD.kilometraje,
	 NEW.kilometraje, NOW());
