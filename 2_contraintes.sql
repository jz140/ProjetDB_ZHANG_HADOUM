-- ==========================================================
-- FICHIER : 2_contraintes.sql
-- OBJET : Règles métiers et validations de données
-- ==========================================================

-- 1. Validation des prix et quantités (Toujours positifs)
ALTER TABLE PRODUIT ADD CONSTRAINT chk_prix_vente 
    CHECK (prix_vente_courant > 0);

ALTER TABLE LIGNE_COMMANDE ADD CONSTRAINT chk_quantite_pos 
    CHECK (quantite_commandee > 0);

ALTER TABLE STOCK ADD CONSTRAINT chk_stock_min 
    CHECK (quantite_stock >= 0);

-- 2. Validation des dates (Logique chronologique)
ALTER TABLE PROMOTION ADD CONSTRAINT chk_dates_promo 
    CHECK (date_fin >= date_debut);

-- 3. Validation des formats (Règles métiers spécifiques)
-- Exemple : Le pourcentage de réduction doit être entre 1 et 100
ALTER TABLE PROMOTION ADD CONSTRAINT chk_pourcentage 
    CHECK (pourcentage_reduction BETWEEN 1 AND 100);

-- Exemple : Le délai fournisseur ne peut pas dépasser 365 jours
ALTER TABLE FOURNISSEUR ADD CONSTRAINT chk_delai 
    CHECK (delai_approvisionnement <= 365);

-- 4. Validation du format email (Contrainte simplifiée)
ALTER TABLE CLIENT ADD CONSTRAINT chk_email_format 
    CHECK (email_client LIKE '%@%.%');