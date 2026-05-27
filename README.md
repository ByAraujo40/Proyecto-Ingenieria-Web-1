#  AeroTickets

Sistema web para la compra de tiquetes aéreos desarrollado con Node.js, Express, MySQL, HTML, CSS y JavaScript.

---

#  Descripción

AeroTickets es una plataforma web que permite:

- Registro de usuarios
- Inicio y cierre de sesión
- Consulta de vuelos
- Búsqueda de vuelos por filtros
- Compra de tiquetes
- Historial de compras

El sistema fue desarrollado como proyecto académico para la asignatura de Ingeniería Web.

---

#  Tecnologías utilizadas

## Frontend
- HTML5
- CSS3
- JavaScript

## Backend
- Node.js
- Express.js
- Express Session

## Base de datos
- MySQL
- MySQL2

---

#  Estructura del proyecto

```bash
AeroTickets/
│
├── public/
│   ├── index.html
│   ├── login.html
│   ├── registro.html
│   ├── historial.html
│   ├── style.css
│   └── script.js
│
├── db.js
├── server.js
├── package.json
└── README.md
 Instalación del proyecto
1. Clonar repositorio
git clone https://github.com/usuario/aerotickets.git
2. Entrar a la carpeta
cd aerotickets
3. Instalar dependencias
npm install

O instalar manualmente:

npm install express
npm install mysql2
npm install express-session
npm install nodemon
 Configuración de la base de datos
Crear base de datos
CREATE DATABASE aerotickets;
USE aerotickets;
Tabla usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100) UNIQUE,
    contrasena VARCHAR(100),
    rol VARCHAR(20) DEFAULT 'cliente'
);
Tabla vuelos
CREATE TABLE vuelos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    origen VARCHAR(100),
    destino VARCHAR(100),
    fecha_salida DATE,
    hora_salida TIME,
    aerolinea VARCHAR(100),
    precio DECIMAL(10,2),
    sillas_disponibles INT,
    estado VARCHAR(20) DEFAULT 'disponible'
);
Tabla tiquetes
CREATE TABLE tiquetes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    vuelo_id INT,
    cantidad_pasajeros INT,
    precio_total DECIMAL(10,2),
    fecha_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(20) DEFAULT 'confirmado',

    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (vuelo_id) REFERENCES vuelos(id)
);
Ejecutar el proyecto
Iniciar servidor
node server.js

o con nodemon:

npx nodemon server.js
 Abrir en navegador
http://localhost:3000
 Rutas principales
Registro
POST /api/auth/register
Login
POST /api/auth/login
Logout
POST /api/auth/logout
Ver sesión activa
GET /api/auth/me
Listar vuelos
GET /api/vuelos
Comprar tiquete
POST /api/tiquetes
Historial de compras
GET /api/tiquetes/historial
 Pruebas realizadas

Se realizaron pruebas usando:

Navegador web
Postman
Casos probados
Registro de usuarios
Inicio de sesión
Validación de credenciales
Consulta de vuelos
Compra de tiquetes
Historial de compras
Manejo de errores
 Funcionalidades implementadas

✅ Registro de usuarios
✅ Inicio de sesión
✅ Cierre de sesión
✅ Catálogo de vuelos
✅ Filtros de búsqueda
✅ Compra de tiquetes
✅ Historial de compras
✅ Validaciones frontend y backend
✅ Integración con MySQL

 Integrantes
Hernan Felipe Araujo Aranda
Juan Gabriel Gutiérrez Trujillo
 Universidad

Universidad Manuela Beltrán
Ingeniería de Software
Ingeniería Web
Bogotá, Colombia
2026
