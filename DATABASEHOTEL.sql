CREATE DATABASE IF NOT EXISTS reserva_hotel;
USE reserva_hotel;

-- TABLA DE HABITACIONES--

CREATE TABLE habitaciones(
id_habitacion INT PRIMARY KEY AUTO_INCREMENT,
numero_habitacion VARCHAR(10) NOT NULL,
tipo_habitacion VARCHAR(50) NOT NULL,		-- SI ES COMUN, DOBLE, SUITE, ETC --
precio DECIMAL(10,2) NOT NULL,
capacidad INT								-- PERSONAS QUE CABEN EN LA HABITACION -- 
);

CREATE TABLE clientes(
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
telefono VARCHAR(20),
documento VARCHAR(10) NOT NULL 
);

CREATE TABLE servicios(
id_servicio INT PRIMARY KEY AUTO_INCREMENT,
nombre_servicio VARCHAR(100) NOT NULL,
costo DECIMAL(10,2) NOT NULL
);

CREATE TABLE reservas(
id_reserva INT PRIMARY KEY AUTO_INCREMENT,
id_cliente INT,
id_habitacion INT,
fecha_inicio DATE NOT NULL,
fecha_fin DATE NOT NULL,
estado VARCHAR(50) DEFAULT 'pendiente', 		-- pendiente, confirmada, cancelada, --
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY (id_habitacion) REFERENCES habitaciones(id_habitacion)
);

CREATE TABLE detalle_reserva_servicio(
id_reserva INT PRIMARY KEY,
id_servicio INT PRIMARY KEY,
cantidad INT DEFAULT 1,
FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva),
FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);

CREATE TABLE facturas(
id_factura INT PRIMARY KEY AUTO_INCREMENT,
id_reserva INT,
fecha_factura DATE NOT NULL,
total DECIMAL(10,2) NOT NULL,
FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva)
);

CREATE TABLE pagos(
id_pago INT PRIMARY KEY AUTO_INCREMENT,
id_factura INT,
metodo_pago VARCHAR(50) 		-- TARJETA DE CREDITO, DEBITO, EFECTIVO --
);

