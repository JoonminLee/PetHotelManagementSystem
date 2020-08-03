-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: phms
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `d_num` int(11) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`d_num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'사무관리부'),(2,'객실관리부'),(3,'미화부');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `e_num` int(11) NOT NULL AUTO_INCREMENT,
  `e_name` varchar(45) DEFAULT NULL,
  `e_d_num` int(11) DEFAULT NULL,
  `e_po_num` int(11) DEFAULT NULL,
  `e_phone` varchar(45) DEFAULT NULL,
  `e_hire_date` date DEFAULT NULL,
  `e_salary` int(11) DEFAULT NULL,
  `e_photo` longtext,
  PRIMARY KEY (`e_num`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'노창옥',1,6,'010-3609-7560','2010-11-11',2000000,'/image/emp/df8263c1-24f0-464a-80df-2ec3b906ff84.jpg');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `g_num` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` varchar(45) DEFAULT NULL,
  `g_name` varchar(45) DEFAULT NULL,
  `g_day` date DEFAULT NULL,
  `g_from` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`g_num`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (28,'1285513591','준만두','2020-03-18','kakao'),(29,'joonmandoo','준만두','2020-03-18','phms'),(30,'joonmandoo','준만두','2020-03-20','phms'),(31,'107072976009818452700','준만두','2020-03-20','google');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet` (
  `p_num` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(45) NOT NULL,
  `p_type` varchar(45) DEFAULT NULL,
  `p_u_num` int(11) DEFAULT NULL,
  `p_v_num` int(11) DEFAULT NULL,
  `p_photo` longtext,
  PRIMARY KEY (`p_num`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
INSERT INTO `pet` VALUES (36,'짹짹이','말티즈',8,0,'/image/pet/24ad2c6d-cc1e-4a23-ac3e-7fce8d073255.jpg'),(47,'인절미','골댕이',8,0,'/image/pet/55ac2f67-debf-4bef-8ebc-0b11472306d2.jpg');
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `po_num` int(11) NOT NULL AUTO_INCREMENT,
  `po_name` varchar(45) NOT NULL,
  PRIMARY KEY (`po_num`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'영업부'),(2,'총무부'),(3,'리셉션'),(4,'미화부'),(5,'마케팅부'),(6,'관리자');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `reroomsize`
--

DROP TABLE IF EXISTS `reroomsize`;
/*!50001 DROP VIEW IF EXISTS `reroomsize`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reroomsize` AS SELECT 
 1 AS `re_num`,
 1 AS `re_id`,
 1 AS `re_phone`,
 1 AS `re_s_num`,
 1 AS `re_r_num`,
 1 AS `re_check_in`,
 1 AS `re_check_out`,
 1 AS `re_day`,
 1 AS `s_num`,
 1 AS `s_size`,
 1 AS `s_r_price`,
 1 AS `s_w_price`,
 1 AS `r_num`,
 1 AS `r_s_num`,
 1 AS `r_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `re_num` int(11) NOT NULL AUTO_INCREMENT,
  `re_id` varchar(45) NOT NULL,
  `re_phone` varchar(45) DEFAULT NULL,
  `re_s_num` int(11) DEFAULT NULL,
  `re_r_num` int(11) DEFAULT NULL,
  `re_check_in` date NOT NULL,
  `re_check_out` date DEFAULT NULL,
  `re_day` date DEFAULT NULL,
  PRIMARY KEY (`re_num`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'joonmandoo','010-2910-0099',1,1,'2020-03-20','2020-03-23','2020-03-19');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `r_num` int(11) NOT NULL AUTO_INCREMENT,
  `r_s_num` int(11) DEFAULT NULL,
  `r_status` int(11) DEFAULT '0',
  PRIMARY KEY (`r_num`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,1,1),(2,1,0),(3,1,0),(4,2,0),(5,2,0),(6,2,0),(7,3,0),(8,3,0),(9,3,0),(10,4,0),(11,4,0),(12,4,0),(13,5,0),(14,5,0),(15,5,0),(16,6,0),(17,6,0),(18,6,0),(19,7,0),(20,7,0),(21,7,0),(22,8,0),(23,8,0),(24,8,0),(25,9,0),(26,9,0),(27,9,0);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `roomsizedto`
--

DROP TABLE IF EXISTS `roomsizedto`;
/*!50001 DROP VIEW IF EXISTS `roomsizedto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `roomsizedto` AS SELECT 
 1 AS `r_num`,
 1 AS `r_s_num`,
 1 AS `r_status`,
 1 AS `s_num`,
 1 AS `s_size`,
 1 AS `s_r_price`,
 1 AS `s_w_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `s_num` int(11) NOT NULL AUTO_INCREMENT,
  `s_size` varchar(45) DEFAULT NULL,
  `s_r_price` int(11) DEFAULT NULL,
  `s_w_price` int(11) DEFAULT NULL,
  `s_max` varchar(45) DEFAULT NULL,
  `s_space` varchar(45) DEFAULT NULL,
  `s_view` varchar(45) DEFAULT NULL,
  `s_bed` varchar(45) DEFAULT NULL,
  `s_lounge` varchar(45) DEFAULT NULL,
  `s_limit` varchar(45) DEFAULT NULL,
  `s_care` int(11) DEFAULT NULL,
  `s_bath` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_num`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'아담',35000,60000,'2 Person','45m²','City View','1 Double',NULL,NULL,NULL,NULL),(2,'넉넉',40000,65000,'3 Person','59m²','City View','1 Double 1 Single',NULL,NULL,NULL,NULL),(3,'푸짐',45000,70000,'4 Person','70m²','Park View','2 Double',NULL,NULL,NULL,NULL),(4,'싱글',50000,75000,'2 Person','45m²','City View','1 Single',NULL,NULL,NULL,NULL),(5,'더블',55000,80000,'3 Person','59m²','Park View','1 Double 1 Single',NULL,NULL,NULL,NULL),(6,'디럭스',60000,85000,'4 Person','70m²','Park View','2 Double',NULL,NULL,NULL,NULL),(7,'소형',25000,35000,'1 Pet',NULL,NULL,NULL,'Yes','4 Pet',2000,2500),(8,'중형',35000,45000,'1 Pet',NULL,NULL,NULL,'Yes','3 Pet',2500,3000),(9,'대형',45000,55000,'1 Pet',NULL,NULL,NULL,'Yes','2 Pet',4000,5000);
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `u_num` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(45) NOT NULL,
  `u_pwd` varchar(45) NOT NULL,
  `u_name` varchar(45) NOT NULL,
  `u_gender` varchar(45) NOT NULL,
  `u_phone` varchar(45) NOT NULL,
  `u_email` varchar(45) NOT NULL,
  `u_birth` date NOT NULL,
  `u_r_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_num`),
  UNIQUE KEY `u_id_UNIQUE` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (8,'joonmandoo','1','쥰만도도도','남','010-1111-1111','ckddhr7560@naver.com','2009-12-09',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `userroomsize`
--

DROP TABLE IF EXISTS `userroomsize`;
/*!50001 DROP VIEW IF EXISTS `userroomsize`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `userroomsize` AS SELECT 
 1 AS `u_num`,
 1 AS `u_id`,
 1 AS `u_pwd`,
 1 AS `u_name`,
 1 AS `u_gender`,
 1 AS `u_phone`,
 1 AS `u_email`,
 1 AS `u_birth`,
 1 AS `u_r_num`,
 1 AS `r_num`,
 1 AS `r_s_num`,
 1 AS `r_status`,
 1 AS `s_num`,
 1 AS `s_size`,
 1 AS `s_r_price`,
 1 AS `s_w_price`,
 1 AS `re_num`,
 1 AS `re_id`,
 1 AS `re_phone`,
 1 AS `re_s_num`,
 1 AS `re_r_num`,
 1 AS `re_check_in`,
 1 AS `re_check_out`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor` (
  `v_num` int(11) NOT NULL AUTO_INCREMENT,
  `v_id` varchar(45) NOT NULL,
  `v_name` varchar(45) NOT NULL,
  `v_email` varchar(45) NOT NULL,
  `v_from` varchar(45) NOT NULL,
  `v_room` int(11) DEFAULT NULL,
  PRIMARY KEY (`v_num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor`
--

LOCK TABLES `visitor` WRITE;
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` VALUES (4,'1285513591','준만두','jmandoo0524@gmail.com','kakao',NULL);
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `visitorroomsize`
--

DROP TABLE IF EXISTS `visitorroomsize`;
/*!50001 DROP VIEW IF EXISTS `visitorroomsize`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visitorroomsize` AS SELECT 
 1 AS `v_num`,
 1 AS `v_id`,
 1 AS `v_name`,
 1 AS `v_email`,
 1 AS `v_from`,
 1 AS `v_room`,
 1 AS `r_num`,
 1 AS `r_s_num`,
 1 AS `r_status`,
 1 AS `s_num`,
 1 AS `s_size`,
 1 AS `s_r_price`,
 1 AS `s_w_price`,
 1 AS `re_num`,
 1 AS `re_id`,
 1 AS `re_phone`,
 1 AS `re_s_num`,
 1 AS `re_r_num`,
 1 AS `re_check_in`,
 1 AS `re_check_out`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `reroomsize`
--

/*!50001 DROP VIEW IF EXISTS `reroomsize`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reroomsize` AS select `aa`.`re_num` AS `re_num`,`aa`.`re_id` AS `re_id`,`aa`.`re_phone` AS `re_phone`,`aa`.`re_s_num` AS `re_s_num`,`aa`.`re_r_num` AS `re_r_num`,`aa`.`re_check_in` AS `re_check_in`,`aa`.`re_check_out` AS `re_check_out`,`aa`.`re_day` AS `re_day`,`aa`.`s_num` AS `s_num`,`aa`.`s_size` AS `s_size`,`aa`.`s_r_price` AS `s_r_price`,`aa`.`s_w_price` AS `s_w_price`,`room`.`r_num` AS `r_num`,`room`.`r_s_num` AS `r_s_num`,`room`.`r_status` AS `r_status` from ((select `reservation`.`re_num` AS `re_num`,`reservation`.`re_id` AS `re_id`,`reservation`.`re_phone` AS `re_phone`,`reservation`.`re_s_num` AS `re_s_num`,`reservation`.`re_r_num` AS `re_r_num`,`reservation`.`re_check_in` AS `re_check_in`,`reservation`.`re_check_out` AS `re_check_out`,`reservation`.`re_day` AS `re_day`,`size`.`s_num` AS `s_num`,`size`.`s_size` AS `s_size`,`size`.`s_r_price` AS `s_r_price`,`size`.`s_w_price` AS `s_w_price` from (`reservation` join `size`) where (`reservation`.`re_s_num` = `size`.`s_num`)) `aa` join `room`) where (`aa`.`re_r_num` = `room`.`r_num`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `roomsizedto`
--

/*!50001 DROP VIEW IF EXISTS `roomsizedto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `roomsizedto` AS select `room`.`r_num` AS `r_num`,`room`.`r_s_num` AS `r_s_num`,`room`.`r_status` AS `r_status`,`size`.`s_num` AS `s_num`,`size`.`s_size` AS `s_size`,`size`.`s_r_price` AS `s_r_price`,`size`.`s_w_price` AS `s_w_price` from (`room` join `size`) where ((`room`.`r_status` = 0) and (`room`.`r_s_num` = `size`.`s_num`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userroomsize`
--

/*!50001 DROP VIEW IF EXISTS `userroomsize`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userroomsize` AS select `bb`.`u_num` AS `u_num`,`bb`.`u_id` AS `u_id`,`bb`.`u_pwd` AS `u_pwd`,`bb`.`u_name` AS `u_name`,`bb`.`u_gender` AS `u_gender`,`bb`.`u_phone` AS `u_phone`,`bb`.`u_email` AS `u_email`,`bb`.`u_birth` AS `u_birth`,`bb`.`u_r_num` AS `u_r_num`,`bb`.`r_num` AS `r_num`,`bb`.`r_s_num` AS `r_s_num`,`bb`.`r_status` AS `r_status`,`bb`.`s_num` AS `s_num`,`bb`.`s_size` AS `s_size`,`bb`.`s_r_price` AS `s_r_price`,`bb`.`s_w_price` AS `s_w_price`,`reservation`.`re_num` AS `re_num`,`reservation`.`re_id` AS `re_id`,`reservation`.`re_phone` AS `re_phone`,`reservation`.`re_s_num` AS `re_s_num`,`reservation`.`re_r_num` AS `re_r_num`,`reservation`.`re_check_in` AS `re_check_in`,`reservation`.`re_check_out` AS `re_check_out` from ((select `aa`.`u_num` AS `u_num`,`aa`.`u_id` AS `u_id`,`aa`.`u_pwd` AS `u_pwd`,`aa`.`u_name` AS `u_name`,`aa`.`u_gender` AS `u_gender`,`aa`.`u_phone` AS `u_phone`,`aa`.`u_email` AS `u_email`,`aa`.`u_birth` AS `u_birth`,`aa`.`u_r_num` AS `u_r_num`,`aa`.`r_num` AS `r_num`,`aa`.`r_s_num` AS `r_s_num`,`aa`.`r_status` AS `r_status`,`size`.`s_num` AS `s_num`,`size`.`s_size` AS `s_size`,`size`.`s_r_price` AS `s_r_price`,`size`.`s_w_price` AS `s_w_price` from ((select `user`.`u_num` AS `u_num`,`user`.`u_id` AS `u_id`,`user`.`u_pwd` AS `u_pwd`,`user`.`u_name` AS `u_name`,`user`.`u_gender` AS `u_gender`,`user`.`u_phone` AS `u_phone`,`user`.`u_email` AS `u_email`,`user`.`u_birth` AS `u_birth`,`user`.`u_r_num` AS `u_r_num`,`room`.`r_num` AS `r_num`,`room`.`r_s_num` AS `r_s_num`,`room`.`r_status` AS `r_status` from (`user` join `room`) where (`user`.`u_r_num` = `room`.`r_num`)) `aa` join `size`) where (`aa`.`r_s_num` = `size`.`s_num`)) `bb` join `reservation`) where (`bb`.`u_id` = `reservation`.`re_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `visitorroomsize`
--

/*!50001 DROP VIEW IF EXISTS `visitorroomsize`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visitorroomsize` AS select `bb`.`v_num` AS `v_num`,`bb`.`v_id` AS `v_id`,`bb`.`v_name` AS `v_name`,`bb`.`v_email` AS `v_email`,`bb`.`v_from` AS `v_from`,`bb`.`v_room` AS `v_room`,`bb`.`r_num` AS `r_num`,`bb`.`r_s_num` AS `r_s_num`,`bb`.`r_status` AS `r_status`,`bb`.`s_num` AS `s_num`,`bb`.`s_size` AS `s_size`,`bb`.`s_r_price` AS `s_r_price`,`bb`.`s_w_price` AS `s_w_price`,`reservation`.`re_num` AS `re_num`,`reservation`.`re_id` AS `re_id`,`reservation`.`re_phone` AS `re_phone`,`reservation`.`re_s_num` AS `re_s_num`,`reservation`.`re_r_num` AS `re_r_num`,`reservation`.`re_check_in` AS `re_check_in`,`reservation`.`re_check_out` AS `re_check_out` from ((select `aa`.`v_num` AS `v_num`,`aa`.`v_id` AS `v_id`,`aa`.`v_name` AS `v_name`,`aa`.`v_email` AS `v_email`,`aa`.`v_from` AS `v_from`,`aa`.`v_room` AS `v_room`,`aa`.`r_num` AS `r_num`,`aa`.`r_s_num` AS `r_s_num`,`aa`.`r_status` AS `r_status`,`size`.`s_num` AS `s_num`,`size`.`s_size` AS `s_size`,`size`.`s_r_price` AS `s_r_price`,`size`.`s_w_price` AS `s_w_price` from ((select `visitor`.`v_num` AS `v_num`,`visitor`.`v_id` AS `v_id`,`visitor`.`v_name` AS `v_name`,`visitor`.`v_email` AS `v_email`,`visitor`.`v_from` AS `v_from`,`visitor`.`v_room` AS `v_room`,`room`.`r_num` AS `r_num`,`room`.`r_s_num` AS `r_s_num`,`room`.`r_status` AS `r_status` from (`visitor` join `room`) where (`visitor`.`v_room` = `room`.`r_num`)) `aa` join `size`) where (`aa`.`r_s_num` = `size`.`s_num`)) `bb` join `reservation`) where (`bb`.`v_id` = `reservation`.`re_id`) limit 0,1000 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-03 23:19:19
