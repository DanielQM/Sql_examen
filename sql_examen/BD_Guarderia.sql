-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-06-30 14:23:09.845

-- tables
-- Table: Abonador

/*DROP DATABASE BD_Guarderia*/

CREATE DATABASE BD_Guarderia
GO

USE BD_Guarderia
GO

CREATE TABLE Abonador (
    Cod_Abo int PRIMARY KEY IDENTITY(1,1)  NOT NULL,
    Dni_Abo varchar(8)  NOT NULL,
    Nom_Abo varchar(50)  NOT NULL,
    Dir_Abo varchar(50)  NOT NULL,
    Tel_Abo varchar(9)  NOT NULL,
    Cue_Abo varchar(20)  NOT NULL,
    Cod_Nino int  NOT NULL
);
GO

-- Table: Familiar
CREATE TABLE Familiar (
    Cod_Fam int PRIMARY KEY IDENTITY(1,1)  NOT NULL,
    Dni_Fam varchar(8)  NOT NULL,
    Nom_Fam varchar(50)  NOT NULL,
    Dir_Fam varchar(50)  NOT NULL,
    Tel_Fam varchar(9)  NOT NULL,
    Rel_Fam varchar(50)  NOT NULL,
    Cod_Nino int  NOT NULL
);
GO

-- Table: Menu
CREATE TABLE Menu (
    Cod_Men int PRIMARY KEY IDENTITY(1,1)  NOT NULL,
    Tip_Men varchar(50)  NOT NULL
);
GO

-- Table: Nino
CREATE TABLE Nino (
    Cod_Nino int PRIMARY KEY IDENTITY(1,1)  NOT NULL,
    NumMat_Nino varchar(10)  NOT NULL,
    Nom_Nino varchar(50)  NOT NULL,
    FecNac_Nino date  NOT NULL,
    FecIng_Nino date  NOT NULL,
    FecBaja_Nino date  NOT NULL,
    Cod_Men int  NOT NULL,
);
GO

-- foreign keys
-- Reference: Abonador_Nino (table: Abonador)
ALTER TABLE Abonador ADD CONSTRAINT Abonador_Nino
    FOREIGN KEY (Cod_Nino)
    REFERENCES Nino (Cod_Nino);
GO

-- Reference: Familiar_Nino (table: Familiar)
ALTER TABLE Familiar ADD CONSTRAINT Familiar_Nino
    FOREIGN KEY (Cod_Nino)
    REFERENCES Nino (Cod_Nino);
GO

-- Reference: Nino_Menu (table: Nino)
ALTER TABLE Nino ADD CONSTRAINT Nino_Menu
    FOREIGN KEY (Cod_Men)
    REFERENCES Menu (Cod_Men);
GO

-- End of file.