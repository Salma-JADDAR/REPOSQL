CREATE table Produit(
    RefProd int primary key AUTO_INCREMENT,
    Design VARCHAR(50),
    PrixHT decimal(10,2)
);
CREATE table Facture(
    Numfact int primary key AUTO_INCREMENT,
    DatFact date not null

);
CREATE table Anc_Produit(
    RefProd int primary key AUTO_INCREMENT,
    Design VARCHAR(50) not null,
    PrixHT decimal(10,2)
);
CREATE table Est_Facture (
    Numfact int not null,
    RefProd int not null,
     Qte int DEFAULT 0,
    primary key (Numfact,RefProd),
    FOREIGN key (Numfact) REFERENCES Facture (Numfact),
     FOREIGN key (RefProd) REFERENCES Produit (RefProd)
);
create table Client(
    IdClient int primary key AUTO_INCREMENT,
    Nom VARCHAR(50) not null,
    Prenom VARCHAR(50) not null,
    ville VARCHAR(50) not null
);
create table Commande(
    Numfact int not null,
    IdClient int not null,
    primary key (Numfact,IdClient),
    FOREIGN key ( Numfact) REFERENCES Facture( Numfact),
    FOREIGN key ( IdClient) REFERENCES Client ( IdClient)
);
CREATE TABLE Categorie_Produit (
    IdCateg INT PRIMARY KEY AUTO_INCREMENT,
    NomCateg VARCHAR(100)
);
CREATE TABLE Produit_Categorie (
    RefProd INT not null,
    IdCateg INT not null,
    PRIMARY KEY (RefProd, IdCateg),
    FOREIGN KEY (RefProd) REFERENCES Produit(RefProd),
    FOREIGN KEY (IdCateg) REFERENCES Categorie_Produit(IdCateg)
);
/************ insertion dans les tables *******/
-- Insert Products
INSERT INTO Produit (Design, PrixHT) VALUES
('Livre', 120.0),
('Stylo Bic', 10.0),
('Cahier A4', 30.0),
('Gomme', 5.0),
('Sac à dos scolaire', 250.0),
('Ordinateur Dell', 9000.0),
('Tablette Samsung', 3200.0),
('Casque Bluetooth', 800.0),
( 'Imprimante HP', 1500.0),
('Souris sans fil', 200.0),
('Clavier mécanique', 400.0),
('Tapis de souris', 80.0),
('Chargeur USB-C', 120.0),
('Disque Dur 1To', 600.0),
('Clé USB 64Go', 150.0),
('Carnet de notes', 35.0),
('Tableau Blanc', 500.0),
('Scanner Epson', 2500.0),
('Clé USB 128Go', 250.0),
('Batterie Externe 10000mAh', 350.0),
('Enceinte Bluetooth', 1200.0),
('Webcam HD', 800.0),
('Rétroprojecteur', 4500.0),
('Casque Gaming', 2200.0),
('Paperboard', 900.0),
('Calculate scientifique', 350.0),
('Lampe LED de bureau', 150.0),
('Sacoche pour ordinateur', 450.0),
('Disque SSD 512Go', 1000.0),
('Support écran ajustable', 750.0);

-- Insert Invoices
INSERT INTO Facture ( DatFact) VALUES
('2024-01-12'),
('2024-01-15'),
('2024-01-20'),
('2024-01-28'),
('2024-02-05'),
('2024-02-10'),
('2010-10-16'),
('2010-12-02'),
('2011-03-03'),
('2012-06-17'),
( '2015-09-25'),
('2018-12-08'),
('2020-07-21'),
('2022-05-30'),
( '2024-04-01'),
('2024-05-03'),
('2024-03-10'),
('2024-03-15');

-- Insert Clients
INSERT INTO Client ( Nom, Prenom, Ville) VALUES
('El Idrissi', 'Omar', 'Casablanca'),
('Bennani', 'Fatima', 'Rabat'),
('Tazi', 'Mohamed', 'Fès'),
('Ouazzani', 'Sofia', 'Tanger'),
('Jebli', 'Hassan', 'Marrakech'),
('Ait Laheen', 'Karim', 'Agadir'),
('Essaidi', 'Imane', 'Oujda'),
('Hajji', 'Abdellah', 'Kenitra'),
('El Amrani', 'Yassine', 'Meknès'),
('Zaidi', 'Nadia', 'Essaouira'),
( 'Karim', 'El Bachir', 'Fès'),
('Soukaina', 'Meziane', 'Rabat'),
('Yassir', 'Benali', 'Rabat'),
('Sarah', 'Touhami', 'Casablanca'),
('Nour', 'El Idrissi', 'Fès'),
('Walid', 'Moussa', 'Meknès'),
('Hind', 'Bakkali', 'Agadir'),
('Ali', 'Hammadi', 'Tanger'),
('Client', 'Supplémentaire', 'Rabat');

-- Insert Categories
INSERT INTO Categorie_Produit (NomCateg) VALUES
('Papeterie'),
('Informatique'),
('Accessoires'),
('Stockage'),
('Audio'),
('Périphérique'),
('Equipements de bureau'),
('Mobilier de Bureau');

-- Insert Product-Category Relationships
INSERT INTO Produit_Categorie (RefProd, IdCateg) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1),
(6, 2), (7, 2), (9, 2), (10, 2), (11, 2),
(8, 3), (12, 3), (13, 3), (14, 4), (15, 4),
(16, 1), (17, 7), (18, 2), (19, 7), (20, 4),
(21, 5), (22, 5), (23, 6), (24, 6), (25, 5),
(26, 7), (27, 1), (28, 7), (29, 3), (30, 4);

-- Insert Orders (Invoice-Client relationships)
INSERT INTO Commande (Numfact, IdClient) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 1), (8, 1), (9, 11), (10, 11),
(11, 12), (12, 12), (16, 19), (17, 2),
(10, 13), (11, 13), (12, 14), (13, 15),
(14, 16), (15, 17), (10, 18), (11, 18);

-- Insert Invoice Details (Est_Facture)
INSERT INTO Est_Facture (Numfact, RefProd, Qte) VALUES
(1, 1, 2), (1, 3, 5), (2, 2, 10), (3, 4, 4),
(4, 5, 1), (4, 6, 2), (5, 7, 3), (5, 8, 2),
(6, 9, 1), (6, 10, 4), (6, 11, 5), (7, 3, 2),
(8, 4, 1), (9, 5, 3), (10, 6, 4), (11, 7, 2),
(12, 8, 1), (16, 26, 2), (17, 27, 3), (18, 28, 1),
(19, 29, 2), (20, 30, 1), (21, 16, 3), (22, 17, 2),
(23, 18, 1), (24, 19, 5), (25, 20, 2), (26, 21, 4),
(27, 22, 2), (28, 23, 3), (29, 24, 1), (30, 25, 2);

-- Insert Product History (Anc_Produit)
INSERT INTO Anc_Produit (RefProd, Design, PrixHT) VALUES
(1, 'Livre', 100), (2, 'Stylo Bic', 8), (3, 'Cahier A4', 25),
(6, 'Ordinateur Dell', 8500), (9, 'Imprimante HP', 1400),
(16, 'Carnet de notes', 30), (19, 'Agrafeuse', 40),
(22, 'Enceinte Bluetooth', 1000), (24, 'Rétroprojecteur', 4000),
(26, 'Paperboard', 850), (27, 'Calculate scientifique', 300),
(28, 'Lampe LED de bureau', 120), (29, 'Sacoche pour ordinateur', 400),
(30, 'Disque SSD 512Go', 900);
