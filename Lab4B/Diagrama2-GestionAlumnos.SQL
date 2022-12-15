CREATE TABLE Alumno
(
  NumMat VARCHAR(9) NOT NULL,
  Nombre VARCHAR(25) NOT NULL,
  Fecha_Nac. DATE NOT NULL,
  PRIMARY KEY (NumMat)
);

CREATE TABLE Especialidad
(
  CódEspecialidad VARCHAR(9) NOT NULL,
  Nombre_especialidad VARCHAR(9) NOT NULL,
  PRIMARY KEY (CódEspecialidad)
);

CREATE TABLE Profesor
(
  ID_P VARCHAR(7) NOT NULL,
  NIF_P VARCHAR(9) NOT NULL,
  Nombre VARCHAR(10) NOT NULL,
  CódEspecialidad VARCHAR(9) NOT NULL,
  PRIMARY KEY (ID_P),
  FOREIGN KEY (CódEspecialidad) REFERENCES Especialidad(CódEspecialidad)
);

CREATE TABLE Teléfono
(
  Prefijo_país INT NOT NULL,
  CódTeléfono INT NOT NULL,
  CódDistricto VARCHAR(9) NOT NULL,
  NumMat VARCHAR(9),
  ID_P VARCHAR(7),
  PRIMARY KEY (Prefijo_país, CódTeléfono, CódDistricto),
  FOREIGN KEY (NumMat) REFERENCES Alumno(NumMat),
  FOREIGN KEY (ID_P) REFERENCES Profesor(ID_P)
);

CREATE TABLE Asignatura
(
  CódAsignatura VARCHAR(9) NOT NULL,
  Nombre VARCHAR(25) NOT NULL,
  ID_P VARCHAR(7) NOT NULL,
  PRIMARY KEY (CódAsignatura),
  FOREIGN KEY (ID_P) REFERENCES Profesor(ID_P)
);

CREATE TABLE Matricular
(
  FechaMat DATE NOT NULL,
  CódAsignatura VARCHAR(9) NOT NULL,
  NumMat VARCHAR(9) NOT NULL,
  PRIMARY KEY (CódAsignatura, NumMat),
  FOREIGN KEY (CódAsignatura) REFERENCES Asignatura(CódAsignatura),
  FOREIGN KEY (NumMat) REFERENCES Alumno(NumMat)
);