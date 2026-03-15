CREATE DATABASE IF NOT EXISTS boutique_meubles;
USE boutique_meubles;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS CONCERNE, APPROVISIONNER, LIGNE_COMMANDE, COMMANDE, PRODUIT, PROMOTION, ENTREPOT, FOURNISSEUR, CLIENT, CATEGORIE;

-- Table CATEGORIE (avec auto-référence pour les sous-catégories)
CREATE TABLE CATEGORIE (
    id_categorie INT PRIMARY KEY,
    nom_categorie VARCHAR(100) NOT NULL,
    id_parent INT,
    CONSTRAINT fk_categorie_parente FOREIGN KEY (id_parent) REFERENCES CATEGORIE(id_categorie) ON DELETE SET NULL
) ENGINE=InnoDB;

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

-- Table PRODUIT (Mise à jour avec tous les nouveaux champs du MCD)
CREATE TABLE PRODUIT (
    id_produit INT PRIMARY KEY,
    nom_produit VARCHAR(100) NOT NULL,
    codebarres VARCHAR(50) UNIQUE,
    description_produit TEXT,
    prix_vente_courant DECIMAL(10,2) NOT NULL,
    poids DECIMAL(8,2),
    longueur DECIMAL(8,2),
    largeur DECIMAL(8,2),
    hauteur DECIMAL(8,2),
    couleur VARCHAR(50),
    materiau VARCHAR(100),
    date_ajout DATE,
    id_categorie INT NOT NULL,
    CONSTRAINT fk_produit_categorie FOREIGN KEY (id_categorie) REFERENCES CATEGORIE(id_categorie) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE COMMANDE (
    id_commande INT PRIMARY KEY,
    date_commande DATE NOT NULL,
    statut_commande VARCHAR(50),
    id_client INT NOT NULL,
    CONSTRAINT fk_commande_client FOREIGN KEY (id_client) REFERENCES CLIENT(id_client) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table d'association LIGNE_COMMANDE (Nettoyée des doublons _1)
CREATE TABLE LIGNE_COMMANDE (
    id_commande INT,
    id_produit INT,
    quantite_commandee INT NOT NULL,
    prix_unitaire DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_commande, id_produit),
    CONSTRAINT fk_ligne_comm FOREIGN KEY (id_commande) REFERENCES COMMANDE(id_commande) ON DELETE CASCADE,
    CONSTRAINT fk_ligne_prod FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table Ternaire APPROVISIONNER (Remplace STOCK et FOURNIS)
CREATE TABLE APPROVISIONNER (
    id_produit INT,
    id_fournisseur INT,
    id_entrepot INT,
    quantite_stock INT NOT NULL DEFAULT 0,
    prix_achat DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_produit, id_fournisseur, id_entrepot),
    CONSTRAINT fk_app_prod FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit) ON DELETE CASCADE,
    CONSTRAINT fk_app_fourn FOREIGN KEY (id_fournisseur) REFERENCES FOURNISSEUR(id_fournisseur) ON DELETE CASCADE,
    CONSTRAINT fk_app_entre FOREIGN KEY (id_entrepot) REFERENCES ENTREPOT(id_entrepot) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE CONCERNE (
    id_produit INT,
    id_promotion INT,
    PRIMARY KEY (id_produit, id_promotion),
    CONSTRAINT fk_conc_prod FOREIGN KEY (id_produit) REFERENCES PRODUIT(id_produit) ON DELETE CASCADE,
    CONSTRAINT fk_conc_prom FOREIGN KEY (id_promotion) REFERENCES PROMOTION(id_promotion) ON DELETE CASCADE
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;
