-- A/ Création du schéma de la base de données

-- Table pour les stades
create table Stade( 
	IdStade number(2) NOT NULL, 
	nomStade varchar2(30) NOT NULL, 
    codePostale number(5) NOT NULL, 
    ville varchar2(30) NOT NULL, 
 
    primary key(Idstade) 
);

-- Table pour les clubs de foot
create table club ( 
	IdClub number(2) NOT NULL, 
    nomClub varchar2(30) NOT NULL, 
    fondation number(4) NOT NULL, 
    ville varchar2(30) NOT NULL, 
	IdStade number(2) NOT NULL, 
 
    primary key(IdClub), 
    foreign key (IdStade) references Stade(IdStade) 
);

-- Table pour les matchs
CREATE TABLE Matchs ( 
    IdMatch number(2) NOT NULL, 
	score varchar2(10) NOT NULL, 
	dateMatch date NOT NULL, 
	IdStade number(2) NOT NULL, 
	IdClubDomicile number(2) NOT NULL, 
	IdClubExterieur number(2) NOT NULL, 
     
    PRIMARY KEY (IdMatch), 
    FOREIGN KEY (IdStade) REFERENCES Stade(IdStade), 
    FOREIGN KEY (IdClubDomicile) REFERENCES Club(IDClub), 
	FOREIGN KEY (IdClubExterieur) REFERENCES Club(IDClub) 
);

-- Table pour les trophées
CREATE TABLE Trophees ( 
    IdTrophee number(2) NOT NULL, 
    nomTrophee varchar2(30) NOT NULL, 
    anneeVictoire number(4) NOT NULL, 
    IdClubGagnant number(2), 
 
    PRIMARY KEY (IdTrophee), 
    FOREIGN KEY (IdClubGagnant) REFERENCES Club(IDClub)
);

-- Table pour les personnels du Stade
create table PersonnelStade( 
	IDPersonnel number(2) NOT NULL, 
    nom varchar2(30) NOT NULL, 
	prenom varchar2(30) NOT NULL, 
	fonction varchar2(30) NOT NULL, 
	IdStade number(2) NOT NULL, 
     
	primary key(IDPersonnel), 
    foreign key (IdStade) references Stade(IdStade)
);

-- Table pour les Personnes qui assite un match
create table Personne (
	IDPersonne number(2) NOT NULL,
    nomP varchar2(30) NOT NULL,
    prenomP varchar2(30) NOT NULL,
    email varchar2(50) NOT NULL,

	primary key(IDPersonne)
);


-- Créons les tables est_abonné et assiste qui sont des associations binaires (x-N)-(x,N)
-- Table est_abonné qui prend les clées des tables Stade et Personne
create table est_abonne(
	IdStade number(2) NOT NULL,
    IDPersonne number(2) NOT NULL,
	abonne number(1) NOT NULL CHECK (abonne IN (0, 1)),
    dateDebut date,
    dateFin date,
    
    foreign key (IDPersonne) references Personne(IDPersonne),
	foreign key (IdStade) references Stade(IdStade)
);

-- Table assiste
create table assiste (
    IDPersonne number(2) NOT NULL,
    IdMatch number(2) NOT NULL,
    prixTicket number(5) not null,
    
    foreign key (IDPersonne) references Personne(IDPersonne),
	foreign key (IdMatch) references Matchs(IdMatch)
);






-- B/ Jeu de données

-- 1. Insertion des jeux de données avc insert
-- Jeu de données pour la table Stade
INSERT INTO Stade VALUES (1, 'Parc des Princes', 75016, 'Paris');
INSERT INTO Stade VALUES (2, 'Stade Charléty', 75013, 'Paris');
INSERT INTO Stade VALUES (3, 'Stade Groupama Stadium', 69001, 'Lyon');
INSERT INTO Stade VALUES (4, 'Stade Decathlon Arena', 59000, 'Lille');
INSERT INTO Stade VALUES (5, 'Stade Matmut Atlantique', 33000, 'Bordeaux');
INSERT INTO Stade VALUES (6, 'Stade de la Beaujoire', 44000, 'Nantes');
INSERT INTO Stade VALUES (7, 'Stade Auguste-Delaune', 51100, 'Reims');
INSERT INTO Stade VALUES (8, 'Stade Francis-Le Blé', 29200, 'Brest');
INSERT INTO Stade VALUES (9, 'Stade de la Meinau', 67100, 'Strasbourg');
INSERT INTO Stade VALUES (10, 'Stade Pierre-Mauroy', 59650, 'Villeneuve-d Ascq');
INSERT INTO Stade VALUES (11, 'Stade Roazhon Park', 35000, 'Rennes');
INSERT INTO Stade VALUES (12, 'Stade de la Licorne', 80000, 'Amiens');
INSERT INTO Stade VALUES (13, 'Orange Vélodrome', 13008, 'Marseille');
INSERT INTO Stade VALUES (14, 'Stade Azur', 13002, 'Marseille');
INSERT INTO Stade VALUES (15, 'Stade Jean Bouin', 78000, 'Versailles');
INSERT INTO Stade VALUES (16, 'Stade Élisabeth', 75014, 'Paris');
INSERT INTO Stade VALUES (17, 'Stade Noir et Blanc', 93100, 'Montreuil');
INSERT INTO Stade VALUES (18, 'Stade de l Espoir', 93300, 'Aubervilliers');
INSERT INTO Stade VALUES (19, 'Stade du Grand Paris', 93400, 'Saint-Ouen');
INSERT INTO Stade VALUES (20, 'Stade Louis II', 98000, 'Monaco');
INSERT INTO Stade VALUES (21, 'Stade Princier', 98000, 'Monaco');
INSERT INTO Stade VALUES (22, 'Stade Horizon', 92000, 'Nanterre');
INSERT INTO Stade VALUES (23, 'Stade Étoile', 92100, 'Boulogne-Billancourt');
INSERT INTO Stade VALUES (24, 'Stade Panorama', 92200, 'Neuilly-sur-Seine');
INSERT INTO Stade VALUES (25, 'Stade Lumière', 92300, 'Levallois-Perret');
INSERT INTO Stade VALUES (26, 'Stade Prodigieux', 92400, 'Courbevoie');
INSERT INTO Stade VALUES (27, 'Stade Olympique Yves du Manoir', 92700, 'Colombes');
INSERT INTO Stade VALUES (28, 'Stade Blaise Matuidi', 92600, 'Asnières-sur-Seine');
INSERT INTO Stade VALUES (29, 'Stade du Dr Bauer', 93200, 'Saint-Denis');
INSERT INTO Stade VALUES (30, 'Stade de Gerland', 69007, 'Lyon');


-- Jeu de données pour la table Club
INSERT INTO Club VALUES (1, 'Paris Saint-Germain', 1970, 'Paris', 1);
INSERT INTO Club VALUES (2, 'Paris FC', 1969, 'Paris', 2);
INSERT INTO Club VALUES (3, 'Olympique Lyonnais', 1950, 'Lyon', 3);
INSERT INTO Club VALUES (4, 'LOSC Lille', 1944, 'Lille', 4);
INSERT INTO Club VALUES (5, 'Girondins de Bordeaux', 1881, 'Bordeaux', 5);
INSERT INTO Club VALUES (6, 'FC Nantes', 1943, 'Nantes', 6);
INSERT INTO Club VALUES (7, 'Stade de Reims', 1931, 'Reims', 7);
INSERT INTO Club VALUES (8, 'Stade Brestois 29', 1950, 'Brest', 8);
INSERT INTO Club VALUES (9, 'RC Strasbourg Alsace', 1906, 'Strasbourg', 9);
INSERT INTO Club VALUES (10, 'Lille OSC', 1944, 'Villeneuve-d''Ascq', 10);
INSERT INTO Club VALUES (11, 'Stade Rennais FC', 1901, 'Rennes', 11);
INSERT INTO Club VALUES (12, 'Amiens SC', 1901, 'Amiens', 12);
INSERT INTO Club VALUES (13, 'Olympique de Marseille', 1899, 'Marseille', 13);
INSERT INTO Club VALUES (14, 'OGC Nice', 1904, 'Marseille', 14);
INSERT INTO Club VALUES (15, 'Versaille FC', 1970, 'Versailles', 15);
INSERT INTO Club VALUES (16, 'FC Paris Alésia', 1897, 'Paris', 16);
INSERT INTO Club VALUES (17, 'RC Paris', 1899, 'Montreuil', 17);
INSERT INTO Club VALUES (18, 'Aubervilliers FC', 1969, 'Aubervilliers', 18);
INSERT INTO Club VALUES (19, 'Leto FC', 1970, 'Saint-Ouen', 19);
INSERT INTO Club VALUES (20, 'FC Monaco', 1924, 'Monaco', 20);
INSERT INTO Club VALUES (21, 'AS Prince', 1970, 'Monaco', 21);
INSERT INTO Club VALUES (22, 'ES Horizon', 1996, 'Nanterre', 22);
INSERT INTO Club VALUES (23, 'Olympique Etoile', 1999, 'Boulogne-Billancourt', 23);
INSERT INTO Club VALUES (24, 'AS Panorama', 1904, 'Neuilly-sur-Seine', 24);
INSERT INTO Club VALUES (25, 'FC Levallois', 1882, 'Levallois-Perret', 25);
INSERT INTO Club VALUES (26, 'Stade Olympique Courbevoie', 1920, 'Courbevoie', 26);
INSERT INTO Club VALUES (27, 'Racing Club FC', 1883, 'Colombes', 27);
INSERT INTO Club VALUES (28, 'Asnières SC', 1908, 'Asnières-sur-Seine', 28);
INSERT INTO Club VALUES (29, 'Red Star FC', 1897, 'Saint-Denis', 29);
INSERT INTO Club VALUES (30, 'FC Choisy', 1950, 'Lyon', 30);


-- Jeu de données pour la table Matchs
INSERT INTO Matchs VALUES (1, '3-1', TO_DATE('2022-01-15', 'YYYY-MM-DD'), 1, 1, 25);
INSERT INTO Matchs VALUES (2, '2-0', TO_DATE('2022-03-16', 'YYYY-MM-DD'), 2, 2, 3);
INSERT INTO Matchs VALUES (3, '1-1', TO_DATE('2022-03-28', 'YYYY-MM-DD'), 3, 3, 12);
INSERT INTO Matchs VALUES (4, '4-2', TO_DATE('2022-05-08', 'YYYY-MM-DD'), 4, 4, 30);
INSERT INTO Matchs VALUES (5, '0-1', TO_DATE('2022-09-01', 'YYYY-MM-DD'), 5, 5, 2);
INSERT INTO Matchs VALUES (6, '2-2', TO_DATE('2022-09-01', 'YYYY-MM-DD'), 6, 6, 18);
INSERT INTO Matchs VALUES (7, '3-0', TO_DATE('2022-09-14', 'YYYY-MM-DD'), 7, 7, 20);
INSERT INTO Matchs VALUES (8, '1-2', TO_DATE('2022-09-14', 'YYYY-MM-DD'), 8, 8, 12);
INSERT INTO Matchs VALUES (9, '2-1', TO_DATE('2022-10-05', 'YYYY-MM-DD'), 9, 9, 11);
INSERT INTO Matchs VALUES (10, '1-0', TO_DATE('2022-10-22', 'YYYY-MM-DD'), 10, 10, 11);
INSERT INTO Matchs VALUES (11, '2-2', TO_DATE('2022-11-03', 'YYYY-MM-DD'), 11, 11, 3);
INSERT INTO Matchs VALUES (12, '3-1', TO_DATE('2022-11-13', 'YYYY-MM-DD'), 12, 12, 23);
INSERT INTO Matchs VALUES (13, '0-0', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 2, 2, 14);
INSERT INTO Matchs VALUES (14, '1-3', TO_DATE('2022-11-25', 'YYYY-MM-DD'), 14, 14, 1);
INSERT INTO Matchs VALUES (15, '2-0', TO_DATE('2022-11-29', 'YYYY-MM-DD'), 2, 2, 16);
INSERT INTO Matchs VALUES (16, '3-2', TO_DATE('2022-12-10', 'YYYY-MM-DD'), 16, 16, 19);
INSERT INTO Matchs VALUES (17, '0-1', TO_DATE('2022-12-10', 'YYYY-MM-DD'), 17, 17, 7);
INSERT INTO Matchs VALUES (18, '1-1', TO_DATE('2023-01-05', 'YYYY-MM-DD'), 18, 18, 29);
INSERT INTO Matchs VALUES (19, '2-0', TO_DATE('2023-01-08', 'YYYY-MM-DD'), 19, 19, 20);
INSERT INTO Matchs VALUES (20, '1-2', TO_DATE('2023-01-08', 'YYYY-MM-DD'), 20, 20, 8);
INSERT INTO Matchs VALUES (21, '3-3', TO_DATE('2023-01-10', 'YYYY-MM-DD'), 21, 21, 2);
INSERT INTO Matchs VALUES (22, '0-1', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 22, 22, 30);
INSERT INTO Matchs VALUES (23, '2-2', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 2, 2, 24);
INSERT INTO Matchs VALUES (24, '1-0', TO_DATE('2023-02-28', 'YYYY-MM-DD'), 24, 24, 12);
INSERT INTO Matchs VALUES (25, '4-1', TO_DATE('2023-03-08', 'YYYY-MM-DD'), 5, 5, 26);
INSERT INTO Matchs VALUES (26, '0-0', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 26, 26, 27);
INSERT INTO Matchs VALUES (27, '2-1', TO_DATE('2023-03-16', 'YYYY-MM-DD'), 2, 2, 28);
INSERT INTO Matchs VALUES (28, '3-2', TO_DATE('2023-04-11', 'YYYY-MM-DD'), 28, 28, 26);
INSERT INTO Matchs VALUES (29, '1-0', TO_DATE('2023-05-22', 'YYYY-MM-DD'), 29, 29, 10);
INSERT INTO Matchs VALUES (30, '2-1', TO_DATE('2023-05-26', 'YYYY-MM-DD'), 30, 30, 1);


-- Jeu de données pour la table Trophees
INSERT INTO Trophees VALUES (1, 'FFF', 2023, 1);
INSERT INTO Trophees VALUES (2, 'LFP', 2023, 3);
INSERT INTO Trophees VALUES (3, 'UEFA', 2023, 20);

INSERT INTO Trophees VALUES (4, 'FFF', 2022, 3);
INSERT INTO Trophees VALUES (5, 'LFP', 2022, 10);
INSERT INTO Trophees VALUES (6, 'UEFA', 2022, NULL);

INSERT INTO Trophees VALUES (7, 'FFF', 2021, 1);
INSERT INTO Trophees VALUES (8, 'LFP', 2021, 20);
INSERT INTO Trophees VALUES (9, 'UEFA', 2021, 1);

INSERT INTO Trophees VALUES (10, 'FFF', 2020, 1);
INSERT INTO Trophees VALUES (11, 'LFP', 2020, 3);
INSERT INTO Trophees VALUES (12, 'UEFA', 2020, NULL);

INSERT INTO Trophees VALUES (13, 'FFF', 2019, 30);
INSERT INTO Trophees VALUES (14, 'LFP', 2019, 1);
INSERT INTO Trophees VALUES (15, 'UEFA', 2019, NULL);

INSERT INTO Trophees VALUES (16, 'FFF', 2018, 1);
INSERT INTO Trophees VALUES (17, 'LFP', 2018, 11);
INSERT INTO Trophees VALUES (18, 'UEFA', 2018, 1);

INSERT INTO Trophees VALUES (19, 'FFF', 2017, 30);
INSERT INTO Trophees VALUES (20, 'LFP', 2017, 30);
INSERT INTO Trophees VALUES (21, 'UEFA', 2017, 1);

INSERT INTO Trophees VALUES (22, 'FFF', 2016, 1);
INSERT INTO Trophees VALUES (23, 'LFP', 2016, 6);
INSERT INTO Trophees VALUES (24, 'UEFA', 2016, 5);

INSERT INTO Trophees VALUES (25, 'FFF', 2015, 3);
INSERT INTO Trophees VALUES (26, 'LFP', 2015, 1);
INSERT INTO Trophees VALUES (27, 'UEFA', 2015, NULL);

INSERT INTO Trophees VALUES (28, 'FFF', 2014, 29);
INSERT INTO Trophees VALUES (29, 'LFP', 2014, 20);
INSERT INTO Trophees VALUES (30, 'UEFA', 2014, NULL);


-- Jeu de données pour la table PersonnelStade avec des noms et prénoms aléatoires
INSERT INTO PersonnelStade VALUES (1, 'Dupont', 'Jean', 'Entraineur', 1);
INSERT INTO PersonnelStade VALUES (2, 'Martin', 'Sophie', 'Médecin', 2);
INSERT INTO PersonnelStade VALUES (3, 'Lefevre', 'Pierre', 'Agent de sécurité', 3);
INSERT INTO PersonnelStade VALUES (4, 'Dubois', 'Marie', 'Directeur', 4);
INSERT INTO PersonnelStade VALUES (5, 'Leroy', 'Philippe', 'Responsable de la billetterie', 5);
INSERT INTO PersonnelStade VALUES (6, 'Moreau', 'Isabelle', 'Directeur', 6);
INSERT INTO PersonnelStade VALUES (7, 'Lefevre', 'François', 'Entraineur', 7);
INSERT INTO PersonnelStade VALUES (8, 'Leroux', 'Catherine', 'Agent d entretien', 8);
INSERT INTO PersonnelStade VALUES (9, 'Girard', 'David', 'Responsable marketing', 9);
INSERT INTO PersonnelStade VALUES (10, 'Martin', 'Julie', 'Entraineur', 10);
INSERT INTO PersonnelStade VALUES (11, 'Thomas', 'Patrick', 'Entraineur', 11);
INSERT INTO PersonnelStade VALUES (12, 'Lefevre', 'Elodie', 'Responsable réseaux', 12);
INSERT INTO PersonnelStade VALUES (13, 'Michel', 'Paul', 'Agent de sécurité', 13);
INSERT INTO PersonnelStade VALUES (14, 'Legrand', 'Sophie', 'Technicien informatique', 14);
INSERT INTO PersonnelStade VALUES (15, 'Roux', 'Vincent', 'Directeur', 15);
INSERT INTO PersonnelStade VALUES (16, 'Lemoine', 'Emilie', 'Coordinateur logistique', 16);
INSERT INTO PersonnelStade VALUES (17, 'Petit', 'Franck', 'Agent d accueil', 17);
INSERT INTO PersonnelStade VALUES (18, 'Durand', 'Mélanie', 'Agent de sécurité', 18);
INSERT INTO PersonnelStade VALUES (19, 'Lefevre', 'Alexandre', 'Entraineur', 19);
INSERT INTO PersonnelStade VALUES (20, 'Mercier', 'Nathalie', 'Directeur', 20);
INSERT INTO PersonnelStade VALUES (21, 'Thomas', 'Laura', 'Agent de maintenance', 21);
INSERT INTO PersonnelStade VALUES (22, 'Dubois', 'Julien', 'Responsable des finances', 22);
INSERT INTO PersonnelStade VALUES (23, 'Robert', 'Elise', 'President', 23);
INSERT INTO PersonnelStade VALUES (24, 'Morel', 'Nicolas', 'Agent d entretien', 24);
INSERT INTO PersonnelStade VALUES (25, 'Fournier', 'Caroline', 'President', 25);
INSERT INTO PersonnelStade VALUES (26, 'Lefevre', 'Romain', 'Directeur', 26);
INSERT INTO PersonnelStade VALUES (27, 'Dubois', 'Elsa', 'Responsable des ventes', 27);
INSERT INTO PersonnelStade VALUES (28, 'Lefevre', 'Jean', 'Agent de sécurité', 28);
INSERT INTO PersonnelStade VALUES (29, 'Lemoine', 'Laure', 'Directeur', 29);
INSERT INTO PersonnelStade VALUES (30, 'Girard', 'Antoine', 'Agent d accueil', 30);


-- Jeu de données pour la table Personne
INSERT INTO Personne VALUES (1, 'Smith', 'John', 'john.smith@gmail.com');
INSERT INTO Personne VALUES (2, 'Johnson', 'Alice', 'alice.johnson@yahoo.com');
INSERT INTO Personne VALUES (3, 'Williams', 'Michael', 'michael.williams@hotmail.com');
INSERT INTO Personne VALUES (4, 'Jones', 'Emily', 'emily.jones@gmail.com');
INSERT INTO Personne VALUES (5, 'Brown', 'Christopher', 'christopher.brown@yahoo.com');
INSERT INTO Personne VALUES (6, 'Taylor', 'Olivia', 'olivia.taylor@hotmail.com');
INSERT INTO Personne VALUES (7, 'Anderson', 'Daniel', 'daniel.anderson@gmail.com');
INSERT INTO Personne VALUES (8, 'Harris', 'Sophia', 'sophia.harris@yahoo.com');
INSERT INTO Personne VALUES (9, 'Martin', 'Matthew', 'matthew.martin@hotmail.com');
INSERT INTO Personne VALUES (10, 'Thompson', 'Emma', 'emma.thompson@gmail.com');
INSERT INTO Personne VALUES (11, 'Garcia', 'Nicholas', 'nicholas.garcia@yahoo.com');
INSERT INTO Personne VALUES (12, 'Martinez', 'Isabella', 'isabella.martinez@hotmail.com');
INSERT INTO Personne VALUES (13, 'Robinson', 'Andrew', 'andrew.robinson@gmail.com');
INSERT INTO Personne VALUES (14, 'Clark', 'Abigail', 'abigail.clark@yahoo.com');
INSERT INTO Personne VALUES (15, 'Rodriguez', 'David', 'david.rodriguez@hotmail.com');
INSERT INTO Personne VALUES (16, 'Lewis', 'Sofia', 'sofia.lewis@gmail.com');
INSERT INTO Personne VALUES (17, 'Lee', 'Benjamin', 'benjamin.lee@yahoo.com');
INSERT INTO Personne VALUES (18, 'Walker', 'Victoria', 'victoria.walker@hotmail.com');
INSERT INTO Personne VALUES (19, 'Hall', 'Aiden', 'aiden.hall@gmail.com');
INSERT INTO Personne VALUES (20, 'Allen', 'Lily', 'lily.allen@yahoo.com');
INSERT INTO Personne VALUES (21, 'Baker', 'Ella', 'ella.baker@hotmail.com');
INSERT INTO Personne VALUES (22, 'Ward', 'Jackson', 'jackson.ward@gmail.com');
INSERT INTO Personne VALUES (23, 'Morgan', 'Grace', 'grace.morgan@yahoo.com');
INSERT INTO Personne VALUES (24, 'Carter', 'Ava', 'ava.carter@hotmail.com');
INSERT INTO Personne VALUES (25, 'Turner', 'Logan', 'logan.turner@gmail.com');
INSERT INTO Personne VALUES (26, 'Cooper', 'Aria', 'aria.cooper@yahoo.com');
INSERT INTO Personne VALUES (27, 'Howard', 'Ethan', 'ethan.howard@hotmail.com');
INSERT INTO Personne VALUES (28, 'Barnes', 'Mia', 'mia.barnes@gmail.com');
INSERT INTO Personne VALUES (29, 'Wells', 'Lucas', 'lucas.wells@yahoo.com');
INSERT INTO Personne VALUES (30, 'Fisher', 'Zoe', 'zoe.fisher@hotmail.com');


-- Jeu de données pour la table est_abonne
INSERT INTO est_abonne VALUES (1, 1, 1, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'));
INSERT INTO est_abonne VALUES (2, 2, 1, TO_DATE('2022-02-01', 'YYYY-MM-DD'), TO_DATE('2023-02-01', 'YYYY-MM-DD'));
INSERT INTO est_abonne VALUES (3, 3, 0, NULL, NULL);
INSERT INTO est_abonne VALUES (4, 4, 1, TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2023-04-01', 'YYYY-MM-DD'));
INSERT INTO est_abonne VALUES (5, 5, 0, NULL, NULL);
INSERT INTO est_abonne VALUES (6, 6, 1, TO_DATE('2022-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-01', 'YYYY-MM-DD'));
INSERT INTO est_abonne VALUES (7, 7, 0, NULL, NULL);
INSERT INTO est_abonne VALUES (8, 8, 1, TO_DATE('2022-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-01', 'YYYY-MM-DD'));
INSERT INTO est_abonne VALUES (9, 9, 0, NULL, NULL);
INSERT INTO est_abonne VALUES (10, 10, 1, TO_DATE('2022-10-01', 'YYYY-MM-DD'), TO_DATE('2023-10-01', 'YYYY-MM-DD'));
INSERT INTO est_abonne VALUES (11, 11, 0, NULL, NULL);
INSERT INTO est_abonne VALUES (12, 12, 1, TO_DATE('2022-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-01', 'YYYY-MM-DD'));
INSERT INTO est_abonne VALUES (13, 13, 0, NULL, NULL);
INSERT INTO est_abonne VALUES (14, 14, 1, TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'));
INSERT INTO est_abonne VALUES (15, 15, 0, NULL, NULL);
INSERT INTO est_abonne VALUES (16, 16, 1, TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'));
INSERT INTO est_abonne VALUES (17, 17, 0, NULL, NULL);
INSERT INTO est_abonne VALUES (18, 18, 1, TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-01', 'YYYY-MM-DD'));
INSERT INTO est_abonne VALUES (19, 19, 0, NULL, NULL);
INSERT INTO est_abonne VALUES (20, 20, 1, TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-01', 'YYYY-MM-DD'));
INSERT INTO est_abonne VALUES (21, 21, 0, NULL, NULL);
INSERT INTO est_abonne VALUES (22, 22, 1, TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2024-10-01', 'YYYY-MM-DD'));
INSERT INTO est_abonne VALUES (23, 23, 0, NULL, NULL);
INSERT INTO est_abonne VALUES (24, 24, 1, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2024-12-01', 'YYYY-MM-DD'));
INSERT INTO est_abonne VALUES (25, 25, 0, NULL, NULL);
INSERT INTO est_abonne VALUES (26, 26, 1, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2025-02-01', 'YYYY-MM-DD'));
INSERT INTO est_abonne VALUES (27, 27, 0, NULL, NULL);
INSERT INTO est_abonne VALUES (28, 28, 1, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2025-04-01', 'YYYY-MM-DD'));
INSERT INTO est_abonne VALUES (29, 29, 0, NULL, NULL);
INSERT INTO est_abonne VALUES (30, 30, 1, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'));


-- Jeu de données pour la table assite
INSERT INTO assiste VALUES (1, 1, 0);
INSERT INTO assiste VALUES (2, 1, 64.99);
INSERT INTO assiste VALUES (3, 1, 64.99);
INSERT INTO assiste VALUES (4, 1, 64.99);
INSERT INTO assiste VALUES (5, 1, 64.99);
-- # match1 se déroule dans le stade1

INSERT INTO assiste VALUES (6, 6, 0);
INSERT INTO assiste VALUES (1, 6, 64.99);
INSERT INTO assiste VALUES (2, 6, 64.99);
INSERT INTO assiste VALUES (9, 6, 64.99);
INSERT INTO assiste VALUES (10, 6, 64.99);
-- # match6 se déroule dans le stade6

INSERT INTO assiste VALUES (2, 15, 0);
INSERT INTO assiste VALUES (1, 15, 64.99);
INSERT INTO assiste VALUES (13, 15, 64.99); 
INSERT INTO assiste VALUES (14, 15, 64.99); 
INSERT INTO assiste VALUES (15, 15, 64.99);
-- # match15 se déroule dans le stade2

INSERT INTO assiste VALUES (22, 22, 0); 
INSERT INTO assiste VALUES (3, 22, 64.99);
INSERT INTO assiste VALUES (5, 22, 64.99); 
INSERT INTO assiste VALUES (19, 22, 64.99); 
INSERT INTO assiste VALUES (20, 22, 64.99);
-- # match22 se déroule dans le stade22

INSERT INTO assiste VALUES (2, 27, 0);
INSERT INTO assiste VALUES (9, 27, 64.99);
INSERT INTO assiste VALUES (23, 27, 64.99);
INSERT INTO assiste VALUES (24, 27, 64.99);
INSERT INTO assiste VALUES (25, 27, 64.99);
-- # match27 se déroule dans le stade2

INSERT INTO assiste VALUES (30, 30, 0); 
INSERT INTO assiste VALUES (5, 30, 64.99);
INSERT INTO assiste VALUES (19, 30, 64.99); 
INSERT INTO assiste VALUES (25, 30, 64.99);
INSERT INTO assiste VALUES (27, 30, 64.99);
-- # match30 se déroule dans le stade30




-- 2. Insertion des jeux de données avc l'outil de chargement d’Oracle SQL*LOAD

-- Jeu de données dans le fichier pour la table Stade
-- Contenu du fichier nommé stade.clt
LOAD DATA
INFILE *
APPEND
INTO TABLE Stade
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(IdStade, nomStade, codePostale, ville)
BEGINDATA
1, 'Parc des Princes', 75016, 'Paris'
2, 'Stade Charléty', 75013, 'Paris'
3, 'Stade Groupama Stadium', 69001, 'Lyon'
4, 'Stade Decathlon Arena', 59000, 'Lille'
5, 'Stade Matmut Atlantique', 33000, 'Bordeaux'
6, 'Stade de la Beaujoire', 44000, 'Nantes'
7, 'Stade Auguste-Delaune', 51100, 'Reims'
8, 'Stade Francis-Le Blé', 29200, 'Brest'
9, 'Stade de la Meinau', 67100, 'Strasbourg'
10, 'Stade Pierre-Mauroy', 59650, 'Villeneuve-d Ascq'
11, 'Stade Roazhon Park', 35000, 'Rennes'
12, 'Stade de la Licorne', 80000, 'Amiens'
13, 'Orange Vélodrome', 13008, 'Marseille'
14, 'Stade Azur', 13002, 'Marseille'
15, 'Stade Jean Bouin', 78000, 'Versailles'
16, 'Stade Élisabeth', 75014, 'Paris'
17, 'Stade Noir et Blanc', 93100, 'Montreuil'
18, 'Stade de l Espoir', 93300, 'Aubervilliers'
19, 'Stade du Grand Paris', 93400, 'Saint-Ouen'
20, 'Stade Louis II', 98000, 'Monaco'
21, 'Stade Princier', 98000, 'Monaco'
22, 'Stade Horizon', 92000, 'Nanterre'
23, 'Stade Étoile', 92100, 'Boulogne-Billancourt'
24, 'Stade Panorama', 92200, 'Neuilly-sur-Seine'
25, 'Stade Lumière', 92300, 'Levallois-Perret'
26, 'Stade Prodigieux', 92400, 'Courbevoie'
27, 'Stade Olympique Yves du Manoir', 92700, 'Colombes'
28, 'Stade Blaise Matuidi', 92600, 'Asnières-sur-Seine'
29, 'Stade du Dr Bauer', 93200, 'Saint-Denis'
30, 'Stade de Gerland', 69007, 'Lyon'

-- Exécution de la commande SQL*Loader (**** : information d'identification)
sqlldr userid=***** control=stade.ctl log=stade.log


-- Jeu de données pour la table Club
-- Contenu du fichier nommé club.clt
LOAD DATA
INFILE *
APPEND
INTO TABLE club
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(IdClub, nomClub, fondation, ville, IdStade)
BEGINDATA
1, 'Paris Saint-Germain', 1970, 'Paris', 1
2, 'Paris FC', 1969, 'Paris', 2
3, 'Olympique Lyonnais', 1950, 'Lyon', 3
4, 'LOSC Lille', 1944, 'Lille', 4
5, 'Girondins de Bordeaux', 1881, 'Bordeaux', 5
6, 'FC Nantes', 1943, 'Nantes', 6
7, 'Stade de Reims', 1931, 'Reims', 7
8, 'Stade Brestois 29', 1950, 'Brest', 8
9, 'RC Strasbourg Alsace', 1906, 'Strasbourg', 9
10, 'Lille OSC', 1944, 'Villeneuve-d''Ascq', 10
11, 'Stade Rennais FC', 1901, 'Rennes', 11
12, 'Amiens SC', 1901, 'Amiens', 12
13, 'Olympique de Marseille', 1899, 'Marseille', 13
14, 'OGC Nice', 1904, 'Marseille', 14
15, 'Versaille FC', 1970, 'Versailles', 15
16, 'FC Paris Alésia', 1897, 'Paris', 16
17, 'RC Paris', 1899, 'Montreuil', 17
18, 'Aubervilliers FC', 1969, 'Aubervilliers', 18
19, 'Leto FC', 1970, 'Saint-Ouen', 19
20, 'FC Monaco', 1924, 'Monaco', 20
21, 'AS Prince', 1970, 'Monaco', 21
22, 'ES Horizon', 1996, 'Nanterre', 22
23, 'Olympique Etoile', 1999, 'Boulogne-Billancourt', 23
24, 'AS Panorama', 1904, 'Neuilly-sur-Seine', 24
25, 'FC Levallois', 1882, 'Levallois-Perret', 25
26, 'Stade Olympique Courbevoie', 1920, 'Courbevoie', 26
27, 'Racing Club FC', 1883, 'Colombes', 27
28, 'Asnières SC', 1908, 'Asnières-sur-Seine', 28
29, 'Red Star FC', 1897, 'Saint-Denis', 29
30, 'FC Choisy', 1950, 'Lyon', 30

-- Exécution de la commande SQL*Loader (**** : information d'identification)
sqlldr userid=***** control=club.ctl log=club.log


-- Jeu de données pour la table Matchs
-- Contenu du fichier nommé matchs.clt
LOAD DATA
INFILE *
APPEND
INTO TABLE Matchs
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(IdMatch, score, dateMatch, IdStade, IdClubDomicile, IdClubExterieur)
BEGINDATA
1, '3-1', TO_DATE('2022-01-15', 'YYYY-MM-DD'), 1, 1, 25
2, '2-0', TO_DATE('2022-03-16', 'YYYY-MM-DD'), 2, 2, 3
3, '1-1', TO_DATE('2022-03-28', 'YYYY-MM-DD'), 3, 3, 12
4, '4-2', TO_DATE('2022-05-08', 'YYYY-MM-DD'), 4, 4, 30
5, '0-1', TO_DATE('2022-09-01', 'YYYY-MM-DD'), 5, 5, 2
6, '2-2', TO_DATE('2022-09-01', 'YYYY-MM-DD'), 6, 6, 18
7, '3-0', TO_DATE('2022-09-14', 'YYYY-MM-DD'), 7, 7, 20
8, '1-2', TO_DATE('2022-09-14', 'YYYY-MM-DD'), 8, 8, 12
9, '2-1', TO_DATE('2022-10-05', 'YYYY-MM-DD'), 9, 9, 11
10, '1-0', TO_DATE('2022-10-22', 'YYYY-MM-DD'), 10, 10, 11
11, '2-2', TO_DATE('2022-11-03', 'YYYY-MM-DD'), 11, 11, 3
12, '3-1', TO_DATE('2022-11-13', 'YYYY-MM-DD'), 12, 12, 23
13, '0-0', TO_DATE('2022-11-17', 'YYYY-MM-DD'), 2, 2, 14
14, '1-3', TO_DATE('2022-11-25', 'YYYY-MM-DD'), 14, 14, 1
15, '2-0', TO_DATE('2022-11-29', 'YYYY-MM-DD'), 2, 2, 16
16, '3-2', TO_DATE('2022-12-10', 'YYYY-MM-DD'), 16, 16, 19
17, '0-1', TO_DATE('2022-12-10', 'YYYY-MM-DD'), 17, 17, 7
18, '1-1', TO_DATE('2023-01-05', 'YYYY-MM-DD'), 18, 18, 29
19, '2-0', TO_DATE('2023-01-08', 'YYYY-MM-DD'), 19, 19, 20
20, '1-2', TO_DATE('2023-01-08', 'YYYY-MM-DD'), 20, 20, 8
21, '3-3', TO_DATE('2023-01-10', 'YYYY-MM-DD'), 21, 21, 2
22, '0-1', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 22, 22, 30
23, '2-2', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 2, 2, 24
24, '1-0', TO_DATE('2023-02-28', 'YYYY-MM-DD'), 24, 24, 12
25, '4-1', TO_DATE('2023-03-08', 'YYYY-MM-DD'), 5, 5, 26
26, '0-0', TO_DATE('2023-03-09', 'YYYY-MM-DD'), 26, 26, 27
27, '2-1', TO_DATE('2023-03-16', 'YYYY-MM-DD'), 2, 2, 28
28, '3-2', TO_DATE('2023-04-11', 'YYYY-MM-DD'), 28, 28, 26
29, '1-0', TO_DATE('2023-05-22', 'YYYY-MM-DD'), 29, 29, 10
30, '2-1', TO_DATE('2023-05-26', 'YYYY-MM-DD'), 30, 30, 1

-- Exécution de la commande SQL*Loader (**** : information d'identification)
sqlldr userid=***** control=matchs.ctl log=matchs.log


-- Jeu de données pour la table Trophees
-- Contenu du fichier nommé Trophees.clt
LOAD DATA
INFILE *
APPEND
INTO TABLE Trophees
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(IdTrophee, nomTrophee, anneVictoire, IdClubGagnant)
BEGINDATA
1, 'FFF', 2023, 1
2, 'LFP', 2023, 3
3, 'UEFA', 2023, 20
4, 'FFF', 2022, 3
5, 'LFP', 2022, 10
6, 'UEFA', 2022, NULL
7, 'FFF', 2021, 1
8, 'LFP', 2021, 20
9, 'UEFA', 2021, 1
10, 'FFF', 2020, 1
11, 'LFP', 2020, 3
12, 'UEFA', 2020, NULL
13, 'FFF', 2019, 30
14, 'LFP', 2019, 1
15, 'UEFA', 2019, NULL
16, 'FFF', 2018, 1
17, 'LFP', 2018, 11
18, 'UEFA', 2018, 1
19, 'FFF', 2017, 30
20, 'LFP', 2017, 30
21, 'UEFA', 2017, 1
22, 'FFF', 2016, 1
23, 'LFP', 2016, 6
24, 'UEFA', 2016, 5
25, 'FFF', 2015, 3
26, 'LFP', 2015, 1
27, 'UEFA', 2015, NULL
28, 'FFF', 2014, 29
29, 'LFP', 2014, 20
30, 'UEFA', 2014, NULL

-- Exécution de la commande SQL*Loader (**** : information d'identification)
sqlldr userid=***** control=Trophees.ctl log=Trophees.log


-- Jeu de données pour la table PersonnelStade avec des noms et prénoms aléatoires
-- Contenu du fichier nommé PersonnelStade.clt
LOAD DATA
INFILE *
APPEND
INTO TABLE PersonnelStade
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(IdPersonnel, nom, prenom, fonction, IdStade)
BEGINDATA
1, 'Dupont', 'Jean', 'Entraineur', 1
2, 'Martin', 'Sophie', 'Médecin', 2
3, 'Lefevre', 'Pierre', 'Agent de sécurité', 3
4, 'Dubois', 'Marie', 'Responsable des installations', 4
5, 'Leroy', 'Philippe', 'Responsable de la billetterie', 5
6, 'Moreau', 'Isabelle', 'Coordinateur des événements', 6
7, 'Lefevre', 'François', 'Technicien son et lumière', 7
8, 'Leroux', 'Catherine', 'Agent d entretien', 8
9, 'Girard', 'David', 'Responsable marketing', 9
10, 'Martin', 'Julie', 'Responsable des médias', 10
11, 'Thomas', 'Patrick', 'Responsable des partenariats', 11
12, 'Lefevre', 'Elodie', 'Responsable réseaux', 12
13, 'Michel', 'Paul', 'Agent de sécurité', 13
14, 'Legrand', 'Sophie', 'Technicien informatique', 14
15, 'Roux', 'Vincent', 'Responsable de la restauration', 15
16, 'Lemoine', 'Emilie', 'Coordinateur logistique', 16
17, 'Petit', 'Franck', 'Agent d accueil', 17
18, 'Durand', 'Mélanie', 'Agent de sécurité', 18
19, 'Lefevre', 'Alexandre', 'Responsable des équipements', 19
20, 'Mercier', 'Nathalie', 'Responsable des communications', 20
21, 'Thomas', 'Laura', 'Agent de maintenance', 21
22, 'Dubois', 'Julien', 'Responsable des finances', 22
23, 'Robert', 'Elise', 'Responsable des communications', 23
24, 'Morel', 'Nicolas', 'Agent d entretien', 24
25, 'Fournier', 'Caroline', 'Responsable des événements', 25
26, 'Lefevre', 'Romain', 'Technicien son et lumière', 26
27, 'Dubois', 'Elsa', 'Responsable des ventes', 27
28, 'Lefevre', 'Jean', 'Agent de sécurité', 28
29, 'Lemoine', 'Laure', 'Responsable des opérations', 29
30, 'Girard', 'Antoine', 'Agent d accueil', 30

-- Exécution de la commande SQL*Loader (**** : information d'identification)
sqlldr userid=***** control=PersonnelStade.ctl log=PersonnelStade.log


-- Jeu de données pour la table Personne
-- Contenu du fichier nommé Personne.clt
LOAD DATA
INFILE *
APPEND
INTO TABLE Personne
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(IdPersonne, nomP, prenomP, email)
BEGINDATA
1, 'Smith', 'John', 'john.smith@gmail.com'
2, 'Johnson', 'Alice', 'alice.johnson@yahoo.com'
3, 'Williams', 'Michael', 'michael.williams@hotmail.com'
4, 'Jones', 'Emily', 'emily.jones@gmail.com'
5, 'Brown', 'Christopher', 'christopher.brown@yahoo.com'
6, 'Taylor', 'Olivia', 'olivia.taylor@hotmail.com'
7, 'Anderson', 'Daniel', 'daniel.anderson@gmail.com'
8, 'Harris', 'Sophia', 'sophia.harris@yahoo.com'
9, 'Martin', 'Matthew', 'matthew.martin@hotmail.com'
10, 'Thompson', 'Emma', 'emma.thompson@gmail.com'
11, 'Garcia', 'Nicholas', 'nicholas.garcia@yahoo.com'
12, 'Martinez', 'Isabella', 'isabella.martinez@hotmail.com'
13, 'Robinson', 'Andrew', 'andrew.robinson@gmail.com'
14, 'Clark', 'Abigail', 'abigail.clark@yahoo.com'
15, 'Rodriguez', 'David', 'david.rodriguez@hotmail.com'
16, 'Lewis', 'Sofia', 'sofia.lewis@gmail.com'
17, 'Lee', 'Benjamin', 'benjamin.lee@yahoo.com'
18, 'Walker', 'Victoria', 'victoria.walker@hotmail.com'
19, 'Hall', 'Aiden', 'aiden.hall@gmail.com'
20, 'Allen', 'Lily', 'lily.allen@yahoo.com'
21, 'Baker', 'Ella', 'ella.baker@hotmail.com'
22, 'Ward', 'Jackson', 'jackson.ward@gmail.com'
23, 'Morgan', 'Grace', 'grace.morgan@yahoo.com'
24, 'Carter', 'Ava', 'ava.carter@hotmail.com'
25, 'Turner', 'Logan', 'logan.turner@gmail.com'
26, 'Cooper', 'Aria', 'aria.cooper@yahoo.com'
27, 'Howard', 'Ethan', 'ethan.howard@hotmail.com'
28, 'Barnes', 'Mia', 'mia.barnes@gmail.com'
29, 'Wells', 'Lucas', 'lucas.wells@yahoo.com'
30, 'Fisher', 'Zoe', 'zoe.fisher@hotmail.com'

-- Exécution de la commande SQL*Loader (**** : information d'identification)
sqlldr userid=***** control=Personne.ctl log=Personne.log


-- Jeu de données pour la table est_abonne
-- Contenu du fichier nommé est_abonne.clt
LOAD DATA
INFILE *
APPEND
INTO TABLE est_abonne
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(IdStade, IdPersonne, abonne, dateDebut, dateFin)
BEGINDATA
1, 1, 1, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD')
2, 2, 1, TO_DATE('2022-02-01', 'YYYY-MM-DD'), TO_DATE('2023-02-01', 'YYYY-MM-DD')
3, 3, 0, NULL, NULL
4, 4, 1, TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2023-04-01', 'YYYY-MM-DD')
5, 5, 0, NULL, NULL
6, 6, 1, TO_DATE('2022-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-01', 'YYYY-MM-DD')
7, 7, 0, NULL, NULL
8, 8, 1, TO_DATE('2022-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-01', 'YYYY-MM-DD')
9, 9, 0, NULL, NULL
10, 10, 1, TO_DATE('2022-10-01', 'YYYY-MM-DD'), TO_DATE('2023-10-01', 'YYYY-MM-DD')
11, 11, 0, NULL, NULL
12, 12, 1, TO_DATE('2022-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-01', 'YYYY-MM-DD')
13, 13, 0, NULL, NULL
14, 14, 1, TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD')
15, 15, 0, NULL, NULL
16, 16, 1, TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD')
17, 17, 0, NULL, NULL
18, 18, 1, TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-01', 'YYYY-MM-DD')
19, 19, 0, NULL, NULL
20, 20, 1, TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-01', 'YYYY-MM-DD')
21, 21, 0, NULL, NULL
22, 22, 1, TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2024-10-01', 'YYYY-MM-DD')
23, 23, 0, NULL, NULL
24, 24, 1, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2024-12-01', 'YYYY-MM-DD')
25, 25, 0, NULL, NULL
26, 26, 1, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2025-02-01', 'YYYY-MM-DD')
27, 27, 0, NULL, NULL
28, 28, 1, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2025-04-01', 'YYYY-MM-DD')
29, 29, 0, NULL, NULL
30, 30, 1, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD')

-- Exécution de la commande SQL*Loader (**** : information d'identification)
sqlldr userid=***** control=est_abonne.ctl log=est_abonne.log


-- Jeu de données pour la table assite
-- Contenu du fichier nommé assite.clt
LOAD DATA
INFILE *
APPEND
INTO TABLE assite
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(IdPersonne, IdMatch, prixTicket)
BEGINDATA
1, 1, 0
2, 1, 64.99
3, 1, 64.99
4, 1, 64.99
5, 1, 64.99
6, 6, 0
1, 6, 64.99
2, 6, 64.99
9, 6, 64.99
10, 6, 64.99
2, 15, 0
1, 15, 64.99
13, 15, 64.99 
14, 15, 64.99 
15, 15, 64.99
22, 22, 0 
3, 22, 64.99
5, 22, 64.99 
19, 22, 64.99 
20, 22, 64.99
2, 27, 0
9, 27, 64.99
23, 27, 64.99
24, 27, 64.99
25, 27, 64.99
30, 30, 0 
5, 30, 64.99
19, 30, 64.99 
25, 30, 64.99
27, 30, 64.99

-- Exécution de la commande SQL*Loader (**** : information d'identification)
sqlldr userid=***** control=assite.ctl log=assite.log




-- C/ Manipulation des données

-- Question 1 : Retrouver  le nombre  de stades de football par département.
select substr(codePostale, 1, 2) as departement, count(*) as nbr_Stades
from Stade
group by substr(codePostale, 1, 2)

-- Question 2 : Retrouver pour chaque club, le nombre de trophées remportés depuis 2015.
select c.nomClub, count(*) as nbr_trophee
from club c 
inner join trophees t on c.IdClub = t.IdClubGagnant
where t.anneeVictoire > 2014
group by c.nomClub;

-- Question 3 :  Donner les informations des personnes (nom, prénom, email) qui se sont abonnées au Parc des Princes après le 01 avril 2023
select * from personne 
where IdPersonne in
			(select ea.IdPersonne from est_abonne ea 
			inner join Stade s on ea.IdStade = s.IdStade
			where ea.abonne = 1
			and s.nomStade = "Parc des Princes"
			and dateDebut > "2022-04-30"
);

-- Question 4 : Donner le score et la date de tous les matchs à domicile du Paris FC au cours de l’année 2022.
select m.Idmatch, m.score, m.datematch
from matchs m
inner join club c on m.IdClubDomicile = c.IdClub
inner join stade s on m.IdStade = s.IdStade
where c.nomClub = "Paris FC"
and m.dateMatch between "2022-01-01" and "2022-12-31";

-- Question 5 : Retrouver les personnes qui ont assisté au moins 2 fois à un match de football.
select p.nomP, p.prenomP
from personne p 
where p.IdPersonne in
				(select a.IdPersonne from assiste a
                group by a.IdPersonne
                having count(a.IdMatch) >= 2
);

-- Question 6 : Écrire un trigger qui permet de déterminer automatiquement le prix d’un ticket.
create or replace trigger Prix_ticket
before insert on assiste for each row

DECLARE
    prix_normal constant number := 64.99;
    abo_existe number;
BEGIN
	select count(*) into abo_existe
    from est_abonne ea 
    inner join match m on ea.Idstade = m.Idstade 
    where ea.Idpersonne = :New.Idpersonne
    and ea.abonne = 1
    and m.dateMatch between ea.dateDebut and ea.dateFin;
    
    if abo_existe > 0 then
		:New.prixTicket := 0;
	else
		:New.prixTicket := prix_normal;
	end if;
END;
/

-- Question 7 : Écrire la procédure PL/SQL Mailing, qui permet d’envoyer automatiquement un courriel de rappel aux personnes dont l'abonnement 
-- 				au stade expirera dans deux semaine. La procédure devrait utiliser la table est-abonné pour obtenir les détails nécessaires tels
--                 que l'identifiantde la personne, l'identifiant du stade, la date de début et la date de fin de l'abonnement. Pour simuler la 
--                 création d’un mailing, on dispose d’une table Mailing (Nom,email,message) contenant le nom de la personne ainsi que son email.
--                 Le message indique qu’il est temps de procéder au rappel d'expiration.

create or replace procedure mailing as
	cursor c1 is select p.nomP, p.email, ea.dateFin
		from personne p 
        join est_abonne ea on p.Idpersonne = ea.Idpersonne;
        
	message varchar2(100);
        
begin 
	for tuple in c1 loop
		if tuple.dateFin - SYSDATE <= 14 then
			message := 'Cher(e) ' || tuple.nomP || ', votre abonnement au stade se terminera dans 2 semaines.';
            
            insert into Mailing(Nom, Email, Message) values (tuple.nomP, tuple.email, message);
		end if;
	end loop;
end;
/





-- D/ Vues

-- Creation des roles
create role Entraineur;
grant Entraineur to (select IdPersonnel from PersonnelStade where fonction = 'Entraineur');

create role Directeur;
grant Directeur to (select IdPersonnel from PersonnelStade where fonction = 'Directeur');

-- Vue 1 : Affiche le nombre de trophées remportés par chaque club, même si certains clubs n'ont pas remporté de trophées.
create view ClassementTrophees as
select c.nomClub as Club, COUNT(t.IdClubGagnant) as nbrTrophees
from Club c
left join Trophees t on c.IdClub = t.IdClubGagnant
group by c.nomClub;
grant select on ClassementTrophees to Entraineur;


-- Vue 2: Liste les détails des abonnements actifs, y compris le nom, le prénom, la date de début et la date de fin prévue.
create view AbonnementsActifs as
select ea.IdPersonne, p.nomP, p.prenomP, ea.dateDebut, ea.dateFin
from est_abonne ea
join Personne p on ea.IdPersonne = p.IdPersonne
WHERE SYSDATE between ea.dateDebut and ea.dateFin;
grant select on AbonnementsActifs to Directeur;


-- Vue 3: Calcule la moyenne du nombre de buts marqués par match, en analysant les résultats des matchs.
create view MoyenneButs as
select m.IdMatch, m.dateMatch, avg(cast(substr(m.score, 1, 1) as int) + cast(substr(m.score, 3, 1) as int)) as MoyenneButs
from Matchs m
group by m.IdMatch, m.dateMatch;
grant select on MoyenneButs to Entraineur;


-- Vue 5: Affiche le nombre total de buts marqués par chaque club dans l'ordre décroissant, en excluant les clubs sans information.
create view PlusDeButsMarques as
select c.IdClub, c.nomClub,
		sum(cast(SUBSTR(m.score, 1, 1) as int) + CAST(SUBSTR(m.score, 3, 1) as int)) as TotalButsMarques
from Club c
left join Matchs m 
on c.IdClub = m.ClubDomicile or c.IdClub = m.ClubExterieur
group by c.IdClub, c.nomClub
having TotalButsMarques is not null
order by TotalButsMarques desc;
grant select on PlusDeButsMarques to Entraineur;


-- Vue 6 : Affiche le nombre de matchs joués à domicile et à l'extérieur par club.
create view MatchJouer as
select c.Idclub, c.nomClub,
    count(distinct case when m.IdClubDomicile = c.IdClub then m.IdMatch end) as matchDomicile,
    count(distinct case when m.IdClubExterieur = c.IdClub then m.IdMatch end) as matchExterieur
from Club c left join Matchs m 
on c.IdClub = m.IdClubDomicile or c.IdClub = m.IdClubExterieur
group by c.idclub, c.nomClub;
grant select on MatchJouer to Entraineur;







-- E/ Intégrité des données : les triggers

-- Trigger 1 : Interdiction de supprimer un club qui a déjà remporté des trophées.
create or replace trigger VerifierSuppressionClub
before delete on Club for each row

DECLARE
    nbr number;
BEGIN
    select count(*) into nbr from Trophees 
    where IdClubGagnant = :OLD.IdClub;
    if nbr > 0 then
        RAISE_APPLICATION_ERROR(-20001, 'Impossible de supprimer un club avec des trophées.');
    end if;
END;
/


-- Trigger 2 : Un abonné ne peut détenir qu'un seul abonnement actif à la fois pour un même stade.
create or replace trigger LimiterAbonnementsActifs
before insert on est_abonne for each row

DECLARE
    nbr number;
BEGIN
    select count(*) into nbr from est_abonne 
    where  IdPersonne = :NEW.IdPersonne 
    and IdStade = :NEW.IdStade 
    and SYSDATE between dateDebut and dateFin;
    if nbr > 0 then
        RAISE_APPLICATION_ERROR(-20002, 'Une personne ne peut avoir qu un abonnement actif à la fois par stade.');
    end if;
END;
/


-- Trigger 3 : Un abonné ne peut pas etre supprimer s'il possède un abonnement actif.
create or replace trigger SuppressionPersonne
before delete on Personne for each row

DECLARE
    nbr number;
BEGIN
	select count(*) into nbr from est_abonne 
	where IdPersonne = :OLD.IdPersonne 
	and SYSDATE between dateDebut and dateFin;
    IF nbr > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Impossible de supprimer une personne avec des abonnements actifs.');
    END IF;
END;
/


-- Trigger 4 : Vérifier la validité des scores des matchs. Les scores des matchs ne doivent pas être négatifs.
create or replace trigger VerifierScores
before delete on matchs for each row

DECLARE
	s_partie1 number;
	s_partie2 number;
BEGIN
	s_partie1 := TO_NUMBER(SUBSTR(:NEW.score, 1, 1));
	s_partie2 := TO_NUMBER(SUBSTR(:NEW.score, 3, 1));
	if s_partie1 < 0 OR s_partie2 < 0 then
		RAISE_APPLICATION_ERROR(-20004, 'Le score d''un match ne peut pas être négatif.');
    end if;
END;
/


-- Trigger 5 : Vérifier q'un stade ne peut avoir qu'un seul club à la fois.
create or replace trigger VerifierClub
before insert on Club for each row

DECLARE
    nbr number;
BEGIN
    select count(*) into nbr from Club
    where IdStade = :NEW.IdStade;
    
    if nbr > 0 then
        RAISE_APPLICATION_ERROR(-20005, 'Un stade ne peut avoir qu un seul club à la fois.');
    end if;
END;
/


-- Trigger 6 : Vérifier qu'un personnel ne peut travailler que dans un seul stade.
create or replace trigger VerifierPersonnelStade
before insert on PersonnelStade for each row

DECLARE
    nbr number;
BEGIN
    select COUNT(*) into nbr from PersonnelStade
    where IdPersonnel = :NEW.IdPersonnel
    and IdStade is not null;

    if nbr > 0 then
        RAISE_APPLICATION_ERROR(-20006, 'Le personnel ne peut travailler que dans un seul stade à la fois.');
    end if;
END;
/








-- F/ Méta-données

-- Script liste_ora_contraintes SQL qui affiche la liste de toutes les contraintes d'intégrité par table et par type, en 
-- incluant le corps de chaque contrainte
select at.table_name, acc.column_name, ac.constraint_name, ac.constraint_type, ac.search_condition
from all_tables at
join all_constraints ac on at.table_name = ac.table_name
join all_cons_columns acc on ac.constraint_name = acc.constraint_name
where
at.table_name in ('STADE', 'CLUB', 'MATCHS', 'TROPHEES', 'PERSONNELSTADE', 'PERSONNE', 'EST_ABONNE', 'ASSISTE')
order by
at.table_name, acc.column_name, ac.constraint_name;


-- Script SQL nommé liste_ora_triggers qui donne une fois exécuté la liste de tous les triggers définis, classés par nom de table.
select table_name, trigger_name
from all_triggers
where table_name in ('STADE', 'CLUB', 'MATCHS', 'TROPHEES', 'PERSONNELSTADE', 'PERSONNE', 'EST_ABONNE', 'ASSISTE')
order by table_name, trigger_name;


-- Script SQL nommé liste_ora_vues qui donne une fois exécuté la liste de tous les vues définis, classés par nom de table.
select name as view_name, referenced_name as table_name
from all_dependencies
where type = 'VIEW'
and referenced_name in ('STADE', 'CLUB', 'MATCHS', 'TROPHEES', 'PERSONNELSTADE', 'PERSONNE', 'EST_ABONNE', 'ASSISTE')
order by referenced_name;


-- Script SQL nommé liste_ora_colonnes qui donne une fois exécuté la liste des colonnes des tables définis, classés par nom de table.
select table_name, column_name, data_type, data_length, nullable
from all_tab_columns
where table_name in ('STADE', 'CLUB', 'MATCHS', 'TROPHEES', 'PERSONNELSTADE', 'PERSONNE', 'EST_ABONNE', 'ASSISTE')
order by table_name, column_id;





















BEGIN
    for t in (
		select table_name from all_tables
        where table_name in ('stade', 'club', 'matchs', 'trophees', 'personnelstade', 'personne', 'est_abonne', 'assiste')
        order by table_name
		) loop
        dbms_output.put_line(nbr || ' /');
        dbms_output.put_line('Table : ' || t.table_name);

        for c in (select constraint_name, constraint_type, search_condition
                  from all_constraints
                  where table_name = t.table_name) loop
            dbms_output.put_line('Nom de la contrainte : ' || c.constraint_name);
            dbms_output.put_line('Type de la contrainte : ' || c.constraint_type);
            if c.search_condition is not null then
                dbms_output.put_line('Condition de recherche : ' || c.search_condition);
            end if;
        end loop;

        dbms_output.new_line;
        nbr := nbr + 1;
    end loop;
END;
/
BEGIN
    liste_ora_contraintes;
END;
/


create or replace procedure liste_ora_triggers as
    nbr number := 1;
    
BEGIN
    for trig in (
        select trigger_name, table_name
        from user_triggers
        where table_name in ('stade', 'club', 'matchs', 'trophees', 'personnelstade', 'personne', 'est_abonne', 'assiste')
        order by table_name
    ) loop
        dbms_output.put_line(nbr || ' /');
        dbms_output.put_line('Table : ' || trig.table_name);
        dbms_output.put_line('Nom du déclencheur : ' || trig.trigger_name);
        nbr := nbr + 1;
        dbms_output.new_line();
    end loop;
END;
/
BEGIN
    liste_ora_triggers;
END;
/


create or replace procedure liste_ora_vues as  
    nbr number := 1;  
  
BEGIN  
    for v in (  
        select name, referenced_name  
        from all_dependencies  
        where referenced_name in ('stade', 'club', 'matchs', 'trophees', 'personnelstade', 'personne', 'est_abonne', 'assiste')  
		and type = 'VIEW'  
        order by referenced_name  
    ) loop  
        dbms_output.put_line(nbr || ' /');  
        dbms_output.put_line('Vue : ' || v.name);  
        dbms_output.put_line('Référence à : ' || v.referenced_name);  
        dbms_output.new_line;  
        nbr := nbr + 1;  
    end loop;  
END;
/
BEGIN  
    liste_ora_vues;  
END;
/

create or replace procedure liste_ora_colonnes as
    nbr number := 1;
    
BEGIN
    for col in (
        select table_name, column_name, data_type, data_length, nullable
        from all_tab_columns
        where table_name in ('stade', 'club', 'matchs', 'trophees', 'personnelstade', 'personne', 'est_abonne', 'assiste')
        order by table_name, column_id
    ) loop
        dbms_output.put_line(nbr || ' /');
        dbms_output.put_line('Table : ' || col.table_name);
        dbms_output.put_line('Colonne : ' || col.column_name);
        dbms_output.put_line('Type de données : ' || col.data_type);
        dbms_output.put_line('Longueur : ' || col.data_length);
        dbms_output.put_line('Nullable : ' || col.nullable);
        dbms_output.new_line;
        nbr := nbr + 1;
    end loop;
END;
/
BEGIN
    liste_ora_colonnes;
END;
/


































