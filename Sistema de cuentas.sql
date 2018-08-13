/*Nombre: Andres 
  Apellido: Cabrera
  Marricula: 17-EIIT-1-050
  Seccion: 0541*/

CREATE TABLE origen (
    idOrigen NUMERIC(5) NOT NULL,
    nombre VARCHAR(7) NOT NULL,
    tipoCredito NUMERIC(2) NOT NULL,
    CONSTRAINT PK_ORIGEN PRIMARY KEY (idOrigen),
    CONSTRAINT O_TIPO_CREDITO CHECK (tipoCredito IN (1, 2)),
    CONSTRAINT O_NOMBRE CHECK (nombre IN ('DEBITO', 'CREDITO'))
);

CREATE TABLE catalogoCuentas (
    idCatalogoCuenta NUMERIC(5) NOT NULL,
    idCatalogoCuentaOrigen NUMERIC(5) NOT NULL, 
    codigo VARCHAR(10) NOT NULL,
    nombre VARCHAR(15) NOT NULL,
    CONSTRAINT PK_CATALOGO PRIMARY KEY (idCatalogoCuenta),
    CONSTRAINT UK_CATALOGOCUENTAS UNIQUE (codigo),
    CONSTRAINT FK_CATALOGOCUENTAS FOREIGN KEY (idCatalogoCuentaOrigen) REFERENCES origen (idOrigen)
);

CREATE TABLE movimientos (
    idMovimiento NUMERIC(5) NOT NULL,
    idMovimientoOrigen NUMERIC(5) NOT NULL,
    idMovimientoCatalogo NUMERIC(5) NOT NULL,
    fecha DATE DEFAULT GETDATE() NOT NULL,
    descripcion VARCHAR(20) NOT NULL,
    importe NUMERIC(10,2) DEFAULT 0,
    CONSTRAINT PK_MOVIMIENTOS PRIMARY KEY (idMovimiento),
    CONSTRAINT FK_MOVIMIENTOS_ORIGEN FOREIGN KEY (idMovimientoOrigen) REFERENCES origen (idOrigen),
    CONSTRAINT FK_MOVIMIENTOS_CATALOGO FOREIGN KEY (idMovimientoCatalogo) REFERENCES catalogoCuentas (idCatalogoCuenta)
);

/*Table Origen*/
INSERT INTO origen (idOrigen, nombre, tipoCredito) VALUES (1000, 'DEBITO', 2);
INSERT INTO origen (idOrigen, nombre, tipoCredito) VALUES (1001, 'DEBITO', 2);
INSERT INTO origen (idOrigen, nombre, tipoCredito) VALUES (1002, 'CREDITO', 1);
INSERT INTO origen (idOrigen, nombre, tipoCredito) VALUES (1003, 'CREDITO', 2);
INSERT INTO origen (idOrigen, nombre, tipoCredito) VALUES (1004, 'DEBITO', 2);
INSERT INTO origen (idOrigen, nombre, tipoCredito) VALUES (1005, 'DEBITO', 1);
INSERT INTO origen (idOrigen, nombre, tipoCredito) VALUES (1006, 'CREDITO', 2);
INSERT INTO origen (idOrigen, nombre, tipoCredito) VALUES (1007, 'CREDITO', 2);
INSERT INTO origen (idOrigen, nombre, tipoCredito) VALUES (1008, 'DEBITO', 1);
INSERT INTO origen (idOrigen, nombre, tipoCredito) VALUES (1009, 'DEBITO', 2);


/*Table Catalogo de Cuentas*/
INSERT INTO catalogoCuentas (idCatalogoCuenta, idCatalogoCuentaOrigen, codigo, nombre) 
            VALUES (20451, 1000, '408496', 'Mayor');
INSERT INTO catalogoCuentas (idCatalogoCuenta, idCatalogoCuentaOrigen, codigo, nombre) 
            VALUES (20452, 1001, '408499', 'Compras');
INSERT INTO catalogoCuentas (idCatalogoCuenta, idCatalogoCuentaOrigen, codigo, nombre) 
            VALUES (20467, 1002, '408494', 'RRHH');
INSERT INTO catalogoCuentas (idCatalogoCuenta, idCatalogoCuentaOrigen, codigo, nombre) 
            VALUES (20489, 1003, '408491', 'Menor');
INSERT INTO catalogoCuentas (idCatalogoCuenta, idCatalogoCuentaOrigen, codigo, nombre) 
            VALUES (20490, 1004, '408492', 'Auxiliar');
INSERT INTO catalogoCuentas (idCatalogoCuenta, idCatalogoCuentaOrigen, codigo, nombre) 
            VALUES (20423, 1005, '408490', 'Pagos');
INSERT INTO catalogoCuentas (idCatalogoCuenta, idCatalogoCuentaOrigen, codigo, nombre) 
            VALUES (20444, 1006, '408493', 'Deudas');
INSERT INTO catalogoCuentas (idCatalogoCuenta, idCatalogoCuentaOrigen, codigo, nombre) 
            VALUES (20411, 1007, '408487', 'Planta');
INSERT INTO catalogoCuentas (idCatalogoCuenta, idCatalogoCuentaOrigen, codigo, nombre) 
            VALUES (20474, 1008, '408481', 'SEO');
INSERT INTO catalogoCuentas (idCatalogoCuenta, idCatalogoCuentaOrigen, codigo, nombre) 
            VALUES (20410, 1009, '408455', 'Ventas');


/*Table Movimientos*/
INSERT INTO movimientos (idMovimiento, idMovimientoOrigen, idMovimientoCatalogo, fecha, descripcion, importe) 
            VALUES (1111, 1000, 20451, '2013-10-10', '10932 Bigge Rd.', 94025.7);
INSERT INTO movimientos (idMovimiento, idMovimientoOrigen, idMovimientoCatalogo, fecha, descripcion, importe) 
            VALUES (1112, 1000, 20452, '2013-10-10','10932 Bigge Rd.', 4025.7);
INSERT INTO movimientos (idMovimiento, idMovimientoOrigen, idMovimientoCatalogo, fecha, descripcion, importe) 
            VALUES (1113, 1004, 20467, '2013-10-10', '10932 Bigge Rd.', 14025.7);
INSERT INTO movimientos (idMovimiento, idMovimientoOrigen, idMovimientoCatalogo, fecha, descripcion, importe) 
            VALUES (1114, 1007, 20489, '2013-10-10', '10932 Bigge Rd.', 84025.7);
INSERT INTO movimientos (idMovimiento, idMovimientoOrigen, idMovimientoCatalogo, fecha, descripcion, importe) 
            VALUES (1115, 1000, 20490, '2013-10-10', '10932 Bigge Rd.', 4025.7);
INSERT INTO movimientos (idMovimiento, idMovimientoOrigen, idMovimientoCatalogo, fecha, descripcion, importe) 
            VALUES (1116, 1001, 20423, '2013-10-10', '10932 Bigge Rd.', 94025.7);
INSERT INTO movimientos (idMovimiento, idMovimientoOrigen, idMovimientoCatalogo, fecha, descripcion, importe) 
            VALUES (1117, 1000, 20444, '2013-10-10', '10932 Bigge Rd.', 24025.7);
INSERT INTO movimientos (idMovimiento, idMovimientoOrigen, idMovimientoCatalogo, fecha, descripcion, importe) 
            VALUES (1118, 1002, 20411, '2013-10-10', '10932 Bigge Rd.', 64025.7);
INSERT INTO movimientos (idMovimiento, idMovimientoOrigen, idMovimientoCatalogo, fecha, descripcion, importe) 
            VALUES (1119, 1002, 20474, '2013-10-10', '10932 Bigge Rd.', 34025.7);
INSERT INTO movimientos (idMovimiento, idMovimientoOrigen, idMovimientoCatalogo, fecha, descripcion, importe) 
            VALUES (11110, 1000, 20410,'2013-10-10', '10932 Bigge Rd.', 74025.7);