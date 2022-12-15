CREATE TABLE Departamento
(
  Código_D VARCHAR(6) NOT NULL,
  Localización VARCHAR(25) NOT NULL,
  Nombre VARCHAR(25) NOT NULL,
  PRIMARY KEY (Código_D)
);

CREATE TABLE Empleado
(
  ID_E VARCHAR(9) NOT NULL,
  DNI_E VARCHAR(9) NOT NULL,
  Nombre VARCHAR(25) NOT NULL,
  Salario FLOAT NOT NULL,
  Código_D VARCHAR(6) NOT NULL,
  serJefe_ID_E VARCHAR(9) NOT NULL,
  PRIMARY KEY (ID_E),
  FOREIGN KEY (Código_D) REFERENCES Departamento(Código_D),
  FOREIGN KEY (serJefe_ID_E) REFERENCES Empleado(ID_E)
);

CREATE TABLE Telefono
(
  CódDistricto VARCHAR(7) NOT NULL,
  PrefijoPaís INT NOT NULL,
  NumTeléfono INT NOT NULL,
  ID_E VARCHAR(9) NOT NULL,
  PRIMARY KEY (CódDistricto, PrefijoPaís, NumTeléfono),
  FOREIGN KEY (ID_E) REFERENCES Empleado(ID_E)
);