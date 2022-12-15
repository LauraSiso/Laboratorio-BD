CREATE TABLE Categoría
(
  ID_C INT NOT NULL,
  Nombre INT NOT NULL,
  Descripcion INT NOT NULL,
  PRIMARY KEY (ID_C)
);

CREATE TABLE Provedores
(
  PagWeb INT NOT NULL,
  Nombre VARCHAR(25) NOT NULL,
  CodProvedores VARCHAR(9) NOT NULL,
  Comunidad VARCHAR(25) NOT NULL,
  Ciudad VARCHAR(25) NOT NULL,
  Calle VARCHAR(25) NOT NULL,
  Numero INT NOT NULL,
  PRIMARY KEY (CodProvedores)
);

CREATE TABLE Clientes
(
  CodClientes VARCHAR(10) NOT NULL,
  Nombre VARCHAR(10) NOT NULL,
  Comunidad VARCHAR(25) NOT NULL,
  Calle VARCHAR(25) NOT NULL,
  Numero INT NOT NULL,
  Ciudad VARCHAR(25) NOT NULL,
  PRIMARY KEY (CodClientes)
);

CREATE TABLE Producto
(
  ID_P INT NOT NULL,
  Nombre INT NOT NULL,
  Stock INT NOT NULL,
  ID_C INT NOT NULL,
  PRIMARY KEY (ID_P),
  FOREIGN KEY (ID_C) REFERENCES Categoría(ID_C)
);

CREATE TABLE Venta
(
  ID_V VARCHAR(9) NOT NULL,
  Descuento INT NOT NULL,
  MontoFinal INT NOT NULL,
  Fecha INT NOT NULL,
  CodClientes VARCHAR(10),
  PRIMARY KEY (ID_V),
  FOREIGN KEY (CodClientes) REFERENCES Clientes(CodClientes)
);

CREATE TABLE Proveer
(
  NombreProvedor VARCHAR(25) NOT NULL,
  PrecioActual FLOAT NOT NULL,
  ID_P INT NOT NULL,
  CodProvedores VARCHAR(9) NOT NULL,
  PRIMARY KEY (ID_P, CodProvedores),
  FOREIGN KEY (ID_P) REFERENCES Producto(ID_P),
  FOREIGN KEY (CodProvedores) REFERENCES Provedores(CodProvedores)
);

CREATE TABLE AsociarProducto
(
  ID_P INT NOT NULL,
  ID_V VARCHAR(9) NOT NULL,
  PRIMARY KEY (ID_P, ID_V),
  FOREIGN KEY (ID_P) REFERENCES Producto(ID_P),
  FOREIGN KEY (ID_V) REFERENCES Venta(ID_V)
);

CREATE TABLE Telefono
(
  NumTelefono INT NOT NULL,
  NumDistricto INT NOT NULL,
  PrefijoPais INT NOT NULL,
  CodProvedores VARCHAR(9) NOT NULL,
  CodClientes VARCHAR(10) NOT NULL,
  PRIMARY KEY (NumTelefono, NumDistricto, PrefijoPais),
  FOREIGN KEY (CodProvedores) REFERENCES Provedores(CodProvedores),
  FOREIGN KEY (CodClientes) REFERENCES Clientes(CodClientes)
);