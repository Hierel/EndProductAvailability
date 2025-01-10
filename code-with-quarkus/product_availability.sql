CREATE DATABASE IF NOT EXISTS `product_availability` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `product_availability`;

CREATE TABLE IF NOT EXISTS `category` (
  `id_category` char(36) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `bDelete` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `category` (`id_category`, `name`, `description`, `date_created`, `bDelete`) VALUES
	('8eb81bd5-cdbd-11ef-bd31-9822eff265f8', 'Électronique', 'Produits technologiques modernes', '2024-01-01 10:00:00', 0),
	('8ebdd532-cdbd-11ef-bd31-9822eff265f8', 'Vêtements', 'Articles vestimentaires variés', '2024-01-02 11:00:00', 0),
	('8ebdd856-cdbd-11ef-bd31-9822eff265f8', 'Mobilier', 'Meubles pour maison et bureau', '2024-01-03 12:00:00', 0),
	('8ebdd91d-cdbd-11ef-bd31-9822eff265f8', 'Cuisine', 'Ustensiles et appareils de cuisine', '2024-01-04 13:00:00', 0),
	('8ebdd9dd-cdbd-11ef-bd31-9822eff265f8', 'Jardinage', 'Outils et accessoires pour jardin', '2024-01-05 14:00:00', 0),
	('8ebdda89-cdbd-11ef-bd31-9822eff265f8', 'Beauté', 'Produits cosmétiques et soins', '2024-01-06 15:00:00', 0),
	('8ebddb41-cdbd-11ef-bd31-9822eff265f8', 'Livres', 'Fiction, non-fiction et manuels', '2024-01-07 16:00:00', 0),
	('8ebddbed-cdbd-11ef-bd31-9822eff265f8', 'Jouets', 'Jeux et jouets pour enfants', '2024-01-08 17:00:00', 0),
	('8ebddca9-cdbd-11ef-bd31-9822eff265f8', 'Audio', 'Casques, enceintes et accessoires audio', '2024-01-09 18:00:00', 0),
	('8ebddd48-cdbd-11ef-bd31-9822eff265f8', 'Sport', 'Équipements sportifs et vêtements', '2024-01-10 19:00:00', 0),
	('8ebdddeb-cdbd-11ef-bd31-9822eff265f8', 'Bricolage', 'Matériaux et outils pour bricolage', '2024-01-11 10:00:00', 0),
	('8ebdde95-cdbd-11ef-bd31-9822eff265f8', 'Automobile', 'Accessoires et pièces automobiles', '2024-01-12 11:00:00', 0),
	('8ebddf43-cdbd-11ef-bd31-9822eff265f8', 'Santé', 'Produits médicaux et de bien-être', '2024-01-13 12:00:00', 0),
	('8ebddfec-cdbd-11ef-bd31-9822eff265f8', 'Éclairage', 'Luminaires et lampes design', '2024-01-14 13:00:00', 0),
	('8ebde091-cdbd-11ef-bd31-9822eff265f8', 'Décoration', 'Accessoires déco pour intérieur', '2024-01-15 14:00:00', 0),
	('8ebde13c-cdbd-11ef-bd31-9822eff265f8', 'Technologie', 'Gadgets et accessoires innovants', '2024-01-16 15:00:00', 0),
	('8ebde1e2-cdbd-11ef-bd31-9822eff265f8', 'Bijoux', 'Montres et accessoires de luxe', '2024-01-17 16:00:00', 0),
	('8ebde295-cdbd-11ef-bd31-9822eff265f8', 'Papeterie', 'Fournitures scolaires et de bureau', '2024-01-18 17:00:00', 0),
	('8ebde33d-cdbd-11ef-bd31-9822eff265f8', 'Jeux vidéo', 'Consoles et jeux interactifs', '2024-01-19 18:00:00', 0),
	('8ebde3df-cdbd-11ef-bd31-9822eff265f8', 'Chaussures', 'Chaussures pour toutes occasions', '2024-01-20 19:00:00', 0),
	('8ebde485-cdbd-11ef-bd31-9822eff265f8', 'Accessoires mode', 'Sacs, ceintures et chapeaux', '2024-01-21 10:00:00', 0),
	('8ebde530-cdbd-11ef-bd31-9822eff265f8', 'Enfants', 'Articles pour bébés et jeunes enfants', '2024-01-22 11:00:00', 0),
	('8ebde5d1-cdbd-11ef-bd31-9822eff265f8', 'Animalerie', 'Produits pour animaux de compagnie', '2024-01-23 12:00:00', 0),
	('8ebde671-cdbd-11ef-bd31-9822eff265f8', 'Montagne', 'Équipements pour sports d’hiver', '2024-01-24 13:00:00', 0),
	('8ebde719-cdbd-11ef-bd31-9822eff265f8', 'Plage', 'Accessoires et vêtements de plage', '2024-01-25 14:00:00', 0),
	('8ebde7ba-cdbd-11ef-bd31-9822eff265f8', 'Voyage', 'Valises, sacs et accessoires de voyage', '2024-01-26 15:00:00', 0),
	('8ebde85a-cdbd-11ef-bd31-9822eff265f8', 'Produits bio', 'Alimentation et soins naturels', '2024-01-27 16:00:00', 0),
	('8ebde8f9-cdbd-11ef-bd31-9822eff265f8', 'Informatique', 'PC, périphériques et accessoires', '2024-01-28 17:00:00', 0),
	('8ebde99e-cdbd-11ef-bd31-9822eff265f8', 'Photographie', 'Caméras et accessoires photo', '2024-01-29 18:00:00', 0),
	('8ebdea45-cdbd-11ef-bd31-9822eff265f8', 'Loisirs', 'Activités et jeux récréatifs', '2024-01-30 19:00:00', 0),
	('8ebdeae6-cdbd-11ef-bd31-9822eff265f8', 'Alimentation', 'Produits alimentaires variés', '2024-01-31 10:00:00', 0),
	('8ebdeb87-cdbd-11ef-bd31-9822eff265f8', 'Santé et fitness', 'Accessoires pour fitness et yoga', '2024-02-01 11:00:00', 0),
	('8ebdec32-cdbd-11ef-bd31-9822eff265f8', 'Artisanat', 'Matériaux et outils créatifs', '2024-02-02 12:00:00', 0),
	('8ebdeccf-cdbd-11ef-bd31-9822eff265f8', 'Drones', 'Appareils volants télécommandés', '2024-02-03 13:00:00', 0),
	('8ebded74-cdbd-11ef-bd31-9822eff265f8', 'Gaming', 'Accessoires pour gamers', '2024-02-04 14:00:00', 0),
	('8ebdee14-cdbd-11ef-bd31-9822eff265f8', 'Innovation', 'Produits technologiques innovants', '2024-02-05 15:00:00', 0),
	('8ebdeeb6-cdbd-11ef-bd31-9822eff265f8', 'Saison', 'Produits selon la saison', '2024-02-06 16:00:00', 0),
	('8ebdef57-cdbd-11ef-bd31-9822eff265f8', 'Maison', 'Décoration et accessoires de maison', '2024-02-07 17:00:00', 0),
	('8ebdefec-cdbd-11ef-bd31-9822eff265f8', 'Réseaux', 'Produits connectés pour la maison', '2024-02-08 18:00:00', 0);

CREATE TABLE IF NOT EXISTS `product` (
  `id_product` char(36) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `id_subcategory` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `id_provider` varchar(30) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `bDelete` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `product` (`id_product`, `name`, `unit_price`, `status`, `id_subcategory`, `stock`, `id_provider`, `date_updated`, `date_created`, `bDelete`) VALUES
  ('57d8722a-cdbe-11ef-bd31-9822eff265f8', 'iPhone 14', 999.99, 'Disponible', 1, 50, 'PROV001', '2024-01-10 10:00:00', '2024-01-01 10:00:00', 0),
  ('57eca7d3-cdbe-11ef-bd31-9822eff265f8', 'Samsung Galaxy S23', 899.99, 'Disponible', 1, 70, 'PROV002', '2024-01-10 10:00:00', '2024-01-02 10:00:00', 0),
  ('57f172b9-cdbe-11ef-bd31-9822eff265f8', 'Google Pixel 7', 799.99, 'Disponible', 1, 40, 'PROV003', '2024-01-10 10:00:00', '2024-01-03 10:00:00', 0),
  ('57f4bb99-cdbe-11ef-bd31-9822eff265f8', 'MacBook Air', 1299.99, 'Disponible', 2, 30, 'PROV004', '2024-01-10 10:00:00', '2024-01-04 10:00:00', 0),
  ('57f6f402-cdbe-11ef-bd31-9822eff265f8', 'Samsung Galaxy Tab S8', 599.99, 'Disponible', 2, 25, 'PROV005', '2024-01-10 10:00:00', '2024-01-05 10:00:00', 0);
