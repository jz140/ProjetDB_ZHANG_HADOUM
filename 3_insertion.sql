USE boutique_meubles;

-- 1. ON INSERE D'ABORD LES CATEGORIES (Indispensable pour l'ID 2)
INSERT INTO CATEGORIE (id_categorie, nom_categorie, id_categorie_1) VALUES 
(1, 'Salons', NULL), 
(2, 'Canapés', 1),   -- On crée ici l'ID 2 qui posait problème
(3, 'Tables basses', 1),
(4, 'Chambres', NULL);

-- 2. ON INSERE LES AUTRES TABLES PARENTES
INSERT INTO CLIENT VALUES (1, 'Alice Martin', 'alice@mail.com', '0601020304'), (2, 'Bob Durand', 'bob@mail.com', '0611121314');
INSERT INTO FOURNISSEUR VALUES (1, 'IKEA Suède', 10), (2, 'Hêtre France', 15);
INSERT INTO ENTREPOT VALUES (1, 'Entrepôt Nord', 'Lille'), (2, 'Entrepôt Sud', 'Marseille');
INSERT INTO PROMOTION VALUES (1, 15, '2024-03-01', '2024-03-31');

-- 3. MAINTENANT ON PEUT INSERER LES PRODUITS (Ils trouveront la catégorie 2)
INSERT INTO PRODUIT VALUES 
(101, 'Canapé EKTORP', 'CB101', 'Canapé 3 places gris', 499.00, 45.0, 218.0, 88.0, 88.0, 'Gris', 'Tissu', '2024-01-01', 2),
(102, 'Table LACK', 'CB102', 'Petite table blanche', 15.00, 3.0, 55.0, 55.0, 45.0, 'Blanc', 'Bois', '2024-01-05', 3);

-- 4. TABLES D'ASSOCIATION ET COMMANDES
INSERT INTO COMMANDE VALUES (501, '2024-03-10', 'Livré', 1);
INSERT INTO LIGNE_COMMANDE VALUES (501, 101, 1, 499.00);
INSERT INTO APPROVISIONNER VALUES (101, 1, 1, 10, 250.00), (102, 2, 2, 50, 5.00);
INSERT INTO CONCERNE VALUES (101, 1);
