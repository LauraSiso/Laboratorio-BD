CREATE TABLE Conflicto
(
  Heridos INT NOT NULL,
  Muertos INT NOT NULL,
  ID_Conflicto VARCHAR(15) NOT NULL,
  Nombre INT NOT NULL,
  PRIMARY KEY (ID_Conflicto)
);

CREATE TABLE Intervencion
(
  Fecha_Incorporación DATE NOT NULL,
  FechaSalida DATE NOT NULL,
  ID_Intervencion VARCHAR(10) NOT NULL,
  ID_Conflicto VARCHAR(15) NOT NULL,
  PRIMARY KEY (ID_Intervencion),
  FOREIGN KEY (ID_Conflicto) REFERENCES Conflicto(ID_Conflicto)
);

CREATE TABLE GrupoArmado
(
  Nombre VARCHAR(25) NOT NULL,
  CodGA VARCHAR(10) NOT NULL,
  PRIMARY KEY (CodGA)
);

CREATE TABLE Organizacion_Mediadora
(
  Nombre_Organizacion VARCHAR(25) NOT NULL,
  CodOrg VARCHAR(10) NOT NULL,
  Organizacion VARCHAR(25) NOT NULL,
  NumPersonas INT NOT NULL,
  Tipo VARCHAR(25) NOT NULL,
  PRIMARY KEY (CodOrg)
);

CREATE TABLE Division
(
  NumBarcos INT NOT NULL,
  NumAviones INT NOT NULL,
  NumTanques INT NOT NULL,
  NumHombres INT NOT NULL,
  ID_Division VARCHAR(10) NOT NULL,
  NumBajas INT NOT NULL,
  CodGA VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Division),
  FOREIGN KEY (CodGA) REFERENCES GrupoArmado(CodGA)
);

CREATE TABLE ArmasDisponibles
(
  Nombre INT NOT NULL,
  Num_Bastidor VARCHAR(17) NOT NULL,
  Capacidad_Destructiva INT NOT NULL,
  PRIMARY KEY (Num_Bastidor)
);

CREATE TABLE TraficanteArmas
(
  Nombre VARCHAR(15) NOT NULL,
  PRIMARY KEY (Nombre)
);

CREATE TABLE LiderPolitico
(
  Nombre VARCHAR(25) NOT NULL,
  Apoyos VARCHAR(25) NOT NULL,
  ID_Lider VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Lider)
);

CREATE TABLE Jefe_Militar
(
  ID_jefe VARCHAR(10) NOT NULL,
  Rango VARCHAR(15) NOT NULL,
  ID_Lider VARCHAR(10) NOT NULL,
  ID_Division VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_jefe, ID_Lider),
  FOREIGN KEY (ID_Lider) REFERENCES LiderPolitico(ID_Lider),
  FOREIGN KEY (ID_Division) REFERENCES Division(ID_Division)
);

CREATE TABLE Ayuda
(
  ID_Ayuda VARCHAR(15) NOT NULL,
  Tipo VARCHAR(15) NOT NULL,
  CodOrg VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Ayuda),
  FOREIGN KEY (CodOrg) REFERENCES Organizacion_Mediadora(CodOrg)
);

CREATE TABLE Territorial
(
  Region_Afectada INT NOT NULL,
  ID_Conflicto VARCHAR(15) NOT NULL,
  PRIMARY KEY (ID_Conflicto),
  FOREIGN KEY (ID_Conflicto) REFERENCES Conflicto(ID_Conflicto)
);

CREATE TABLE Religioso
(
  Religiones_afectadas INT NOT NULL,
  ID_Conflicto VARCHAR(15) NOT NULL,
  PRIMARY KEY (ID_Conflicto),
  FOREIGN KEY (ID_Conflicto) REFERENCES Conflicto(ID_Conflicto)
);

CREATE TABLE Racial
(
  Etnias INT NOT NULL,
  ID_Conflicto VARCHAR(15) NOT NULL,
  PRIMARY KEY (ID_Conflicto),
  FOREIGN KEY (ID_Conflicto) REFERENCES Conflicto(ID_Conflicto)
);

CREATE TABLE País
(
  Nombre VARCHAR(25) NOT NULL,
  PRIMARY KEY (Nombre)
);

CREATE TABLE Liderado
(
  ID_Lider VARCHAR(10) NOT NULL,
  CodGA VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Lider, CodGA),
  FOREIGN KEY (ID_Lider) REFERENCES LiderPolitico(ID_Lider),
  FOREIGN KEY (CodGA) REFERENCES GrupoArmado(CodGA)
);

CREATE TABLE Intervenir1
(
  ID_Intervencion VARCHAR(10) NOT NULL,
  CodGA VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Intervencion, CodGA),
  FOREIGN KEY (ID_Intervencion) REFERENCES Intervencion(ID_Intervencion),
  FOREIGN KEY (CodGA) REFERENCES GrupoArmado(CodGA)
);

CREATE TABLE Intervenir2
(
  ID_Intervencion VARCHAR(10) NOT NULL,
  CodOrg VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Intervencion, CodOrg),
  FOREIGN KEY (ID_Intervencion) REFERENCES Intervencion(ID_Intervencion),
  FOREIGN KEY (CodOrg) REFERENCES Organizacion_Mediadora(CodOrg)
);

CREATE TABLE Suministrar
(
  Cantidad INT NOT NULL,
  Num_Bastidor VARCHAR(17) NOT NULL,
  Nombre VARCHAR(15) NOT NULL,
  PRIMARY KEY (Num_Bastidor, Nombre),
  FOREIGN KEY (Num_Bastidor) REFERENCES ArmasDisponibles(Num_Bastidor),
  FOREIGN KEY (Nombre) REFERENCES TraficanteArmas(Nombre)
);

CREATE TABLE Pertenecer
(
  CodGA VARCHAR(10) NOT NULL,
  Num_Bastidor VARCHAR(17) NOT NULL,
  PRIMARY KEY (CodGA, Num_Bastidor),
  FOREIGN KEY (CodGA) REFERENCES GrupoArmado(CodGA),
  FOREIGN KEY (Num_Bastidor) REFERENCES ArmasDisponibles(Num_Bastidor)
);

CREATE TABLE Dialogar
(
  Texto_dialogado VARCHAR(500) NOT NULL,
  CodOrg VARCHAR(10) NOT NULL,
  ID_Lider VARCHAR(10) NOT NULL,
  PRIMARY KEY (CodOrg, ID_Lider),
  FOREIGN KEY (CodOrg) REFERENCES Organizacion_Mediadora(CodOrg),
  FOREIGN KEY (ID_Lider) REFERENCES LiderPolitico(ID_Lider)
);

CREATE TABLE Afectar
(
  ID_Conflicto VARCHAR(15) NOT NULL,
  Nombre VARCHAR(25) NOT NULL,
  PRIMARY KEY (ID_Conflicto, Nombre),
  FOREIGN KEY (ID_Conflicto) REFERENCES Conflicto(ID_Conflicto),
  FOREIGN KEY (Nombre) REFERENCES País(Nombre)
);