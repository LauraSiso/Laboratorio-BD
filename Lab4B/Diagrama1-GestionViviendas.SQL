CREATE TABLE Municipio
(
  Códmunicipio VARCHAR(9) NOT NULL,
  Abreviatura VARCHAR(10) NOT NULL,
  Latitud FLOAT NOT NULL,
  Longitud FLOAT NOT NULL,
  PRIMARY KEY (Códmunicipio)
);

CREATE TABLE Personas
(
  NIF VARCHAR(9) NOT NULL,
  Nombre VARCHAR(25) NOT NULL,
  Apellido1 VARCHAR(25) NOT NULL,
  Apellido2 VARCHAR(25) NOT NULL,
  Sexo CHAR(1) NOT NULL,
  Fecha_nac. DATE NOT NULL,
  CódCatastro VARCHAR(9) NOT NULL,
  Códmunicipio VARCHAR(9) NOT NULL,
  Ser_cabeza_familia_NIF VARCHAR(9),
  PRIMARY KEY (NIF),
  FOREIGN KEY (CódCatastro) REFERENCES Vivienda(CódCatastro),
  FOREIGN KEY (Códmunicipio) REFERENCES Municipio(Códmunicipio),
  FOREIGN KEY (Ser_cabeza_familia_NIF) REFERENCES Personas(NIF)
);

CREATE TABLE Vivienda
(
  CódCatastro VARCHAR(9) NOT NULL,
  Superficie FLOAT NOT NULL,
  Nº_Hab. INT NOT NULL,
  Orientación CHAR(1) NOT NULL,
  CódRegistral VARCHAR(99) NOT NULL,
  Calle VARCHAR(25) NOT NULL,
  Nº INT NOT NULL,
  Portal INT NOT NULL,
  Altura FLOAT NOT NULL,
  Letra CHAR(1) NOT NULL,
  CódPostal VARCHAR(5) NOT NULL,
  NIF VARCHAR(9) NOT NULL,
  PRIMARY KEY (CódCatastro),
  FOREIGN KEY (NIF) REFERENCES Personas(NIF),
  UNIQUE (CódRegistral)
);

CREATE TABLE Nacionalidad
(
  CódPais VARCHAR(9) NOT NULL,
  Nombre_nacionalidad VARCHAR(25) NOT NULL,
  NIF VARCHAR(9) NOT NULL,
  PRIMARY KEY (CódPais),
  FOREIGN KEY (NIF) REFERENCES Personas(NIF)
);