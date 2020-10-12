CREATE DATABASE dbcompagnie_aerienne;

use dbcompagnie_aerienne;

-- Structure de la table `constructeur`

CREATE TABLE IF NOT EXISTS Constructeur
(IdConstructeur int(2) not null AUTO_INCREMENT,
NomConstrusteur varchar (50),
PRIMARY KEY (IdConstructeur)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

-- Contenu de la table `constructeur`

INSERT INTO Constructeur VALUES
("0","Aérospatiale"),
("0","Boeing"),
("0","Cessna"),
("0","Douglas");


-- Structure de la table `Aeroport`

CREATE TABLE IF NOT EXISTS Aeroport
(IdAeroport varchar(3) not null check (IdAeroport like "[A-Z]"),
NomAeroport varchar(150),
NomVilleDesservie varchar(150) null,
PRIMARY KEY (IdAeroport)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

-- Contenu de la table `Aeroport`

INSERT INTO Aeroport VALUES
("BAS","Poretta","Bastia"),
("BLA","Blagnac","Toulouse"),
("BRI","Brive","Brive"),
("CDG","Roissy","Paris"),
("GRE","Saint Geoir","Grenoble"),
("LYS","Saint exupéry","Lyon"),
("NAN","Saint Herblain","Nantes"),
("NIC","Nice cote d'azur","Nice"),
("ORL","Orly","Paris");

-- Structure de la table `Pilote`

CREATE TABLE IF NOT EXISTS Pilote
(IdPilote int(2) not null AUTO_INCREMENT,
NomPilote varchar(150) not null UNIQUE,
PrenomPilote varchar(150) not null UNIQUE,
PRIMARY KEY (IdPilote)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

-- Contenu de la table `Pilote`

INSERT INTO Pilote VALUES
("0","GAINSBOURG","Serge"),
("0","FERRAT","Jean"),
("0","NOUGARO","Claude"),
("0","SHUMMAN","Robert"),
("0","STROGOFF","Michel"),
("0","SORREL","Lucien"),
("0","TAVERNIER","Bertand"),
("0","FAYOLLE","Marc"),
("0","LECU","Regis");


-- Structure de la table `Type`

CREATE TABLE IF NOT EXISTS `Type`
(TypeAvion varchar(5)  not null,
Capacite int(4) not null DEFAULT 100,
CHECK (Capacite>=50 AND Capacite<=400),
IdConstructeur int(2) not null,
PRIMARY KEY (TypeAvion),
FOREIGN KEY IdConstructeur(IdConstructeur) REFERENCES Constructeur(IdConstructeur)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

-- Contenu de la table `Type`

INSERT INTO `Type` VALUES
("A320","300","1"),
("A340","350","1"),
("ATR42","50","1"),
("B707","250","2"),
("B727","300","2"),
("B747","400","2"),
("DC10","200","4");


-- Structure de la table `Avion`
CREATE TABLE IF NOT EXISTS Avion
(NumAvion int(5) AUTO_INCREMENT not null,
TypeAvion varchar (5) not null,
BaseAeroport varchar(3) not null,
PRIMARY KEY (NumAvion)
)ENGINE = INNODB DEFAULT CHARSET = latin1;



/* Contrainte table Avion */

ALTER TABLE Avion AUTO_INCREMENT=100;
ALTER TABLE Avion
  ADD CONSTRAINT BaseAeroport FOREIGN KEY (BaseAeroport) REFERENCES Aeroport (IdAeroport);
ALTER TABLE Avion
  ADD CONSTRAINT `Type` FOREIGN KEY (TypeAvion) REFERENCES `Type` (TypeAvion);

-- Contenu de la table `Avion`

INSERT INTO Avion VALUES
("0","A320","NIC"),
("0","B707","CDG"),
("0","A320","BLA"),
("0","DC10","BLA"),
("0","B747","ORL"),
("0","A320","GRE"),
("0","ATR42","CDG"),
("0","B727","LYS"),
("0","B727","NAN"),
("0","A340","BAS");

-- Structure de la table `Vol`

CREATE TABLE IF NOT EXISTS Vol
(NumVol varchar(5) not null check (Numvol like "IT[0-9][0-9][0-9]") ,
AeroportDept varchar(3) not null,
Hdepart Time not null,
AeroportArr varchar(3),
Harrivee Time not null,
PRIMARY KEY (NumVol)
)ENGINE = INNODB DEFAULT CHARSET = latin1;

-- Contrainte table vol 

ALTER TABLE Vol
ADD CONSTRAINT AeroportDept FOREIGN KEY (AeroportDept) REFERENCES Aeroport(IdAeroport);
ALTER TABLE Vol
ADD CONSTRAINT AeroportArr FOREIGN KEY (AeroportArr) REFERENCES Aeroport(IdAeroport);

-- Contenu de la table `Vol`

INSERT INTO Vol VALUES
("IT100","NIC","7:00","CDG","9:00"),
("IT101","ORL","11:00","BLA","12:00"),
("IT102","CDG","12:00","NIC","14:00"),
("IT103","GRE","9:00","BLA","11:00"),
("IT104","BLA","17:00","GRE","19:00"),
("IT105","LYS","6:00","ORL","7:00"),
("IT106","BAS","10:00","ORL","13:00"),
("IT107","NIC","7:00","BRI","8:00"),
("IT108","BRI","19:00","ORL","20:00"),
("IT109","NIC","18:00","ORL","19:00"),
("IT110","ORL","15:00","NIC","16:00"),
("IT111","NIC","17:00","NAN","19:00");

-- Structure de la table `Affectation`

CREATE TABLE IF NOT EXISTS Affectation (
  NumVol varchar(5) not null check (Numvol like "IT[0-9][0-9][0-9]"),
  DateVol date NOT NULL,
  NumAvion int(5) not null,
  IdPilote int(2) null,
  FOREIGN KEY NumVol (NumVol) REFERENCES Vol (NumVol),
  FOREIGN KEY IdPilote (IdPilote) REFERENCES Pilote (IdPilote)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Contenu de la table `Affectation`


INSERT INTO Affectation VALUES
("IT100","6 avril 2001","100","1"),
("IT100","7 avril 2001","101","2"),
("IT101","6 avril 2001","100","2"),
("IT101","7 avril 2001","103","4"),
("IT102","6 avril 2001","101","1"),
("IT102","7 avril 2001","102","3"),
("IT103","6 avril 2001","105","3"),
("IT103","7 avril 2001","104","2"),
("IT104","6 avril 2001","105","3"),
("IT104","7 avril 2001","107","8"),
("IT105","6 avril 2001","107","7"),
("IT105","7 avril 2001","106","7"),
("IT106","6 avril 2001","109","8"),
("IT106","7 avril 2001","104","5"),
("IT107","6 avril 2001","106","9"),
("IT107","7 avril 2001","103","8"),
("IT108","6 avril 2001","106","9"),
("IT108","7 avril 2001","106","5"),
("IT109","6 avril 2001","107","7"),
("IT109","7 avril 2001","105","1"),
("IT110","6 avril 2001","102","2"),
("IT110","7 avril 2001","104","3"),
("IT111","6 avril 2001","101","4"),
("IT111","7 avril 2001","100","8");