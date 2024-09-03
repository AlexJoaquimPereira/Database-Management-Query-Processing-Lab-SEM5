-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: expt3
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Dept`
--

DROP TABLE IF EXISTS `Dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dept` (
  `Deptno` int(11) NOT NULL,
  `dname` varchar(25) NOT NULL,
  `location` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Deptno`),
  UNIQUE KEY `dname` (`dname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dept`
--

LOCK TABLES `Dept` WRITE;
/*!40000 ALTER TABLE `Dept` DISABLE KEYS */;
INSERT INTO `Dept` VALUES (1,'Accounting','Vancouver'),(5,'Sales','Bengaluru'),(10,'Research','Dublin'),(20,'HR','London'),(30,'Marketing','Hyderabad'),(40,'Admin','San Francisco');
/*!40000 ALTER TABLE `Dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `Empno` int(11) NOT NULL,
  `Empname` varchar(25) NOT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `job` varchar(25) DEFAULT NULL,
  `managerno` int(11) DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `salary` float(12,2) DEFAULT NULL,
  `commision` float(10,2) DEFAULT NULL,
  `deptno` int(11) DEFAULT NULL,
  PRIMARY KEY (`Empno`),
  KEY `deptno` (`deptno`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`deptno`) REFERENCES `Dept` (`Deptno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (2,'Angelo','M','Clerk',11,'2023-01-09',40000.00,30000.00,5),(4,'Annie','F','Analyst',15,'2022-03-08',21000.00,NULL,20),(5,'Brandon','M','President',5,'2023-10-05',24000.00,NULL,30),(6,'Bunni','F','HR',11,'2020-05-05',35000.00,NULL,5),(7,'Stella','F','receptionist',11,'2022-06-18',38000.00,50000.00,5),(8,'Maria','F','Clerk',5,'2022-07-22',40000.00,3000.00,30),(9,'Max','M','Engineer',9,'2022-11-05',45000.00,NULL,10),(10,'Lya','F','Analyst',15,'2023-06-04',42000.00,NULL,20),(11,'Valery','M','Manager',11,'2023-04-22',50000.00,NULL,5),(12,'Nikki','F','Clerk',11,'2024-02-11',37000.00,10000.00,40),(13,'Theodore','M','Technician',9,'2021-03-01',33000.00,5000.00,10),(14,'Alice','F','Consultant',9,'2022-01-19',53000.00,NULL,1),(15,'Elliot','M','Developer',15,'2024-02-24',48000.00,NULL,20);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Project` (
  `Proj_num` int(11) NOT NULL,
  `Pname` varchar(25) NOT NULL,
  `location` varchar(25) DEFAULT NULL,
  `dnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`Proj_num`),
  UNIQUE KEY `Pname` (`Pname`),
  KEY `dnum` (`dnum`),
  CONSTRAINT `Project_ibfk_1` FOREIGN KEY (`dnum`) REFERENCES `Dept` (`Deptno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES (1,'Cloud Computing','Dublin',10),(2,'Firewall','San Francisco',40),(3,'DBMS','San Francisco',40);
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_workson_project`
--

DROP TABLE IF EXISTS `emp_workson_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_workson_project` (
  `eno` int(11) NOT NULL,
  `pno` int(11) NOT NULL,
  `hours_per_week` float DEFAULT 20,
  PRIMARY KEY (`eno`,`pno`),
  KEY `pno` (`pno`),
  CONSTRAINT `emp_workson_project_ibfk_1` FOREIGN KEY (`eno`) REFERENCES `Employee` (`Empno`),
  CONSTRAINT `emp_workson_project_ibfk_2` FOREIGN KEY (`pno`) REFERENCES `Project` (`Proj_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_workson_project`
--

LOCK TABLES `emp_workson_project` WRITE;
/*!40000 ALTER TABLE `emp_workson_project` DISABLE KEYS */;
INSERT INTO `emp_workson_project` VALUES (4,1,48),(5,3,40),(9,1,48),(11,1,48),(13,3,18),(15,3,35);
/*!40000 ALTER TABLE `emp_workson_project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-26  0:52:29
