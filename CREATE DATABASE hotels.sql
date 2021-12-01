CREATE DATABASE hotels;

CREATE TABLE Hotel (
    num_hotel int(11) AUTO_INCREMENT,
    capacite_hotel int(11),
    categorie_hotel int(1),
    nom_hotel varchar(50),
    adresse_hotel varchar(200),
    num_station int(11),
    PRIMARY KEY (num_hotel)
) ENGINE=INNODB;

CREATE TABLE Station (
    num_station int(11) AUTO_INCREMENT,
    nom_station varchar(50),
    PRIMARY KEY (num_station)
) ENGINE=INNODB;

CREATE TABLE Chambre (
    num_chambre int(11) AUTO_INCREMENT,
    capacite_cambre int(2),
    degre_confort varchar(50),
    exposition varchar(50),
    type_chambre varchar(50),
    num_hotel int(11),
    PRIMARY KEY (num_chambre)
) ENGINE=INNODB;

CREATE TABLE Client (
    num_client int(11) AUTO_INCREMENT,
    adresse_client varchar(200),
    nom_client varchar(200),
    prenom_client varchar(200),
    PRIMARY KEY (num_client)
) ENGINE=INNODB;

CREATE TABLE Reservation (
    num_chambre int(11),
    num_client int(11),
    date_debut date,
    date_fin date,
    date_reservation date,
    montant_arrhes decimal(10,2),
    prix_total decimal(10,2)
) ENGINE=INNODB;

/*ALTER TABLE Hotel
ADD constraint hotel_id PRIMARY KEY (num_hotel);

ALTER TABLE Station
ADD constraint station_id PRIMARY KEY (num_station);

ALTER TABLE Chambre
ADD constraint chambre_id PRIMARY KEY (num_chambre);

ALTER TABLE Client
ADD constraint client_id PRIMARY KEY (num_client); */

ALTER TABLE Reservation
ADD constraint res_fk_1 FOREIGN KEY (num_chambre) REFERENCES Chambre (num_chambre),
ADD constraint res_fk_2 FOREIGN KEY (num_client) REFERENCES Client (num_client);

ALTER TABLE Hotel
ADD constraint sta_fk FOREIGN KEY (num_station) REFERENCES Station (num_station);

ALTER TABLE Chambre
ADD constraint hot_fk FOREIGN KEY (num_hotel) REFERENCES Hotel (num_hotel);

/*ajoute des stations */
INSERT INTO Station (nom_station)
VALUES ('Auron'), ('Chabanon'), ('Risoul');

/*ajoute des hotels */
INSERT INTO Hotel (nom_hotel, num_station)
VALUES ('Edelweiss', 1), ('Le Blainon', 1), ('Le Régalivou', 1);

INSERT INTO Hotel (nom_hotel, num_station)
VALUES ('Le Blanchon', 2), ('Chez le Poète', 2), ('Le Relais de la Forge', 2);

INSERT INTO Hotel (nom_hotel, num_station)
VALUES ('La maison de Joséphine', 3), ('Le Chardon bleu', 3), ('Le Rochasson', 3);

/*ajoute des chambres */

INSERT INTO Chambre (num_hotel, type_chambre, capacite_cambre)
SELECT num_hotel,'Standard', 2 FROM Hotel
WHERE nom_hotel = 'Edelweiss';

INSERT INTO Chambre (num_hotel, type_chambre, capacite_cambre)
SELECT num_hotel,'Familiales', 5 FROM Hotel
WHERE nom_hotel = 'Edelweiss';

INSERT INTO Chambre (num_hotel, type_chambre, capacite_cambre)
SELECT num_hotel,'Appartements', 4 FROM Hotel
WHERE nom_hotel = 'Edelweiss';

INSERT INTO Chambre (num_hotel, type_chambre, capacite_cambre)
SELECT num_hotel,'Chambre simple', 1 FROM Hotel
WHERE nom_hotel = 'Le Blainon';

INSERT INTO Chambre (num_hotel, type_chambre, capacite_cambre)
SELECT num_hotel,'Chambre double', 2 FROM Hotel
WHERE nom_hotel = 'Le Blainon';

INSERT INTO Chambre (num_hotel, type_chambre, capacite_cambre)
SELECT num_hotel,'Chambre dortoir', 7 FROM Hotel
WHERE nom_hotel = 'Le Blainon';

INSERT INTO Chambre (num_hotel, type_chambre, capacite_cambre)
SELECT num_hotel,'Standard', 2 FROM Hotel
WHERE nom_hotel = 'Le Régalivou';

INSERT INTO Chambre (num_hotel, type_chambre, capacite_cambre)
SELECT num_hotel,'Chambre triple ', 3 FROM Hotel
WHERE nom_hotel = 'Le Régalivou';

INSERT INTO Chambre (num_hotel, type_chambre, capacite_cambre)
SELECT num_hotel,'Chambre quadruple', 4 FROM Hotel
WHERE nom_hotel = 'Le Régalivou';


INSERT INTO Chambre (num_hotel, type_chambre, capacite_cambre)
values 
    (2, 'std', 10), (2, 'std', 10), (2, 'std', 10), (2, 'std', 10), (2, 'std', 10),