-- Modelo relacional: Departamento y Empleado
-- Motor: MySQL 8.0+

CREATE DATABASE IF NOT EXISTS empresa
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;

USE empresa;

CREATE TABLE IF NOT EXISTS Departamento (
    DeptID       INT NOT NULL AUTO_INCREMENT,
    NombreDepto  VARCHAR(100) NOT NULL,
    Ubicacion    VARCHAR(150) NOT NULL,
    CONSTRAINT pk_departamento PRIMARY KEY (DeptID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Empleado (
    EmpID     INT NOT NULL AUTO_INCREMENT,
    Nombre    VARCHAR(80) NOT NULL,
    Apellido  VARCHAR(80) NOT NULL,
    Edad      INT NOT NULL,
    Salario   DECIMAL(12,2) NOT NULL,
    DeptID    INT NOT NULL,
    CONSTRAINT pk_empleado PRIMARY KEY (EmpID),
    INDEX ix_empleado_deptid (DeptID),
    CONSTRAINT fk_empleado_departamento
        FOREIGN KEY (DeptID)
        REFERENCES Departamento (DeptID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB;
