-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: wellnessdb
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `meal_tracker`
--

DROP TABLE IF EXISTS `meal_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal_tracker` (
  `Meal_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int DEFAULT NULL,
  `Activity_Date` date DEFAULT NULL,
  `Meal_Type` enum('Breakfast','Lunch','Dinner','Extra') DEFAULT NULL,
  `Meal_Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Meal_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `meal_tracker_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_tracker`
--

LOCK TABLES `meal_tracker` WRITE;
/*!40000 ALTER TABLE `meal_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `meal_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `Profile_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Gender` varchar(15) DEFAULT NULL,
  `Weight` double DEFAULT NULL,
  `Height` double DEFAULT NULL,
  PRIMARY KEY (`Profile_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,1,'Eon','Busque',20,'Male',73,163);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotes` (
  `Quote_ID` int NOT NULL AUTO_INCREMENT,
  `Quote_Text` varchar(1000) DEFAULT NULL,
  `Quote_Author` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Quote_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (1,'Wellness is not a medical fix but a way of living - a lifestyle sensitive and responsive to all the dimensions of body, mind, and spirit, an approach to life we each design to achieve our highest potential for well-being now and forever.','Greg Anderson'),(2,'Wellness encompasses a healthy body, a sound mind, and a tranquil spirit. Enjoy the journey as you strive for wellness.','Laurette Gagnon Beaulieu'),(3,'Our bodies are our gardens - our will are our gardeners','William Shakespeare'),(4,'Self-care is not selfish. You cannot serve from an empty vessel.','Eleanor Brown'),(5,'Today is your day to start fresh, to eat right, to train hard, to live healthy, to be proud.','Bonnie Pfiester'),(6,'Your body holds deep wisdom. Trust in it. Learn from it. Nourish it. Watch your life transform and be healthy','Bella Bleue'),(7,'Wellness is the complete integration of body, mind, and spirit - the realization that everything we do, think, feel, and believe has an effect on our state of well-being.','Greg Anderson'),(8,'If you don\'t do what\'s best for your body, you\'re the one who comes up on the short end.','Julius Erving'),(9,'A healthy lifestyle is the most potent medicine at your disposal.','Sravani Saha Nakhro'),(10,'To ensure good health: eat lightly, breathe deeply, live moderately, cultivate cheerfulness, and maintain an interest in life.','William Londen');
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sleep_tracker`
--

DROP TABLE IF EXISTS `sleep_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sleep_tracker` (
  `Sleep_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int DEFAULT NULL,
  `Activity_Date` date DEFAULT NULL,
  `Sleep_Duration` double DEFAULT NULL,
  `Sleep_Quality` enum('BAD','DECENT','GOOD') DEFAULT NULL,
  PRIMARY KEY (`Sleep_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `sleep_tracker_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sleep_tracker`
--

LOCK TABLES `sleep_tracker` WRITE;
/*!40000 ALTER TABLE `sleep_tracker` DISABLE KEYS */;
INSERT INTO `sleep_tracker` VALUES (1,1,'2024-12-14',45,'DECENT');
/*!40000 ALTER TABLE `sleep_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'eonbusque123','eonbusque123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_tracker`
--

DROP TABLE IF EXISTS `workout_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_tracker` (
  `Workout_ID` int NOT NULL AUTO_INCREMENT,
  `User_ID` int DEFAULT NULL,
  `Activity_Date` date DEFAULT NULL,
  `Workout_Type` varchar(50) DEFAULT NULL,
  `Workout_Duration` double DEFAULT NULL,
  PRIMARY KEY (`Workout_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `workout_tracker_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_tracker`
--

LOCK TABLES `workout_tracker` WRITE;
/*!40000 ALTER TABLE `workout_tracker` DISABLE KEYS */;
INSERT INTO `workout_tracker` VALUES (1,1,'2024-12-14','push-ups',45);
/*!40000 ALTER TABLE `workout_tracker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-17 20:09:40
