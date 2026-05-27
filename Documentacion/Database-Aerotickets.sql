CREATE DATABASE IF NOT EXISTS aerotickets;
USE aerotickets;

CREATE TABLE usuarios (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    nombre     VARCHAR(100) NOT NULL,
    correo     VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    rol        VARCHAR(20)  NOT NULL DEFAULT 'cliente'
);

CREATE TABLE vuelos (
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    origen             VARCHAR(100)  NOT NULL,
    destino            VARCHAR(100)  NOT NULL,
    fecha_salida       DATE          NOT NULL,
    hora_salida        TIME          NOT NULL,
    aerolinea          VARCHAR(100)  NOT NULL,
    precio             DECIMAL(10,2) NOT NULL,
    sillas_disponibles INT           NOT NULL,
    estado             VARCHAR(20)   NOT NULL DEFAULT 'disponible'
);

CREATE TABLE tiquetes (
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id         INT           NOT NULL,
    vuelo_id           INT           NOT NULL,
    cantidad_pasajeros INT           NOT NULL DEFAULT 1,
    precio_total       DECIMAL(10,2) NOT NULL,
    fecha_compra       DATETIME      NOT NULL DEFAULT NOW(),
    estado             VARCHAR(20)   NOT NULL DEFAULT 'confirmado',
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (vuelo_id)   REFERENCES vuelos(id)
);

DELIMITER //
CREATE TRIGGER trg_actualizar_sillas
AFTER INSERT ON tiquetes
FOR EACH ROW
BEGIN
    UPDATE vuelos
    SET sillas_disponibles = sillas_disponibles - NEW.cantidad_pasajeros
    WHERE id = NEW.vuelo_id;

    UPDATE vuelos
    SET estado = 'agotado'
    WHERE id = NEW.vuelo_id AND sillas_disponibles <= 0;
END //
DELIMITER ;

INSERT INTO usuarios (nombre, correo, contrasena, rol) VALUES
('Valentina Omaña',   'valentina@email.com',   '1234',     'cliente'),
('Carlos Ruiz',       'carlos@email.com',       '1234',     'cliente'),
('Admin AeroTickets', 'admin@aerotickets.com',  'admin123', 'administrador');

INSERT INTO vuelos (origen, destino, fecha_salida, hora_salida, aerolinea, precio, sillas_disponibles, estado) VALUES
('Bogotá',    'Medellín',     '2025-07-10', '06:00', 'Avianca', 180000, 30, 'disponible'),
('Bogotá',    'Cartagena',    '2025-07-11', '08:30', 'LATAM',   250000, 20, 'disponible'),
('Bogotá',    'Cali',         '2025-07-12', '10:00', 'Avianca', 160000, 25, 'disponible'),
('Medellín',  'Bogotá',       '2025-07-13', '14:00', 'Wingo',   120000, 40, 'disponible'),
('Cali',      'Cartagena',    '2025-07-14', '07:45', 'LATAM',   310000, 15, 'disponible'),
('Bogotá',    'Barranquilla', '2025-07-15', '09:00', 'Avianca', 220000, 18, 'disponible'),
('Cartagena', 'Bogotá',       '2025-07-16', '16:00', 'Wingo',   190000, 22, 'disponible'),
('Bogotá',    'Bucaramanga',  '2025-07-17', '11:30', 'EasyFly', 140000, 35, 'disponible');