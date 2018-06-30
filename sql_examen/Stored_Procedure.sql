
USE BD_Guarderia
GO

/* SP: GUARDAR REGISTRO EN LA TABLA MENU */

CREATE PROCEDURE sp_GuardarMenu
    @TipoMenu VARCHAR(50)
AS
    BEGIN
        INSERT INTO Menu
            (Tip_Men)
        VALUES
            (@TipoMenu)
        SELECT * FROM Menu
    END
GO

EXEC sp_GuardarMenu @TipoMenu = 'Ejecutivo'
GO
SELECT * FROM Menu
GO

/* SP: ELIMINAR REGISTRO DE LA TABLA MENU */
CREATE PROCEDURE sp_EliminarMenu
    @Codigo INT
AS
    BEGIN
        IF(SELECT Cod_Men
            FROM Menu
            WHERE Cod_Men = @Codigo) IS NULL
            PRINT 'EL CÓDIGO NO EXISTE'
        ELSE
            DELETE FROM Menu
            WHERE Cod_Men = @Codigo
    END    
GO

EXEC sp_EliminarMenu @Codigo = 3
GO

/* SP: LISTAR REGISTRO DE LA TABLA MENU */
CREATE PROCEDURE sp_ListarMenu
AS
    BEGIN
        SELECT * FROM Menu
    END
GO

EXEC sp_ListarMenu
GO

/* SP: GUARDAR REGISTRO EN LA TABLA NINO */
CREATE PROCEDURE sp_GuardarNino
    @NumMatricula VARCHAR(10),
    @Nombre VARCHAR(50),
    @FecNacimiento DATE,
    @FecIngreso DATE,
    @FecBaja DATE,
    @CodMenu INT
AS
    BEGIN
        INSERT INTO Nino
            (NumMat_Nino, Nom_Nino, FecNac_Nino, FecIng_Nino, FecBaja_Nino, Cod_Men)
        VALUES
            (@NumMatricula, @Nombre, @FecNacimiento, @FecIngreso, @FecBaja, @CodMenu)
        SELECT * FROM Nino
    END
GO

EXEC sp_GuardarNino @NumMatricula = 'G-12', @Nombre = 'Pepito', @FecNacimiento = '02/01/2016', @FecIngreso = '05/03/2018', @FecBaja = '', @CodMenu = '1'
GO

/* SP: ELIMINAR REGISTRO DE LA TABLA NINO */
CREATE PROCEDURE sp_EliminarNino
    @Codigo INT
AS
    BEGIN
        IF(SELECT Cod_Nino
            FROM Nino
            WHERE Cod_Nino = @Codigo) IS NULL
            PRINT 'EL CÓDIGO NO EXISTE'
        ELSE
            DELETE FROM Nino
            WHERE Cod_Nino = @Codigo
    END    
GO

EXEC sp_EliminarNino @Codigo = '12'
GO

/* SP: LISTAR REGISTROS DE LA TABLA NINO */
CREATE PROCEDURE sp_ListarNino
AS
    BEGIN
        SELECT * FROM Nino
    END
GO

EXEC sp_ListarNino
GO

/* SP: GUARDAR REGISTROS EN LA TABLA FAMILIAR */
CREATE PROCEDURE sp_GuardarFamiliar
    @Dni VARCHAR(8),
    @Nombre VARCHAR(50),
    @Direccion VARCHAR(50),
    @Telefono VARCHAR(9),
    @Relacion VARCHAR(50),
    @CodNino INT
AS
    BEGIN
        INSERT INTO Familiar
            (Dni_Fam, Nom_Fam, Dir_Fam, Tel_Fam, Rel_Fam, Cod_Nino)
        VALUES
            (@Dni, @Nombre, @Direccion, @Telefono, @Relacion, @CodNino)
        SELECT * FROM Familiar
    END
GO

EXEC sp_GuardarFamiliar @Dni = '75856965', @Nombre = 'Vania', @Direccion = 'San Luis', @Telefono = '965855444', @Relacion = 'Tía', @CodNino = '12'
GO

/* ELIMINAR REGISTROS DE LA TABLA FAMILIAR */
CREATE PROCEDURE sp_EliminarFamiliar
    @Codigo INT
AS
    BEGIN
        IF(SELECT Cod_Fam
            FROM Familiar
            WHERE Cod_Fam = @Codigo) IS NULL
            PRINT 'EL CÓDIGO NO EXISTE'
        ELSE
            DELETE FROM Familiar
            WHERE Cod_Fam = @Codigo
    END    
GO

EXEC sp_EliminarFamiliar @Codigo = '4'
GO

/* LISTAR REGISTROS DE LA TABLA FAMILIAR */
CREATE PROCEDURE sp_ListarFamiliar
AS
    BEGIN
        SELECT * FROM Familiar
    END
GO

EXEC sp_ListarFamiliar
GO