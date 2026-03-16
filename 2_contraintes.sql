USE boutique_meubles;

-- produits
ALTER TABLE PRODUIT ADD CONSTRAINT chk_poids CHECK (poids_produit > 0);
ALTER TABLE PRODUIT ADD CONSTRAINT chk_dimensions CHECK (longueur_produit > 0 AND largeur_produit > 0 AND hauteur_produit > 0);
ALTER TABLE PRODUIT ADD CONSTRAINT chk_prix CHECK (prix_vente_courant_produit > 0 AND prix_vente_en_ligne_produit > 0);
ALTER TABLE PRODUIT ADD CONSTRAINT chk_cout_fabrication CHECK (cout_fabrication_unitaire_produit > 0);

-- approvisionner
ALTER TABLE APPROVISIONNER ADD CONSTRAINT chk_prix_achat CHECK (prix_achat > 0);

-- promotion
ALTER TABLE PROMOTION ADD CONSTRAINT chk_dates_promo CHECK (date_fin >= date_debut);
ALTER TABLE PROMOTION ADD CONSTRAINT chk_pourcentage CHECK (pourcentage_reduction BETWEEN 1 AND 100);

-- client
ALTER TABLE CLIENT ADD CONSTRAINT chk_email CHECK (email_client LIKE '%@%.%');
 
 -- ligne_commande
 ALTER TABLE LIGNE_COMMANDE ADD CONSTRAINT chk_quantite CHECK (quantite_commande > 0);
 ALTER TABLE LIGNE_COMMANDE ADD CONSTRAINT chk_prix_commande CHECK (prix_unitaire >0);
 
