CREATE TABLE Transacciones_digitales
(
  ID_Transaccion VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Transaccion)
);

CREATE TABLE Pagos
(
  ID_Transaccion VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Transaccion),
  FOREIGN KEY (ID_Transaccion) REFERENCES Transacciones_digitales(ID_Transaccion)
);

CREATE TABLE Intercambios
(
  ID_Transaccion VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Transaccion),
  FOREIGN KEY (ID_Transaccion) REFERENCES Transacciones_digitales(ID_Transaccion)
);

CREATE TABLE Ingresos
(
  ID_Transaccion VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Transaccion),
  FOREIGN KEY (ID_Transaccion) REFERENCES Transacciones_digitales(ID_Transaccion)
);

CREATE TABLE Criptomoneda
(
  CodCripto VARCHAR(5) NOT NULL,
  ID_Wallet VARCHAR(10) NOT NULL,
  PRIMARY KEY (CodCripto),
  FOREIGN KEY (ID_Wallet) REFERENCES Propietario(ID_Wallet)
);

CREATE TABLE Wallet
(
  ID_Wallet VARCHAR(10) NOT NULL,
  CodRegistro VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Wallet),
  FOREIGN KEY (CodRegistro) REFERENCES Registro(CodRegistro)
);

CREATE TABLE Propietario
(
  ID_Wallet VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Wallet),
  FOREIGN KEY (ID_Wallet) REFERENCES Wallet(ID_Wallet)
);

CREATE TABLE Usuario
(
  ID_Wallet VARCHAR(10) NOT NULL,
  PRIMARY KEY (ID_Wallet),
  FOREIGN KEY (ID_Wallet) REFERENCES Wallet(ID_Wallet)
);

CREATE TABLE Registro
(
  CodRegistro VARCHAR(10) NOT NULL,
  ID_Wallet VARCHAR(10) NOT NULL,
  PRIMARY KEY (CodRegistro),
  FOREIGN KEY (ID_Wallet) REFERENCES Usuario(ID_Wallet)
);