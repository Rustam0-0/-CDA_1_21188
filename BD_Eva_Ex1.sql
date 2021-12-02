CREATE DATABASE Eva_ex1;

USE Eva_ex1;

CREATE TABLE produit (
pro_num int PRIMARY KEY,
pro_libelle VARCHAR (50),
pro_description VARCHAR (50)
);

CREATE TABLE client (
cli_num int PRIMARY KEY,
cli_nom VARCHAR(50),
cli_adresse VARCHAR(50),
cli_tel VARCHAR(50)
);

CREATE TABLE commande (
com_num int PRIMARY KEY,
cli_num int,
 FOREIGN KEY (cli_num) REFERENCES client(cli_num),
com_date datetime,
com_obs VARCHAR(50)
);

CREATE TABLE est_compose (
com_num int,
 FOREIGN KEY (com_num) REFERENCES commande(com_num),
pro_num int,
 FOREIGN KEY (pro_num) REFERENCES produit(pro_num),
est_qte int
);

