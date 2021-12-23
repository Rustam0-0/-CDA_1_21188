-- 1. modif_reservation : interdire la modification des réservations (on autorise l'ajout et la suppression)
DELIMITER |
CREATE TRIGGER modif_reservation_before
BEFORE UPDATE 
ON reservation
FOR EACH ROW
BEGIN    
    SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Modification est interdite!';
END |
DELIMITER ;

-- pour tester
UPDATE reservation
SET reservation.date_res = '2020-01-01'
WHERE reservation.id_res = 1;

-- 2. insert_reservation : interdire l'ajout de réservation pour les hôtels possédant déjà 10 réservations

-- pour vérifier
SELECT num_hotel, COUNT(num_hotel) AS nombre FROM reservation
GROUP BY num_hotel
HAVING nombre > 10;

DELIMITER |
CREATE TRIGGER insert_reservation
BEFORE INSERT 
ON reservation
FOR EACH ROW
BEGIN
    IF (NEW.num_hotel IN (
        SELECT num_hotel
        FROM reservation
        GROUP BY num_hotel
        HAVING COUNT(num_hotel) > 10)
    	)
    THEN
    SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Hotel est ocupé';
    END IF;
END |
DELIMITER ;

-- pour tester
INSERT INTO `reservation` (`num_client`,`num_hotel`,`date_res`)
VALUES (4,5,"2021-07-08 03:22:54");


-- 3. nsert_reservation2 : interdire les réservations si le client possède déjà 3 réservations

-- pour vérifier
SELECT num_client, COUNT(num_client) AS nombre
FROM reservation
GROUP BY num_client

DELIMITER |
CREATE TRIGGER insert_reservation2
BEFORE INSERT 
ON reservation
FOR EACH ROW
BEGIN
    IF (NEW.num_client IN (
        SELECT num_client
        FROM reservation
        GROUP BY num_client
        HAVING COUNT(num_client) > 3)
    	)
    THEN
    SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Trois réservations est maximum';
    END IF;
END |
DELIMITER ;

-- pour tester
INSERT INTO `reservation` (`num_client`,`num_hotel`,`date_res`)
VALUES (4,12,"2021-07-08 03:22:54");


--4. insert_chambre : lors d'une insertion, on calcule le total des capacités des chambres pour l'hôtel,
-- si ce total est supérieur à 15 (50), on interdit l'insertion de la chambre

-- pour vérifier
SELECT num_hotel, SUM(capacite_chambre) AS total_cap
FROM hotel
NATURAL JOIN chambre
GROUP BY 1;

DELIMITER |
CREATE TRIGGER insert_chambre
BEFORE INSERT 
ON chambre
FOR EACH ROW
BEGIN
    IF (NEW.num_hotel IN (
        SELECT num_hotel
        FROM hotel
        NATURAL JOIN chambre
        GROUP BY 1
        HAVING SUM(capacite_chambre) >15)
    	)
    THEN
    SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Total des capacités est maximum 15';
    END IF;
END |
DELIMITER ;

-- pour tester
INSERT INTO `chambre` (`capacite_chambre`,`type_chambre`,`num_hotel`)
VALUES (4,"familiales",5);
