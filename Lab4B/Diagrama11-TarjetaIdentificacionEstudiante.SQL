CREATE TABLE Matricula
(
  CodMatricula VARCHAR(7) NOT NULL,
  PRIMARY KEY (CodMatricula)
);

CREATE TABLE Grado
(
  CodGrado VARCHAR(5) NOT NULL,
  PRIMARY KEY (CodGrado)
);

CREATE TABLE Alumno
(
  NIF VARCHAR(9) NOT NULL,
  CodMatricula VARCHAR(7) NOT NULL,
  PRIMARY KEY (NIF),
  FOREIGN KEY (CodMatricula) REFERENCES Matricula(CodMatricula)
);

CREATE TABLE TarjetaIdentificacion
(
  CodTarjeta VARCHAR(5) NOT NULL,
  NIF VARCHAR(9) NOT NULL,
  PRIMARY KEY (CodTarjeta),
  FOREIGN KEY (NIF) REFERENCES Alumno(NIF)
);

CREATE TABLE DocumentosAdmistrativos
(
  ID_Admistrativo VARCHAR(5) NOT NULL,
  NIF VARCHAR(9) NOT NULL,
  PRIMARY KEY (ID_Admistrativo),
  FOREIGN KEY (NIF) REFERENCES Alumno(NIF)
);

CREATE TABLE Curso
(
  CodCurso VARCHAR(5) NOT NULL,
  CodGrado VARCHAR(5) NOT NULL,
  CodMatricula VARCHAR(7) NOT NULL,
  PRIMARY KEY (CodCurso),
  FOREIGN KEY (CodGrado) REFERENCES Grado(CodGrado),
  FOREIGN KEY (CodMatricula) REFERENCES Matricula(CodMatricula)
);

CREATE TABLE Pago
(
  ID_Pago VARCHAR(5) NOT NULL,
  CodMatricula VARCHAR(7) NOT NULL,
  CodCurso VARCHAR(5) NOT NULL,
  PRIMARY KEY (ID_Pago),
  FOREIGN KEY (CodMatricula) REFERENCES Matricula(CodMatricula),
  FOREIGN KEY (CodCurso) REFERENCES Curso(CodCurso)
);