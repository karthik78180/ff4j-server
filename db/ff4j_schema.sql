-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: ff4j_demo
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `ff4j_audit`
--

DROP TABLE IF EXISTS `ff4j_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE transfer_network.ff4j_audit (
                                             EVT_UUID text NOT NULL PRIMARY KEY,
                                             EVT_TIME timestamp default current_timestamp ,
                                             EVT_TYPE text NOT NULL,
                                             EVT_NAME text NOT NULL,
                                             EVT_ACTION text NOT NULL,
                                             EVT_HOSTNAME text NOT NULL,
                                             EVT_SOURCE text NOT NULL,
                                             EVT_DURATION int DEFAULT NULL,
                                             EVT_USER text DEFAULT NULL,
                                             EVT_VALUE text DEFAULT NULL,
                                             EVT_KEYS text DEFAULT NULL
)
    TABLESPACE pg_default;

ALTER TABLE transfer_network.ff4j_audit
    OWNER to postgres;
 -- ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO transfer_network.ff4j_audit VALUES ('001f7ce7-1e7b-424e-92b2-c084f0554d79','2018-08-25 06:25:11','feature','Beta-Feature-1','checkOn','LOH068ND447GLYF','JAVA_API',0,'sasi',NULL,''),('002e4e37-6410-43ae-984d-c3eb7d6502e9','2018-10-05 14:40:48','feature','client-feature','toggle-on','LOH069PF0X4B28','JAVA_API',8989600,NULL,NULL,''),('00335cdd-6254-4418-a48b-78f5f5be2c63','2018-10-17 14:52:19','feature','sasi-f1','checkOn','LOH069PF0X4B28','JAVA_API',0,'sasi',NULL,''),('0039cad2-dcae-4ed0-b5ca-e8c647d46536','2018-10-08 18:11:27','feature','sasi-f1','checkOn','LOH069PF0X4B28','JAVA_API',0,'sasi',NULL,''),('003c97e6-f749-4278-b2e4-804b0a8062e3','2018-09-19 13:37:15','feature','Beta-Feature-1','checkOff','LOH069PF0X4B28','JAVA_API',0,'sasi',NULL,'');
--
-- Dumping data for table `ff4j_audit`
--

LOCK TABLES `ff4j_audit` WRITE;
/*!40000 ALTER TABLE `ff4j_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ff4j_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ff4j_custom_properties`
--

DROP TABLE IF EXISTS ff4j_custom_properties;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE transfer_network.ff4j_custom_properties (
                                        PROPERTY_ID varchar(100) NOT NULL,
                                        CLAZZ varchar(255) NOT NULL,
                                        CURRENTVALUE varchar(255) DEFAULT NULL,
                                        FIXEDVALUES varchar(1000) DEFAULT NULL,
                                        DESCRIPTION varchar(1000) DEFAULT NULL,
                                        FEAT_UID varchar(100) NOT NULL,
                                        PRIMARY KEY (PROPERTY_ID,FEAT_UID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table ff4j_custom_properties
--

LOCK TABLES transfer_network.ff4j_custom_properties WRITE;
/*!40000 ALTER TABLE ff4j_custom_properties DISABLE KEYS */;
/*!40000 ALTER TABLE ff4j_custom_properties ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table ff4j_features
--

DROP TABLE IF EXISTS ff4j_features;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE transfer_network.ff4j_features (
                               FEAT_UID varchar(100) NOT NULL,
                               ENABLE int NOT NULL,
                               DESCRIPTION varchar(1000) DEFAULT NULL,
                               STRATEGY varchar(1000) DEFAULT NULL,
                               EXPRESSION varchar(255) DEFAULT NULL,
                               GROUPNAME varchar(100) DEFAULT NULL,
                               PRIMARY KEY (FEAT_UID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table ff4j_features
--

LOCK TABLES ff4j_features WRITE;
/*!40000 ALTER TABLE ff4j_features DISABLE KEYS */;
INSERT INTO transfer_network.ff4j_features VALUES ('Beta-Feature-1',1,'User story -1 for R1',NULL,NULL,'R1'),('Beta-Feature-2',1,'User story 2 for R1',NULL,NULL,'R1'),('client-feature',1,NULL,'org.ff4j.strategy.ClientFilterStrategy','grantedClients=dwebnetv01,10.228.18.35',NULL),('exp-sasi',0,NULL,'org.ff4j.strategy.el.ExpressionFlipStrategy','expression=sasi-f1 | sasi-f2',NULL),('office-hour-normal',0,NULL,'org.ff4j.strategy.time.OfficeHourStrategy','tuesday=08:00-12:00,13:30-18:00&monday=08:00-12:00,13:30-18:00',NULL),('office-hour-public-holiday',0,NULL,'org.ff4j.strategy.time.OfficeHourStrategy','publicHolidays=2015-01-01,2015-05-01,2015-12-25',NULL),('office-hour-special-opening',0,NULL,'org.ff4j.strategy.time.OfficeHourStrategy','specialOpenings=[08:00-12:00]@2015-01-01',NULL),('poderation',0,NULL,'org.ff4j.strategy.PonderationStrategy','weight=0.5',NULL),('Release-date',1,NULL,'org.ff4j.strategy.time.ReleaseDateFlipStrategy','releaseDate=2018-10-18-14:00',NULL),('sasi-f1',1,'',NULL,NULL,NULL),('sasi-f2',1,'',NULL,NULL,NULL),('system-binary',1,'Enables binary system',NULL,NULL,NULL);
/*!40000 ALTER TABLE ff4j_features ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table ff4j_properties
--

DROP TABLE IF EXISTS ff4j_properties;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE transfer_network.ff4j_properties (
                                                  PROPERTY_ID varchar(100) NOT NULL,
                                                  CLAZZ varchar(255) NOT NULL,
                                                  CURRENTVALUE varchar(255) DEFAULT NULL,
                                                  FIXEDVALUES varchar(1000) DEFAULT NULL,
                                                  DESCRIPTION varchar(1000) DEFAULT NULL,
                                                  PRIMARY KEY (PROPERTY_ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table ff4j_properties
--

LOCK TABLES transfer_network.ff4j_properties WRITE;
/*!40000 ALTER TABLE transfer_network.ff4j_properties DISABLE KEYS */;
INSERT INTO transfer_network.ff4j_properties VALUES ('a','org.ff4j.property.PropertyString','AMER','AMER, EAST',NULL),('b','org.ff4j.property.PropertyString','12',NULL,NULL),('c','org.ff4j.property.PropertyString','12.5',NULL,NULL),('d','org.ff4j.property.PropertyString','true',NULL,NULL),('e','org.ff4j.property.PropertyString','hello',NULL,NULL),('f','org.ff4j.property.PropertyString','12,13,14',NULL,NULL),('g','org.ff4j.property.PropertyLogLevel','DEBUG','WARN, ERROR, FATAL, INFO, DEBUG, TRACE',NULL),('SampleProperty','org.ff4j.property.PropertyString','go-sasi!',NULL,NULL),('SamplePropertyIn','org.ff4j.property.PropertyInt','12',NULL,NULL);
/*!40000 ALTER TABLE ff4j_properties ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table ff4j_roles
--

DROP TABLE IF EXISTS ff4j_roles;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE transfer_network.ff4j_roles (
                                             FEAT_UID varchar(100) NOT NULL,
                                             ROLE_NAME varchar(100) NOT NULL,
                                             PRIMARY KEY (FEAT_UID,ROLE_NAME)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table ff4j_roles
--

LOCK TABLES ff4j_roles WRITE;
/*!40000 ALTER TABLE transfer_network.ff4j_roles DISABLE KEYS */;
INSERT INTO transfer_network.ff4j_roles VALUES ('Beta-Feature-1','ROLE_BETA-TESTER'),('Beta-Feature-2','ROLE_BETA-TESTER');
/*!40000 ALTER TABLE ff4j_roles ENABLE KEYS */;
UNLOCK TABLES;