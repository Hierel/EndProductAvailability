-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.4.27-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour product_availability
CREATE DATABASE IF NOT EXISTS `product_availability` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `product_availability`;

-- Listage de la structure de table product_availability. category
CREATE TABLE IF NOT EXISTS `category` (
  `id_category` char(36) NOT NULL DEFAULT uuid(),
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `bDelete` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table product_availability.category : ~48 rows (environ)
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
	('8ebdee14-cdbd-11ef-bd31-9822eff265f8', 'Musique', 'Instruments et accessoires musicaux', '2024-02-05 15:00:00', 0),
	('8ebdeeb6-cdbd-11ef-bd31-9822eff265f8', 'Énergie solaire', 'Panneaux et accessoires écologiques', '2024-02-06 16:00:00', 0),
	('8ebdef5b-cdbd-11ef-bd31-9822eff265f8', 'Voyage', 'Articles pour l’aventure et exploration', '2024-02-07 17:00:00', 0),
	('8ebdefff-cdbd-11ef-bd31-9822eff265f8', 'Smart Home', 'Produits pour maison connectée', '2024-02-08 18:00:00', 0),
	('8ebdf0a4-cdbd-11ef-bd31-9822eff265f8', 'Collectibles', 'Objets de collection', '2024-02-09 19:00:00', 0),
	('8ebdf146-cdbd-11ef-bd31-9822eff265f8', 'Piscine', 'Accessoires pour piscine et spa', '2024-02-10 10:00:00', 0),
	('8ebdf1e6-cdbd-11ef-bd31-9822eff265f8', 'Industrie', 'Matériel et équipements industriels', '2024-02-11 11:00:00', 0),
	('8ebdf288-cdbd-11ef-bd31-9822eff265f8', 'Accessoires maison', 'Produits utiles pour la maison', '2024-02-12 12:00:00', 0),
	('8ebdf32f-cdbd-11ef-bd31-9822eff265f8', 'Objets personnalisés', 'Cadeaux et créations uniques', '2024-02-13 13:00:00', 0),
	('8ebdf3db-cdbd-11ef-bd31-9822eff265f8', 'Produits ménagers', 'Produits de nettoyage et d’entretien', '2024-02-14 14:00:00', 0),
	('8ebdf487-cdbd-11ef-bd31-9822eff265f8', 'Montres connectées', 'Smartwatches et accessoires', '2024-02-15 15:00:00', 0),
	('8ebdf52a-cdbd-11ef-bd31-9822eff265f8', 'Équipements médicaux', 'Appareils et accessoires médicaux', '2024-02-16 16:00:00', 0),
	('8ebdf5db-cdbd-11ef-bd31-9822eff265f8', 'Ski', 'Matériel et vêtements pour sports d’hiver', '2024-02-17 17:00:00', 0);

-- Listage de la structure de table product_availability. product
CREATE TABLE IF NOT EXISTS `product` (
  `id_product` char(36) NOT NULL DEFAULT uuid(),
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

-- Listage des données de la table product_availability.product : ~39 rows (environ)
INSERT INTO `product` (`id_product`, `name`, `unit_price`, `status`, `id_subcategory`, `stock`, `id_provider`, `date_updated`, `date_created`, `bDelete`) VALUES
	('57d8722a-cdbe-11ef-bd31-9822eff265f8', 'iPhone 14', 999.99, 'Disponible', 1, 50, 'PROV001', '2024-01-10 10:00:00', '2024-01-01 10:00:00', 0),
	('57eca7d3-cdbe-11ef-bd31-9822eff265f8', 'Samsung Galaxy S23', 899.99, 'Disponible', 1, 70, 'PROV002', '2024-01-10 10:00:00', '2024-01-02 10:00:00', 0),
	('57ecab48-cdbe-11ef-bd31-9822eff265f8', 'MacBook Pro 16"', 2399.99, 'Disponible', 2, 30, 'PROV003', '2024-01-10 10:00:00', '2024-01-03 10:00:00', 0),
	('57ecac2c-cdbe-11ef-bd31-9822eff265f8', 'Dell XPS 15', 1799.99, 'Disponible', 2, 40, 'PROV004', '2024-01-10 10:00:00', '2024-01-04 10:00:00', 0),
	('57ecacfc-cdbe-11ef-bd31-9822eff265f8', 'AirPods Pro', 249.99, 'Disponible', 5, 200, 'PROV005', '2024-01-10 10:00:00', '2024-01-05 10:00:00', 0),
	('57ecadc2-cdbe-11ef-bd31-9822eff265f8', 'Baskets Nike Air', 129.99, 'Disponible', 3, 100, 'PROV006', '2024-01-10 10:00:00', '2024-01-06 10:00:00', 0),
	('57ecae94-cdbe-11ef-bd31-9822eff265f8', 'Canon EOS R6', 2499.99, 'Disponible', 4, 20, 'PROV007', '2024-01-10 10:00:00', '2024-01-07 10:00:00', 0),
	('57ecaf7d-cdbe-11ef-bd31-9822eff265f8', 'Sony WH-1000XM5', 399.99, 'Disponible', 5, 60, 'PROV008', '2024-01-10 10:00:00', '2024-01-08 10:00:00', 0),
	('57ecb04f-cdbe-11ef-bd31-9822eff265f8', 'Mixeur KitchenAid', 199.99, 'Disponible', 6, 80, 'PROV009', '2024-01-10 10:00:00', '2024-01-09 10:00:00', 0),
	('57ecb10f-cdbe-11ef-bd31-9822eff265f8', 'Liseuse Kindle', 129.99, 'Disponible', 7, 120, 'PROV010', '2024-01-10 10:00:00', '2024-01-10 10:00:00', 0),
	('57ecb1cc-cdbe-11ef-bd31-9822eff265f8', 'Jeu de société Monopoly', 29.99, 'Disponible', 8, 150, 'PROV011', '2024-01-10 10:00:00', '2024-01-11 10:00:00', 0),
	('57ecb299-cdbe-11ef-bd31-9822eff265f8', 'Tondeuse Bosch', 399.99, 'Disponible', 9, 25, 'PROV012', '2024-01-10 10:00:00', '2024-01-12 10:00:00', 0),
	('57ecb516-cdbe-11ef-bd31-9822eff265f8', 'Sweat à capuche Adidas', 49.99, 'Disponible', 10, 200, 'PROV013', '2024-01-10 10:00:00', '2024-01-13 10:00:00', 0),
	('57ecb5db-cdbe-11ef-bd31-9822eff265f8', 'Robe d’été Zara', 59.99, 'Disponible', 10, 180, 'PROV014', '2024-01-10 10:00:00', '2024-01-14 10:00:00', 0),
	('57ecb694-cdbe-11ef-bd31-9822eff265f8', 'Table en bois Ikea', 299.99, 'Disponible', 11, 40, 'PROV015', '2024-01-10 10:00:00', '2024-01-15 10:00:00', 0),
	('57ecb747-cdbe-11ef-bd31-9822eff265f8', 'Canapé 3 places', 799.99, 'Disponible', 11, 10, 'PROV016', '2024-01-10 10:00:00', '2024-01-16 10:00:00', 0),
	('57ecb7f6-cdbe-11ef-bd31-9822eff265f8', 'Lampe de bureau Philips', 49.99, 'Disponible', 12, 120, 'PROV017', '2024-01-10 10:00:00', '2024-01-17 10:00:00', 0),
	('57ecb8c3-cdbe-11ef-bd31-9822eff265f8', 'Cafetière Nespresso', 129.99, 'Disponible', 6, 90, 'PROV018', '2024-01-10 10:00:00', '2024-01-18 10:00:00', 0),
	('57ecb97c-cdbe-11ef-bd31-9822eff265f8', 'Livre Harry Potter', 19.99, 'Disponible', 7, 300, 'PROV019', '2024-01-10 10:00:00', '2024-01-19 10:00:00', 0),
	('57ecba40-cdbe-11ef-bd31-9822eff265f8', 'Outil multifonctions Bosch', 149.99, 'Disponible', 9, 50, 'PROV020', '2024-01-10 10:00:00', '2024-01-20 10:00:00', 0),
	('57ecbb02-cdbe-11ef-bd31-9822eff265f8', 'Sac à dos Herschel', 79.99, 'Disponible', 13, 80, 'PROV021', '2024-01-10 10:00:00', '2024-01-21 10:00:00', 0),
	('57ecbbc4-cdbe-11ef-bd31-9822eff265f8', 'Lunettes de soleil Ray-Ban', 159.99, 'Disponible', 13, 60, 'PROV022', '2024-01-10 10:00:00', '2024-01-22 10:00:00', 0),
	('57ecbc83-cdbe-11ef-bd31-9822eff265f8', 'Vélo électrique Trek', 1899.99, 'Disponible', 14, 15, 'PROV023', '2024-01-10 10:00:00', '2024-01-23 10:00:00', 0),
	('57ecbd4b-cdbe-11ef-bd31-9822eff265f8', 'Tapis de yoga Manduka', 79.99, 'Disponible', 14, 100, 'PROV024', '2024-01-10 10:00:00', '2024-01-24 10:00:00', 0),
	('57ecbe0e-cdbe-11ef-bd31-9822eff265f8', 'Barbecue Weber', 499.99, 'Disponible', 15, 20, 'PROV025', '2024-01-10 10:00:00', '2024-01-25 10:00:00', 0),
	('57ecbeb3-cdbe-11ef-bd31-9822eff265f8', 'Aspirateur Dyson V12', 599.99, 'Disponible', 16, 30, 'PROV026', '2024-01-10 10:00:00', '2024-01-26 10:00:00', 0),
	('57ecbf53-cdbe-11ef-bd31-9822eff265f8', 'Montre connectée Garmin', 199.99, 'Disponible', 17, 50, 'PROV027', '2024-01-10 10:00:00', '2024-01-27 10:00:00', 0),
	('57ecbff3-cdbe-11ef-bd31-9822eff265f8', 'Lunettes VR Oculus', 399.99, 'Disponible', 18, 20, 'PROV028', '2024-01-10 10:00:00', '2024-01-28 10:00:00', 0),
	('57ecc08e-cdbe-11ef-bd31-9822eff265f8', 'Appareil photo instantané Fujifilm', 129.99, 'Disponible', 19, 40, 'PROV029', '2024-01-10 10:00:00', '2024-01-29 10:00:00', 0),
	('57ecc132-cdbe-11ef-bd31-9822eff265f8', 'Chaussures de randonnée Salomon', 179.99, 'Disponible', 20, 50, 'PROV030', '2024-01-10 10:00:00', '2024-01-30 10:00:00', 0),
	('57ecc1d3-cdbe-11ef-bd31-9822eff265f8', 'Bureau ajustable', 599.99, 'Disponible', 11, 25, 'PROV031', '2024-01-10 10:00:00', '2024-01-31 10:00:00', 0),
	('57ecc270-cdbe-11ef-bd31-9822eff265f8', 'Casque gaming Logitech', 99.99, 'Disponible', 5, 80, 'PROV032', '2024-01-10 10:00:00', '2024-02-01 10:00:00', 0),
	('57ecc311-cdbe-11ef-bd31-9822eff265f8', 'Batterie externe Anker', 49.99, 'Disponible', 21, 200, 'PROV033', '2024-01-10 10:00:00', '2024-02-02 10:00:00', 0),
	('57ecc3aa-cdbe-11ef-bd31-9822eff265f8', 'Chargeur sans fil Belkin', 39.99, 'Disponible', 21, 150, 'PROV034', '2024-01-10 10:00:00', '2024-02-03 10:00:00', 0),
	('57ecc454-cdbe-11ef-bd31-9822eff265f8', 'Drone DJI Mini 3', 499.99, 'Disponible', 22, 30, 'PROV035', '2024-01-10 10:00:00', '2024-02-04 10:00:00', 0),
	('57ecc4ef-cdbe-11ef-bd31-9822eff265f8', 'Caméra de sécurité Arlo', 299.99, 'Disponible', 23, 20, 'PROV036', '2024-01-10 10:00:00', '2024-02-05 10:00:00', 0),
	('57ecc591-cdbe-11ef-bd31-9822eff265f8', 'Manette Xbox Series X', 59.99, 'Disponible', 24, 100, 'PROV037', '2024-01-10 10:00:00', '2024-02-06 10:00:00', 0),
	('57ecc62e-cdbe-11ef-bd31-9822eff265f8', 'Switch HDMI', 29.99, 'Disponible', 25, 200, 'PROV038', '2024-01-10 10:00:00', '2024-02-07 10:00:00', 0),
	('57ecc6cb-cdbe-11ef-bd31-9822eff265f8', 'Station météo Netatmo', 149.99, 'Disponible', 26, 15, 'PROV039', '2024-01-10 10:00:00', '2024-02-08 10:00:00', 0);

-- Listage de la structure de table product_availability. subcategory
CREATE TABLE IF NOT EXISTS `subcategory` (
  `id_subcategory` char(36) NOT NULL DEFAULT uuid(),
  `name` varchar(50) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `id_category` int(11) NOT NULL DEFAULT 0,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id_subcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table product_availability.subcategory : ~50 rows (environ)
INSERT INTO `subcategory` (`id_subcategory`, `name`, `active`, `id_category`, `date_created`) VALUES
	('00463797-cdbe-11ef-bd31-9822eff265f8', 'Smartphones', 1, 1, '2024-01-01 10:00:00'),
	('004aa003-cdbe-11ef-bd31-9822eff265f8', 'Ordinateurs portables', 1, 1, '2024-01-02 11:00:00'),
	('004aa263-cdbe-11ef-bd31-9822eff265f8', 'Tablettes', 1, 1, '2024-01-03 12:00:00'),
	('004aa2c5-cdbe-11ef-bd31-9822eff265f8', 'Téléviseurs', 1, 1, '2024-01-04 13:00:00'),
	('004aa322-cdbe-11ef-bd31-9822eff265f8', 'Accessoires informatiques', 1, 1, '2024-01-05 14:00:00'),
	('004aa380-cdbe-11ef-bd31-9822eff265f8', 'Vêtements pour hommes', 1, 2, '2024-01-06 15:00:00'),
	('004aa3d2-cdbe-11ef-bd31-9822eff265f8', 'Vêtements pour femmes', 1, 2, '2024-01-07 16:00:00'),
	('004aa421-cdbe-11ef-bd31-9822eff265f8', 'Chaussures', 1, 2, '2024-01-08 17:00:00'),
	('004aa47a-cdbe-11ef-bd31-9822eff265f8', 'Sacs à main', 1, 2, '2024-01-09 18:00:00'),
	('004aa4c8-cdbe-11ef-bd31-9822eff265f8', 'Accessoires de mode', 1, 2, '2024-01-10 19:00:00'),
	('004aa51b-cdbe-11ef-bd31-9822eff265f8', 'Canapés', 1, 3, '2024-01-11 10:00:00'),
	('004aa570-cdbe-11ef-bd31-9822eff265f8', 'Chaises', 1, 3, '2024-01-12 11:00:00'),
	('004aa5be-cdbe-11ef-bd31-9822eff265f8', 'Tables', 1, 3, '2024-01-13 12:00:00'),
	('004aa60d-cdbe-11ef-bd31-9822eff265f8', 'Bureaux', 1, 3, '2024-01-14 13:00:00'),
	('004aa65b-cdbe-11ef-bd31-9822eff265f8', 'Rangements', 1, 3, '2024-01-15 14:00:00'),
	('004aa6ad-cdbe-11ef-bd31-9822eff265f8', 'Ustensiles de cuisine', 1, 4, '2024-01-16 15:00:00'),
	('004aa703-cdbe-11ef-bd31-9822eff265f8', 'Appareils électroménagers', 1, 4, '2024-01-17 16:00:00'),
	('004aa75c-cdbe-11ef-bd31-9822eff265f8', 'Vaisselle', 1, 4, '2024-01-18 17:00:00'),
	('004aa7a9-cdbe-11ef-bd31-9822eff265f8', 'Robots de cuisine', 1, 4, '2024-01-19 18:00:00'),
	('004aa843-cdbe-11ef-bd31-9822eff265f8', 'Casseroles et poêles', 1, 4, '2024-01-20 19:00:00'),
	('004aa898-cdbe-11ef-bd31-9822eff265f8', 'Outillage à main', 1, 5, '2024-01-21 10:00:00'),
	('004aa903-cdbe-11ef-bd31-9822eff265f8', 'Outillage électrique', 1, 5, '2024-01-22 11:00:00'),
	('004aa959-cdbe-11ef-bd31-9822eff265f8', 'Plantes et graines', 1, 5, '2024-01-23 12:00:00'),
	('004aa9a9-cdbe-11ef-bd31-9822eff265f8', 'Mobilier de jardin', 1, 5, '2024-01-24 13:00:00'),
	('004aa9f5-cdbe-11ef-bd31-9822eff265f8', 'Accessoires de jardinage', 1, 5, '2024-01-25 14:00:00'),
	('004aaa47-cdbe-11ef-bd31-9822eff265f8', 'Soins du visage', 1, 6, '2024-01-26 15:00:00'),
	('004aaa95-cdbe-11ef-bd31-9822eff265f8', 'Soins capillaires', 1, 6, '2024-01-27 16:00:00'),
	('004aaae1-cdbe-11ef-bd31-9822eff265f8', 'Produits de maquillage', 1, 6, '2024-01-28 17:00:00'),
	('004aab2f-cdbe-11ef-bd31-9822eff265f8', 'Parfums', 1, 6, '2024-01-29 18:00:00'),
	('004aab7b-cdbe-11ef-bd31-9822eff265f8', 'Soins corporels', 1, 6, '2024-01-30 19:00:00'),
	('004aabc4-cdbe-11ef-bd31-9822eff265f8', 'Romans', 1, 7, '2024-01-31 10:00:00'),
	('004aac10-cdbe-11ef-bd31-9822eff265f8', 'Livres éducatifs', 1, 7, '2024-02-01 11:00:00'),
	('004aac67-cdbe-11ef-bd31-9822eff265f8', 'Bandes dessinées', 1, 7, '2024-02-02 12:00:00'),
	('004aacba-cdbe-11ef-bd31-9822eff265f8', 'Livres pour enfants', 1, 7, '2024-02-03 13:00:00'),
	('004aad0b-cdbe-11ef-bd31-9822eff265f8', 'Livres audio', 1, 7, '2024-02-04 14:00:00'),
	('004aad5f-cdbe-11ef-bd31-9822eff265f8', 'Poupées', 1, 8, '2024-02-05 15:00:00'),
	('004aadb7-cdbe-11ef-bd31-9822eff265f8', 'Voitures miniatures', 1, 8, '2024-02-06 16:00:00'),
	('004aadfd-cdbe-11ef-bd31-9822eff265f8', 'Jeux de construction', 1, 8, '2024-02-07 17:00:00'),
	('004aae3e-cdbe-11ef-bd31-9822eff265f8', 'Peluches', 1, 8, '2024-02-08 18:00:00'),
	('004aae83-cdbe-11ef-bd31-9822eff265f8', 'Jeux éducatifs', 1, 8, '2024-02-09 19:00:00'),
	('004aaec8-cdbe-11ef-bd31-9822eff265f8', 'Casques audio', 1, 9, '2024-02-10 10:00:00'),
	('004aaf09-cdbe-11ef-bd31-9822eff265f8', 'Enceintes', 1, 9, '2024-02-11 11:00:00'),
	('004aaf4b-cdbe-11ef-bd31-9822eff265f8', 'Microphones', 1, 9, '2024-02-12 12:00:00'),
	('004aaf8e-cdbe-11ef-bd31-9822eff265f8', 'Amplificateurs', 1, 9, '2024-02-13 13:00:00'),
	('004aafd1-cdbe-11ef-bd31-9822eff265f8', 'Accessoires audio', 1, 9, '2024-02-14 14:00:00'),
	('004ab015-cdbe-11ef-bd31-9822eff265f8', 'Vélos', 1, 10, '2024-02-15 15:00:00'),
	('004ab058-cdbe-11ef-bd31-9822eff265f8', 'Équipements de fitness', 1, 10, '2024-02-16 16:00:00'),
	('004ab09b-cdbe-11ef-bd31-9822eff265f8', 'Matériel de yoga', 1, 10, '2024-02-17 17:00:00'),
	('004ab0e4-cdbe-11ef-bd31-9822eff265f8', 'Sports d’équipe', 1, 10, '2024-02-18 18:00:00'),
	('004ab12c-cdbe-11ef-bd31-9822eff265f8', 'Équipements de natation', 1, 10, '2024-02-19 19:00:00');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
