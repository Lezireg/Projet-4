-- Utilisateurs
INSERT INTO utilisateur
VALUES 
(NULL,"Henry.t","mdp","client"),
(NULL,"Ronaldo.c","mdp","client"),
(NULL,"Nadal.r","mdp","client"),
(NULL,"Zidane.z","mdp","client"),
(NULL,"Macron.e","mdp","livreur"),
(NULL,"Paradis.v","mdp","livreur"),
(NULL,"Mauresmo.a","mdp","livreur"),
(NULL,"Griezman.a","mdp","livreur");

-- Clients
INSERT INTO client 
VALUES 
(NULL, "Henry","Thierry", 0298917768, "thierry.henry@gmail.com",1),
(NULL, "Ronaldo","Christiano", 0298917768, "ronaldo.christiano@gmail.com",2),
(NULL, "Nadal","Raphaël", 0298917768, "raphael.nadal@gmail.com",3),
(NULL, "Zidane","Zinedine", 0298917768, "zinedine.zidane@gmail.com",4);

-- Adresses
INSERT INTO adresse_livraison
VALUES 
(NULL,"Place Graslin",7,"NANTES",75001,"n°4 sur l'interphone","Zone 1",1),
(NULL,"Rue maréchal Joffre",12,"NANTES",75001,"sonner au n°4","Zone 2",2),
(NULL,"Rue Jean Jaurès",156,"NANTES",75001,"Au fond de l'impasse","Zone 3",3),
(NULL,"Boulevard des poilus",26,"NANTES",75001,NULL,"Zone 1",4);

-- Commandes
INSERT INTO commande
VALUES 
(NULL,"2018-05-31 14:12:00",false,false,false,1,1,1),
(NULL,"2018-05-31 14:20:00",false,false,false,1,2,2),
(NULL,"2018-05-31 14:36:00",false,false,false,1,3,3),
(NULL,"2018-06-31 11:24:00",false,false,false,1,4,4),
(NULL,"2018-06-31 12:56:00",false,false,false,1,4,4),
(NULL,"2018-06-31 13:17:00",false,false,false,1,1,1);

-- Livreurs
INSERT INTO livreur
VALUES 
(NULL,"Macron","Emmanuel",true,"Zone 1",5),
(NULL,"Paradis","Vanessa",true,"Zone 1",6),
(NULL,"Mauresmo","Amelie",false,"Zone 2",7),
(NULL,"Griezman","Antoine",true,"Zone 3",8);

-- Livraisons
INSERT INTO Livraison
VALUES 
(1,5,1,12),
(2,2,8,8),
(3,3,7,10),
(4,4,5,18),
(5,4,6,6),
(6,1,8,14);

-- Articles
INSERT INTO article
VALUES 
("Lasagnes","Lasagnes maison réalisé selon la recette familiale du chef",true,11.90,50,"plat"),
("Jambalaya","Spécialité culinaire à base de riz, emblématique de la Louisiane",true,10.90,50,"plat"),
("Burger","Cheesburger maison, à déguster au plus vite",false,12.90,50,"plat"),
("Mousse au chocolat/menthe","La mousse au chocolat revisitée",true,5.90,50,"dessert"),
("Fondant au chocolat","La spécialité de la maison",true,3.90,50,"dessert"),
("Clafoutis","Grand classique aux cerises",false,4.90,50,"dessert");

-- Detail_commande
INSERT INTO Detail_commande
VALUES 

-- Commande 1
(1,1,"Lasagnes",1),
(1,1,"Jambalaya",1),
(1,1,"Fondant au chocolat",2),

-- Commande 2
(2,2,"Lasagnes",1),
(2,2,"Fondant au chocolat",1),

-- Commande 3
(3,3,"Lasagnes",1),
(3,3,"Burger",1),
(3,3,"Clafoutis",2),

-- Commande 4
(4,4,"Lasagnes",1),
(4,4,"Mousse au chocolat/menthe",1),

-- Commande 5
(5,4,"Jambalaya",1),
(5,4,"Fondant au chocolat",1),

-- Commande 6
(6,1,"Lasagnes",1),
(6,1,"Fondant au chocolat",1);

-- Stock livreurs
INSERT INTO sac_livreur
VALUES 
(1,"Lasagnes",3),
(1,"Jambalaya",2),
(1,"Mousse au chocolat/menthe",1),
(1,"Fondant au chocolat",0),
(2,"Lasagnes",5),
(2,"Jambalaya",2),
(2,"Mousse au chocolat/menthe",3),
(2,"Fondant au chocolat",4),
(3,"Lasagnes",3),
(3,"Jambalaya",4),
(3,"Mousse au chocolat/menthe",0),
(3,"Fondant au chocolat",4),
(4,"Lasagnes",0),
(4,"Jambalaya",3),
(4,"Mousse au chocolat/menthe",1),
(4,"Fondant au chocolat",1);