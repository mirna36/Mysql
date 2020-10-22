create DATABASE  if not EXISTS db_librairie

USE db_librairie

CREATE TABLE IF NOT EXISTS Auteur
(Id_auteur int(5) NOT NULL AUTO_INCREMENT,
Nom_auteur varchar(30) NOT NULL,
Prenom_auteur varchar(30) NOT NULL,
Pays_auteur varchar(20) NOT NULL,
Ville_auteur varchar(30),
PRIMARY KEY (Id_auteur)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

INSERT INTO Auteur VALUES
('0','Robert','Henry','France','Paris'),
('0','Durant','Pierre','France','Nice'),
('0','Smith','Ryan','USA','Chicago');

CREATE TABLE IF NOT EXISTS Editeur
(Id_editeur int(5) NOT NULL AUTO_INCREMENT,
Nom_editeur varchar(30) NOT NULL,
Pays_auteur varchar(20) NOT NULL,
PRIMARY KEY (Id_editeur)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

INSERT INTO Editeur VALUES
('0','Robert','France'),
('0','Nathan','France'),
('0','Uta','USA');

CREATE TABLE IF NOT EXISTS Theme
(Id_theme int(5) NOT NULL AUTO_INCREMENT,
Libelle_theme varchar(30) NOT NULL,
PRIMARY KEY (Id_theme)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

INSERT INTO Theme VALUES
('0','Nature'),
('0', 'Relation'),
('0','Famille'),
('0','Univer');


CREATE TABLE IF NOT EXISTS Rayon
(Id_Ra int(5) NOT NULL AUTO_INCREMENT,
Libelle_Ra varchar(30) NOT NULL,
PRIMARY KEY (Id_Ra)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

INSERT INTO Rayon VALUES
('0','Science'),
('0','Enfant'),
('0','Roman'),
('0','Litterature');

CREATE TABLE IF NOT EXISTS Utilisateur
(Id_Ut int(5) NOT NULL AUTO_INCREMENT,
Nom_Ut varchar(30) NOT NULL,
Prenom_Ut varchar(30) NOT NULL,
adress_Ut varchar (60),
CP_Ut int(5),
ville_Ut varchar(10),
email_Ut varchar (60) NOT NULL,
mdp_Ut varchar(30) NOT NULL,
Type_Ut varchar(10) NOT NULL,
PRIMARY KEY (Id_Ut)
)ENGINE = INNODB DEFAULT CHARSET = latin1;


INSERT INTO Utilisateur VALUES
('0','Thor','Alice','5 rue du champs','75015','Paris','alice@gmail.com','mi24','client');



CREATE TABLE IF NOT EXISTS Editer
(Id_editeur int(5) NOT null,
Id_auteur int(5) NOT null,
Contrat_edition varchar (15)NOT NULL,
PRIMARY KEY (Id_editeur,Id_auteur),
KEY Id_editeur (Id_editeur)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

INSERT INTO Editer VALUES
('1','2','2567'),
('2','2','1245'),
('3','3','1468');



CREATE TABLE IF NOT EXISTS Livre
(Id_li int(5) NOT NULL AUTO_INCREMENT,
Titre_li varchar (30) NOT NULL,
Ss_titre_li varchar (30),
date_pub_li date NOT NULL,
Resume_li TEXT (200) NOT NULL,
Num_isbn int (5) NOT NULL,
prix_li decimal(8,2) DEFAULT NULL,
Id_Ra int(5) NOT NULL,
PRIMARY KEY (Id_li),
FOREIGN KEY (Id_Ra) REFERENCES Rayon (Id_Ra)
)ENGINE = INNODB DEFAULT CHARSET = latin1;



INSERT INTO Livre VALUES
('0','Alice et son chien','Alice aventure 5','1994-12-09',"Alice a perdu son chien et tente de le retruver",'5678','6.50','3'),
('0',"L'Univer",'Atmosphère','1998-12-09',"Comment l'atmosphère protège notre terre",'8976','5.30','1');


CREATE TABLE IF NOT EXISTS Vente
(Id_vte int(5) NOT NULL AUTO_INCREMENT,
Num_vte int(5) NOT NULL,
dte_vte date NOT NULL,
qte_vte int(3) NOT NULL,
montant_vte decimal(8,2) DEFAULT NULL,
mode_de_paiement varchar(10),
Id_Ut int(5) NOT NULL,
PRIMARY KEY (Id_vte),
FOREIGN KEY (Id_Ut) REFERENCES Utilisateur (Id_Ut)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

INSERT INTO Vente VALUES
('0','457','2020-12-09','2','17.30','CB','1');

CREATE TABLE IF NOT EXISTS Commander
(Id_cde int(5) NOT NULL AUTO_INCREMENT,
qte_cde int(3) NOT NULL,
prix_Unit decimal(8,2) DEFAULT NOT NULL,
Id_li int(5) NOT NULL,
Id_vte int(5) NOT NULL,
PRIMARY KEY (Id_cde),
FOREIGN KEY  (Id_li ) REFERENCES Livre (Id_li ),
FOREIGN KEY  (Id_vte ) REFERENCES Vente (Id_vte )
)ENGINE = INNODB DEFAULT CHARSET = latin1;

INSERT INTO Commander VALUES
('0','2','6.50','1','1'),
('0','1','5.30','2','1');



CREATE TABLE IF NOT EXISTS Ranger
(Id_theme int(5) NOT NULL,
Id_Ra int(5) NOT NULL
PRIMARY KEY (Id_theme,Id_Ra),
KEY Id_Ra  (Id_Ra)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

INSERT INTO Ranger VALUES
('1','1'),
('2','3'),
('3','2'),
('4','1');

CREATE TABLE IF NOT EXISTS Commentaire
(Id_com int(5) NOT NULL AUTO_INCREMENT,
libelle_com text (150) NOT NULL,
note_com int(2),
Id_li int(5) NOT NULL,
Id_Ut int(5) NOT NULL,
PRIMARY KEY (Id_com),
FOREIGN KEY (Id_li) REFERENCES Livre (Id_li ),
FOREIGN KEY (Id_Ut) REFERENCES Utilisateur (Id_Ut)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

INSERT INTO Commentaire VALUES
('0','Livre très interessant','8','1','1');


CREATE TABLE IF NOT EXISTS Publier
(Id_li int(5) NOT NULL,
Id_editeur int(5) NOT null,
PRIMARY KEY (Id_li,Id_editeur),
KEY Id_editeur  (Id_editeur)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

INSERT INTO Publier VALUES
('1','2'),
('2','1');

CREATE TABLE IF NOT EXISTS Ecrire
(Id_li int(5) NOT NULL,
Id_auteur int(5) NOT null,
PRIMARY KEY (Id_li,Id_auteur),
KEY Id_auteur (Id_auteur)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

INSERT INTO Ecrire VALUES
('1','2'),
('2','3');






