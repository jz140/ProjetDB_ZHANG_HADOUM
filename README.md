Voici le prompt utilisé : Tu travailles dans le domaine de l’ammeublement. Ton entreprise a comme activité de fabriquer des meubles et de les vendre.
C’est une entreprise comme Ikea, Leroy merlin. Metier, les produits avec description, les achats, la date.
Inspire- https://www.ikea.com/fr/fr/ suivant : https://www.ikea.com/fr/fr/cat/rangements-papier-et-multimedia-16202/, https://www.ikea.com/fr/fr/rooms/dining/, https://www.ikea.com/fr/fr/cat/lower-price/, https://www.ikea.com/fr/fr/cat/rangement-pour-documents-et-accessoires-media-10551/ .
Ton entreprise veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c’est-à-dire de collecter les besoins auprès de l’entreprise.
Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu’il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données.
D’abord, établis les règles de gestions des données de ton entreprise, sous la forme d'une liste à puce. Elle doit correspondre aux informations que fournit quelqu’un qui connaît le fonctionnement de l’entreprise, mais pas comment se construit un système d’information.
Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres.
Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite.
Fournis donc les règles de gestion et le dictionnaire de données

Et voici les images pris de la discussion avec l'IA :

<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/65c46818-4eca-493d-919d-34d722cca9b9" />
<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/af337cf8-1499-4bf1-8150-7047501f843e" />
<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/d739af74-069e-4373-b056-a2ce285416e9" />
<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/94fbc354-f2e8-4df5-945c-fc7fc5ed65c3" />
<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/06e022c7-ef59-4c75-86ca-0ae78d904c28" />
<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/80867957-bc72-4df5-a73d-0fc842f6697b" />

Nous avons ajouté deux autres attributs dans l'entité client qui sont : "email_client" et "telephone_client". 
Nous avons enlevé plusieurs attributs a l'entité produit qui sont : "statut_produit", "date_mise_marche".
Nous avons changé un attribut dans l'entité produit : "date_creation_marche" en "date_ajout_produit".

Voici une image de notre MCD : 
![ScreenShot](https://github.com/jz140/ProjetDB_ZHANG_HADOUM/blob/main/image%20/image%20du%20MCD.png)

Voici une image du MLD:
![ScreenShot](https://github.com/jz140/ProjetDB_ZHANG_HADOUM/blob/main/image%20/image%20du%20MLD.png)


Voici notre scénario d'utilisation : 

Le responsable marketing souhaite analyser les ventes, les produits et les promotions pour préparer une prochaine campagne et suivre les performances de la boutique.

Il cherche donc des données à extraire pour les analyser :
- Liste des produits disponibles et de leurs prix.
- Produits en promotion et le pourcentage de réduction.
- Clients ayant passé des commandes importantes.
- Statistiques sur les ventes (quantité moyenne, chiffre d’affaires…).
- Produits rarement commandés ou non vendus.


