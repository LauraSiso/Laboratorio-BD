CREATE TABLE Motor
(
  CodHibrido VARCHAR(10) NOT NULL,
  PRIMARY KEY (CodHibrido)
);

CREATE TABLE Termico
(
  Autonomia INT NOT NULL,
  CodHibrido VARCHAR(10) NOT NULL,
  PRIMARY KEY (CodHibrido),
  FOREIGN KEY (CodHibrido) REFERENCES Motor(CodHibrido)
);

CREATE TABLE Electrico
(
  Consumo INT NOT NULL,
  CodHibrido VARCHAR(10) NOT NULL,
  PRIMARY KEY (CodHibrido),
  FOREIGN KEY (CodHibrido) REFERENCES Motor(CodHibrido)
);

CREATE TABLE Hibrido
(
  Consumo INT NOT NULL,
  Autonomía INT NOT NULL,
  CodHibrido VARCHAR(10) NOT NULL,
  PRIMARY KEY (CodHibrido),
  FOREIGN KEY (CodHibrido) REFERENCES Motor(CodHibrido)
);

CREATE TABLE Escuderia
(
  NombreEscuderia VARCHAR(25) NOT NULL,
  PRIMARY KEY (NombreEscuderia)
);

CREATE TABLE Modelo
(
  NumPatente VARCHAR(5) NOT NULL,
  CodHibrido VARCHAR(10) NOT NULL,
  NombreEscuderia VARCHAR(25) NOT NULL,
  PRIMARY KEY (NumPatente),
  FOREIGN KEY (CodHibrido) REFERENCES Motor(CodHibrido),
  FOREIGN KEY (NombreEscuderia) REFERENCES Escuderia(NombreEscuderia)
);