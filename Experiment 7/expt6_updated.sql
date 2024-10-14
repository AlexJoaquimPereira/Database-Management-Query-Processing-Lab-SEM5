-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: expt6
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
INSERT INTO `Employee` VALUES (2,'Angelo','M','Clerk',11,'2023-01-09',40000.00,30000.00,5),(4,'Annie','F','Analyst',15,'2022-03-08',21000.00,NULL,20),(5,'Brandon','M','President',5,'2023-10-05',24000.00,NULL,30),(6,'Bunni','F','HR',11,'2020-05-05',35000.00,NULL,5),(7,'Stella','F','receptionist',11,'2022-06-18',38000.00,50000.00,5),(8,'Maria','F','Clerk',5,'2022-07-22',40000.00,3000.00,30),(9,'Max','M','Engineer',9,'2022-11-05',45000.00,NULL,10),(10,'Lya','F','Analyst',15,'2023-06-04',42000.00,NULL,20),(11,'Valery','M','Manager',11,'2023-04-22',50000.00,NULL,5),(12,'Nikki','F','Clerk',11,'2024-02-11',37000.00,10000.00,40),(13,'Theodore','M','Technician',9,'2021-03-01',33000.00,5000.00,10),(14,'Alice','F','Consultant',9,'2022-01-19',53000.00,NULL,1),(15,'Elliot','M','Developer',15,'2024-02-24',48000.00,NULL,20),(16,'Smith','M','Analyst',9,'2024-09-15',75000.00,6500.00,10);
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
  `pbudget` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
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
INSERT INTO `Project` VALUES (1,'Cloud Computing','Dublin',10,NULL,NULL,NULL),(2,'Firewall','San Francisco',40,NULL,NULL,NULL),(3,'DBMS','San Francisco',40,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `admin_employees`
--

DROP TABLE IF EXISTS `admin_employees`;
/*!50001 DROP VIEW IF EXISTS `admin_employees`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `admin_employees` AS SELECT
 1 AS `Empno`,
  1 AS `Empname`,
  1 AS `Gender`,
  1 AS `job`,
  1 AS `managerno`,
  1 AS `hiredate`,
  1 AS `salary`,
  1 AS `commision` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `dept_emp_summary`
--

DROP TABLE IF EXISTS `dept_emp_summary`;
/*!50001 DROP VIEW IF EXISTS `dept_emp_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `dept_emp_summary` AS SELECT
 1 AS `Dname`,
  1 AS `num_employees`,
  1 AS `avg_salary` */;
SET character_set_client = @saved_cs_client;

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

--
-- Temporary table structure for view `employee_project_details`
--

DROP TABLE IF EXISTS `employee_project_details`;
/*!50001 DROP VIEW IF EXISTS `employee_project_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `employee_project_details` AS SELECT
 1 AS `Empname`,
  1 AS `Empno`,
  1 AS `salary`,
  1 AS `Proj_num`,
  1 AS `Pname`,
  1 AS `hours_per_week`,
  1 AS `status` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `employee_project_summary`
--

DROP TABLE IF EXISTS `employee_project_summary`;
/*!50001 DROP VIEW IF EXISTS `employee_project_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `employee_project_summary` AS SELECT
 1 AS `Empno`,
  1 AS `Empname`,
  1 AS `num_projects`,
  1 AS `total_hours` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `proj_details`
--

DROP TABLE IF EXISTS `proj_details`;
/*!50001 DROP VIEW IF EXISTS `proj_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `proj_details` AS SELECT
 1 AS `Proj_num`,
  1 AS `Pname`,
  1 AS `status`,
  1 AS `location`,
  1 AS `duration`,
  1 AS `Empname`,
  1 AS `dname`,
  1 AS `salary`,
  1 AS `hours_per_week` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `project_employee_summary`
--

DROP TABLE IF EXISTS `project_employee_summary`;
/*!50001 DROP VIEW IF EXISTS `project_employee_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `project_employee_summary` AS SELECT
 1 AS `Proj_num`,
  1 AS `Pname`,
  1 AS `num_employees`,
  1 AS `total_hours` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `admin_employees`
--

/*!50001 DROP VIEW IF EXISTS `admin_employees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `admin_employees` AS select `E`.`Empno` AS `Empno`,`E`.`Empname` AS `Empname`,`E`.`Gender` AS `Gender`,`E`.`job` AS `job`,`E`.`managerno` AS `managerno`,`E`.`hiredate` AS `hiredate`,`E`.`salary` AS `salary`,`E`.`commision` AS `commision` from (`Employee` `E` join `Dept` `D` on(`E`.`deptno` = `D`.`Deptno`)) where `D`.`dname` = 'Admin' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dept_emp_summary`
--

/*!50001 DROP VIEW IF EXISTS `dept_emp_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dept_emp_summary` AS select `D`.`dname` AS `Dname`,count(`E`.`Empno`) AS `num_employees`,avg(`E`.`salary`) AS `avg_salary` from (`Employee` `E` join `Dept` `D` on(`E`.`deptno` = `D`.`Deptno`)) group by `D`.`dname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_project_details`
--

/*!50001 DROP VIEW IF EXISTS `employee_project_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_project_details` AS select `E`.`Empname` AS `Empname`,`E`.`Empno` AS `Empno`,`E`.`salary` AS `salary`,`P`.`Proj_num` AS `Proj_num`,`P`.`Pname` AS `Pname`,`ewp`.`hours_per_week` AS `hours_per_week`,`P`.`status` AS `status` from ((`Employee` `E` join `emp_workson_project` `ewp` on(`E`.`Empno` = `ewp`.`eno`)) join `Project` `P` on(`P`.`Proj_num` = `ewp`.`pno`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_project_summary`
--

/*!50001 DROP VIEW IF EXISTS `employee_project_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_project_summary` AS select `epd`.`Empno` AS `Empno`,`epd`.`Empname` AS `Empname`,count(`ewp`.`pno`) AS `num_projects`,sum(`ewp`.`hours_per_week`) AS `total_hours` from (`employee_project_details` `epd` join `emp_workson_project` `ewp` on(`epd`.`Empno` = `ewp`.`eno`)) group by `epd`.`Empno`,`epd`.`Empname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `proj_details`
--

/*!50001 DROP VIEW IF EXISTS `proj_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `proj_details` AS select `P`.`Proj_num` AS `Proj_num`,`P`.`Pname` AS `Pname`,`P`.`status` AS `status`,`P`.`location` AS `location`,`P`.`duration` AS `duration`,`E`.`Empname` AS `Empname`,`D`.`dname` AS `dname`,`E`.`salary` AS `salary`,`ewp`.`hours_per_week` AS `hours_per_week` from (((`Employee` `E` join `emp_workson_project` `ewp` on(`E`.`Empno` = `ewp`.`eno`)) join `Project` `P` on(`P`.`Proj_num` = `ewp`.`pno`)) join `Dept` `D` on(`D`.`Deptno` = `E`.`deptno`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `project_employee_summary`
--

/*!50001 DROP VIEW IF EXISTS `project_employee_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `project_employee_summary` AS select `P`.`Proj_num` AS `Proj_num`,`P`.`Pname` AS `Pname`,count(`epd`.`Empno`) AS `num_employees`,sum(`ewp`.`hours_per_week`) AS `total_hours` from ((`employee_project_details` `epd` join `Project` `P` on(`epd`.`Proj_num` = `P`.`Proj_num`)) join `emp_workson_project` `ewp` on(`epd`.`Empno` = `ewp`.`eno`)) group by `P`.`Proj_num`,`P`.`Pname` */;
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

-- Dump completed on 2024-10-14  9:58:09
