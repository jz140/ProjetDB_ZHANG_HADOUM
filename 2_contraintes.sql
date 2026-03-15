USE boutique_meubles;

-- Validation des dimensions (Doivent être > 0)
ALTER TABLE PRODUIT ADD CONSTRAINT chk_poids CHECK (poids > 0);
ALTER TABLE PRODUIT ADD CONSTRAINT chk_dimensions CHECK (longueur > 0 AND largeur > 0 AND hauteur > 0);

-- Validation des prix
ALTER TABLE PRODUIT ADD CONSTRAINT chk_prix_vente CHECK (prix_vente_courant > 0);
ALTER TABLE APPROVISIONNER ADD CONSTRAINT chk_prix_achat CHECK (prix_achat > 0);

-- Validation des promotions
ALTER TABLE PROMOTION ADD CONSTRAINT chk_dates_promo CHECK (date_fin >= date_debut);
ALTER TABLE PROMOTION ADD CONSTRAINT chk_pourcentage CHECK (pourcentage_reduction BETWEEN 1 AND 100);

-- Validation du format email sommaire
ALTER TABLE CLIENT ADD CONSTRAINT chk_email CHECK (email_client LIKE '%@%.%');
