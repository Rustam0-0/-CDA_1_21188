-- Exercice 1 : création d'une procédure stockée sans paramètre
DELIMITER |
CREATE PROCEDURE Lst_fournis()
BEGIN
SELECT entcom.numfou FROM entcom;
END |
DELIMITER;

CALL Lst_fournis;

SHOW CREATE PROCEDURE Lst_fournis;