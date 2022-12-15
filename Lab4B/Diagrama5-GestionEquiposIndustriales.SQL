CREATE TABLE EquipoIndustrial
(
  CódEquipo VARCHAR(10) NOT NULL,
  PRIMARY KEY (CódEquipo)
);

CREATE TABLE ModeloEquipo
(
  CódModelo VARCHAR(10) NOT NULL,
  CódEquipo VARCHAR(10) NOT NULL,
  PRIMARY KEY (CódModelo),
  FOREIGN KEY (CódEquipo) REFERENCES EquipoIndustrial(CódEquipo)
);

CREATE TABLE Instalador
(
  NIF_I VARCHAR(9) NOT NULL,
  Nombre VARCHAR(10) NOT NULL,
  Calle VARCHAR(25) NOT NULL,
  CodPostal VARCHAR(5) NOT NULL,
  PRIMARY KEY (NIF_I)
);

CREATE TABLE Instalación
(
  CódInstalacion VARCHAR(10) NOT NULL,
  PRIMARY KEY (CódInstalacion)
);

CREATE TABLE Clientes
(
  NIF_C VARCHAR(9) NOT NULL,
  Nombre VARCHAR(25) NOT NULL,
  Calle VARCHAR(25) NOT NULL,
  CodPostal VARCHAR(5) NOT NULL,
  PRIMARY KEY (NIF_C)
);

CREATE TABLE Teléfono
(
  NumTelefono INT NOT NULL,
  PrefijoLocalidad INT NOT NULL,
  PrefijoPaís INT NOT NULL,
  NIF VARCHAR(9),
  NIF VARCHAR(9),
  PRIMARY KEY (NumTelefono, PrefijoLocalidad, PrefijoPaís),
  FOREIGN KEY (NIF) REFERENCES Instalador(NIF_I),
  FOREIGN KEY (NIF) REFERENCES Clientes(NIF_C)
);

CREATE TABLE Comprar
(
  FechaCompra INT NOT NULL,
  NIF VARCHAR(9) NOT NULL,
  CódEquipo VARCHAR(10) NOT NULL,
  PRIMARY KEY (NIF, CódEquipo),
  FOREIGN KEY (NIF) REFERENCES Clientes(NIF_C),
  FOREIGN KEY (CódEquipo) REFERENCES EquipoIndustrial(CódEquipo)
);

CREATE TABLE Montar
(
  CódEquipo VARCHAR(10) NOT NULL,
  NIF VARCHAR(9) NOT NULL,
  PRIMARY KEY (CódEquipo, NIF),
  FOREIGN KEY (CódEquipo) REFERENCES EquipoIndustrial(CódEquipo),
  FOREIGN KEY (NIF) REFERENCES Instalador(NIF_I)
);

CREATE TABLE Instalar
(
  FechaInstalación DATE NOT NULL,
  NumInstalaciones INT NOT NULL,
  NIF VARCHAR(9) NOT NULL,
  CódInstalacion VARCHAR(10) NOT NULL,
  PRIMARY KEY (NIF, CódInstalacion),
  FOREIGN KEY (NIF) REFERENCES Instalador(NIF_I),
  FOREIGN KEY (CódInstalacion) REFERENCES Instalación(CódInstalacion)
);