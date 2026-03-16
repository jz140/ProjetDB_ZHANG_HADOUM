USE boutique_meubles;

-- ---------------------------
-- Remplissage de FOURNISSEUR
-- ---------------------------
INSERT INTO FOURNISSEUR (id_fournisseur, nom_fournisseur, delai_approvisionnement) VALUES
(1, 'Meubles & Co', '7 jours'),
(2, 'Design Scandinave', '10 jours'),
(3, 'Habitat Pro', '5 jours');

-- ---------------------------
-- Remplissage de ENTREPOT
-- ---------------------------
INSERT INTO ENTREPOT (id_entrepot, nom_entrepot, adresse_entrepot) VALUES
(1, 'Entrepot Nord', '12 Rue du Nord'),
(2, 'Entrepot Sud', '8 Avenue du Sud');

-- ---------------------------
-- Remplissage de CLIENT
-- ---------------------------
INSERT INTO CLIENT (id_client, nom_client, email_client, telephone_client) VALUES
(1, 'Alice Martin', 'alice.martin@email.com', 0601020304),
(2, 'Bob Dupont', 'bob.dupont@email.com', 0605060708),
(3, 'Claire Petit', 'claire.petit@email.com', 0608091011),
(4, 'David Moreau', 'david.moreau@email.com', 0611121314),
(5, 'Emma Leroy', 'emma.leroy@email.com', 0615161718);

-- ---------------------------
-- Remplissage de CATEGORIE
-- ---------------------------
INSERT INTO CATEGORIE (id_categorie, nom_categorie, id_categorie_1) VALUES
(1, 'Bibliothèques', NULL),
(2, 'Lits', NULL),
(3, 'Étagères', NULL),
(4, 'Canapés', NULL),
(5, 'Tables', NULL);

-- ---------------------------
-- Remplissage de PRODUIT
-- ---------------------------
INSERT INTO PRODUIT (id_produit, nom_produit, codebarres_produit, description_produit, prix_vente_courant_produit, prix_vente_en_ligne_produit, cout_fabrication_unitaire_produit, materiau_principal_produit, coloris_produit, poids_produit, longueur_produit, largeur_produit, hauteur_produit, date_ajout_produit, id_categorie) VALUES
(1, 'Bibliothèque BILLY', 100001, 'Bibliothèque en bois blanc', 79.99, 75, 30.00, 'Bois', 'Blanc', 25.0, 80.0, 30.0, 202.0, '2026-03-01', 1),
(2, 'Bibliothèque HEMNES', 100002, 'Bibliothèque en bois massif', 149.99, 140, 60.00, 'Bois', 'Chêne', 30.0, 90.0, 35.0, 200.0, '2026-03-02', 1),
(3, 'Lit MALM', 100003, 'Lit double avec rangement', 249.99, 230, 120.00, 'Bois', 'Blanc', 50.0, 200.0, 160.0, 35.0, '2026-03-03', 2),
(4, 'Lit BRIMNES', 100004, 'Lit avec tiroirs intégrés', 279.99, 260, 130.00, 'Bois', 'Noir', 55.0, 200.0, 160.0, 40.0, '2026-03-04', 2),
(5, 'Étagère KALLAX', 100005, 'Étagère modulable', 69.99, 65, 25.00, 'MDF', 'Blanc', 20.0, 77.0, 39.0, 147.0, '2026-03-05', 3),
(6, 'Étagère LACK', 100006, 'Étagère simple', 29.99, 28, 10.00, 'MDF', 'Noir', 10.0, 55.0, 26.0, 190.0, '2026-03-06', 3),
(7, 'Canapé EKTORP', 100007, 'Canapé 3 places confortable', 499.99, 480, 300.00, 'Tissu', 'Beige', 45.0, 230.0, 95.0, 90.0, '2026-03-07', 4),
(8, 'Canapé KLIPPAN', 100008, 'Canapé 2 places compact', 299.99, 280, 180.00, 'Tissu', 'Gris', 35.0, 180.0, 88.0, 80.0, '2026-03-08', 4),
(9, 'Table INGATORP', 100009, 'Table extensible', 199.99, 190, 100.00, 'Bois', 'Blanc', 40.0, 150.0, 90.0, 75.0, '2026-03-09', 5),
(10, 'Table LACK', 100010, 'Table basse simple', 49.99, 45, 20.00, 'MDF', 'Noir', 15.0, 90.0, 55.0, 45.0, '2026-03-10', 5);

-- ---------------------------
-- Remplissage de COMMANDE
-- ---------------------------
INSERT INTO COMMANDE (id_commande, date_commande, statut_commande, id_client) VALUES
(1, '2026-03-11 10:00:00', TRUE, 1),
(2, '2026-03-12 14:30:00', FALSE, 2),
(3, '2026-03-13 09:15:00', TRUE, 3),
(4, '2026-03-14 16:45:00', TRUE, 4),
(5, '2026-03-15 11:20:00', FALSE, 5);

-- ---------------------------
-- Remplissage de PROMOTION
-- ---------------------------
INSERT INTO PROMOTION (id_produit, id_promotion, pourcentage_reduction, date_debut, date_fin) VALUES
(1, 1, 10.00, '2026-03-01', '2026-03-31'),
(7, 2, 25.00, '2026-03-05', '2026-03-20');

-- ---------------------------
-- Remplissage de LIGNE_COMMANDE
-- ---------------------------
INSERT INTO LIGNE_COMMANDE (id_commande, id_produit, quantite_commandee, prix_unitaire, id_commande_1, id_produit_1) VALUES
(1, 1, 2, 79.99, 1, 1),
(1, 5, 1, 69.99, 1, 5),
(2, 3, 1, 249.99, 2, 3),
(3, 7, 1, 499.99, 3, 7),
(4, 2, 1, 149.99, 4, 2),
(4, 9, 1, 199.99, 4, 9),
(5, 6, 3, 29.99, 5, 6);

-- ---------------------------
-- Remplissage de APPROVISIONNER
-- ---------------------------
INSERT INTO APPROVISIONNER (id_produit, id_fournisseur, id_entrepot, quantite_livree, prix_achat_lot, date_livraison) VALUES
(1, 1, 1, 20, 500, '2026-03-01'),
(3, 2, 2, 10, 1200, '2026-03-02'),
(5, 1, 1, 15, 350, '2026-03-03'),
(7, 3, 2, 5, 1500, '2026-03-04'),
(9, 2, 1, 8, 800, '2026-03-05');

-- ---------------------------
-- Remplissage de CONCERNE
-- ---------------------------
INSERT INTO CONCERNE (id_produit, id_produit_1, id_promotion) VALUES
(1, 1, 1),
(7, 7, 2);
