-- Modelo relacional según el diagrama de MySQL Workbench
-- Motor: MySQL 8.0+ / InnoDB

CREATE DATABASE IF NOT EXISTS empresa
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;

USE empresa;

CREATE TABLE IF NOT EXISTS Departamento (
    id_departamento     INT NOT NULL AUTO_INCREMENT,
    Nombre_Departamento VARCHAR(100) NOT NULL,
    ubicacion           VARCHAR(45) NOT NULL,
    CONSTRAINT pk_departamento PRIMARY KEY (id_departamento)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Empleado (
    id_empleado                   INT NOT NULL AUTO_INCREMENT,
    Nombre                        VARCHAR(45) NOT NULL,
    Apellido                      VARCHAR(45) NOT NULL,
    Edad                          INT NOT NULL,
    Salario                       DECIMAL(10,2) NOT NULL,
    Departamento_id_departamento  INT NOT NULL,
    CONSTRAINT pk_empleado PRIMARY KEY (id_empleado),
    INDEX ix_empleado_departamento (Departamento_id_departamento),
    CONSTRAINT fk_empleado_departamento
        FOREIGN KEY (Departamento_id_departamento)
        REFERENCES Departamento (id_departamento)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB;
