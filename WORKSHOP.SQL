CREATE TABLE Produit(
    RefProd INT PRIMARY KEY AUTO_INCREMENT,
    Design VARCHAR(50) NOT NULL,
    PrixHT DECIMAL(10,2)
);

CREATE TABLE Facture(
    Numfact INT PRIMARY KEY AUTO_INCREMENT,
    DatFact DATE NOT NULL
);

CREATE TABLE Anc_Produit(
    RefProd INT PRIMARY KEY AUTO_INCREMENT,
    Design VARCHAR(50) NOT NULL,
    PrixHT DECIMAL(10,2)
);

CREATE TABLE Client(
    IdClient INT PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(50) NOT NULL,
    Prenom VARCHAR(50) NOT NULL,
    Ville VARCHAR(50) NOT NULL
);

CREATE TABLE Commande(
    IdCommande INT PRIMARY KEY AUTO_INCREMENT,
    Numfact INT NOT NULL,
    IdClient INT NOT NULL,
    FOREIGN KEY (Numfact) REFERENCES Facture(Numfact),
    FOREIGN KEY (IdClient) REFERENCES Client(IdClient)
);

CREATE TABLE Est_Facture(
    Numfact INT NOT NULL,
    RefProd INT NOT NULL,
    Qte INT DEFAULT 0,
    PRIMARY KEY (Numfact, RefProd),
    FOREIGN KEY (Numfact) REFERENCES Facture(Numfact),
    FOREIGN KEY (RefProd) REFERENCES Produit(RefProd)
);

CREATE TABLE Categorie_Produit(
    IdCateg INT PRIMARY KEY AUTO_INCREMENT,
    NomCateg VARCHAR(100)
);

CREATE TABLE Produit_Categorie(
    RefProd INT NOT NULL,
    IdCateg INT NOT NULL,
    PRIMARY KEY (RefProd, IdCateg),
    FOREIGN KEY (RefProd) REFERENCES Produit(RefProd),
    FOREIGN KEY (IdCateg) REFERENCES Categorie_Produit(IdCateg)
);


INSERT INTO Produit (Design, PrixHT) VALUES
('Livre', 120.0),
('Stylo Bic', 10.0),
('Cahier A4', 30.0),
('Gomme', 5.0),
('Sac à dos scolaire', 250.0),
('Ordinateur Dell', 9000.0),
('Tablette Samsung', 3200.0),
('Casque Bluetooth', 800.0),
('Imprimante HP', 1500.0),
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
('Calculatrice scientifique', 350.0),
('Lampe LED de bureau', 150.0),
('Sacoche pour ordinateur', 450.0),
('Disque SSD 512Go', 1000.0),
('Support écran ajustable', 750.0);


INSERT INTO Client (Nom, Prenom, Ville) VALUES
('El Idrissi', 'Omar', 'Casablanca'),
('Bennani', 'Fatima', 'Rabat'),
('Tazi', 'Mohamed', 'Fès'),
('Ouazzani', 'Sofia', 'Tanger'),
('Jebli', 'Hassan', 'Marrakech'),
('Ait Laheen', 'Karim', 'Agadir'),
('Essaidi', 'Imane', 'Oujda'),
('Hajji', 'Abdellah', 'Kenitra'),
('El Amrani', 'Yassine', 'Meknès'),
('Zaidi', 'Nadia', 'Essaouira');

INSERT INTO Facture (DatFact) VALUES
('2024-01-12'),('2024-01-15'),('2024-01-20'),('2024-01-28'),('2024-02-05'),
('2024-02-10'),('2024-03-05'),('2024-03-10'),('2024-03-15'),('2024-03-20');


INSERT INTO Commande (Numfact, IdClient) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);


INSERT INTO Est_Facture (Numfact, RefProd, Qte) VALUES
(1,1,2),(1,3,5),(2,2,10),(3,4,4),(4,5,1),(4,6,2),
(5,7,3),(5,8,2),(6,9,1),(6,10,4),(7,11,5),(7,12,2),
(8,13,1),(8,14,3),(9,15,2),(9,16,1),(10,17,5),(10,18,2);

INSERT INTO Categorie_Produit (NomCateg) VALUES
('Papeterie'),('Informatique'),('Accessoires'),('Stockage'),
('Audio'),('Périphérique'),('Equipements de bureau'),('Mobilier de Bureau');


INSERT INTO Produit_Categorie (RefProd, IdCateg) VALUES
(1,1),(2,1),(3,1),(4,1),(5,1),
(6,2),(7,2),(8,3),(9,2),(10,2),
(11,2),(12,3),(13,3),(14,4),(15,4),
(16,1),(17,7),(18,2),(19,7),(20,4);


INSERT INTO Anc_Produit (Design, PrixHT) VALUES
('Livre', 100),('Stylo Bic', 8),('Cahier A4', 25),
('Ordinateur Dell', 8500),('Imprimante HP', 1400),
('Carnet de notes', 30),('Agrafeuse', 40),
('Enceinte Bluetooth', 1000),('Rétroprojecteur', 4000),
('Paperboard', 850),('Calculatrice scientifique', 300),
('Lampe LED de bureau', 120),('Sacoche pour ordinateur', 400),
('Disque SSD 512Go', 900);

