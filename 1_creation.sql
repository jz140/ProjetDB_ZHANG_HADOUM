CREATE DATABASE IF NOT EXISTS boutique_meubles;
USE boutique_meubles;

DROP TABLE IF EXISTS CONCERNE;
DROP TABLE IF EXISTS APPROVISIONNER;
DROP TABLE IF EXISTS LIGNE_COMMANDE;
DROP TABLE IF EXISTS COMMANDE;
DROP TABLE IF EXISTS PRODUIT;
DROP TABLE IF EXISTS PROMOTION;
DROP TABLE IF EXISTS ENTREPOT;
DROP TABLE IF EXISTS FOURNISSEUR;
DROP TABLE IF EXISTS CLIENT;
DROP TABLE IF EXISTS CATEGORIE;

CREATE TABLE CATEGORIE (
    id_categorie INT PRIMARY KEY,
    nom_categorie VARCHAR(50) NOT NULL,
    id_categorie_1 INT, 
    FOREIGN KEY (id_categorie_1) REFERENCES CATEGORIE(id_categorie) ON DELETE SET NULL
);

CREATE TABLE CLIENT (
    id_client INT PRIMARY KEY,
    nom_client VARCHAR(50) NOT NULL,
    email_client VARCHAR(50),
    telephone VARCHAR(20)
);

CREATE TABLE FOURNISSEUR (
    id_fournisseur INT PRIMARY KEY,
    nom_fournisseur VARCHAR(50) NOT NULL,
    delai_approvisionnement INT
);

CREATE TABLE ENTREPOT (
    id_entrepot INT PRIMARY KEY,
    nom_entrepot VARCHAR(50) NOT NULL,
    adresse_entrepot VARCHAR(255)
);

CREATE TABLE PROMOTION (
    id_promotion INT PRIMARY KEY,
    pourcentage_reduction INT NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL
);

CREATE TABLE PRODUIT (
    id_produit INT PRIMARY KEY,
    nom_produit VARCHAR(50) NOT NULL,
    codebarres_produit INT UNIQUE NOT NULL,
    description_produit TEXT,
    statut_produit VARCHAR(50),
    prix_vente_courant_produit DECIMAL(10,2) NOT NULL,
    prix_vente_en_ligne_produit DECIMAL(10,2) NOT NULL,
    cout_fabrication_unitaire_produit INT NOT NULL,
    poids_produit DECIMAL(8,2),
    longueur_produit DECIMAL(8,2),
    largeur_produit DECIMAL(8,2),
    hauteur_produit DECIMAL(8,2),
    coloris_produit VARCHAR(50),
    materiau_produit VARCHAR(50),
    date_ajout_produit DATE NOT NULL,
    id_categorie INT NOT NULL,
    FOREIGN KEY (id_categorie) REFERENCES CATEGORIE(id_categorie) ON DELETE CASCADE
);

CREATE TABLE COMMANDE (
    id_commande INT PRIMARY KEY,
    date_commande DATE NOT NULL,
    statut_commande VARCHAR(50),
    id_client INT NOT NULL,
    FOREIGN KEY (id_client) REFERENCES CLIENT(id_client) ON DELETE CASCADE
);

CREATE TABLE LIGNE_COMMANDE (
    id_commande INT,
    id_produit INT,
    quantite_commandee INT NOT NULL,
    prix_unitaire DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_commande, id_produit),
    FOREIGN KEY (id_commande) REFERENCES COMMANDE(id_commande) ON DELETE CASCADE,
    FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit) ON DELETE CASCADE
);

CREATE TABLE APPROVISIONNER (
    id_produit INT,
    id_fournisseur INT,
    id_entrepot INT,
    quantite_livree INT NOT NULL DEFAULT 0,
    prix_achat_lot DECIMAL(10,2) NOT NULL,
    date_livraison DATE NOT NULL,
    PRIMARY KEY (id_produit, id_fournisseur, id_entrepot),
    FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit) ON DELETE CASCADE,
    FOREIGN KEY (id_fournisseur) REFERENCES FOURNISSEUR(id_fournisseur) ON DELETE CASCADE,
    FOREIGN KEY (id_entrepot) REFERENCES ENTREPOT(id_entrepot) ON DELETE CASCADE
);

CREATE TABLE CONCERNE (
    id_produit INT,
    id_promotion INT,
    PRIMARY KEY (id_produit, id_promotion),
    FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit) ON DELETE CASCADE,
    FOREIGN KEY (id_promotion) REFERENCES PROMOTION(id_promotion) ON DELETE CASCADE
);
