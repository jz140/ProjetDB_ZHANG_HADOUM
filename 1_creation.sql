CREATE DATABASE IF NOT EXISTS boutique_meubles;
USE boutique_meubles;
-- ==========================================================
-- FICHIER : 1_creation.sql
-- OBJET : Création des tables et intégrité référentielle
-- ==========================================================

-- Désactivation des vérifications pour éviter les problèmes de dépendances lors de la création
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS CONCERNE, FOURNIS, STOCK, LIGNE_COMMANDE, COMMANDE, PRODUIT, PROMOTION, ENTREPOT, FOURNISSEUR, CLIENT, CATEGORIE;

-- Tables de base
CREATE TABLE CATEGORIE (
    id_categorie INT PRIMARY KEY,
    nom_categorie VARCHAR(100) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE CLIENT (
    id_client INT PRIMARY KEY,
    nom_client VARCHAR(100) NOT NULL,
    email_client VARCHAR(150),
    telephone VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE FOURNISSEUR (
    id_fournisseur INT PRIMARY KEY,
    nom_fournisseur VARCHAR(100) NOT NULL,
    delai_approvisionnement INT
) ENGINE=InnoDB;

CREATE TABLE ENTREPOT (
    id_entrepot INT PRIMARY KEY,
    nom_entrepot VARCHAR(100) NOT NULL,
    adresse_entrepot VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE PROMOTION (
    id_promotion INT PRIMARY KEY,
    pourcentage_reduction INT NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL
) ENGINE=InnoDB;

-- Tables avec dépendances
CREATE TABLE PRODUIT (
    id_produit INT PRIMARY KEY,
    nom_produit VARCHAR(100) NOT NULL,
    codebarres VARCHAR(50) UNIQUE,
    description_produit TEXT,
    prix_vente_courant DECIMAL(10,2) NOT NULL,
    id_categorie INT NOT NULL,
    CONSTRAINT fk_produit_categorie 
        FOREIGN KEY (id_categorie) REFERENCES CATEGORIE(id_categorie)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE COMMANDE (
    id_commande INT PRIMARY KEY,
    date_commande DATE NOT NULL,
    statut_commande VARCHAR(50),
    id_client INT NOT NULL,
    CONSTRAINT fk_commande_client 
        FOREIGN KEY (id_client) REFERENCES CLIENT(id_client)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- Tables d'associations (plusieurs à plusieurs)
CREATE TABLE LIGNE_COMMANDE (
    id_commande INT,
    id_produit INT,
    quantite_commandee INT NOT NULL,
    prix_unitaire DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_commande, id_produit),
    CONSTRAINT fk_ligne_commande 
        FOREIGN KEY (id_commande) REFERENCES COMMANDE(id_commande) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_ligne_produit 
        FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE STOCK (
    id_produit INT,
    id_entrepot INT,
    quantite_stock INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id_produit, id_entrepot),
    CONSTRAINT fk_stock_produit 
        FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_stock_entrepot 
        FOREIGN KEY (id_entrepot) REFERENCES ENTREPOT(id_entrepot) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE FOURNIS (
    id_produit INT,
    id_fournisseur INT,
    prix_achat DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_produit, id_fournisseur),
    CONSTRAINT fk_fournis_produit 
        FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_fournis_fournisseur 
        FOREIGN KEY (id_fournisseur) REFERENCES FOURNISSEUR(id_fournisseur) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE CONCERNE (
    id_produit INT,
    id_promotion INT,
    PRIMARY KEY (id_produit, id_promotion),
    CONSTRAINT fk_concerne_produit 
        FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_concerne_promotion 
        FOREIGN KEY (id_promotion) REFERENCES PROMOTION(id_promotion) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;