
USE BD_Guarderia
GO

CREATE VIEW VW_Apoderado
AS
    SELECT Nom_Nino AS 'Nombre del Niño', FecNac_Nino AS 'Fecha de Nacimiento', Familiar.Nom_Fam AS 'Apoderado', Familiar.Rel_Fam AS 'Parentesco'
    FROM Nino
    INNER JOIN Familiar ON Nino.Cod_Nino = Familiar.Cod_Nino
GO

CREATE VIEW VW_Alimentos
AS
    SELECT Nom_Nino AS 'Nombre del Niño', Menu.Tip_Men AS 'Menú'
    FROM Nino
    INNER JOIN Menu ON Menu.Cod_Men = Nino.Cod_Men
GO

CREATE VIEW VW_Abonado
AS
    SELECT Nom_Abo AS 'Nombre del Abonador', Cue_Abo AS 'Cuenta', Nino.Nom_Nino AS 'Abonado'
    FROM Abonador
    INNER JOIN Nino ON Nino.Cod_Nino = Abonador.Cod_Nino
GO

CREATE VIEW VW_InformeGeneral
AS
    SELECT Nom_Nino AS 'Nombre del Niño', Menu.Tip_Men AS 'Menú', Familiar.Nom_Fam AS 'Familiar', Familiar.Rel_Fam AS 'Parentesco', Abonador.Nom_Abo AS 'Abonador'
    FROM Nino
    INNER JOIN Menu ON Menu.Cod_Men = Nino.Cod_Men
    INNER JOIN Familiar ON Familiar.Cod_Nino = Nino.Cod_Nino
    INNER JOIN Abonador ON Abonador.Cod_Nino = Nino.Cod_Nino
GO

CREATE VIEW VW_Menu
AS
    SELECT Nom_Nino AS 'Nombre del Niño', Menu.Tip_Men AS 'Menú'
    FROM Nino
    INNER JOIN Menu ON Menu.Cod_Men = Nino.Cod_Men
    WHERE Menu.Tip_Men = 'Normal'
GO