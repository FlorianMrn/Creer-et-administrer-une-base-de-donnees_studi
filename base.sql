CREATE DATABASE reservation_cinema;
USE reservation_cinema;
 
CREATE TABLE USERS (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    email VARCHAR(255),
    date_naissance DATE,
    FOREIGN KEY(ticket) REFERENCES TICKETS(id)
);

INSERT INTO USERS(nom, prenom, email, date_naissance) VALUES ('julien', 'dupont', 'julien.dupont@studi.com', '2020-12-24');
INSERT INTO USERS(nom, prenom, email, date_naissance) VALUES ('Marie', 'dulle', 'marie.dulle@studi.com', '2020-03-18');

CREATE TABLE TARIFS (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    prix DECIMAL(4,2) NOT NULL
);

INSERT INTO TARIFS(nom, prix) VALUES ('Plein tarif', '9,20');
INSERT INTO TARIFS(nom, prix) VALUES ('Etudiant', '7,60');
INSERT INTO TARIFS(nom, prix) VALUES ('Moins de 14 ans', '5,90');

CREATE TABLE METHODES (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    methode_de_paiement VARCHAR(255) NOT NULL
);

INSERT INTO METHODES(methode_de_paiement) VALUES ('Sur place');
INSERT INTO METHODES(methode_de_paiement) VALUES ('En ligne');

CREATE TABLE TICKETS (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date_ticket DATE NOT NULL,
    FOREIGN KEY(prix) REFERENCES TARIFS(id),
    FOREIGN KEY(user) REFERENCES USERS(id),
    FOREIGN KEY(salle) REFERENCES SALLES(id)
    FOREIGN KEY(methode_de_paiement) REFERENCES METHODES(id)
);

CREATE TABLE CINEMAS (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    FOREIGN KEY(seances) REFERENCES SEANCES(id)
    FOREIGN KEY(salle) REFERENCES SALLES(id)
);

INSERT INTO CINEMAS(nom) VALUES ('Grand Rex');
INSERT INTO CINEMAS(nom) VALUES ('Gaumont');

CREATE TABLE SALLES (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_de_places INT NOT NULL,
    FOREIGN KEY(film) REFERENCES SEANCES(id)
);

CREATE TABLE SEANCES (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date_seance DATE NOT NULL,
    FOREIGN KEY(cinema) REFERENCES CINEMAS(id),
    FOREIGN KEY(salle) REFERENCES SALLES(id)
);









