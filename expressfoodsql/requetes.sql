----------------  AUTHENTIFICATION  ---------------

--Création d'un compte utilisateur
INSERT INTO utilisateur
VALUES (NULL,"Dupont.p","test","client");

--Ajout d'un nouveau client
INSERT INTO client 
VALUES (NULL, "Henry","Thierry", 0298917768, "thierry.henry@gmail.com",1);
INSERT INTO adresse_livraison
VALUES (NULL,"Place Graslin",7,"NANTES",75001,"n°4 sur l'interphone","Zone 1",1);
INSERT INTO utilisateur
VALUES (NULL,"Henry.t","mdp","client");

--Ajout d'un livreur
INSERT INTO livreur 
VALUES (NULL,"Macron","Emmanuel",true,"Zone 1",5);
INSERT INTO utilisateur
VALUES (NULL,"Macron.e","mdp","livreur");

--------------   PASSER UNE COMMANDE  --------------

--Afficher les articles au menu
SELECT * FROM article WHERE auMenu=true --SHOW

--Création de la commande
INSERT INTO commande
VALUES (NULL,"2018-05-31 14:12:00",false,false,false,1,1,1);

--Ajout des produits
INSERT INTO Detail_commande
VALUES 
(1,1,1,"Lasagnes",1),
(1,1,1,"Jambalaya",1),
(1,1,1,"Fondant au chocolat",2);

--Modification d'un produit dans la commande
UPDATE detail_commande SET quantite="nombre de produits souhaité" WHERE id_article="type article" AND id_commande="id de la commande";

--Affichage prix total commande --SHOW
UPDATE commande 
SET prixTotal = 
	(SELECT sum(detail_commande.quantite * prixUnitaire) 
		FROM detail_commande 
		JOIN article 
        ON idarticle = article_idArticle
		WHERE detail_commande.commande_idCommande =(1)) 
	WHERE idCommande=(1);

--Afficher commande
SELECT * FROM commande --SHOW

--Réglement commande
UPDATE commande SET reglementClient=true WHERE idCommande="numéro commande réglée";

--------------  LIVRER UNE COMMANDE  ---------------

--Sélection des livreurs disponibles dans la zone de livraison --SHOW
SELECT *
FROM livreur
INNER JOIN adresse_livraison
    ON position = zoneAdresse
WHERE position= "zone 1" AND dispo=true;

--affichage du contenu de la commande au livreur
SELECT * FROM detail_commande WHERE commande_idCommande="id de la commande à livrer"; --SHOW

-- le livreur prend en charge la commande
UPDATE livreur SET dispo=false WHERE idLivreur="id du livreur en charge de la commande";
UPDATE commande SET priseEnCharge=true WHERE idCommande="id de la commande à livrer";

--Temps de livraison
UPDATE livraison SET tempsLivraison="temps estimee de livraison" WHERE commande_idCommande="id de la commande à livrer"; --(le livreur estime lui même le temps de livraison)

--Livreur a livré la commande 
UPDATE commande SET commandeLivree=true WHERE idCommande="id de la commande en cours";
UPDATE sac_livreur SET stockLivreur=stockLivreur - "nombre d'article de la commande" WHERE article_idarticle="id de l'article livré" AND livreur_idlivreur="id du livreur";
UPDATE livreur SET dispo=true WHERE idLivreur="id du livreur concerné";

---------------- SUIVI COMMANDE POUR LE CLIENT -------------
--Affichage prise en charge
SELECT priseEnCharge FROM commande WHERE idCommande="id de la commande du client";
--if true = La commande a été prise en charge
--if false = La commande est en attente de prise en charge

--Affichage le délai estimé de livraison
SELECT tempsLivraisonEstime FROM livraison WHERE commande_idCommande="id de la commande du client";

------------  RAVITAILLEMENT LIVREUR  -------------
--Afficher le stock des livreurs
SELECT * FROM sac_livreur WHERE livreur_idlivreur="id du livreur";

--Modifier les stocks suite au ravitaillement 
UPDATE sac_livreur SET stockLivreur=stockLivreur + "nombre d'article pris par le livreur" WHERE article_idArticle="id de l'article pris par le livreur"AND livreur_idLivreur= "id du livreur";
UPDATE article SET stock=stock - "articles pris par le livreur" WHERE idArticle="id de l'article pris par le livreur";

-------------- AJOUT D'UN PLAT AU MENU -------------
--Création de nouveau plat 
INSERT INTO article
VALUES ("Lasagnes","Lasagnes maison réalisé selon la recette familiale du chef",true,11.90,50,"plat");

--Retrait des articles à afficher au menu du jour
UPDATE article SET auMenu=false WHERE idArticle="nom du plat à afficher au menu"; --SHOW SELECT * FROM article

--Selection des articles à afficher au menu du jour
UPDATE article SET auMenu=true WHERE idArticle="nom du plat à afficher au menu";

--Suppression d'un plat de la liste
DELETE FROM article WHERE idArticle="nom du plat à supprimer"

----------------- STATISTIQUES ----------------

--Afficher toutes les commandes du jour
SELECT * FROM commande WHERE dateCommande LIKE "2018-05-31%" --SHOW
--Afficher le prix moyen des commandes
SELECT AVG (prixTotal) AS "prix moyen des commandes" FROM commande -- SHOW


