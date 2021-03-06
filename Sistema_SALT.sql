CREATE DATABASE SALT;
USE SALT;
						/* Creación de la tabla usuarios */
                                     
CREATE TABLE usuarios(
id_usuario INT(4) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(25) NOT NULL,
apellido VARCHAR(25) NOT NULL,
rol VARCHAR(15) NOT NULL,
contrasenia VARCHAR(20) NOT NULL,
foto_perfil varchar(50) NULL,
estado_usuario VARCHAR(1	5) NULL DEFAULT 'Activo');  

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
rendimiento FLOAT NOT NULL,
no_tarjeta VARCHAR(25) NOT NULL,
estado_tarjeta VARCHAR(15) NOT NULL,
vigencia_tarjeta DATE NOT NULL,
kilometraje INT(8) NOT NULL,
periodo_mantenimiento VARCHAR(20) NOT NULL,
estado_vehiculo VARCHAR(15) NOT NULL);
 
                        

									/* Creación de la tabla verificaciones */
                                    
CREATE TABLE verificaciones(
id_verificacion INT(4) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY, 
fecha_verificacion DATE NOT NULL,
proveedor VARCHAR(25) NOT NULL,
importe FLOAT NOT NULL,
id_usuario INT(4) ZEROFILL NOT NULL,
descripcion VARCHAR(50) NULL,
foto_factura MEDIUMBLOB NULL,
proxima_fecha DATE NOT NULL,
id_vehiculo INT(4) ZEROFILL NOT NULL,
FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo),
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)); 


					     
					     /* CREACION DE TABLA PROVEEDORES */
CREATE TABLE proveedores(
id_proveedor INT(4) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
direccion VARCHAR(60) NULL,
telefono INT(20) NULL,
estado VARCHAR(25) NULL DEFAULT 'Activo');	
					     
					     
					     
					     /* CREACION DE TABLA PENDIENTES */
CREATE TABLE pendientes(
id_pendiente INT(4) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
pendiente VARCHAR(30) NOT NULL,
estado VARCHAR(25) NULL DEFAULT 'Activo',
id_viaje INT(8) ZEROFILL NOT NULL,
FOREIGN KEY (id_viaje) REFERENCES viajes(id_viaje));	
					     
					     
					/* Creación de la tabla mantenimientos */
                                    
CREATE TABLE mantenimientos(
id_mantenimiento INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
fecha_mantenimiento DATE NOT NULL,
proximo_servicio INT(10) NOT NULL,
id_usuario INT(4) ZEROFILL NOT NULL,
id_vehiculo INT(4) ZEROFILL NOT NULL,
FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo),
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario));                 
					     
					     
					     /* CREACION DE TABLAS PARA MANTENIMIENTOS */
					     
CREATE TABLE aceite_filtros(
id_aceite_filtros INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
cambio_aceite DATE NULL,
cambio_filtro_aceite DATE NULL,
cambio_filtro_combustible DATE NULL,
cambio_filtro_aire DATE NULL,
importe FLOAT NULL,
id_proveedor INT(4) ZEROFILL NOT NULL,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)); 

CREATE TABLE balatas(
id_balatas INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
traseras DATE NULL,
delanteras DATE NULL,
importe FLOAT NULL,
id_proveedor INT(4) ZEROFILL NOT NULL,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor));
						  
CREATE TABLE inyectores_bujias(
id_inyectores INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
lavado_inyectores DATE NULL,
cambio_bujias DATE NULL,
reemplazo_cable_bujia DATE NULL,
importe FLOAT NULL,
id_proveedor INT(4) ZEROFILL NOT NULL,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)); 
						  
CREATE TABLE llantas(
id_llantas INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
traseras DATE NULL,
delanteras DATE NULL,
importe FLOAT NULL,
id_proveedor INT(4) ZEROFILL NOT NULL,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor));
						  
CREATE TABLE alineacion_balanceo(
id_alineacion_balanceo INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
alineacion DATE NULL,
balanceo DATE NULL,
importe FLOAT NULL,
id_proveedor INT(4) ZEROFILL NOT NULL,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor));
						  
CREATE TABLE amortiguadores(
id_amortiguadores INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
traseras DATE NULL,
delanteras DATE NULL,
importe FLOAT NULL,
id_proveedor INT(4) ZEROFILL NOT NULL,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor));						  

CREATE TABLE otro_reemplazo(
id_otros INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
otro_reemplazo DATE NULL,
especificaciones_otro VARCHAR(100) NULL,	
trabajo_extra DATE NULL,
especificaciones_trabajo VARCHAR(100) NULL,	
importe FLOAT NULL,
id_proveedor INT(4) ZEROFILL NOT NULL,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor));						  

									                                                       
                                    
                                    
									/* Creación de la tabla viajes */
                                    
CREATE TABLE viajes(
id_viaje INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
fecha_salida DATE NOT NULL,
destino VARCHAR(20) NOT NULL,
motivo VARCHAR(35) NOT NULL,
estado_viaje VARCHAR(25) NOT NULL,
observaciones VARCHAR(100) NOT NULL,
id_vehiculo INT(8) ZEROFILL NOT NULL,
id_usuario INT(4) ZEROFILL NOT NULL,
FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo), 
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)); 

						     
						     /* Creación de la tabla presupuestos */

CREATE TABLE presupuestos(
id_presupuesto INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
distancia INT(5) NOT NULL,
precio_combustible FLOAT NOT NULL,
total_combustible FLOAT NOT NULL,
litros_combustible FLOAT NOT NULL,
vale_gasolina TINYINT NOT NULL,
no_vale VARCHAR(10) NOT NULL,
total_casetas INT(2) NOT NULL,
gasto_casetas FLOAT NOT NULL,
no_personas INT(2) NOT NULL,
hotel FLOAT NOT NULL,
comida FLOAT NOT NULL,
total_biaticos FLOAT NOT NULL,
total_presupuesto FLOAT NOT NULL,
id_viaje INT(8) ZEROFILL NOT NULL,
FOREIGN KEY (id_viaje) REFERENCES viajes(id_viaje)); 
					 
					
						/* Creación de la tabla revision de vehiculo */	
                                    
CREATE TABLE revision_vehiculo(
id_revision INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
aceite_motor VARCHAR(25) NOT NULL,
aceite_transmision VARCHAR(25) NOT NULL,
anticongelante VARCHAR(25) NOT NULL,
liquido_frenos VARCHAR(25) NOT NULL,
llanta_refaccion TINYINT NOT NULL,
llave_ruedas TINYINT NOT NULL,
verificacion TINYINT NOT NULL,
poliza_seguro TINYINT NOT NULL,
gato TINYINT NOT NULL,
tarjeta_circulacion TINYINT NULL,
cinchos INT(2) NOT NULL,
matracas INT(2) NOT NULL,
cobijas INT(2) NOT NULL,
colchones INT(2) NOT NULL,
rampas VARCHAR(15) NULL,
limpieza_vehiculo VARCHAR(10) NOT NULL,
nivel_gasolina_ida FLOAT(4,1) NOT NULL,
observaciones VARCHAR(50) NOT NULL,
foto_frontal MEDIUMBLOB NULL,
foto_trasera MEDIUMBLOB NULL,
foto_izquierda MEDIUMBLOB NULL,
foto_derecha MEDIUMBLOB NULL,
id_viaje INT(8) ZEROFILL NOT NULL,
FOREIGN KEY (id_viaje) REFERENCES viajes(id_viaje)); 


									/* Creación de la tabla revision de vehiculo */	
                                    
CREATE TABLE revision_final(                                    
id_revision_final INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
kilometros_entrada INT(5) NOT NULL,
total_km_recorridos INT(5) NOT NULL,
aceite_motor VARCHAR(15) NOT NULL,
aceite_transmision VARCHAR(15) NOT NULL,
anticongelante VARCHAR(15) NOT NULL,
liquido_frenos VARCHAR(15) NOT NULL,
llanta_refaccion TINYINT NOT NULL,
llave_ruedas TINYINT NOT NULL,
verificacion TINYINT NOT NULL,
poliza_seguro TINYINT NOT NULL,
gato TINYINT NOT NULL,
tarjeta_circulacion TINYINT NULL,
cinchos INT(2) NOT NULL,
matracas INT(2) NOT NULL,
cobijas INT(2) NOT NULL,
colchones INT(2) NOT NULL,
rampas VARCHAR(15) NULL,
limpieza_vehiculo VARCHAR(10) NOT NULL,
nivel_gasolina_llegada FLOAT(4,1) NOT NULL,
observaciones VARCHAR(50) NOT NULL,
foto_frontal MEDIUMBLOB NULL,
foto_trasera MEDIUMBLOB NULL,
foto_izquierda MEDIUMBLOB NULL,
foto_derecha MEDIUMBLOB NULL,
id_viaje INT(8) ZEROFILL NOT NULL,
FOREIGN KEY (id_viaje) REFERENCES viajes(id_viaje));
                                    

							/* Creación de la tabla factura_gasolina */                                    
                                    
CREATE TABLE factura_gasolina(
id_factura INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
fecha DATE NOT NULL,
tipo_combustible VARCHAR(10) NOT NULL,
litros_recargados FLOAT(4,1) NOT NULL,
importe FLOAT(4,2) NOT NULL,
descripcion VARCHAR(50) NULL,
foto_factura MEDIUMBLOB NULL,
id_viaje INT(8) ZEROFILL NOT NULL,
FOREIGN KEY (id_viaje) REFERENCES viajes(id_viaje));                                    
                                    
                                    
									/* Creación de la tabla incidentes */                                                                        
                                    
CREATE TABLE incidentes(
id_incidente INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
proveedor VARCHAR(25) NOT NULL,
importe FLOAT(4,2) NOT NULL,
descripcion VARCHAR(50) NULL,
observaciones VARCHAR(50) NULL,
foto_factura MEDIUMBLOB NULL,
id_viaje INT(8) ZEROFILL NOT NULL,
FOREIGN KEY (id_viaje) REFERENCES viajes(id_viaje));                                        


					/* Creación de la tabla biaticos_extra */                                                                        

CREATE TABLE biaticos_extra(
id_biatico INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
fecha DATE NOt NULL,
concepto VARCHAR(20) NOT NULL,
importe FLOAT NOT NULL,
observaciones VARCHAR(50) NULL,
id_viaje INT(8) ZEROFILL NOT NULL,
FOREIGN KEY (id_viaje) REFERENCES viajes(id_viaje));           
					 
					 
					 /* CREACION DE TABLA PARA REGISTRO DE */
CREATE TABLE poliza_seguros(
id_poliza INT(8) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
fecha_inicio DATE NOT NULL,	
aseguradora VARCHAR(25) NOT NULL,
fecha_vencimiento DATE NULL,	
no_poliza INT(15) NOT NULL, 	
importe_total FLOAT NOT NULL,
foto_poliza VARCHAR(50) NULL,	
id_vehiculo INT(8) ZEROFILL NOT NULL,
FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo));
					       
					 
					/* Creación de la tabla seguro */
						
CREATE TABLE pago_seguro(
id_pago_seguro INT(4) ZEROFILL AUTO_INCREMENT NOT NULL PRIMARY KEY,
fecha_pago DATE NULL,
proxima_fecha_pago DATE NULL,		
importe FLOAT NOT NULL,		
foto_recibo VARCHAR(50) NULL,		
id_poliza INT(8) ZEROFILL NOT NULL,
FOREIGN KEY (id_poliza) REFERENCES poliza_seguros(id_poliza));
					                                           				 
                                    
                                    
                                    
                                    
                                    
                                    
