CREATE TABLE MTransporte
(
  CodMedio VARCHAR(5) NOT NULL,
  PRIMARY KEY (CodMedio)
);

CREATE TABLE Aereo
(
  CodMedio VARCHAR(5) NOT NULL,
  PRIMARY KEY (CodMedio),
  FOREIGN KEY (CodMedio) REFERENCES MTransporte(CodMedio)
);

CREATE TABLE Acuatico
(
  CodMedio VARCHAR(5) NOT NULL,
  PRIMARY KEY (CodMedio),
  FOREIGN KEY (CodMedio) REFERENCES MTransporte(CodMedio)
);

CREATE TABLE Terrestre
(
  CodMedio VARCHAR(5) NOT NULL,
  PRIMARY KEY (CodMedio),
  FOREIGN KEY (CodMedio) REFERENCES MTransporte(CodMedio)
);

CREATE TABLE Anfibio
(
  CodMedio VARCHAR(5) NOT NULL,
  PRIMARY KEY (CodMedio),
  FOREIGN KEY (CodMedio) REFERENCES MTransporte(CodMedio)
);

CREATE TABLE Aeroterrestre
(
  CodMedio VARCHAR(5) NOT NULL,
  PRIMARY KEY (CodMedio),
  FOREIGN KEY (CodMedio) REFERENCES MTransporte(CodMedio)
);