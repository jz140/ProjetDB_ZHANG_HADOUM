USE boutique_meubles;

-- Liste des produits dont le prix de vente en ligne est supérieur à 500€, triée par prix décroissant
SELECT nom_produit, prix_vente_en_ligne_produit
FROM PRODUIT
WHERE prix_vente_en_ligne_produit > 500
ORDER BY prix_vente_en_ligne_produit DESC;

-- Produits de certaines catégories ( ici on va utiliser chaise et table comme catégorie )
SELECT nom_produit, categorie_produit
FROM PRODUIT
WHERE categorie_produit IN ('Chaise', 'Table');

-- Produits dont le poids est compris entre 5 et 20 kg
SELECT nom_produit, poids_produit
FROM PRODUIT
WHERE poids_produit BETWEEN 5 AND 20;

-- Liste des clients avec email contenant "@gmail.com"
SELECT DISTINCT nom_client, email_client
FROM CLIENT
WHERE email_client LIKE '%@gmail.com';

-- Commandes passées entre le 01/01/2026 et le 31/03/2026
SELECT id_commande, date_commande, id_client
FROM COMMANDE
WHERE date_commande BETWEEN '2026-01-01' AND '2026-03-31';

-- Quantité totale commandée par produit
SELECT id_produit, SUM(quantite_commande) AS total_quantite
FROM LIGNE_COMMANDE
GROUP BY id_produit;

-- Chiffre d’affaires total par produit
SELECT id_produit, SUM(quantite_commande * prix_unitaire) AS chiffre_affaires
FROM LIGNE_COMMANDE
GROUP BY id_produit;

-- Moyenne des prix de vente des produits par catégorie
SELECT categorie_produit, AVG(prix_vente_courant_produit) AS prix_moyen
FROM PRODUIT
GROUP BY categorie_produit;

-- Clients ayant passé plus de 3 commandes
SELECT id_client, COUNT(id_commande) AS nb_commandes
FROM COMMANDE
GROUP BY id_client
HAVING COUNT(id_commande) > 3;

-- Produits ayant généré un chiffre d’affaires supérieur à 1000€
SELECT id_produit, SUM(quantite_commande * prix_unitaire) AS chiffre_affaires
FROM LIGNE_COMMANDE
GROUP BY id_produit
HAVING SUM(quantite_commande * prix_unitaire) > 1000;

-- Détail des commandes avec nom du client
SELECT C.nom_client, CO.id_commande, CO.date_commande
FROM COMMANDE CO
INNER JOIN CLIENT C ON CO.id_client = C.id_client;

-- Produits et promotions (s’il y a une promotion)
SELECT P.nom_produit, PR.pourcentage_reduction
FROM PRODUIT P
LEFT JOIN PROMOTION PR ON P.id_produit = PR.id_produit;

-- Produits commandés avec quantité et prix
SELECT L.id_produit, P.nom_produit, L.quantite_commande, L.prix_unitaire
FROM LIGNE_COMMANDE L
JOIN PRODUIT P ON L.id_produit = P.id_produit;

-- Clients et leurs commandes (y compris ceux qui n’ont jamais commandé)
SELECT C.nom_client, CO.id_commande
FROM CLIENT C
LEFT JOIN COMMANDE CO ON C.id_client = CO.id_client;

-- Produits et fournisseurs (approvisionnement)
SELECT P.nom_produit, A.id_fournisseur, A.prix_achat
FROM PRODUIT P
LEFT JOIN APPROVISIONNER A ON P.id_produit = A.id_produit;

-- Produits jamais commandés
SELECT nom_produit
FROM PRODUIT
WHERE id_produit NOT IN (SELECT id_produit FROM LIGNE_COMMANDE);

-- Clients n’ayant jamais passé de commande
SELECT nom_client
FROM CLIENT
WHERE id_client NOT IN (SELECT id_client FROM COMMANDE);

-- Produits dont le prix est supérieur au prix moyen
SELECT nom_produit, prix_vente_courant_produit
FROM PRODUIT
WHERE prix_vente_courant_produit > ALL (SELECT AVG(prix_vente_courant_produit) FROM PRODUIT);

-- Commandes contenant des produits en promotion
SELECT id_commande
FROM LIGNE_COMMANDE
WHERE id_produit IN (SELECT id_produit FROM PROMOTION);

-- Clients ayant commandé tous les produits d’une certaine catégorie
SELECT id_client
FROM LIGNE_COMMANDE
WHERE id_produit IN (SELECT id_produit FROM PRODUIT WHERE categorie_produit = 'Chaise')
GROUP BY id_client
HAVING COUNT(DISTINCT id_produit) = (SELECT COUNT(*) FROM PRODUIT WHERE categorie_produit = 'Chaise');