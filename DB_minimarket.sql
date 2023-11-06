CREATE DATABASE IF NOT EXISTS Minimarket_SCRUMMASTER;

USE Minimarket_SCRUMMASTER;

CREATE TABLE Rol (
	idRol INT PRIMARY KEY AUTO_INCREMENT,
    descripción TEXT NOT NULL,
    fechaCreación DATETIME
);

CREATE TABLE Estado (
	idEstado INT PRIMARY KEY AUTO_INCREMENT,
    descripción VARCHAR(10) NOT NULL
);

CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	dni CHAR(8) NOT NULL,
    nombreCompleto VARCHAR(45),
    correo VARCHAR(45) UNIQUE,
    contraseña TEXT,
    idRol INT,
    fechaCreación DATETIME,
    idEstado INT,
    FOREIGN KEY (idRol) REFERENCES Rol(idRol),
    FOREIGN KEY (idEstado) REFERENCES Estado(idEstado)
);

CREATE TABLE Venta (
	idVenta INT PRIMARY KEY AUTO_INCREMENT,
	idUsuario INT,
	numeroComprobante VARCHAR(20),
	clienteDni VARCHAR (8),
    nombreCliente VARCHAR (45),
    montoPagoCliente DECIMAL(5,2),
    montoCambio DECIMAL(5,2),
    montoTotal DECIMAL(5,2),
    fechaRegistro DATETIME,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Categoría (
	idCategoría INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nombreCategoría VARCHAR(50) NOT NULL,
    descripción TEXT NOT NULL,
    idEstado INT,
    fechaRegistro DATETIME,
    FOREIGN KEY (idEstado) REFERENCES Estado(idEstado)
);

CREATE TABLE Producto (
	idProducto INT PRIMARY KEY AUTO_INCREMENT,
	código VARCHAR(20) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    descripción TEXT NOT NULL,
    idCategoría INT,
    stock INT NOT NULL,
    precioCompra DECIMAL(5,2) NOT NULL,
    precioVenta DECIMAL(5,2) NOT NULL,
    idEstado INT,
    fechaRegistro DATETIME,
    FOREIGN KEY (idCategoría) REFERENCES Categoría(idCategoría),
    FOREIGN KEY (idEstado) REFERENCES Estado(idEstado)
);

CREATE TABLE Detalle_venta (
	idDetalleVenta INT PRIMARY KEY AUTO_INCREMENT,
    idVenta INT,
    idProducto INT,
    precioVenta DECIMAL(5,2),
    cantidad INT,
    subTotal DECIMAL(5,2),
    FOREIGN KEY (idVenta) REFERENCES Venta(idVenta),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

CREATE TABLE Proveedor (
	idProveedor INT PRIMARY KEY AUTO_INCREMENT,
    ruc VARCHAR(11) NOT NULL,
    razónSocial VARCHAR(45) NOT NULL,
    tipoComprobante VARCHAR(10) NOT NULL,
    correo VARCHAR(45) UNIQUE NOT NULL,
    teléfono1 VARCHAR(9),
    telefono2 VARCHAR(9),
    fechaCreación DATETIME,
    idEstado INT,
    FOREIGN KEY (idEstado) REFERENCES Estado(idEstado)
);

CREATE TABLE Compra (
	idCompra INT PRIMARY KEY AUTO_INCREMENT,
    idUsuario INT,
    idProveedor INT,
    tipoComprobante VARCHAR(10) NOT NULL,
    númeroComprobante VARCHAR(20) NOT NULL,
    montoTotal DECIMAL(5,2),
    fechaRegistro DATETIME,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)
);

CREATE TABLE Detalle_compra (
	idDetalleCompra INT PRIMARY KEY AUTO_INCREMENT,
    idCompra INT,
    idProducto INT,
    precioCompra DECIMAL(5,2),
    precioVenta DECIMAL(5,2),
    cantidad INT,
    total FLOAT,
	FOREIGN KEY (idCompra) REFERENCES Compra(idCompra),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);