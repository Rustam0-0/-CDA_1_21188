CREATE DATABASE hotels;

CREATE TABLE Hotel (
    capacite_hotel int(11),
    categorie_hotel int(1),
    nom_hotel varchar(50),
    adresse_hotel varchar(200),
    num_hotel int(11),
    num_station int(11)
) ENGINE=INNODB;

CREATE TABLE Station (
    num_station int(11),
    nom_staton varchar(50)
) ENGINE=INNODB;

CREATE TABLE Chambre (
    capacite_cambre int(2),
    degre_confort varchar(50),
    exposition varchar(50),
    type_chambre varchar(50),
    num_chambre int(11),
    num_hotel int(11)
) ENGINE=INNODB;

CREATE TABLE Client (
    adresse_client varchar(200),
    nom_client varchar(200),
    prenom_client varchar(200),
    num_client int(11)
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

ALTER TABLE Hotel
ADD constraint hotel_id PRIMARY KEY (num_hotel);

ALTER TABLE Station
ADD constraint station_id PRIMARY KEY (num_station);

ALTER TABLE Chambre
ADD constraint chambre_id PRIMARY KEY (num_chambre);

ALTER TABLE Client
ADD constraint client_id PRIMARY KEY (num_client);

ALTER TABLE Reservation
ADD constraint res_fk_1 FOREIGN KEY (num_chambre) REFERENCES Chambre (num_chambre),
ADD constraint res_fk_2 FOREIGN KEY (num_client) REFERENCES Client (num_client);

ALTER TABLE Hotel
ADD constraint sta_fk FOREIGN KEY (num_station) REFERENCES Station (num_station);

ALTER TABLE Chambre
ADD constraint hot_fk FOREIGN KEY (num_hotel) REFERENCES Hotel (num_hotel);