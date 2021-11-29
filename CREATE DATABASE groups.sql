CREATE DATABASE groups;

CREATE TABLE Personne (
    per_num int(11) not null auto_increment,
    per_nom varchar(50),
    per_prenom varchar(50),
    per_adress varchar(200),
    per_ville varchar(50),
    PRIMARY KEY (per_num)
) ENGINE=INNODB;

CREATE TABLE Groupe (
    gro_num int(11) not null auto_increment,
    gro_libelle varchar(200),
    PRIMARY KEY (gro_num)
) ENGINE=INNODB;

CREATE TABLE Appartient (
    per_num int(11) not null,
    gro_num int(11) not null,
    FOREIGN KEY (per_num) REFERENCES Personne (per_num),
    FOREIGN KEY (gro_num) REFERENCES Groupe (gro_num)
) ENGINE=INNODB;