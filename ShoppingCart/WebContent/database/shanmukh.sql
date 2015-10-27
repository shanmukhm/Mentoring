CREATE DATABASE  IF NOT EXISTS `products` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `products`;
-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: products
-- ------------------------------------------------------
-- Server version	5.5.35-1ubuntu1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `name` varchar(50) NOT NULL,
  `imgsrc` varchar(50) NOT NULL,
  `mrp` double NOT NULL,
  `selling_price` double NOT NULL,
  `delivery` double NOT NULL,
  `category` varchar(50) NOT NULL,
  `productId` varchar(50) NOT NULL,
  `language` varchar(50) NOT NULL,
  `pricerange` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('Poirot (English)','../images/poirot.jpeg',199,169,25,'2','book_1','english','0-499','others',NULL),('Heroes of Olympus : The House of Hades (English)','../images/olympus.jpeg',499,399,0,'2','book_2','english','500-999','others',NULL),('Rahasya (Hindi Of The Secret)','../images/secret.jpeg',325,242,30,'2','book_3','hindi','0-499','others',NULL),('Ikshvaku Ke Vanshaj (Hindi)','../images/vanshaj.jpeg',295,266,0,'2','book_4','hindi','0-499','others',NULL),('Life of Mahatma Gandhi, The (English)','../images/gandhi.jpeg',599,450,15,'2','book_5','english','0-499','others',NULL),('Bhagavad Gita (Telugu)','../images/gita.jpeg',480,199,20,'2','book_6','telugu','0-499','others',NULL);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carouselimages`
--

DROP TABLE IF EXISTS `carouselimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carouselimages` (
  `productId` varchar(50) NOT NULL,
  `carouselimages` varchar(50) NOT NULL,
  KEY `productId` (`productId`),
  CONSTRAINT `carouselimages_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `footware` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carouselimages`
--

LOCK TABLES `carouselimages` WRITE;
/*!40000 ALTER TABLE `carouselimages` DISABLE KEYS */;
/*!40000 ALTER TABLE `carouselimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cart_item` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `productId` varchar(50) NOT NULL,
  `quantity` int(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cart_item`),
  KEY `userid` (`userid`),
  KEY `category` (`category`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`category`) REFERENCES `categories` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (31,2,4,'puma_tx_34',5),(46,3,3,'clothing_2',2),(53,4,1,'k3_note_2',1),(54,4,3,'clothing_5',1),(56,7,1,'k3_note_1',3),(57,1,2,'book_2',1),(59,1,3,'clothing_2',13),(62,10,2,'book_2',4),(65,11,1,'k3_note_2',4);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'electronics'),(2,'books'),(3,'clothing'),(4,'footware');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothing`
--

DROP TABLE IF EXISTS `clothing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clothing` (
  `name` varchar(50) NOT NULL,
  `imgsrc` varchar(50) NOT NULL,
  `mrp` double NOT NULL,
  `selling_price` double NOT NULL,
  `delivery` double NOT NULL,
  `category` varchar(50) NOT NULL,
  `productId` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `pricerange` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothing`
--

LOCK TABLES `clothing` WRITE;
/*!40000 ALTER TABLE `clothing` DISABLE KEYS */;
INSERT INTO `clothing` VALUES ('Miraan Cotton Printed Salwar Suit Dupatta Material','../images/salwar-dupatta.jpeg',2549,568,0,'3','clothing_1','women','500-999','Miraan'),('Zovi Printed Men\'s Round Neck T-Shirt','../images/zovi1.jpeg',499,420,0,'3','clothing_2','men','0-499','Zovi'),('Uber Urban Regular Fit Men\'s Jeans','../images/uber-jeans1.jpeg',1499,549,20,'3','clothing_3','men','500-999','Uber'),('Gas Slim Fit Women\'s Jeans','../images/gas1.jpeg',6990,4194,0,'3','clothing_4','women','>3000','Gas'),('Kabeer Boy\'s Shirt, Waistcoat and Pant Set','../images/kabeer1.jpeg',800,750,42,'3','clothing_5','kids','500-999','Kabeer');
/*!40000 ALTER TABLE `clothing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electronics`
--

DROP TABLE IF EXISTS `electronics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `electronics` (
  `name` varchar(50) NOT NULL,
  `imgsrc` varchar(50) NOT NULL,
  `mrp` double NOT NULL,
  `selling_price` double NOT NULL,
  `delivery` double NOT NULL,
  `category` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `pricerange` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `productId` varchar(50) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electronics`
--

LOCK TABLES `electronics` WRITE;
/*!40000 ALTER TABLE `electronics` DISABLE KEYS */;
INSERT INTO `electronics` VALUES ('Lenovo K3 Note','../images/k3-note1.jpeg',9999,9999,0,'1','mobile','5000-10000','Lenevo','k3_note_1',NULL),('Moto G (3rd Generation)','../images/motog1.jpeg',12999,12999,15,'1','mobile','10000-20000','Motorola','k3_note_2',NULL),('Honor Holly','../images/honor1.jpeg',6999,5999,0,'1','mobile','5000-10000','Huawae','k3_note_3',NULL),('Mi Pad','../images/mipad1.jpeg',12999,12999,0,'1','tablet','10000-20000','Xiaomi','k3_note_4',NULL),('Dell Inspiron 3558','../images/dell1.jpeg',32790,32790,150,'1','laptop','>20000','dell','k3_note_5',NULL);
/*!40000 ALTER TABLE `electronics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footware`
--

DROP TABLE IF EXISTS `footware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footware` (
  `name` varchar(50) NOT NULL,
  `imgsrc` varchar(50) NOT NULL,
  `mrp` double NOT NULL,
  `selling_price` double NOT NULL,
  `delivery` double NOT NULL,
  `category` varchar(50) NOT NULL,
  `productId` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `pricerange` varchar(50) NOT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footware`
--

LOCK TABLES `footware` WRITE;
/*!40000 ALTER TABLE `footware` DISABLE KEYS */;
INSERT INTO `footware` VALUES ('Puma TX-3 Sneakers','../images/tx-3-car1.jpeg',2999,1666,35,'4','puma_tx_31','men','puma','1000-2999'),('Puma K9000 Xc Dp Sandals','../images/puma1.jpeg',2499,2499,0,'4','puma_tx_32','men','puma','1000-2999'),('Nell Boots','../images/nell1.jpeg',2285,1140,50,'4','puma_tx_33','women','nell','1000-2999'),('Steve Madden Stecy Heels','../images/steve1.jpeg',5999,4787,20,'4','puma_tx_34','women','steve','>3000'),('Skechers Go Walk 2 - Flash Sports Shoes','../images/sketchers1.jpeg',3499,1579,0,'4','puma_tx_35','kids','sketchers','1000-2999');
/*!40000 ALTER TABLE `footware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'shanmukh','beehyv','8374197270','male'),(2,'vishal','vishal','9985443212','male'),(3,'kishore','kishore','8567432211','male'),(4,'rishan','rishan','9585484349','male'),(5,'srujan','srujan','8907654432','male'),(7,'himtej','himtej','9848499221','male'),(9,'shanmukh2','msr,msr','9322233213','male'),(10,'Satyarth','beehyv','8011239870','male'),(11,'Hansraj','hansraj','9999999999','male');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-27 15:54:34
