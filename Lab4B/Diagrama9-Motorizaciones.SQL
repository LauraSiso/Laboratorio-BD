CREATE TABLE Motorizaciones
(
  CodMotor VARCHAR(5) NOT NULL,
  PRIMARY KEY (CodMotor)
);

CREATE TABLE Hibrido
(
  CodMotor VARCHAR(5) NOT NULL,
  PRIMARY KEY (CodMotor),
  FOREIGN KEY (CodMotor) REFERENCES Motorizaciones(CodMotor)
);

CREATE TABLE Gasolina
(
  CodMotor VARCHAR(5) NOT NULL,
  PRIMARY KEY (CodMotor),
  FOREIGN KEY (CodMotor) REFERENCES Motorizaciones(CodMotor)
);

CREATE TABLE Gas
(
  CodMotor VARCHAR(5) NOT NULL,
  PRIMARY KEY (CodMotor),
  FOREIGN KEY (CodMotor) REFERENCES Motorizaciones(CodMotor)
);

CREATE TABLE Diesel
(
  CodMotor VARCHAR(5) NOT NULL,
  PRIMARY KEY (CodMotor),
  FOREIGN KEY (CodMotor) REFERENCES Motorizaciones(CodMotor)
);

CREATE TABLE Electrico
(
  CodMotor VARCHAR(5) NOT NULL,
  PRIMARY KEY (CodMotor),
  FOREIGN KEY (CodMotor) REFERENCES Motorizaciones(CodMotor)
);

CREATE TABLE Hidrogeno
(
  CodMotor VARCHAR(5) NOT NULL,
  PRIMARY KEY (CodMotor),
  FOREIGN KEY (CodMotor) REFERENCES Motorizaciones(CodMotor)
);

CREATE TABLE Coche
(
  NumBastidor VARCHAR(17) NOT NULL,
  PRIMARY KEY (NumBastidor)
);

CREATE TABLE Modelo
(
  CodModelo VARCHAR(5) NOT NULL,
  CodMotor VARCHAR(5) NOT NULL,
  NumBastidor VARCHAR(17) NOT NULL,
  PRIMARY KEY (CodModelo),
  FOREIGN KEY (CodMotor) REFERENCES Motorizaciones(CodMotor),
  FOREIGN KEY (NumBastidor) REFERENCES Coche(NumBastidor)
);