CREATE TABLE Editorial
(
  CodEditorial VARCHAR(10) NOT NULL,
  PRIMARY KEY (CodEditorial)
);

CREATE TABLE Sucursal
(
  CodSucursales VARCHAR(9) NOT NULL,
  CodPostal VARCHAR(5) NOT NULL,
  Calle VARCHAR(25) NOT NULL,
  CodEditorial VARCHAR(10) NOT NULL,
  PRIMARY KEY (CodSucursales),
  FOREIGN KEY (CodEditorial) REFERENCES Editorial(CodEditorial)
);

CREATE TABLE Empleado
(
  DNI VARCHAR(9) NOT NULL,
  CodSucursales VARCHAR(9) NOT NULL,
  PRIMARY KEY (DNI),
  FOREIGN KEY (CodSucursales) REFERENCES Sucursal(CodSucursales)
);

CREATE TABLE Periodista
(
  Especialidad VARCHAR(25) NOT NULL,
  DNI VARCHAR(9) NOT NULL,
  CodEditorial VARCHAR(10) NOT NULL,
  PRIMARY KEY (DNI),
  FOREIGN KEY (CodEditorial) REFERENCES Editorial(CodEditorial)
);

CREATE TABLE Revista
(
  Titulo VARCHAR(25) NOT NULL,
  Tipo VARCHAR(6) NOT NULL,
  NumRegistro VARCHAR(10) NOT NULL,
  NumEjemplares INT NOT NULL,
  NumPaginas INT NOT NULL,
  Num INT NOT NULL,
  Fecha DATE NOT NULL,
  DNI VARCHAR(9) NOT NULL,
  CodSucursales VARCHAR(9) NOT NULL,
  PRIMARY KEY (NumRegistro),
  FOREIGN KEY (DNI) REFERENCES Periodista(DNI),
  FOREIGN KEY (CodSucursales) REFERENCES Sucursal(CodSucursales)
);

CREATE TABLE Teléfono
(
  NumDistricto INT NOT NULL,
  PrefijoPais INT NOT NULL,
  NumTelefono INT NOT NULL,
  DNI VARCHAR(9),
  CodSucursales VARCHAR(9),
  PRIMARY KEY (NumDistricto, PrefijoPais, NumTelefono),
  FOREIGN KEY (DNI) REFERENCES Empleado(DNI),
  FOREIGN KEY (CodSucursales) REFERENCES Sucursal(CodSucursales)
);