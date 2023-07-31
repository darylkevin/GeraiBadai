-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: geraibadai-darylkevin
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `product_count` int NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Hand Bouquet',9),(2,'Flower Box and Flower Basket',5),(3,'Bobo Balloon',1),(4,'Dried and Preserved Flowers',2),(5,'Vase Arrangement',3),(6,'Flower Dome',2),(7,'Artificial Flowers',2),(8,'Graduation Bouquet',4),(9,'Custom Bouquet',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_seq`
--

DROP TABLE IF EXISTS `category_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_seq`
--

LOCK TABLES `category_seq` WRITE;
/*!40000 ALTER TABLE `category_seq` DISABLE KEYS */;
INSERT INTO `category_seq` VALUES (101);
/*!40000 ALTER TABLE `category_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_method`
--

DROP TABLE IF EXISTS `collection_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_method` (
  `collection_method_id` bigint NOT NULL,
  `how` bit(1) NOT NULL,
  PRIMARY KEY (`collection_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_method`
--

LOCK TABLES `collection_method` WRITE;
/*!40000 ALTER TABLE `collection_method` DISABLE KEYS */;
INSERT INTO `collection_method` VALUES (1,_binary ''),(2,_binary '\0');
/*!40000 ALTER TABLE `collection_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_method_seq`
--

DROP TABLE IF EXISTS `collection_method_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_method_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_method_seq`
--

LOCK TABLES `collection_method_seq` WRITE;
/*!40000 ALTER TABLE `collection_method_seq` DISABLE KEYS */;
INSERT INTO `collection_method_seq` VALUES (101);
/*!40000 ALTER TABLE `collection_method_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ob-item-association`
--

DROP TABLE IF EXISTS `ob-item-association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ob-item-association` (
  `order-basket-id` bigint NOT NULL,
  `order-basket-item-id` bigint NOT NULL,
  PRIMARY KEY (`order-basket-id`,`order-basket-item-id`),
  KEY `FKswss1tmlmncikwccugkr1fd0p` (`order-basket-item-id`),
  CONSTRAINT `FK2xwbtctut8ocdet6wwfot9vcq` FOREIGN KEY (`order-basket-id`) REFERENCES `order_basket` (`order_basket_id`),
  CONSTRAINT `FKswss1tmlmncikwccugkr1fd0p` FOREIGN KEY (`order-basket-item-id`) REFERENCES `order_basket_item` (`order_basket_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ob-item-association`
--

LOCK TABLES `ob-item-association` WRITE;
/*!40000 ALTER TABLE `ob-item-association` DISABLE KEYS */;
INSERT INTO `ob-item-association` VALUES (1,1),(1,2),(1,3),(1,4),(2,5),(2,6),(2,7),(3,8),(3,9),(3,10),(3,11),(3,12),(4,13),(4,14),(4,15),(4,16),(4,17),(5,18),(5,19),(5,20),(5,21),(5,22),(6,23),(6,24),(6,25),(6,26),(6,27),(6,28),(7,29),(7,30),(7,31),(8,32),(8,33),(8,34),(8,35),(8,36),(8,37),(8,38),(9,39),(9,40),(9,41),(10,42),(10,43),(10,44),(10,45),(10,46),(10,47),(11,48),(11,49),(11,50),(11,51),(11,52),(12,53),(12,54),(12,55),(12,56),(12,57),(12,58),(13,59),(13,60),(13,61),(13,62),(13,63),(13,64),(13,65),(14,66),(14,67),(14,68),(14,69),(14,70),(14,71),(14,72),(14,73),(15,74),(15,75),(15,76),(15,77),(15,78),(15,79),(16,80),(16,81),(16,82),(16,83),(16,84),(17,85),(17,86),(17,87),(17,88),(17,89),(17,90),(17,91),(18,92),(18,93),(18,94),(18,95),(18,96),(18,97),(18,98),(19,99),(19,100),(19,101),(19,102),(19,103),(19,104),(20,105),(20,106),(20,107),(20,108),(20,109),(20,110),(20,111),(20,112);
/*!40000 ALTER TABLE `ob-item-association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_basket`
--

DROP TABLE IF EXISTS `order_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_basket` (
  `order_basket_id` bigint NOT NULL,
  `basket_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_basket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_basket`
--

LOCK TABLES `order_basket` WRITE;
/*!40000 ALTER TABLE `order_basket` DISABLE KEYS */;
INSERT INTO `order_basket` VALUES (1,'OB1'),(2,'OB2'),(3,'OB3'),(4,'OB4'),(5,'OB5'),(6,'OB6'),(7,'OB7'),(8,'OB8'),(9,'OB9'),(10,'OB10'),(11,'OB11'),(12,'OB12'),(13,'OB13'),(14,'OB14'),(15,'OB15'),(16,'OB16'),(17,'OB17'),(18,'OB18'),(19,'OB19'),(20,'OB20');
/*!40000 ALTER TABLE `order_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_basket_item`
--

DROP TABLE IF EXISTS `order_basket_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_basket_item` (
  `order_basket_item_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `fk_product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_basket_item_id`),
  KEY `FKpbj1fjv0pysxll3lwm3i7893l` (`fk_product_id`),
  CONSTRAINT `FKpbj1fjv0pysxll3lwm3i7893l` FOREIGN KEY (`fk_product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_basket_item`
--

LOCK TABLES `order_basket_item` WRITE;
/*!40000 ALTER TABLE `order_basket_item` DISABLE KEYS */;
INSERT INTO `order_basket_item` VALUES (1,16,8),(2,15,2),(3,23,7),(4,21,5),(5,17,6),(6,25,3),(7,1,10),(8,10,4),(9,20,13),(10,8,14),(11,4,20),(12,27,12),(13,30,4),(14,22,9),(15,26,7),(16,5,24),(17,11,5),(18,9,22),(19,19,6),(20,28,8),(21,24,20),(22,7,7),(23,5,12),(24,27,13),(25,24,2),(26,18,9),(27,21,3),(28,19,11),(29,13,15),(30,4,10),(31,29,4),(32,11,11),(33,13,7),(34,15,8),(35,20,5),(36,18,19),(37,6,6),(38,2,9),(39,8,2),(40,12,12),(41,23,5),(42,12,10),(43,3,7),(44,19,4),(45,10,6),(46,25,9),(47,5,11),(48,28,14),(49,13,9),(50,30,1),(51,2,15),(52,17,20),(53,23,12),(54,7,21),(55,11,13),(56,26,24),(57,18,2),(58,29,5),(59,1,7),(60,24,8),(61,11,27),(62,6,14),(63,29,4),(64,19,11),(65,5,3),(66,16,5),(67,25,12),(68,18,8),(69,26,20),(70,21,26),(71,19,19),(72,1,2),(73,30,4),(74,6,13),(75,10,11),(76,9,2),(77,23,6),(78,19,18),(79,8,7),(80,5,14),(81,7,1),(82,23,10),(83,14,12),(84,10,4),(85,13,8),(86,22,2),(87,5,24),(88,3,3),(89,11,11),(90,16,20),(91,14,9),(92,29,12),(93,23,15),(94,14,9),(95,4,7),(96,8,4),(97,5,14),(98,11,13),(99,11,8),(100,6,6),(101,20,23),(102,18,12),(103,30,2),(104,14,10),(105,16,9),(106,25,7),(107,3,8),(108,29,5),(109,22,19),(110,7,4),(111,12,22),(112,17,28);
/*!40000 ALTER TABLE `order_basket_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_basket_item_order_baskets`
--

DROP TABLE IF EXISTS `order_basket_item_order_baskets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_basket_item_order_baskets` (
  `order_basket_item_order_basket_item_id` bigint NOT NULL,
  `order_baskets_order_basket_id` bigint NOT NULL,
  PRIMARY KEY (`order_basket_item_order_basket_item_id`,`order_baskets_order_basket_id`),
  KEY `FKmr3q71qsx7yp279oixrvgexto` (`order_baskets_order_basket_id`),
  CONSTRAINT `FK2vtq33c3w5xrraxqr0vcdhteu` FOREIGN KEY (`order_basket_item_order_basket_item_id`) REFERENCES `order_basket_item` (`order_basket_item_id`),
  CONSTRAINT `FKmr3q71qsx7yp279oixrvgexto` FOREIGN KEY (`order_baskets_order_basket_id`) REFERENCES `order_basket` (`order_basket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_basket_item_order_baskets`
--

LOCK TABLES `order_basket_item_order_baskets` WRITE;
/*!40000 ALTER TABLE `order_basket_item_order_baskets` DISABLE KEYS */;
INSERT INTO `order_basket_item_order_baskets` VALUES (1,1),(2,1),(3,1),(4,1),(5,2),(6,2),(7,2),(8,3),(9,3),(10,3),(11,3),(12,3),(13,4),(14,4),(15,4),(16,4),(17,4),(18,5),(19,5),(20,5),(21,5),(22,5),(23,6),(24,6),(25,6),(26,6),(27,6),(28,6),(29,7),(30,7),(31,7),(32,8),(33,8),(34,8),(35,8),(36,8),(37,8),(38,8),(39,9),(40,9),(41,9),(42,10),(43,10),(44,10),(45,10),(46,10),(47,10),(48,11),(49,11),(50,11),(51,11),(52,11),(53,12),(54,12),(55,12),(56,12),(57,12),(58,12),(59,13),(60,13),(61,13),(62,13),(63,13),(64,13),(65,13),(66,14),(67,14),(68,14),(69,14),(70,14),(71,14),(72,14),(73,14),(74,15),(75,15),(76,15),(77,15),(78,15),(79,15),(80,16),(81,16),(82,16),(83,16),(84,16),(85,17),(86,17),(87,17),(88,17),(89,17),(90,17),(91,17),(92,18),(93,18),(94,18),(95,18),(96,18),(97,18),(98,18),(99,19),(100,19),(101,19),(102,19),(103,19),(104,19),(105,20),(106,20),(107,20),(108,20),(109,20),(110,20),(111,20),(112,20);
/*!40000 ALTER TABLE `order_basket_item_order_baskets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_basket_item_seq`
--

DROP TABLE IF EXISTS `order_basket_item_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_basket_item_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_basket_item_seq`
--

LOCK TABLES `order_basket_item_seq` WRITE;
/*!40000 ALTER TABLE `order_basket_item_seq` DISABLE KEYS */;
INSERT INTO `order_basket_item_seq` VALUES (201);
/*!40000 ALTER TABLE `order_basket_item_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_basket_seq`
--

DROP TABLE IF EXISTS `order_basket_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_basket_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_basket_seq`
--

LOCK TABLES `order_basket_seq` WRITE;
/*!40000 ALTER TABLE `order_basket_seq` DISABLE KEYS */;
INSERT INTO `order_basket_seq` VALUES (101);
/*!40000 ALTER TABLE `order_basket_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` bigint NOT NULL,
  `cost` double DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `product_creation_time` datetime(6) DEFAULT NULL,
  `requests` int NOT NULL,
  `stock` varchar(255) DEFAULT NULL,
  `fk_category_id` bigint DEFAULT NULL,
  `fk_status_id` bigint DEFAULT NULL,
  `fk_type_id` bigint DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKpxqa5fj6hpcc9mew356eoj68d` (`fk_category_id`),
  KEY `FKetkso9yisafo24rqptj79b2su` (`fk_status_id`),
  KEY `FKq1hftij7r8ekkkioo7xivmqm7` (`fk_type_id`),
  CONSTRAINT `FKetkso9yisafo24rqptj79b2su` FOREIGN KEY (`fk_status_id`) REFERENCES `status` (`status_id`),
  CONSTRAINT `FKpxqa5fj6hpcc9mew356eoj68d` FOREIGN KEY (`fk_category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `FKq1hftij7r8ekkkioo7xivmqm7` FOREIGN KEY (`fk_type_id`) REFERENCES `type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,175000,'A classic symbol of love and beauty, these elegant roses are perfect for any occasion.','Roses',275000,'2023-07-22 22:30:12.000000',81,'95',1,1,1),(2,215000,'Brighten up your day with these cheerful sunflowers that radiate warmth and happiness.','Sunflower',315000,'2023-07-22 22:30:42.000000',398,'72',1,1,1),(3,612000,'Add a bold pop of color with these striking red lilies that exude passion and confidence. Each lily consists of 2 to 3 flowers.','Red Lilies',750000,'2023-07-22 22:31:59.000000',178,'45',1,1,1),(4,645000,'Delicate and charming, these soft pink lilies are a lovely choice for expressing your affection.','Soft Pink Lilies',815000,'2023-07-22 22:32:27.000000',430,'19',1,1,1),(5,312000,'Simple yet sophisticated, these graceful tulips come in a variety of colors to suit your taste.','Tulips',455000,'2023-07-22 22:32:49.000000',373,'28',1,1,1),(6,218000,'Create a dreamy, ethereal atmosphere with these delicate and airy baby\'s breaths.','Baby\'s Breaths',450000,'2023-07-22 22:33:18.000000',208,'55',1,1,1),(7,85000,'A medley of vibrant colors and textures, this mixed bouquet is perfect for those who appreciate variety and diversity.','Mixed Flowers',275000,'2023-07-22 22:33:59.000000',274,'',1,1,2),(8,190000,' With its full, fluffy blooms, the hydrangea is a beautiful and versatile flower that adds a touch of elegance to any setting.','Hydrangea',380000,'2023-07-22 22:34:23.000000',329,'77',1,1,1),(9,215000,'Add a playful and colorful touch to your space with these fun and whimsical pompoms and rainbows. Perfect for brightening up any room and spreading joy.','Pompoms and Rainbows',380000,'2023-07-22 22:34:52.000000',312,'48',1,1,1),(10,210000,'A beautiful and elegant way to display flowers, this round bloom box is perfect for showcasing your favorite blooms in style.','Round Bloom Box',350000,'2023-07-22 22:37:37.000000',142,'11',2,1,1),(11,711000,'Exotic and eye-catching, the cymbidium bloom box features striking orchids in a sleek and modern presentation.','Cymbidium Bloom Box',950000,'2023-07-22 22:38:26.000000',187,'8',2,1,1),(12,925000,'Delicate and ethereal, the phalaenopsis bloom box features lovely orchids arranged in a chic and stylish box.','Phalaenopsis Bloom Box',1100000,'2023-07-22 22:39:24.000000',386,'3',2,1,1),(13,341000,'Show your love and affection with this heart-shaped flower box, filled with a beautiful array of blooms that will warm anyone\'s heart. Box is 25x25 cm.','Heart Shaped Flower Box',680000,'2023-07-22 22:40:07.000000',210,'33',2,1,1),(14,921000,'Inspired by the delicate beauty of the wind orchid, this stunning blossom will add a touch of grace and elegance to any space.','Wind Orchid Blossom',1100000,'2023-07-22 22:40:41.000000',104,'5',2,1,1),(15,320000,'Elevate any celebration with these unique and long-lasting PVC balloons that are guaranteed not to deflate. Each order is based on demand and may vary, adding a photo or LED lights can make it even more special. Perfect for birthdays, graduations, or any special occasion.\r\n\r\nAdd Ons:\r\n- Photo Card @15K\r\n- LED Lights @40K\r\n- Small Graduation Doll @45K','Celebration Bobo Balloon (PRE-ORDER ONLY)',550000,'2023-07-22 22:45:05.000000',40,'',3,1,2),(16,345000,'one of the most common methods of drying is by hanging the flowers and leaving them to dry or dehydrate naturally. The flowers we commonly dry are roses, lavender, and cotton. The color of dried flowers (especially roses) is not as vibrant as FRESH flowers. Most of the colors of dried flowers will fade into a brownish tone.','Bunga Kering (PRE-ORDER ONLY)',625000,'2023-07-22 22:47:49.000000',0,'',4,1,2),(17,425000,'Preserved Flowers - Unlike dried flowers, preserved flowers are processed differently. Instead of being left to dry naturally, fresh flowers undergo a rehydration process using chemicals. Preserved flowers can last up to 3 years and maintain their bright and vibrant colors just like fresh flowers. However, they should not be exposed to water or stored in humid environments.','Bunga yang Diawetkan (PRE-ORDER ONLY)',700000,'2023-07-22 22:49:46.000000',0,'',4,1,2),(18,512000,'Bring the beauty of fresh flowers into your home or office with this medium-sized vase filled with a lovely arrangement of seasonal blooms. Perfect for adding a touch of color and fragrance to any space.','Medium Fresh Flowers Vase',700000,'2023-07-22 22:51:29.000000',57,'',5,1,2),(19,620000,'Create a stunning display with this artificial large vase that looks just like the real thing. Featuring lifelike stems and blooms, it\'s perfect for adding a touch of greenery and beauty to any room without the upkeep.','Artificial Large Vase',800000,'2023-07-22 22:51:53.000000',134,'',5,1,2),(20,1200000,'Make a statement with this elegant and sophisticated large vase arrangement featuring stunning orchids in a variety of colors. Perfect for adding a touch of luxury and glamour to any space.','Large Orchid Vase Arrangement',1500000,'2023-07-22 22:52:18.000000',242,'',5,1,2),(21,330000,'Capture the beauty of nature with this charming preserved flower dome, featuring delightful roses and cotton that will last for years. As a bonus, every purchase comes with a free photo card inside the dome, making it a lovely gift for any occasion.','Preserved Roses and Cotton Dome (20x12 cm)',445000,'2023-07-22 22:54:12.000000',33,'',6,2,2),(22,425000,'Capture the beauty of nature with this charming preserved flower dome, featuring delightful roses and cotton that will last for years. As a bonus, every purchase comes with a free photo card inside the dome, making it a lovely gift for any occasion. Add-on LED Light for @30K.','Preserved Roses and Cotton Dome (27 cm)',650000,'2023-07-22 22:55:08.000000',18,'',6,2,2),(23,325000,'Enjoy the beauty of flowers without the maintenance with this artificial round bloom box. Featuring lifelike blooms in a sleek and modern presentation, it\'s perfect for adding a touch of elegance to any space. Comes with silver, black, gold and rosegold spray colors.','Artificial Round Bloom Box',680000,'2023-07-22 22:56:51.000000',60,'',7,1,2),(24,485000,'Bring the beauty of nature into your home with this stunning artificial mix flower bouquet. Featuring a variety of lifelike blooms in bold and vibrant colors, it\'s the perfect way to add a pop of color and charm to your decor.','Artificial Mix Flower Bouquet',585000,'2023-07-22 22:57:18.000000',113,'',7,1,2),(25,135000,'Congratulate your graduate with this special gift set that includes 5 beautiful roses and an adorable graduation teddy bear. Perfect for expressing your pride and celebrating their achievement.','5 Roses + Graduation Teddy',225000,'2023-07-22 22:59:24.000000',0,'250',8,1,1),(26,214000,'Add a touch of whimsy to your decor with this colorful and playful rainbow baby\'s breath bouquet. Perfect for brightening up any room and spreading joy.','Rainbow Baby\'s Breath',350000,'2023-07-22 22:59:53.000000',84,'215',8,1,1),(27,215000,' Treat your loved ones to something sweet with this delightful Ferrero bouquet. Featuring a variety of Ferrero chocolates arranged in a beautiful bouquet, it\'s the perfect gift for any occasion.','Ferrero Bouquet (15 pcs)',390000,'2023-07-22 23:00:31.000000',22,'84',8,1,1),(28,290000,'Celebrate your graduate\'s achievement with this elegant and sophisticated bouquet featuring sky blue and white flowers. Perfect for adding a touch of class and sophistication to any graduation ceremony or party.','Skyblue x White Graduation Flowers',400000,'2023-07-22 23:01:07.000000',17,'345',8,1,1),(29,95000,'Create a truly unique and personalized gift with this custom bouquet that can include cigarettes, snacks, chocolates, money, and more. Prices start at 300K IDR for 20 items and increase by 100K IDR for every additional 10 items added. Perfect for surprising your loved ones with a one-of-a-kind gift that\'s tailored just for them.','Personalized Orders (PRE-ORDER ONLY)',300000,'2023-07-22 23:04:00.000000',0,'',9,2,2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_seq`
--

DROP TABLE IF EXISTS `product_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_seq`
--

LOCK TABLES `product_seq` WRITE;
/*!40000 ALTER TABLE `product_seq` DISABLE KEYS */;
INSERT INTO `product_seq` VALUES (101);
/*!40000 ALTER TABLE `product_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order`
--

DROP TABLE IF EXISTS `sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order` (
  `order_id` int DEFAULT NULL,
  `amount_paid` int DEFAULT NULL,
  `collection_period` text,
  `customer_name` text,
  `order_creation_time` text,
  `order_state` int DEFAULT NULL,
  `phone_number` text,
  `shipping_address` text,
  `special_requests` text,
  `fk_collection_method_id` int DEFAULT NULL,
  `fk_order_basket_id` int DEFAULT NULL,
  `MyUnknownColumn` text,
  `MyUnknownColumn_[0]` text,
  `MyUnknownColumn_[1]` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order`
--

LOCK TABLES `sales_order` WRITE;
/*!40000 ALTER TABLE `sales_order` DISABLE KEYS */;
INSERT INTO `sales_order` VALUES (1,26685000,'2023-07-22 10:00:00.000000','Eric Phillips','2023-07-19 08:00:00.000000',0,'+12083967359','123-45 Sinsa-dong, Gangnam-gu, Seoul, South Korea, Delivery','Add baby\'s breath to roses.',2,3,'','',''),(2,26750000,'2023-07-22 10:01:00.000000','Anthony Cole','2023-07-19 08:01:00.000000',0,'+19456344457','45 Rue du Faubourg Saint-Honoré, 75008 Paris, France (48.8722, 2.3124)','Include sunflowers in mixed bouquet.',2,10,'','',''),(3,42265000,'2023-07-22 10:02:00.000000','Brandon Jones','2023-07-19 08:02:00.000000',0,'+18309582896','1-5-2 Nishishinjuku, Shinjuku City, Tokyo 160-0023, Japan (35.6908, 139.6935)','Include some lavender in mixed bouquet.',2,15,'','',''),(4,127935000,'2023-07-22 10:03:00.000000','Kristina Blevins','2023-07-19 08:03:00.000000',0,'+16317022945','<PICK-UP IN STORE>','Add some blue hydrangeas to mixed bouquet.',1,14,'','',''),(5,26185000,'2023-07-22 10:04:00.000000','Dawn Sullivan','2023-07-19 08:04:00.000000',0,'+14704772025','10-1 Nanba, Chuo Ward, Osaka, Osaka Prefecture 542-0076, Japan (34.6657, 135.5006)','N/A',2,9,'','',''),(6,127935000,'2023-07-22 10:05:00.000000','Thomas Mullins','2023-07-19 08:05:00.000000',0,'+15627222264','5 Rue des Petits Champs, 75001 Paris, France (48.8645, 2.3407)','Use only white lilies in bouquet.',2,14,'','',''),(7,72060000,'2023-07-22 10:06:00.000000','Chase Scott','2023-07-19 08:06:00.000000',0,'+19039316771','1-7-1 Roppongi, Minato City, Tokyo 106-0045, Japan (35.6629, 139.7310)','Add some pink peonies to mixed bouquet.',2,6,'','',''),(8,26685000,'2023-07-22 10:07:00.000000','Jessica Fisher','2023-07-19 08:07:00.000000',0,'+15008179601','<PICK-UP IN STORE>','Use only yellow roses in bouquet.',1,1,'','',''),(9,26750000,'2023-07-22 10:08:00.000000','Dave Ramirez','2023-07-19 08:08:00.000000',0,'+19863406483','3-6-1 Kita-Aoyama, Minato City, Tokyo 107-0061, Japan (35.6630, 139.7207)','N/A',2,2,'','',''),(10,62965000,'2023-07-22 10:09:00.000000','David Rojas','2023-07-19 08:09:00.000000',0,'+585003431113','25 Rue du Faubourg Saint-Antoine, 75011 Paris, France (48.8526, 2.3752)','Include some purple orchids in mixed bouquet.',2,5,'','',''),(11,39025000,'2023-07-22 10:10:00.000000','Mary Curtis','2023-07-19 08:10:00.000000',0,'+15843176995','1-1-7 Shinjuku, Shinjuku City, Tokyo 160-0022, Japan (35.6906, 139.6998)','Add some white baby\'s breath to mixed bouquet.',2,16,'','',''),(12,47890000,'2023-07-22 10:11:00.000000','Autumn Collins','2023-07-19 08:11:00.000000',0,'+18487851427','<PICK-UP IN STORE>','Use only orange roses in bouquet.',1,4,'','',''),(13,56815000,'2023-07-22 10:12:00.000000','Travis Huynh','2023-07-19 08:12:00.000000',0,'+18549722520','5-1-1 Roppongi, Minato City, Tokyo 106-0032, Japan (35.6623, 139.7331)','Include some pink carnations in mixed bouquet.',2,17,'','',''),(14,69970000,'2023-07-22 10:13:00.000000','Zachary Anderson','2023-07-19 08:13:00.000000',0,'+639173266612','3-8-4 Ginza, Chuo City, Tokyo 104-0061, Japan (35.6713, 139.7666)','Add some red gerberas to mixed bouquet.',2,12,'','',''),(15,47890000,'2023-07-22 10:14:00.000000','Jeffrey Boyd','2023-07-19 08:14:00.000000',0,'+18772423488','1033 6th Ave, New York, NY 10018, United States (40.7537, -73.9855)','Use only purple roses in bouquet.',2,4,'','',''),(16,127935000,'2023-07-22 10:15:00.000000','Hannah Griffith','2023-07-19 08:15:00.000000',0,'+553844118673','149 Rue Saint-Honoré, 75001 Paris, France (48.8649, 2.3414)','N/A',2,14,'','',''),(17,65720000,'2023-07-22 10:16:00.000000','Shawn Howard','2023-07-19 08:16:00.000000',0,'+14347811296','1-9-15 Nishishinjuku, Shinjuku City, Tokyo 160-0023, Japan (35.6915, 139.6933)','Add some blue hydrangeas to mixed bouquet.',2,13,'','',''),(18,46685000,'2023-07-22 10:17:00.000000','Scott Smith','2023-07-19 08:17:00.000000',0,'+15335574418','1-7-8 Kabukicho, Shinjuku City, Tokyo 160-0021, Japan (35.6944, 139.7031)','Include some yellow chrysanthemums in mixed bouquet.',2,8,'','',''),(19,69970000,'2023-07-22 10:18:00.000000','Michelle Martinez','2023-07-19 08:18:00.000000',0,'+15129190382','15 Rue du Faubourg Saint-Antoine, 75011 Paris, France (48.8522, 2.3758)','Use only white lilies in bouquet.',2,12,'','',''),(20,32185000,'2023-07-22 10:19:00.000000','Rachael Washington','2023-07-19 08:19:00.000000',0,'+639213991689','1-8-1 Higashi-Shinbashi, Minato City, Tokyo 105-0021, Japan (35.6614, 139.7582)','Add some pink peonies to mixed bouquet.',2,7,'','',''),(21,54630000,'2023-07-22 10:20:00.000000','Michael Meadows','2023-07-19 08:20:00.000000',0,'+15259360672','5 Rue de Turenne, 75004 Paris, France (48.8577, 2.3646)','N/A',2,19,'','',''),(22,70590000,'2023-07-22 10:21:00.000000','Rebecca Contreras','2023-07-19 08:21:00.000000',0,'+16727641344','2-14-3 Shibuya, Shibuya City, Tokyo 150-0002, Japan (35.6583, 139.6995)','Wrap bouquet in blue paper.',2,11,'','',''),(23,47890000,'2023-07-22 10:22:00.000000','Amy Vargas','2023-07-19 08:22:00.000000',0,'+15852292144','<PICK-UP IN STORE>','Include some purple orchids in mixed bouquet.',1,4,'','',''),(24,66250000,'2023-07-22 10:23:00.000000','Alexander Schmidt','2023-07-19 08:23:00.000000',0,'+642115342798','2-16-7 Asakusa, Taito City, Tokyo 111-0032, Japan (35.7161, 139.7966)','N/A',2,3,'','',''),(25,46685000,'2023-07-22 10:24:00.000000','Haley Smith','2023-07-19 08:24:00.000000',0,'+16894150981','3-8-3 Ginza, Chuo City, Tokyo 104-0061, Japan (35.6716, 139.7668)','Use only orange roses in bouquet.',2,8,'','',''),(26,72060000,'2023-07-22 10:25:00.000000','Jessica Kennedy','2023-07-19 08:25:00.000000',0,'+629632014765','1-23-1 Toyosu, Koto City, Tokyo 135-0061, Japan (35.6580, 139.7956)','Include some pink carnations in mixed bouquet.',2,6,'','',''),(27,70470000,'2023-07-22 10:26:00.000000','Anthony Graves','2023-07-19 08:26:00.000000',0,'+3812053992809','8 Rue du Faubourg Saint-Denis, 75010 Paris, France (48.8724, 2.3541)','Add some red gerberas to mixed bouquet.',2,18,'','',''),(28,42265000,'2023-07-22 10:27:00.000000','Abigail Oneill','2023-07-19 08:27:00.000000',0,'+14458382007','2-2 Marunouchi, Chiyoda City, Tokyo 100-0005, Japan (35.6802, 139.7632)','N/A',2,15,'','',''),(29,26750000,'2023-07-22 10:28:00.000000','Alexander Oconnell','2023-07-19 08:28:00.000000',0,'+14048299653','7 Rue du Faubourg Poissonnière, 75009 Paris, France (48.8736, 2.3477)','Include some lavender in mixed bouquet.',2,2,'','',''),(30,26685000,'2023-07-22 10:29:00.000000','Mr. Dale Barnes','2023-07-19 08:29:00.000000',0,'+19716006166','<PICK-UP IN STORE>','Add some blue hydrangeas to mixed bouquet.',1,1,'','',''),(31,127935000,'2023-07-22 10:30:00.000000','Timothy Lewis','2023-07-19 08:30:00.000000',0,'+13466164516','5 Rue de la Paix, 75002 Paris, France (48.8684, 2.3296)','N/A',2,14,'','',''),(32,42265000,'2023-07-22 10:31:00.000000','Willie Carson','2023-07-19 08:31:00.000000',0,'+18178429688','<PICK-UP IN STORE>','N/A',1,15,'','',''),(33,56815000,'2023-07-22 10:32:00.000000','Julie Hatfield','2023-07-19 08:32:00.000000',0,'+13133405335','<PICK-UP IN STORE>','Add some pink peonies to mixed bouquet.',1,17,'','',''),(34,26185000,'2023-07-22 10:33:00.000000','Jennifer Wilson','2023-07-19 08:33:00.000000',0,'+18095646697','1-5-2 Nishishinjuku, Shinjuku City, Tokyo 160-0023, Japan (35.6908, 139.6935)','Use only yellow roses in bouquet.',2,9,'','',''),(35,72060000,'2023-07-22 10:34:00.000000','Alexander Rosales','2023-07-19 08:34:00.000000',0,'+18178349654','100 Rue du Faubourg Saint-Antoine, 75012 Paris, France (48.8498, 2.3880)','Wrap bouquet in blue paper.',2,6,'','',''),(36,54630000,'2023-07-22 10:35:00.000000','David Coleman','2023-07-19 08:35:00.000000',0,'+12262731792','10-1 Nanba, Chuo Ward, Osaka, Osaka Prefecture 542-0076, Japan (34.6657, 135.5006)','Include some purple orchids in mixed bouquet.',2,19,'','',''),(37,72060000,'2023-07-22 10:36:00.000000','Mark Keller','2023-07-19 08:36:00.000000',0,'+14698496748','5 Rue des Petits Champs, 75001 Paris, France (48.8645, 2.3407)','Add some white baby\'s breath to mixed bouquet.',2,6,'','',''),(38,26750000,'2023-07-22 10:37:00.000000','Paul Vaughn','2023-07-19 08:37:00.000000',0,'+15079617443','<PICK-UP IN STORE>','N/A',1,2,'','',''),(39,62965000,'2023-07-22 10:38:00.000000','Jessica Underwood','2023-07-19 08:38:00.000000',0,'+3584502202554','2 Rue du Faubourg Saint-Antoine, 75012 Paris, France (48.8504, 2.3723)','Include some pink carnations in mixed bouquet.',2,5,'','',''),(40,65195000,'2023-07-22 10:39:00.000000','Alison Henderson','2023-07-19 08:39:00.000000',0,'+16698929478','3-6-1 Kita-Aoyama, Minato City, Tokyo 107-0061, Japan (35.6630, 139.7207)','Add some red gerberas to mixed bouquet.',2,20,'','',''),(41,69970000,'2023-07-22 10:40:00.000000','Richard Hurley','2023-07-19 08:40:00.000000',0,'+527146486556','25 Rue du Faubourg Saint-Antoine, 75011 Paris, France (48.8526, 2.3752)','Use only purple roses in bouquet.',2,12,'','',''),(42,56815000,'2023-07-22 10:41:00.000000','Bobby Bell','2023-07-19 08:41:00.000000',0,'+12022932051','<PICK-UP IN STORE>','Include some lavender in mixed bouquet.',1,17,'','',''),(43,39025000,'2023-07-22 10:42:00.000000','Andrea Hurley','2023-07-19 08:42:00.000000',0,'+17082487789','<PICK-UP IN STORE>','Add some blue hydrangeas to mixed bouquet.',1,16,'','',''),(44,26685000,'2023-07-22 10:43:00.000000','Mason Hodge','2023-07-19 08:43:00.000000',0,'+14109225486','5-1-1 Roppongi, Minato City, Tokyo 106-0032, Japan (35.6623, 139.7331)','Include some yellow chrysanthemums in mixed bouquet.',2,1,'','',''),(45,47890000,'2023-07-22 10:44:00.000000','Natalie Marquez','2023-07-19 08:44:00.000000',0,'+15014288426','3-8-4 Ginza, Chuo City, Tokyo 104-0061, Japan (35.6713, 139.7666)','N/A',2,4,'','',''),(46,65720000,'2023-07-22 10:45:00.000000','Michael Williamson','2023-07-19 08:45:00.000000',0,'+14637140848','1033 6th Ave, New York, NY 10018, United States (40.7537, -73.9855)','Add some pink peonies to mixed bouquet.',2,13,'','',''),(47,70590000,'2023-07-22 10:46:00.000000','Keith Neal','2023-07-19 08:46:00.000000',0,'+17072964762','149 Rue Saint-Honoré, 75001 Paris, France (48.8649, 2.3414)','N/A',2,11,'','',''),(48,39025000,'2023-07-22 10:47:00.000000','Kevin Pham','2023-07-19 08:47:00.000000',0,'+18653858496','1-9-15 Nishishinjuku, Shinjuku City, Tokyo 160-0023, Japan (35.6915, 139.6933)','Wrap bouquet in blue paper.',2,16,'','',''),(49,54630000,'2023-07-22 10:48:00.000000','Valerie Roth','2023-07-19 08:48:00.000000',0,'+12089270572','<PICK-UP IN STORE>','Include some purple orchids in mixed bouquet.',1,19,'','',''),(50,39260000,'2023-07-22 10:49:00.000000','Vincent Ramos','2023-07-19 08:49:00.000000',0,'+12236865754','15 Rue du Faubourg Saint-Antoine, 75011 Paris, France (48.8522, 2.3758)','Add some white baby\'s breath to mixed bouquet.',2,10,'','','');
/*!40000 ALTER TABLE `sales_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_order_seq`
--

DROP TABLE IF EXISTS `sales_order_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order_seq`
--

LOCK TABLES `sales_order_seq` WRITE;
/*!40000 ALTER TABLE `sales_order_seq` DISABLE KEYS */;
INSERT INTO `sales_order_seq` VALUES (151);
/*!40000 ALTER TABLE `sales_order_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `status_id` bigint NOT NULL,
  `live` bit(1) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,_binary ''),(2,_binary '\0');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_seq`
--

DROP TABLE IF EXISTS `status_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_seq`
--

LOCK TABLES `status_seq` WRITE;
/*!40000 ALTER TABLE `status_seq` DISABLE KEYS */;
INSERT INTO `status_seq` VALUES (101);
/*!40000 ALTER TABLE `status_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `type_id` bigint NOT NULL,
  `on_demand` bit(1) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,_binary '\0'),(2,_binary '');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_seq`
--

DROP TABLE IF EXISTS `type_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_seq`
--

LOCK TABLES `type_seq` WRITE;
/*!40000 ALTER TABLE `type_seq` DISABLE KEYS */;
INSERT INTO `type_seq` VALUES (101);
/*!40000 ALTER TABLE `type_seq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-31 10:34:33
