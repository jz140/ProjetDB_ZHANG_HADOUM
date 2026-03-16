CREATE DATABASE IF NOT EXISTS boutique_meubles;
USE boutique_meubles;

CREATE TABLE FOURNISSEUR (
    id_fournisseur INT PRIMARY KEY,
    nom_fournisseur VARCHAR(100) NOT NULL,
    delai_approvisionnement VARCHAR(20)
);

CREATE TABLE ENTREPOT (
    id_entrepot INT PRIMARY KEY,
    nom_entrepot VARCHAR(100) NOT NULL,
    adresse_entrepot VARCHAR(150)
);

CREATE TABLE CLIENT (
    id_client INT PRIMARY KEY,
    nom_client VARCHAR(100) NOT NULL,
    email_client VARCHAR(100),
    telephone_client INT
);

CREATE TABLE CATEGORIE (
    id_categorie INT PRIMARY KEY,
    nom_categorie VARCHAR(100) NOT NULL,
    id_categorie_1 INT,
    FOREIGN KEY (id_categorie_1) REFERENCES CATEGORIE(id_categorie)
);

CREATE TABLE PRODUIT (
    id_produit INT PRIMARY KEY,
    nom_produit VARCHAR(100) NOT NULL,
    codebarres_produit BIGINT,
    description_produit VARCHAR(255),
    prix_vente_courant_produit DECIMAL(10,2),
    prix_vente_en_ligne_produit DECIMAL(10,2),
    cout_fabrication_unitaire_produit DECIMAL(10,2),
    materiau_principal_produit VARCHAR(50),
    coloris_produit VARCHAR(50),
    poids_produit DECIMAL(6,2),
    longueur_produit DECIMAL(6,2),
    largeur_produit DECIMAL(6,2),
    hauteur_produit DECIMAL(6,2),
    date_ajout_produit DATE,
    id_categorie INT,
    FOREIGN KEY (id_categorie) REFERENCES CATEGORIE(id_categorie)
);

CREATE TABLE COMMANDE (
    id_commande INT PRIMARY KEY,
    date_commande DATETIME,
    statut_commande BOOLEAN,
    id_client INT,
    FOREIGN KEY (id_client) REFERENCES CLIENT(id_client)
);

CREATE TABLE PROMOTION (
    id_promotion INT PRIMARY KEY,
    id_produit INT,
    pourcentage_reduction DECIMAL(5,2),
    date_debut DATE,
    date_fin DATE,
    FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit)
);

CREATE TABLE LIGNE_COMMANDE (
    id_commande INT,
    id_produit INT,
    quantite_commandee INT,
    prix_unitaire DECIMAL(10,2),
    id_commande_1 INT,
    id_produit_1 INT,
    PRIMARY KEY (id_commande, id_produit),
    FOREIGN KEY (id_commande) REFERENCES COMMANDE(id_commande),
    FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit)
);

CREATE TABLE APPROVISIONNER (
    id_produit INT,
    id_fournisseur INT,
    id_entrepot INT,
    quantite_livree INT,
    prix_achat_lot DECIMAL(10,2),
    date_livraison DATE,
    PRIMARY KEY (id_produit, id_fournisseur, id_entrepot),
    FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit),
    FOREIGN KEY (id_fournisseur) REFERENCES FOURNISSEUR(id_fournisseur),
    FOREIGN KEY (id_entrepot) REFERENCES ENTREPOT(id_entrepot)
);

CREATE TABLE CONCERNE (
    id_produit INT,
    id_produit_1 INT,
    id_promotion INT,
    PRIMARY KEY (id_produit, id_promotion),
    FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit),
    FOREIGN KEY (id_produit_1) REFERENCES PRODUIT(id_produit),
    FOREIGN KEY (id_promotion) REFERENCES PROMOTION(id_promotion)
);


