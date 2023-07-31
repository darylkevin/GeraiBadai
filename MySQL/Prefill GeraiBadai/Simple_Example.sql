CREATE DATABASE  IF NOT EXISTS `geraibadai-darylkevin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `geraibadai-darylkevin`;
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
INSERT INTO `category` VALUES (1,'Makanan',2),(2,'Jus Buah',1);
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
INSERT INTO `collection_method` VALUES (1,_binary '\0'),(2,_binary '');
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
INSERT INTO `ob-item-association` VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(3,6),(3,7),(3,8),(4,9),(5,10),(5,11);
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
INSERT INTO `order_basket` VALUES (1,'OB1'),(2,'OB2'),(3,'OB3'),(4,'OB4'),(5,'OB5');
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
INSERT INTO `order_basket_item` VALUES (1,3,2),(2,2,4),(3,2,3),(4,5,4),(5,8,3),(6,12,2),(7,2,3),(8,9,4),(9,3,3),(10,9,2),(11,14,4);
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
INSERT INTO `order_basket_item_order_baskets` VALUES (1,1),(2,1),(3,1),(4,2),(5,2),(6,3),(7,3),(8,3),(9,4),(10,5),(11,5);
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
INSERT INTO `order_basket_item_seq` VALUES (101);
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
INSERT INTO `product` VALUES (2,12500,'Soto Ayam Khas Semarang, begitu tagline dari Warung Soto Ayam yang di dalamnya memajang foto foto iklan jadul serta foto foto pejabat dari level kota Semarang hingga menteri ini. ','Soto Ayam',23000,'2023-07-21 16:19:46.000000',24,'11',1,1,1),(3,35000,'Nasi kuning adalah makanan khas Indonesia. Makanan ini terbuat dari beras yang dimasak bersama dengan kunyit serta santan dan rempah-rempah.','Nasi Kuning',52000,'2023-07-21 16:20:57.000000',15,'',1,1,2),(4,9000,'Sajian Alpukat Kocok memang tengah dijajakan di berbagai tempat. Cita rasanya manis legit dengan tekstur yang creamy sehingga menjadikan hidangan ini cocok disantap sebagai dessert. Yuk, coba buat dengan resep berikut.','Alpukat Cokelat',13000,'2023-07-21 16:22:02.000000',30,'18',2,1,1);
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
  `order_id` bigint NOT NULL,
  `amount_paid` double DEFAULT NULL,
  `collection_period` datetime(6) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `order_creation_time` datetime(6) DEFAULT NULL,
  `order_state` int NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `shipping_address` varchar(1000) DEFAULT NULL,
  `special_requests` varchar(1000) DEFAULT NULL,
  `fk_collection_method_id` bigint DEFAULT NULL,
  `fk_order_basket_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK79gyyb8t0yogqwu01y1nqr9co` (`fk_collection_method_id`),
  KEY `FKkc1twihcucn5dnog342wgljwr` (`fk_order_basket_id`),
  CONSTRAINT `FK79gyyb8t0yogqwu01y1nqr9co` FOREIGN KEY (`fk_collection_method_id`) REFERENCES `collection_method` (`collection_method_id`),
  CONSTRAINT `FKkc1twihcucn5dnog342wgljwr` FOREIGN KEY (`fk_order_basket_id`) REFERENCES `order_basket` (`order_basket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_order`
--

LOCK TABLES `sales_order` WRITE;
/*!40000 ALTER TABLE `sales_order` DISABLE KEYS */;
INSERT INTO `sales_order` VALUES (1,132000,'2023-07-21 08:26:00.000000','Udin Komarudin','2023-07-21 16:25:46.000000',0,55190517,'Perumahan Griya Mandala, Jl. Kehormatan Blok A No.19 Rt.002 Rw.08\r\nDuri Kepa, Kebon Jeruk, Jakarta Barat, Indonesia, 11510','Cabe x2',1,1),(2,325600,'2023-07-21 08:26:00.000000','Mat Sanip bin Umar Juned','2023-07-21 16:26:26.000000',0,61351131,'Apartemen Ula Ilu Tower Melati Lantai 8 No.44\r\nJl. Kacang Kapri Muda Kav. 13\r\nUtan Kayu Selatan, Matraman, Jakarta Timur, Indonesia, 13120','N/A',1,2),(3,1200000,'2023-07-29 12:30:00.000000','Nurhadi Sumringrah','2023-07-21 16:27:41.000000',0,74131171,'<PICK-UP IN STORE>','N/A',2,3),(4,82900,'2023-07-21 08:27:00.000000','Hj. Ayu Zubaedah','2023-07-21 16:28:40.000000',0,31641191,'Jl. Cinta Boulevard No.3 RT 07/02\r\nBintaro, Pesanggrahan, Jaksel, 12330','Drop deket pos satpam pessangrahan',1,4),(5,670000,'2023-07-21 08:28:00.000000','Siti Mulyani','2023-07-21 16:29:15.000000',0,61510000,'<PICK-UP IN STORE>','N/A',2,5);
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
INSERT INTO `sales_order_seq` VALUES (101);
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
INSERT INTO `status` VALUES (1,_binary '');
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
INSERT INTO `status_seq` VALUES (51);
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

-- Dump completed on 2023-07-21 16:31:07
