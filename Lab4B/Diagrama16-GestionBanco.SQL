CREATE TABLE Sucursal
(
  Ciudad VARCHAR(25) NOT NULL,
  Nombre VARCHAR(25) NOT NULL,
  Activos INT NOT NULL,
  PRIMARY KEY (Nombre)
);

CREATE TABLE Cliente
(
  ID_Cliente VARCHAR(10) NOT NULL,
  Nombre VARCHAR(25) NOT NULL,
  Calle VARCHAR(25) NOT NULL,
  Cuidad VARCHAR(25) NOT NULL,
  PRIMARY KEY (ID_Cliente)
);

CREATE TABLE Cuenta
(
  NumCuenta INT NOT NULL,
  Saldo INT NOT NULL,
  FechaAcceso DATE NOT NULL,
  PRIMARY KEY (NumCuenta)
);

CREATE TABLE Banquero_Particular
(
  ID_empleado VARCHAR(9) NOT NULL,
  ID_Cliente VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_empleado),
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Banquero_Personal
(
  ID_empleado VARCHAR(9) NOT NULL,
  ID_Cliente VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_empleado),
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Descubierto
(
  NumCuenta INT NOT NULL,
  PRIMARY KEY (NumCuenta),
  FOREIGN KEY (NumCuenta) REFERENCES Cuenta(NumCuenta)
);

CREATE TABLE CuentaAhorro
(
  TipoInteres FLOAT NOT NULL,
  NumCuenta INT NOT NULL,
  PRIMARY KEY (NumCuenta),
  FOREIGN KEY (NumCuenta) REFERENCES Cuenta(NumCuenta)
);

CREATE TABLE Prestamo
(
  Importe INT NOT NULL,
  NumPrestamo VARCHAR(9) NOT NULL,
  Nombre VARCHAR(25),
  PRIMARY KEY (NumPrestamo),
  FOREIGN KEY (Nombre) REFERENCES Sucursal(Nombre)
);

CREATE TABLE Pago
(
  NumdePago VARCHAR(25) NOT NULL,
  FechaPago DATE NOT NULL,
  Importe INT NOT NULL,
  NumPrestamo VARCHAR(9) NOT NULL,
  PRIMARY KEY (NumdePago),
  FOREIGN KEY (NumPrestamo) REFERENCES Prestamo(NumPrestamo)
);

CREATE TABLE Tener3
(
  ID_Cliente VARCHAR(10) NOT NULL,
  NumCuenta INT NOT NULL,
  PRIMARY KEY (ID_Cliente, NumCuenta),
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
  FOREIGN KEY (NumCuenta) REFERENCES Cuenta(NumCuenta)
);

CREATE TABLE Asociado3
(
  ID_Cliente VARCHAR(10) NOT NULL,
  NumPrestamo VARCHAR(9) NOT NULL,
  PRIMARY KEY (ID_Cliente, NumPrestamo),
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
  FOREIGN KEY (NumPrestamo) REFERENCES Prestamo(NumPrestamo)
);

CREATE TABLE Empleado
(
  ID_Empleado VARCHAR(9) NOT NULL,
  NombreEmpleado VARCHAR(25) NOT NULL,
  NombreSubordinados VARCHAR(50) NOT NULL,
  SerJefe_ID_Empleado VARCHAR(9) NOT NULL,
  PRIMARY KEY (ID_Empleado),
  FOREIGN KEY (SerJefe_ID_Empleado) REFERENCES Empleado(ID_Empleado)
);

CREATE TABLE Contrato
(
  FechaInicio DATE NOT NULL,
  FechaFin DATE NOT NULL,
  NumContrato VARCHAR(9) NOT NULL,
  ID_Empleado VARCHAR(9) NOT NULL,
  PRIMARY KEY (NumContrato),
  FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);

CREATE TABLE NumTelf
(
  Prefijo INT NOT NULL,
  NumDistricto INT NOT NULL,
  Numero INT NOT NULL,
  ID_Empleado VARCHAR(9) NOT NULL,
  PRIMARY KEY (Prefijo, NumDistricto, Numero, ID_Empleado),
  FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);