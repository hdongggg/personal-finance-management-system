-- MySQL dump 10.13  Distrib 8.4.7, for Win64 (x86_64)
--
-- Host: localhost    Database: PersonalFinanceDB
-- ------------------------------------------------------
-- Server version	8.4.7

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
-- Table structure for table `balancehistory`
--

DROP TABLE IF EXISTS `balancehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `balancehistory` (
  `HistoryID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int NOT NULL,
  `ChangeType` enum('OPENING','CREDIT','DEBIT') NOT NULL,
  `AmountChanged` decimal(15,2) NOT NULL,
  `BalanceBefore` decimal(15,2) NOT NULL,
  `BalanceAfter` decimal(15,2) NOT NULL,
  `ChangedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ReferenceType` enum('ACCOUNT','INCOME','EXPENSE') NOT NULL,
  `ReferenceID` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`HistoryID`),
  KEY `idx_balancehistory_account_time` (`AccountID`,`ChangedAt`),
  KEY `idx_balancehistory_reference` (`ReferenceType`,`ReferenceID`),
  CONSTRAINT `fk_balancehistory_account` FOREIGN KEY (`AccountID`) REFERENCES `bankaccounts` (`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balancehistory`
--

LOCK TABLES `balancehistory` WRITE;
/*!40000 ALTER TABLE `balancehistory` DISABLE KEYS */;
INSERT INTO `balancehistory` VALUES (1,1,'OPENING',5000000.00,0.00,5000000.00,'2026-04-26 18:34:51','ACCOUNT',1,'Opening balance'),(2,2,'OPENING',2500000.00,0.00,2500000.00,'2026-04-26 18:34:51','ACCOUNT',2,'Opening balance'),(3,3,'OPENING',4200000.00,0.00,4200000.00,'2026-04-26 18:34:51','ACCOUNT',3,'Opening balance'),(4,4,'OPENING',3000000.00,0.00,3000000.00,'2026-04-26 18:34:51','ACCOUNT',4,'Opening balance'),(5,5,'OPENING',2800000.00,0.00,2800000.00,'2026-04-26 18:34:51','ACCOUNT',5,'Opening balance'),(6,6,'OPENING',3500000.00,0.00,3500000.00,'2026-04-26 18:34:51','ACCOUNT',6,'Opening balance'),(7,1,'CREDIT',10000000.00,5000000.00,15000000.00,'2026-04-26 18:34:51','INCOME',1,'Monthly salary'),(8,2,'CREDIT',2000000.00,2500000.00,4500000.00,'2026-04-26 18:34:51','INCOME',2,'Freelance income'),(9,3,'CREDIT',8000000.00,4200000.00,12200000.00,'2026-04-26 18:34:51','INCOME',3,'Monthly salary'),(10,4,'CREDIT',6500000.00,3000000.00,9500000.00,'2026-04-26 18:34:51','INCOME',4,'Part-time teaching'),(11,5,'CREDIT',9000000.00,2800000.00,11800000.00,'2026-04-26 18:34:51','INCOME',5,'Monthly salary'),(12,6,'CREDIT',7000000.00,3500000.00,10500000.00,'2026-04-26 18:34:51','INCOME',6,'Business income'),(13,3,'CREDIT',1500000.00,12200000.00,13700000.00,'2026-04-26 18:34:51','INCOME',7,'Bonus'),(14,4,'CREDIT',1000000.00,9500000.00,10500000.00,'2026-04-26 18:34:51','INCOME',8,'Project allowance'),(15,1,'DEBIT',30000.00,15000000.00,14970000.00,'2026-04-26 18:34:51','EXPENSE',1,'Breakfast'),(16,1,'DEBIT',100000.00,14970000.00,14870000.00,'2026-04-26 18:34:51','EXPENSE',2,'Taxi fare'),(17,2,'DEBIT',1200000.00,4500000.00,3300000.00,'2026-04-26 18:34:51','EXPENSE',3,'Online course'),(18,3,'DEBIT',80000.00,13700000.00,13620000.00,'2026-04-26 18:34:51','EXPENSE',4,'Lunch'),(19,3,'DEBIT',600000.00,13620000.00,13020000.00,'2026-04-26 18:34:51','EXPENSE',5,'New shoes'),(20,4,'DEBIT',300000.00,10500000.00,10200000.00,'2026-04-26 18:34:51','EXPENSE',6,'Medicine'),(21,4,'DEBIT',200000.00,10200000.00,10000000.00,'2026-04-26 18:34:51','EXPENSE',7,'Movie ticket'),(22,5,'DEBIT',150000.00,11800000.00,11650000.00,'2026-04-26 18:34:51','EXPENSE',8,'Dinner'),(23,6,'DEBIT',120000.00,10500000.00,10380000.00,'2026-04-26 18:34:51','EXPENSE',9,'Bus card'),(24,6,'DEBIT',450000.00,10380000.00,9930000.00,'2026-04-26 18:34:51','EXPENSE',10,'Clothes shopping'),(25,1,'CREDIT',500000.00,14870000.00,15370000.00,'2026-04-26 18:35:17','INCOME',9,'Test income'),(26,1,'DEBIT',100000.00,15370000.00,15270000.00,'2026-04-26 18:35:38','EXPENSE',11,'Test expense'),(27,1,'CREDIT',100000.00,15270000.00,15370000.00,'2026-04-26 18:43:26','INCOME',10,'Bonus'),(28,7,'OPENING',200000.00,0.00,200000.00,'2026-04-26 18:47:43','ACCOUNT',7,'Opening balance');
/*!40000 ALTER TABLE `balancehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `balancehistoryview`
--

DROP TABLE IF EXISTS `balancehistoryview`;
/*!50001 DROP VIEW IF EXISTS `balancehistoryview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `balancehistoryview` AS SELECT 
 1 AS `HistoryID`,
 1 AS `AccountID`,
 1 AS `UserName`,
 1 AS `BankName`,
 1 AS `ChangeType`,
 1 AS `AmountChanged`,
 1 AS `BalanceBefore`,
 1 AS `BalanceAfter`,
 1 AS `ChangedAt`,
 1 AS `ReferenceType`,
 1 AS `ReferenceID`,
 1 AS `Description`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bankaccounts`
--

DROP TABLE IF EXISTS `bankaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bankaccounts` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `BankName` varchar(100) NOT NULL,
  `Balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`AccountID`),
  KEY `idx_bankaccounts_userid` (`UserID`),
  CONSTRAINT `fk_bankaccounts_user` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankaccounts`
--

LOCK TABLES `bankaccounts` WRITE;
/*!40000 ALTER TABLE `bankaccounts` DISABLE KEYS */;
INSERT INTO `bankaccounts` VALUES (1,1,'Vietcombank',15370000.00),(2,1,'Techcombank',3300000.00),(3,2,'SHB',13020000.00),(4,3,'MB Bank',10000000.00),(5,4,'BIDV',11650000.00),(6,5,'Sacombank',9930000.00),(7,6,'VCB',200000.00);
/*!40000 ALTER TABLE `bankaccounts` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_account_insert` AFTER INSERT ON `bankaccounts` FOR EACH ROW BEGIN
    IF NEW.Balance > 0 THEN
        INSERT INTO BalanceHistory (
            AccountID, ChangeType, AmountChanged, BalanceBefore, BalanceAfter,
            ReferenceType, ReferenceID, Description
        )
        VALUES (
            NEW.AccountID, 'OPENING', NEW.Balance, 0.00, NEW.Balance,
            'ACCOUNT', NEW.AccountID, 'Opening balance'
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `expensecategories`
--

DROP TABLE IF EXISTS `expensecategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expensecategories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(100) NOT NULL,
  PRIMARY KEY (`CategoryID`),
  UNIQUE KEY `CategoryName` (`CategoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expensecategories`
--

LOCK TABLES `expensecategories` WRITE;
/*!40000 ALTER TABLE `expensecategories` DISABLE KEYS */;
INSERT INTO `expensecategories` VALUES (3,'Education'),(6,'Entertainment'),(1,'Food'),(5,'Health'),(4,'Shopping'),(2,'Transport');
/*!40000 ALTER TABLE `expensecategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `ExpenseID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `CategoryID` int NOT NULL,
  `AccountID` int NOT NULL,
  `Amount` decimal(15,2) NOT NULL,
  `ExpenseDate` date NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ExpenseID`),
  KEY `idx_expenses_user_date` (`UserID`,`ExpenseDate`),
  KEY `idx_expenses_categoryid` (`CategoryID`),
  KEY `idx_expenses_accountid` (`AccountID`),
  CONSTRAINT `fk_expenses_account` FOREIGN KEY (`AccountID`) REFERENCES `bankaccounts` (`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_expenses_category` FOREIGN KEY (`CategoryID`) REFERENCES `expensecategories` (`CategoryID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_expenses_user` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chk_expense_amount` CHECK ((`Amount` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,1,1,1,30000.00,'2026-04-02','Breakfast'),(2,1,2,1,100000.00,'2026-04-03','Taxi fare'),(3,1,3,2,1200000.00,'2026-04-06','Online course'),(4,2,1,3,80000.00,'2026-04-04','Lunch'),(5,2,4,3,600000.00,'2026-04-08','New shoes'),(6,3,5,4,300000.00,'2026-04-09','Medicine'),(7,3,6,4,200000.00,'2026-04-10','Movie ticket'),(8,4,1,5,150000.00,'2026-04-05','Dinner'),(9,5,2,6,120000.00,'2026-04-07','Bus card'),(10,5,4,6,450000.00,'2026-04-15','Clothes shopping'),(11,1,1,1,100000.00,'2026-04-28','Test expense');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_expense_insert` AFTER INSERT ON `expenses` FOR EACH ROW BEGIN
    INSERT INTO BalanceHistory (
        AccountID, ChangeType, AmountChanged, BalanceBefore, BalanceAfter,
        ReferenceType, ReferenceID, Description
    )
    SELECT
        AccountID,
        'DEBIT',
        NEW.Amount,
        Balance,
        Balance - NEW.Amount,
        'EXPENSE',
        NEW.ExpenseID,
        NEW.Description
    FROM BankAccounts
    WHERE AccountID = NEW.AccountID;

    UPDATE BankAccounts
    SET Balance = Balance - NEW.Amount
    WHERE AccountID = NEW.AccountID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income` (
  `IncomeID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `AccountID` int NOT NULL,
  `Amount` decimal(15,2) NOT NULL,
  `IncomeDate` date NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IncomeID`),
  KEY `idx_income_user_date` (`UserID`,`IncomeDate`),
  KEY `idx_income_accountid` (`AccountID`),
  CONSTRAINT `fk_income_account` FOREIGN KEY (`AccountID`) REFERENCES `bankaccounts` (`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_income_user` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chk_income_amount` CHECK ((`Amount` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income` VALUES (1,1,1,10000000.00,'2026-04-01','Monthly salary'),(2,1,2,2000000.00,'2026-04-05','Freelance income'),(3,2,3,8000000.00,'2026-04-02','Monthly salary'),(4,3,4,6500000.00,'2026-04-03','Part-time teaching'),(5,4,5,9000000.00,'2026-04-01','Monthly salary'),(6,5,6,7000000.00,'2026-04-04','Business income'),(7,2,3,1500000.00,'2026-04-12','Bonus'),(8,3,4,1000000.00,'2026-04-18','Project allowance'),(9,1,1,500000.00,'2026-04-28','Test income'),(10,1,1,100000.00,'2026-05-23','Bonus');
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_income_insert` AFTER INSERT ON `income` FOR EACH ROW BEGIN
    INSERT INTO BalanceHistory (
        AccountID, ChangeType, AmountChanged, BalanceBefore, BalanceAfter,
        ReferenceType, ReferenceID, Description
    )
    SELECT
        AccountID,
        'CREDIT',
        NEW.Amount,
        Balance,
        Balance + NEW.Amount,
        'INCOME',
        NEW.IncomeID,
        NEW.Description
    FROM BankAccounts
    WHERE AccountID = NEW.AccountID;

    UPDATE BankAccounts
    SET Balance = Balance + NEW.Amount
    WHERE AccountID = NEW.AccountID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mai Huy Dong','hdongm1607@gmail.com','0901234567'),(2,'Ta Thanh Dat','thanhdat636@gmail.com','0912345678'),(3,'Dang Nhat Minh','dnminh17@gmail.com','0923456789'),(4,'Bui Dang Cuong','dangcuong21@gmail.com','0934567890'),(5,'Bui Duy Anh','danhbui29@gmail.com','0945678901'),(6,'Ronaldo','CR7@gmail.com','9128738');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'PersonalFinanceDB'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddExpenseProc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddExpenseProc`(
    IN p_UserID INT,
    IN p_CategoryID INT,
    IN p_AccountID INT,
    IN p_Amount DECIMAL(15,2),
    IN p_ExpenseDate DATE,
    IN p_Description VARCHAR(255)
)
BEGIN
    INSERT INTO Expenses (UserID, CategoryID, AccountID, Amount, ExpenseDate, Description)
    VALUES (p_UserID, p_CategoryID, p_AccountID, p_Amount, p_ExpenseDate, p_Description);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddIncomeProc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddIncomeProc`(
    IN p_UserID INT,
    IN p_AccountID INT,
    IN p_Amount DECIMAL(15,2),
    IN p_IncomeDate DATE,
    IN p_Description VARCHAR(255)
)
BEGIN
    INSERT INTO Income (UserID, AccountID, Amount, IncomeDate, Description)
    VALUES (p_UserID, p_AccountID, p_Amount, p_IncomeDate, p_Description);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MonthlyClosureProc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MonthlyClosureProc`(
    IN p_UserID INT,
    IN p_Year INT,
    IN p_Month INT
)
BEGIN
    SELECT
        u.UserID,
        u.UserName,
        p_Year AS SummaryYear,
        p_Month AS SummaryMonth,
        IFNULL((
            SELECT SUM(i.Amount)
            FROM Income i
            WHERE i.UserID = p_UserID
              AND YEAR(i.IncomeDate) = p_Year
              AND MONTH(i.IncomeDate) = p_Month
        ), 0) AS TotalIncome,
        IFNULL((
            SELECT SUM(e.Amount)
            FROM Expenses e
            WHERE e.UserID = p_UserID
              AND YEAR(e.ExpenseDate) = p_Year
              AND MONTH(e.ExpenseDate) = p_Month
        ), 0) AS TotalExpense,
        IFNULL((
            SELECT SUM(i.Amount)
            FROM Income i
            WHERE i.UserID = p_UserID
              AND YEAR(i.IncomeDate) = p_Year
              AND MONTH(i.IncomeDate) = p_Month
        ), 0)
        -
        IFNULL((
            SELECT SUM(e.Amount)
            FROM Expenses e
            WHERE e.UserID = p_UserID
              AND YEAR(e.ExpenseDate) = p_Year
              AND MONTH(e.ExpenseDate) = p_Month
        ), 0) AS NetAmount
    FROM Users u
    WHERE u.UserID = p_UserID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `balancehistoryview`
--

/*!50001 DROP VIEW IF EXISTS `balancehistoryview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `balancehistoryview` AS select `bh`.`HistoryID` AS `HistoryID`,`bh`.`AccountID` AS `AccountID`,`u`.`UserName` AS `UserName`,`b`.`BankName` AS `BankName`,`bh`.`ChangeType` AS `ChangeType`,`bh`.`AmountChanged` AS `AmountChanged`,`bh`.`BalanceBefore` AS `BalanceBefore`,`bh`.`BalanceAfter` AS `BalanceAfter`,`bh`.`ChangedAt` AS `ChangedAt`,`bh`.`ReferenceType` AS `ReferenceType`,`bh`.`ReferenceID` AS `ReferenceID`,`bh`.`Description` AS `Description` from ((`balancehistory` `bh` join `bankaccounts` `b` on((`bh`.`AccountID` = `b`.`AccountID`))) join `users` `u` on((`b`.`UserID` = `u`.`UserID`))) */;
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

-- Dump completed on 2026-04-26 20:41:05
