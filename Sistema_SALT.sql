CREATE DATABASE SALT;
USE SALT;

									/* Creación de la tabla Vehículos */
                                    
CREATE TABLE vehiculos(
id_vehiculo INT(4) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
foto_vehiculo mediumblob null,
marca VARCHAR(20) NOT NULL,
modelo VARCHAR(20) NOT NULL,
no_serie VARCHAR(25) NOT NULL,
anio VARCHAR(4) NOT NULL,
placa VARCHAR(8) NOT NULL,
capacidad_tanque INT(4) NOT NULL,
tipo_combustible VARCHAR(9) NOT NULL,
rendimiento DOUBLE(2,1) NOT NULL,
tarjeta_circulacion VARCHAR(25) NOT NULL,
kilometraje INT(8) NOT NULL,
periodo_mantenimiento VARCHAR(10) NOT NULL,
estado_vehiculo VARCHAR(15) NOT NULL);


									/* Creación de la tabla seguro */
						
CREATE TABLE seguro(
id_seguro INT(4) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
no_poliza INT(15) NOT NULL,
aseguradora VARCHAR(20) NOT NULL,
fecha_pago DATE NOT NULL,
foto_poliza MEDIUMBLOB,
id_vehiculo INT(4) ZEROFILL NOT NULL,
FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo)); 
                        

									/* Creación de la tabla verificaciones */
                                    
CREATE TABLE verificaciones(
id_verificacion INT(4) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY, 
fecha_verificacion DATE NOT NULL,
proveedor VARCHAR(25) NOT NULL,
importe DOUBLE(4,2) NOT NULL,
encargado VARCHAR(25) NULL,
descripcion VARCHAR(50) NULL,
foto_factura MEDIUMBLOB NULL,
proxima_fecha DATE NOT NULL,
id_vehiculo INT(4) ZEROFILL NOT NULL,
FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo)); 

									/* Creación de la tabla verificaciones */
								