-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: library
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin@yahoo.com','admin'),(2,'admin123','desmondmccabe3@gmail.com','admin123'),(8,'wrong','desmondmccabe3@gmail.com','wrong1'),(9,'wrong','desmondmccabe3@gmail.com','wrong1'),(10,'test','tester@meeting.com','tester123'),(11,'testing','desmondmccabe3@gmail.com','testing123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `room_no_id` int NOT NULL,
  `room_slot_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `ID` int DEFAULT NULL,
  `TITLE` varchar(40) NOT NULL,
  `AUTHOR` varchar(30) NOT NULL,
  `ISBN` varchar(30) NOT NULL,
  `DESCRIP` varchar(250) DEFAULT NULL,
  `GENRE` varchar(25) DEFAULT NULL,
  `STKLVL` int NOT NULL,
  `borrowed_By` varchar(30) DEFAULT NULL,
  `DUE_DATE` date DEFAULT NULL,
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (3,'The Odyssey','	Homer','9780140449112','The epic tale of Odysseus and his ten-year journey home after the Trojan War forms one of the earliest and greatest works of Western literature.','Novel',0,'user1','2022-04-15'),(4,'Don Quixote','Miguel de Cervantes','9780393045147','Don Quixote has become so entranced by reading romances of chivalry that he determines to become a knight errant and pursue bold adventures.','Novel',1,NULL,NULL),(5,'One Hundred Years of Solitude','Gabriel Garcia Marquez','9780060919658','One Hundred Years of Solitude tells the story of the rise and fall, birth and death of the mythical town of Macondo through the history of the Buendiá family','Novel',1,NULL,NULL),(6,'The Great Gatsby','IF. Scott Fitzgerald','9780743273565','The Story Of The Mysteriously Wealthy Jay Gatsby And His Love For The Beautiful Daisy Buchanan','Novel',1,NULL,NULL),(7,'Lolita','Vladimir Nabokov','9780141182537','The Story Of The Mysteriously Wealthy Jay Gatsby And His Love For The Beautiful Daisy Buchanan','Novel',1,NULL,NULL),(8,'Crime and Punishment','Fyodor Dostoyevsky','9780486415871','Supreme masterpiece recounts in feverish, an impoverished student tormented by his own thoughts after he brutally murders an old woman','Novel',1,NULL,NULL),(1,'Ulysses','James Joyce','9780140185584','All the action of Ulysses takes place in and immediately around Dublin on a single day (June 16, 1904).','Novel',0,'user1','2022-04-15'),(2,'In Search of Lost Time','Marcel Proust','9781841598970','Recollections of childhood and experiences into adulthood in the late 19th-century \nand early 20th-century high-society France, while reflecting on the loss of time and lack of meaning in the world.The novel began to take shape in 1909.','Novel',1,NULL,NULL);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_no` char(50) NOT NULL DEFAULT '',
  `username` varchar(30) DEFAULT NULL,
  `fullname` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `BookDate` varchar(30) DEFAULT NULL,
  `TIMESLOT` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'A',NULL,NULL,NULL,NULL,NULL),(2,'B','user1','John','Jones@joners.com','26/03/2022','11:00 To 12:00'),(3,'C',NULL,NULL,NULL,NULL,NULL),(4,'D',NULL,NULL,NULL,NULL,NULL),(5,'E',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user1','username','user1@yahoo.com','1234'),(2,'test','Tester McTest','testing@test.com','tester'),(3,'test2','Tester McTest2','desmondmccabe3@gmail.com','testingallnight'),(4,'test22','Tester McTest22','desmondmccabe3@gmail.com','testingallnight2'),(5,'test22','Tester McTest22','desmondmccabe3@gmail.com','testingallnight2'),(6,'Des','Desmond','desmondmccabe3@gmail.com','desmond123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-25  1:10:22
