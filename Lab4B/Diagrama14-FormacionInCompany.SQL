CREATE TABLE Curso
(
  CodCurso VARCHAR(9) NOT NULL,
  Denominacion VARCHAR(25) NOT NULL,
  Descripcion VARCHAR(200) NOT NULL,
  Numero_horas_ INT NOT NULL,
  Coste INT NOT NULL,
  PRIMARY KEY (CodCurso)
);

CREATE TABLE Edicion
(
  Lugar VARCHAR(25) NOT NULL,
  Formato VARCHAR(25) NOT NULL,
  Horario CHAR(1) NOT NULL,
  CodEdición VARCHAR(8) NOT NULL,
  CodCurso VARCHAR(9) NOT NULL,
  PRIMARY KEY (CodEdición),
  FOREIGN KEY (CodCurso) REFERENCES Curso(CodCurso)
);

CREATE TABLE Matriculado
(
  NIF VARCHAR(9) NOT NULL,
  CodEdición VARCHAR(8) NOT NULL,
  PRIMARY KEY (CodEdición),
  FOREIGN KEY (CodEdición) REFERENCES Edicion(CodEdición),
  UNIQUE (NIF)
);

CREATE TABLE Asignado
(
  CodEdición VARCHAR(8) NOT NULL,
  PRIMARY KEY (CodEdición),
  FOREIGN KEY (CodEdición) REFERENCES Edicion(CodEdición)
);

CREATE TABLE Prerequisito
(
  Cod_Prerequisito CHAR(9) NOT NULL,
  CodCurso VARCHAR(9) NOT NULL,
  PRIMARY KEY (Cod_Prerequisito),
  FOREIGN KEY (CodCurso) REFERENCES Curso(CodCurso)
);

CREATE TABLE Obligatorio
(
  Cod_Prerequisito CHAR(9) NOT NULL,
  PRIMARY KEY (Cod_Prerequisito),
  FOREIGN KEY (Cod_Prerequisito) REFERENCES Prerequisito(Cod_Prerequisito)
);

CREATE TABLE Recomendacion
(
  Cod_Prerequisito CHAR(9) NOT NULL,
  PRIMARY KEY (Cod_Prerequisito),
  FOREIGN KEY (Cod_Prerequisito) REFERENCES Prerequisito(Cod_Prerequisito)
);

CREATE TABLE Profesor
(
  NIF VARCHAR(9) NOT NULL,
  FNacimiento DATE NOT NULL,
  Nacionalidad VARCHAR(25) NOT NULL,
  Sexo CHAR(1) NOT NULL,
  NumHijos INT NOT NULL,
  Salario FLOAT NOT NULL,
  Acreditacion VARCHAR(10) NOT NULL,
  CodEdición VARCHAR(8),
  PRIMARY KEY (NIF),
  FOREIGN KEY (CodEdición) REFERENCES Asignado(CodEdición)
);