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

CREATE TABLE IF NOT EXISTS Editeur
(Id_editeur int(5) NOT NULL AUTO_INCREMENT,
Nom_editeur varchar(30) NOT NULL,
Pays_auteur varchar(20) NOT NULL,
PRIMARY KEY (Id_editeur)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

CREATE TABLE IF NOT EXISTS Theme
(Id_theme int(5) NOT NULL AUTO_INCREMENT,
Libelle_theme varchar(30) NOT NULL,
PRIMARY KEY (Id_theme)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

CREATE TABLE IF NOT EXISTS Rayon
(Id_Ra int(5) NOT NULL AUTO_INCREMENT,
Libelle_Ra varchar(30) NOT NULL,
PRIMARY KEY (Id_Ra)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

CREATE TABLE IF NOT EXISTS Utilisateur
(Id_Ut int(5) NOT NULL AUTO_INCREMENT,
email_Ut varchar (60) NOT NULL,
mdp_Ut varchar(30) NOT NULL,
Type_Ut varchar(10) NOT NULL,
PRIMARY KEY (Id_Ut)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

CREATE TABLE IF NOT EXISTS Editer
(Contrat.edition varchar (15)NOT NULL,
FOREIGN KEY Id_editeur (Id_editeur) REFERENCES Editeur (Id_editeur),
FOREIGN KEY Id_auteur (Id_auteur) REFERENCES Auteur(Id_auteur)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

CREATE TABLE IF NOT EXISTS Livre
(Id_li int(5) NOT NULL AUTO_INCREMENT,
Titre_li varchar(30) NOT NULL,
Ss_titre_li varchar(30) ,
date_pub_li date (10) NOT NULL,
Resume_li TEXT (200) NOT NULL,
Num_isbn int(5) NOT NULL,
prix_li int (5),
PRIMARY KEY (Id_li)
FOREIGN KEY Id_editeur (Id_editeur) REFERENCES Editeur (Id_editeur),
FOREIGN KEY Id_auteur (Id_auteur) REFERENCES Auteur(Id_auteur)
FOREIGN KEY Id_Ra (Id_Ra) REFERENCES Rayon (Id_Ra),
FOREIGN KEY Id_theme (Id_theme) REFERENCES Theme(Id_theme)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

CREATE TABLE IF NOT EXISTS Employe
(Id_Em int(5) NOT NULL AUTO_INCREMENT,
Nom_Em varchar(30) NOT NULL,
Nom_Em varchar(30) NOT NULL,
email_Em varchar (60) NOT NULL,
mdp_Em varchar(30) NOT NULL,
Type_EM varchar(10) NOT NULL,
PRIMARY KEY (Id_Em),
FOREIGN KEY Id_Ut (Id_Ut) REFERENCES Utilisateur(Id_Ut)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

CREATE TABLE IF NOT EXISTS Client
(Id_Clt int(5) NOT NULL AUTO_INCREMENT,
Nom_Clt varchar(30) NOT NULL,
Nom_Clt varchar(30) NOT NULL,
email_Clt varchar (60) NOT NULL,
mdp_Em varchar(30) NOT NULL,
Type_EM varchar(10) NOT NULL,
PRIMARY KEY (Id_Clt),
FOREIGN KEY Id_Ut (Id_Ut) REFERENCES Utilisateur(Id_Ut)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

CREATE TABLE IF NOT EXISTS Vente
(Id_vte int(5) NOT NULL AUTO_INCREMENT,
qte_vte int(3) NOT NULL,
PRIMARY KEY (Id_vte),
FOREIGN KEY Id_Clt  (Id_Clt ) REFERENCES Client (Id_Clt )
)ENGINE = INNODB DEFAULT CHARSET = latin1;

CREATE TABLE IF NOT EXISTS Commander
(
FOREIGN KEY Id_li  (Id_li ) REFERENCES Livre (Id_li )
FOREIGN KEY Id_vte  (Id_vte ) REFERENCES Vente (Id_vte )
)ENGINE = INNODB DEFAULT CHARSET = latin1;

CREATE TABLE IF NOT EXISTS Paiement

CREATE TABLE IF NOT EXISTS Ranger

CREATE TABLE IF NOT EXISTS Commentaire

CREATE TABLE IF NOT EXISTS Achat





