CREATE TABLE Región
(
  ID_R VARCHAR(10) NOT NULL,
  Nombre VARCHAR(20) NOT NULL,
  PRIMARY KEY (ID_R)
);

CREATE TABLE Provincia
(
  CódProv VARCHAR(6) NOT NULL,
  Nombre VARCHAR(25) NOT NULL,
  ID_R VARCHAR(10) NOT NULL,
  PRIMARY KEY (CódProv),
  FOREIGN KEY (ID_R) REFERENCES Región(ID_R)
);

CREATE TABLE Localidad
(
  Códloc VARCHAR(9) NOT NULL,
  Nombre_loc VARCHAR(25) NOT NULL,
  CódProv VARCHAR(6) NOT NULL,
  PRIMARY KEY (Códloc),
  FOREIGN KEY (CódProv) REFERENCES Provincia(CódProv)
);

CREATE TABLE Teléfono
(
  CódDistricto VARCHAR(6) NOT NULL,
  CódTeléfono INT NOT NULL,
  PrefijoPaís INT NOT NULL,
  PRIMARY KEY (CódDistricto, CódTeléfono, PrefijoPaís)
);

CREATE TABLE empleado
(
  DNI_E VARCHAR(9) NOT NULL,
  ID_E VARCHAR(9) NOT NULL,
  Nombre VARCHAR(25) NOT NULL,
  Salario INT NOT NULL,
  Códloc VARCHAR(9) NOT NULL,
  CódDistricto VARCHAR(6) NOT NULL,
  CódTeléfono INT NOT NULL,
  PrefijoPaís INT NOT NULL,
  PRIMARY KEY (ID_E),
  FOREIGN KEY (Códloc) REFERENCES Localidad(Códloc),
  FOREIGN KEY (CódDistricto, CódTeléfono, PrefijoPaís) REFERENCES Teléfono(CódDistricto, CódTeléfono, PrefijoPaís)
);