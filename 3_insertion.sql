USE boutique_meubles;

-- 1. Tables de base (indépendantes)
INSERT INTO CATEGORIE VALUES (1, 'Salons'), (2, 'Chambres'), (3, 'Cuisines'), (4, 'Bureaux'), (5, 'Décoration');

INSERT INTO CLIENT VALUES 
(1, 'Alice Martin', 'alice@mail.com', '0601020304'),
(2, 'Bob Durand', 'bob@mail.com', '0611121314'),
(3, 'Charlie Leroy', 'charlie@mail.com', '0621222324'),
(4, 'Diane Petit', 'diane@mail.com', '0631323334'),
(5, 'Eve Grand', 'eve@mail.com', '0641424344');

INSERT INTO FOURNISSEUR VALUES 
(1, 'Bois & Co', 15), (2, 'Métal Design', 10), (3, 'Tissus Confort', 20);

INSERT INTO ENTREPOT VALUES 
(1, 'Dépôt Nord', '12 rue des Usines, Lille'), (2, 'Dépôt Sud', '45 avenue du Soleil, Marseille');

INSERT INTO PROMOTION VALUES 
(1, 15, '2024-03-01', '2024-03-31'), (2, 30, '2024-06-01', '2024-06-30');

-- 2. Tables avec clés étrangères
INSERT INTO PRODUIT VALUES 
(101, 'Canapé 3 places', 'CB001', 'Canapé en tissu gris', 599.00, 1),
(102, 'Table basse', 'CB002', 'Table en chêne massif', 149.00, 1),
(103, 'Lit King Size', 'CB003', 'Lit avec sommier inclus', 899.00, 2),
(104, 'Armoire 2 portes', 'CB004', 'Armoire blanche laquée', 350.00, 2),
(105, 'Chaise de bureau', 'CB005', 'Chaise ergonomique noire', 120.00, 4);

INSERT INTO COMMANDE VALUES 
(501, '2024-03-10', 'Livré', 1),
(502, '2024-03-12', 'En cours', 2),
(503, '2024-03-14', 'En attente', 3);

-- 3. Tables de liaison
INSERT INTO LIGNE_COMMANDE VALUES 
(501, 101, 1, 599.00), (501, 102, 1, 149.00),
(502, 103, 1, 899.00),
(503, 105, 2, 120.00);

INSERT INTO STOCK VALUES 
(101, 1, 10), (102, 1, 25), (103, 2, 5), (104, 2, 8), (105, 1, 15);

INSERT INTO FOURNIS VALUES 
(101, 3, 300.00), (102, 1, 70.00), (103, 1, 450.00);

INSERT INTO CONCERNE VALUES (101, 1), (103, 2);