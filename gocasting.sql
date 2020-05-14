-- MySQL dump 10.13  Distrib 8.0.15, for osx10.14 (x86_64)
--
-- Host: localhost    Database: gocasting
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add cast tag',7,'add_casttag'),(26,'Can change cast tag',7,'change_casttag'),(27,'Can delete cast tag',7,'delete_casttag'),(28,'Can view cast tag',7,'view_casttag'),(29,'Can add language',8,'add_language'),(30,'Can change language',8,'change_language'),(31,'Can delete language',8,'delete_language'),(32,'Can view language',8,'view_language'),(33,'Can add region',9,'add_region'),(34,'Can change region',9,'change_region'),(35,'Can delete region',9,'delete_region'),(36,'Can view region',9,'view_region'),(37,'Can add city',10,'add_city'),(38,'Can change city',10,'change_city'),(39,'Can delete city',10,'delete_city'),(40,'Can view city',10,'view_city'),(41,'Can add cast',11,'add_cast'),(42,'Can change cast',11,'change_cast'),(43,'Can delete cast',11,'delete_cast'),(44,'Can view cast',11,'view_cast'),(45,'Can add Token',12,'add_token'),(46,'Can change Token',12,'change_token'),(47,'Can delete Token',12,'delete_token'),(48,'Can view Token',12,'view_token'),(49,'Can add user info',13,'add_userinfo'),(50,'Can change user info',13,'change_userinfo'),(51,'Can delete user info',13,'delete_userinfo'),(52,'Can view user info',13,'view_userinfo'),(53,'Can add additional skill',14,'add_additionalskill'),(54,'Can change additional skill',14,'change_additionalskill'),(55,'Can delete additional skill',14,'delete_additionalskill'),(56,'Can view additional skill',14,'view_additionalskill'),(57,'Can add photo gallery',15,'add_photogallery'),(58,'Can change photo gallery',15,'change_photogallery'),(59,'Can delete photo gallery',15,'delete_photogallery'),(60,'Can view photo gallery',15,'view_photogallery'),(61,'Can add interest tag',7,'add_interesttag'),(62,'Can change interest tag',7,'change_interesttag'),(63,'Can delete interest tag',7,'delete_interesttag'),(64,'Can view interest tag',7,'view_interesttag'),(65,'Can add cast info',16,'add_castinfo'),(66,'Can change cast info',16,'change_castinfo'),(67,'Can delete cast info',16,'delete_castinfo'),(68,'Can view cast info',16,'view_castinfo'),(69,'Can add education history',17,'add_educationhistory'),(70,'Can change education history',17,'change_educationhistory'),(71,'Can delete education history',17,'delete_educationhistory'),(72,'Can view education history',17,'view_educationhistory'),(73,'Can add work history',18,'add_workhistory'),(74,'Can change work history',18,'change_workhistory'),(75,'Can delete work history',18,'delete_workhistory'),(76,'Can view work history',18,'view_workhistory'),(77,'Can add video gallery',19,'add_videogallery'),(78,'Can change video gallery',19,'change_videogallery'),(79,'Can delete video gallery',19,'delete_videogallery'),(80,'Can view video gallery',19,'view_videogallery'),(81,'Can add picture area',20,'add_picturearea'),(82,'Can change picture area',20,'change_picturearea'),(83,'Can delete picture area',20,'delete_picturearea'),(84,'Can view picture area',20,'view_picturearea'),(85,'Can add agent info',21,'add_agentinfo'),(86,'Can change agent info',21,'change_agentinfo'),(87,'Can delete agent info',21,'delete_agentinfo'),(88,'Can view agent info',21,'view_agentinfo'),(89,'Can add agent model',22,'add_agentmodel'),(90,'Can change agent model',22,'change_agentmodel'),(91,'Can delete agent model',22,'delete_agentmodel'),(92,'Can view agent model',22,'view_agentmodel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_gocasting_user_id` FOREIGN KEY (`user_id`) REFERENCES `gocasting_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('77ba7dd7a3f2bdeab9d117b2be39b6fe8b837c37','2020-04-02 18:10:24.199750',32),('a9ad25d59c0b51a4c6daa0b49cf8fe268bc73095','2020-05-14 16:59:42.613198',40);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_gocasting_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_gocasting_user_id` FOREIGN KEY (`user_id`) REFERENCES `gocasting_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-03-29 12:35:50.547103','1','Language object (1)',1,'[{\"added\": {}}]',8,1),(2,'2020-03-29 12:35:53.687103','2','Language object (2)',1,'[{\"added\": {}}]',8,1),(3,'2020-03-29 12:36:01.327450','1','Region object (1)',1,'[{\"added\": {}}]',9,1),(4,'2020-03-29 12:37:11.655955','1','City object (1)',1,'[{\"added\": {}}]',10,1),(5,'2020-03-29 12:37:50.048839','2','saria',1,'[{\"added\": {}}, {\"added\": {\"name\": \"user info\", \"object\": \"UserInfo object (1)\"}}]',6,1),(6,'2020-03-29 12:38:02.755869','2','saria',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',6,1),(7,'2020-03-29 12:39:07.692338','1','CastTag object (1)',1,'[{\"added\": {}}]',7,1),(8,'2020-03-29 12:39:10.905061','2','CastTag object (2)',1,'[{\"added\": {}}]',7,1),(9,'2020-03-29 12:39:15.146788','1','Cast object (1)',1,'[{\"added\": {}}]',11,1),(10,'2020-03-29 14:23:03.968132','1','swimming',1,'[{\"added\": {}}]',14,1),(11,'2020-03-29 14:23:08.420274','2','martial arts',1,'[{\"added\": {}}]',14,1),(12,'2020-03-29 14:23:17.633807','3','singing',1,'[{\"added\": {}}]',14,1),(13,'2020-03-29 14:24:31.033161','2','saria',2,'[{\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (1)\"}}]',6,1),(14,'2020-03-29 15:08:34.466298','3','amen',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (2)\"}}]',6,1),(15,'2020-03-29 15:08:44.676584','3','amen',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',6,1),(16,'2020-03-29 15:10:36.554423','4','feven',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (3)\"}}]',6,1),(17,'2020-03-29 15:10:45.004071','4','feven',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',6,1),(18,'2020-03-29 15:11:39.786134','2','Amhara',1,'[{\"added\": {}}]',9,1),(19,'2020-03-29 15:11:45.755608','2','Bahir Dar',1,'[{\"added\": {}}]',10,1),(20,'2020-03-29 15:11:49.055692','5','mieraf',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (4)\"}}]',6,1),(21,'2020-03-29 15:11:58.946472','5','mieraf',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',6,1),(22,'2020-03-29 15:15:53.729544','3','Arabic',1,'[{\"added\": {}}]',8,1),(23,'2020-03-29 15:16:50.440905','6','hibaq',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (5)\"}}]',6,1),(24,'2020-03-29 15:17:03.266786','6','hibaq',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(25,'2020-03-29 15:18:20.925576','7','betty',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (6)\"}}]',6,1),(26,'2020-03-29 15:18:27.981925','7','betty',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(27,'2020-03-29 15:21:00.129755','8','bestelot',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (7)\"}}]',6,1),(28,'2020-03-29 15:21:05.715777','8','bestelot',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(29,'2020-03-29 15:25:22.883604','9','jerry',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (8)\"}}]',6,1),(30,'2020-03-29 15:25:27.697640','9','jerry',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(31,'2020-03-29 15:28:59.166654','10','johan',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (9)\"}}]',6,1),(32,'2020-03-29 15:29:03.073232','10','johan',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(33,'2020-03-29 15:30:50.170984','5','mieraf',2,'[{\"changed\": {\"name\": \"cast info\", \"object\": \"CastInfo object (4)\", \"fields\": [\"profile_picture\"]}}]',6,1),(34,'2020-03-29 15:35:03.684741','11','mahder',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (10)\"}}]',6,1),(35,'2020-03-29 15:35:09.993391','11','mahder',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(36,'2020-03-29 15:36:48.214238','12','amy',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (11)\"}}]',6,1),(37,'2020-03-29 15:36:53.986933','12','amy',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(38,'2020-03-29 15:43:02.325656','10','johan',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(39,'2020-03-29 15:43:11.446445','10','johan',2,'[{\"changed\": {\"fields\": [\"first_name\"]}}]',6,1),(40,'2020-03-29 15:43:37.118556','10','johan',2,'[{\"changed\": {\"name\": \"cast info\", \"object\": \"CastInfo object (9)\", \"fields\": [\"profile_picture\"]}}]',6,1),(41,'2020-03-29 16:29:51.053551','2','saria',2,'[{\"changed\": {\"fields\": [\"last_name\"]}}]',6,1),(42,'2020-03-29 16:30:07.583154','2','saria',2,'[{\"changed\": {\"fields\": [\"first_name\"]}}]',6,1),(43,'2020-03-29 16:36:51.604256','13','emily',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (12)\"}}]',6,1),(44,'2020-03-29 16:36:54.412826','13','emily',2,'[{\"changed\": {\"fields\": [\"first_name\"]}}]',6,1),(45,'2020-03-30 05:44:40.513377','3','Short Films',1,'[{\"added\": {}}]',7,1),(46,'2020-03-30 05:44:46.676393','4','Tv Commercials',1,'[{\"added\": {}}]',7,1),(47,'2020-03-30 05:44:53.521759','5','Tv Series',1,'[{\"added\": {}}]',7,1),(48,'2020-03-30 05:44:59.233386','6','Drama',1,'[{\"added\": {}}]',7,1),(49,'2020-03-30 05:45:14.036184','7','Social Media Commercials',1,'[{\"added\": {}}]',7,1),(50,'2020-03-30 05:46:06.444046','8','Runway',1,'[{\"added\": {}}]',7,1),(51,'2020-03-30 05:47:46.892780','13','emily',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}, {\"changed\": {\"name\": \"cast info\", \"object\": \"CastInfo object (12)\", \"fields\": [\"additional_skills\", \"intersted_in\"]}}]',6,1),(52,'2020-03-30 06:08:16.409731','13','emily',2,'[{\"added\": {\"name\": \"photo gallery\", \"object\": \"PhotoGallery object (1)\"}}, {\"added\": {\"name\": \"photo gallery\", \"object\": \"PhotoGallery object (2)\"}}, {\"added\": {\"name\": \"photo gallery\", \"object\": \"PhotoGallery object (3)\"}}, {\"added\": {\"name\": \"photo gallery\", \"object\": \"PhotoGallery object (4)\"}}, {\"added\": {\"name\": \"photo gallery\", \"object\": \"PhotoGallery object (5)\"}}, {\"added\": {\"name\": \"photo gallery\", \"object\": \"PhotoGallery object (6)\"}}, {\"added\": {\"name\": \"photo gallery\", \"object\": \"PhotoGallery object (7)\"}}, {\"added\": {\"name\": \"photo gallery\", \"object\": \"PhotoGallery object (8)\"}}, {\"added\": {\"name\": \"photo gallery\", \"object\": \"PhotoGallery object (9)\"}}, {\"added\": {\"name\": \"photo gallery\", \"object\": \"PhotoGallery object (10)\"}}, {\"added\": {\"name\": \"photo gallery\", \"object\": \"PhotoGallery object (11)\"}}]',6,1),(53,'2020-03-30 06:20:36.497881','13','emily',2,'[{\"changed\": {\"name\": \"cast info\", \"object\": \"CastInfo object (12)\", \"fields\": [\"weight\"]}}]',6,1),(54,'2020-03-30 06:21:13.166202','13','emily',2,'[{\"changed\": {\"name\": \"cast info\", \"object\": \"CastInfo object (12)\", \"fields\": [\"facebook\", \"instagram\", \"twitter\"]}}]',6,1),(55,'2020-03-30 06:22:18.904280','13','emily',2,'[{\"changed\": {\"name\": \"cast info\", \"object\": \"CastInfo object (12)\", \"fields\": [\"phone\"]}}]',6,1),(56,'2020-03-30 06:22:25.348772','13','emily',2,'[{\"changed\": {\"name\": \"cast info\", \"object\": \"CastInfo object (12)\", \"fields\": [\"phone\"]}}]',6,1),(57,'2020-03-30 06:22:33.688568','13','emily',2,'[{\"changed\": {\"name\": \"cast info\", \"object\": \"CastInfo object (12)\", \"fields\": [\"phone\"]}}]',6,1),(58,'2020-03-30 07:04:28.577586','13','emily',2,'[{\"added\": {\"name\": \"work history\", \"object\": \"WorkHistory object (1)\"}}, {\"added\": {\"name\": \"work history\", \"object\": \"WorkHistory object (2)\"}}, {\"added\": {\"name\": \"work history\", \"object\": \"WorkHistory object (3)\"}}, {\"added\": {\"name\": \"education history\", \"object\": \"EducationHistory object (1)\"}}]',6,1),(59,'2020-03-30 17:20:21.644527','10','johan',2,'[{\"changed\": {\"name\": \"cast info\", \"object\": \"CastInfo object (9)\", \"fields\": [\"intersted_in\", \"facebook\", \"instagram\", \"twitter\"]}}]',6,1),(60,'2020-03-30 17:23:01.189265','10','johan',2,'[{\"changed\": {\"name\": \"cast info\", \"object\": \"CastInfo object (9)\", \"fields\": [\"height\", \"weight\"]}}, {\"added\": {\"name\": \"education history\", \"object\": \"EducationHistory object (2)\"}}, {\"added\": {\"name\": \"education history\", \"object\": \"EducationHistory object (3)\"}}]',6,1),(61,'2020-03-30 17:23:32.338222','10','johan',2,'[{\"changed\": {\"name\": \"cast info\", \"object\": \"CastInfo object (9)\", \"fields\": [\"phone\"]}}]',6,1),(62,'2020-03-30 17:24:32.900441','10','johan',2,'[{\"added\": {\"name\": \"work history\", \"object\": \"WorkHistory object (4)\"}}]',6,1),(63,'2020-03-30 18:13:49.021353','14','yeab',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (13)\"}}]',6,1),(64,'2020-03-30 18:13:54.719634','14','yeab',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(65,'2020-03-30 18:17:55.079274','15','danayit',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (14)\"}}]',6,1),(66,'2020-03-30 18:17:59.764022','15','danayit',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(67,'2020-03-30 18:24:49.536280','16','abel',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (15)\"}}]',6,1),(68,'2020-03-30 18:24:56.084581','16','abel',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(69,'2020-03-30 18:25:21.853733','13','emily',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',6,1),(70,'2020-03-30 18:27:11.539835','17','ledetu',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (16)\"}}]',6,1),(71,'2020-03-30 18:27:16.278772','17','ledetu',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(72,'2020-03-30 18:31:04.012582','10','johan',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(73,'2020-03-30 18:31:24.314663','12','amy',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',6,1),(74,'2020-03-31 07:34:34.563300','12','amy',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',6,1),(75,'2020-03-31 07:34:39.759210','13','emily',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',6,1),(76,'2020-03-31 10:20:30.256067','18','bamlak',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (17)\"}}]',6,1),(77,'2020-03-31 10:20:36.720504','18','bamlak',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(78,'2020-03-31 10:22:07.135403','19','joeethio',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (18)\"}}]',6,1),(79,'2020-03-31 10:22:13.568790','19','joeethio',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(80,'2020-03-31 10:25:06.748061','20','kidst',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (19)\"}}]',6,1),(81,'2020-03-31 10:25:16.413032','20','kidst',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(82,'2020-03-31 10:26:55.599025','4','Tigrai',1,'[{\"added\": {}}]',8,1),(83,'2020-03-31 10:27:11.444249','21','rahel',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (20)\"}}]',6,1),(84,'2020-03-31 10:27:16.615068','21','rahel',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(85,'2020-03-31 10:32:53.858369','22','bettys',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (21)\"}}]',6,1),(86,'2020-03-31 10:32:59.983160','22','bettys',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(87,'2020-03-31 10:35:41.737136','23','nishan',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (22)\"}}]',6,1),(88,'2020-03-31 10:35:43.992642','23','nishan',2,'[{\"changed\": {\"fields\": [\"first_name\"]}}]',6,1),(89,'2020-03-31 10:40:29.931813','24','messay',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cast info\", \"object\": \"CastInfo object (23)\"}}]',6,1),(90,'2020-03-31 10:40:34.339837','24','messay',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',6,1),(91,'2020-03-31 12:30:06.309929','13','emily',2,'[{\"added\": {\"name\": \"video gallery\", \"object\": \"VideoGallery object (1)\"}}, {\"added\": {\"name\": \"video gallery\", \"object\": \"VideoGallery object (2)\"}}]',6,1),(92,'2020-03-31 12:30:38.738040','13','emily',2,'[{\"changed\": {\"name\": \"video gallery\", \"object\": \"VideoGallery object (2)\", \"fields\": [\"video\"]}}]',6,1),(93,'2020-03-31 13:17:37.342922','13','emily',2,'[{\"added\": {\"name\": \"video gallery\", \"object\": \"VideoGallery object (3)\"}}, {\"changed\": {\"name\": \"video gallery\", \"object\": \"VideoGallery object (1)\", \"fields\": [\"video\"]}}, {\"changed\": {\"name\": \"video gallery\", \"object\": \"VideoGallery object (2)\", \"fields\": [\"video\"]}}]',6,1),(94,'2020-04-02 10:48:24.771466','25','taborns',3,'',6,1),(95,'2020-04-02 10:49:05.636040','26','taborns',3,'',6,1),(96,'2020-04-02 11:10:22.232973','27','taborns',3,'',6,1),(97,'2020-04-02 11:19:05.597138','28','taborns',2,'[{\"changed\": {\"name\": \"cast info\", \"object\": \"CastInfo object (25)\", \"fields\": [\"birth_date\"]}}]',6,1),(98,'2020-04-02 12:26:21.283194','28','taborns',3,'',6,1),(99,'2020-04-02 16:41:51.587190','30','mkcast',3,'',6,1),(100,'2020-04-02 16:45:14.269091','31','mkcast',3,'',6,1),(101,'2020-05-14 11:40:44.462753','29','taborns',2,'[{\"deleted\": {\"name\": \"photo gallery\", \"object\": \"PhotoGallery object (None)\"}}, {\"deleted\": {\"name\": \"photo gallery\", \"object\": \"PhotoGallery object (None)\"}}, {\"deleted\": {\"name\": \"photo gallery\", \"object\": \"PhotoGallery object (None)\"}}]',6,1),(102,'2020-05-14 15:36:58.513967','12','amy',3,'',6,1),(103,'2020-05-14 15:36:58.517061','13','emily',3,'',6,1),(104,'2020-05-14 15:36:58.519286','2','saria',3,'',6,1),(105,'2020-05-14 15:41:59.010633','33','booker',3,'',6,1),(106,'2020-05-14 15:46:25.017864','34','booker',3,'',6,1),(107,'2020-05-14 15:47:01.109122','35','booker',3,'',6,1),(108,'2020-05-14 15:47:54.635549','36','booker',3,'',6,1),(109,'2020-05-14 15:50:02.660115','37','booker',3,'',6,1),(110,'2020-05-14 15:51:16.445034','38','booker',3,'',6,1),(111,'2020-05-14 15:52:04.560809','39','booker',3,'',6,1),(112,'2020-05-14 15:55:02.081552','29','taborns',3,'',6,1),(113,'2020-05-14 15:58:11.931922','41','taborns',3,'',6,1),(114,'2020-05-14 16:00:13.139497','42','taborns',3,'',6,1),(115,'2020-05-14 17:02:02.667763','43','taborns',3,'',6,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(12,'authtoken','token'),(4,'contenttypes','contenttype'),(14,'gocasting','additionalskill'),(21,'gocasting','agentinfo'),(22,'gocasting','agentmodel'),(11,'gocasting','cast'),(16,'gocasting','castinfo'),(10,'gocasting','city'),(17,'gocasting','educationhistory'),(7,'gocasting','interesttag'),(8,'gocasting','language'),(15,'gocasting','photogallery'),(20,'gocasting','picturearea'),(9,'gocasting','region'),(6,'gocasting','user'),(13,'gocasting','userinfo'),(19,'gocasting','videogallery'),(18,'gocasting','workhistory'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-03-29 11:34:02.775246'),(2,'contenttypes','0002_remove_content_type_name','2020-03-29 11:34:02.803313'),(3,'auth','0001_initial','2020-03-29 11:34:02.838361'),(4,'auth','0002_alter_permission_name_max_length','2020-03-29 11:34:02.916977'),(5,'auth','0003_alter_user_email_max_length','2020-03-29 11:34:02.922601'),(6,'auth','0004_alter_user_username_opts','2020-03-29 11:34:02.929851'),(7,'auth','0005_alter_user_last_login_null','2020-03-29 11:34:02.945128'),(8,'auth','0006_require_contenttypes_0002','2020-03-29 11:34:02.946670'),(9,'auth','0007_alter_validators_add_error_messages','2020-03-29 11:34:02.951954'),(10,'auth','0008_alter_user_username_max_length','2020-03-29 11:34:02.958413'),(11,'auth','0009_alter_user_last_name_max_length','2020-03-29 11:34:02.963715'),(12,'auth','0010_alter_group_name_max_length','2020-03-29 11:34:02.974119'),(13,'auth','0011_update_proxy_permissions','2020-03-29 11:34:02.980095'),(14,'gocasting','0001_initial','2020-03-29 11:34:03.128068'),(15,'admin','0001_initial','2020-03-29 11:34:03.372123'),(16,'admin','0002_logentry_remove_auto_add','2020-03-29 11:34:03.419468'),(17,'admin','0003_logentry_add_action_flag_choices','2020-03-29 11:34:03.433430'),(18,'sessions','0001_initial','2020-03-29 11:34:03.444876'),(19,'authtoken','0001_initial','2020-03-29 11:38:42.481357'),(20,'authtoken','0002_auto_20160226_1747','2020-03-29 11:38:42.639717'),(21,'gocasting','0002_auto_20200329_1219','2020-03-29 12:19:24.470658'),(22,'gocasting','0003_auto_20200329_1350','2020-03-29 13:50:44.836856'),(23,'gocasting','0004_auto_20200329_1355','2020-03-29 13:55:44.407991'),(24,'gocasting','0005_userinfo_weight','2020-03-29 14:04:14.400631'),(25,'gocasting','0006_auto_20200329_1418','2020-03-29 14:18:42.297196'),(26,'gocasting','0007_auto_20200329_1428','2020-03-29 14:28:33.970540'),(27,'gocasting','0008_educationhistory_workhistory','2020-03-30 06:59:27.294381'),(28,'gocasting','0009_auto_20200331_1223','2020-03-31 12:23:38.636213'),(29,'gocasting','0010_picturearea','2020-04-02 07:15:37.475594'),(30,'gocasting','0011_auto_20200402_1019','2020-04-02 10:19:46.548150'),(31,'gocasting','0012_auto_20200402_1033','2020-04-02 10:33:56.183049'),(32,'gocasting','0013_agentinfo','2020-04-02 16:41:23.424898'),(33,'gocasting','0014_auto_20200402_1812','2020-04-02 18:12:22.402471'),(34,'gocasting','0015_auto_20200402_1953','2020-04-02 19:54:03.672500');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('55qdk4ka0yla0gj1ncjrj1c7958uebkf','ZGJhMmEyOTkwM2VjYjk0MTU1YjU5Zjg0ZDIwNWVjM2UwODRkYzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzc4Yjk2Nzg4MWUzMmM2NGFhYmM1MGZmMDliOGVmYTU4NzIzMGU5YiJ9','2020-04-16 12:43:12.372801'),('5u0xe6kizlvss4n8a9qu9wrty0ogiork','ZGJhMmEyOTkwM2VjYjk0MTU1YjU5Zjg0ZDIwNWVjM2UwODRkYzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzc4Yjk2Nzg4MWUzMmM2NGFhYmM1MGZmMDliOGVmYTU4NzIzMGU5YiJ9','2020-04-16 20:23:12.673468'),('8pdr9c9vxnn2o5z6o10y4rvn58hfvmi3','ZGJhMmEyOTkwM2VjYjk0MTU1YjU5Zjg0ZDIwNWVjM2UwODRkYzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzc4Yjk2Nzg4MWUzMmM2NGFhYmM1MGZmMDliOGVmYTU4NzIzMGU5YiJ9','2020-04-16 13:05:53.389199'),('9whuhu17s42hk5u68qnj81af5lzwpo4d','YTA4MjdlMTZlYWFlY2ZhM2MyMWJjZDQ4NzA3N2NiYzNlZGRiODBjMjp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWQ0ZjRmYjJmODEzNGNmOGRmMmM1MmYwYzRkZmNmNTg2YWI3ODVlNyJ9','2020-05-28 14:39:59.114128'),('aj68vel357ibmy538incodeynmgvg0uo','OGE2ZTAzZWY0Zjc1NDI4MzljMWE1NGEzZDk1MDg2ZGM5MGJhMTAzNTp7Il9hdXRoX3VzZXJfaWQiOiI0MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMGUxMmI2YWQwYmMwYWZjMzExZjRiMGQ2NDU1NzBhZjg1YTYzMjhkYSJ9','2020-05-28 16:00:30.819823'),('egaht5p68wkvhwybwf71j8pxwln24vgs','NjVhYjdjMDRmMmQwODE5MzI1NTdlNDhlYmQxNTlhMzI1MGE4YzBhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYTYwNjE4YzZlNTYwOGVlYzZkNDllNWVmZWY4Mzk0MWUyNTViZDkzIn0=','2020-05-28 11:40:26.639113'),('fc8pg6ogrrb11uolmef734gdvd3vy2zd','OGE2ZTAzZWY0Zjc1NDI4MzljMWE1NGEzZDk1MDg2ZGM5MGJhMTAzNTp7Il9hdXRoX3VzZXJfaWQiOiI0MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMGUxMmI2YWQwYmMwYWZjMzExZjRiMGQ2NDU1NzBhZjg1YTYzMjhkYSJ9','2020-05-28 16:59:27.969809'),('gbiy56aotwl994qms8gcwlitk91liavk','YzM4OTJmODIwYmM3NjU5MzNiOTdiOWNiMjcwZGJkMDY4NDI3NWIzZDp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzMyZGQ0ZGNiZmIwMmFkZDJlMzRkMDMzYmM2ZGE3OTg5Nzc1OGIyMiJ9','2020-05-28 15:52:15.701127'),('hr7edoth6629eeguw4lyy02a6hud42r0','ZGJhMmEyOTkwM2VjYjk0MTU1YjU5Zjg0ZDIwNWVjM2UwODRkYzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzc4Yjk2Nzg4MWUzMmM2NGFhYmM1MGZmMDliOGVmYTU4NzIzMGU5YiJ9','2020-04-25 12:01:02.940986'),('i4ujv3z49qya2tz6rta1aaz9mmgdkgpj','ZGJhMmEyOTkwM2VjYjk0MTU1YjU5Zjg0ZDIwNWVjM2UwODRkYzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzc4Yjk2Nzg4MWUzMmM2NGFhYmM1MGZmMDliOGVmYTU4NzIzMGU5YiJ9','2020-04-16 13:04:20.133862'),('iltd5jhy0m7va94mxz2ic1dm0prpgbmy','YTA4MjdlMTZlYWFlY2ZhM2MyMWJjZDQ4NzA3N2NiYzNlZGRiODBjMjp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWQ0ZjRmYjJmODEzNGNmOGRmMmM1MmYwYzRkZmNmNTg2YWI3ODVlNyJ9','2020-05-28 14:51:10.197625'),('jw3zpvq5ulpg7ny519r20160jlnn596q','ZGJhMmEyOTkwM2VjYjk0MTU1YjU5Zjg0ZDIwNWVjM2UwODRkYzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzc4Yjk2Nzg4MWUzMmM2NGFhYmM1MGZmMDliOGVmYTU4NzIzMGU5YiJ9','2020-04-16 15:35:26.230199'),('lpnqsghd6hok04hxdpx9x434srg0omsx','ZGJhMmEyOTkwM2VjYjk0MTU1YjU5Zjg0ZDIwNWVjM2UwODRkYzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzc4Yjk2Nzg4MWUzMmM2NGFhYmM1MGZmMDliOGVmYTU4NzIzMGU5YiJ9','2020-04-16 20:19:25.124331'),('lusrcv6qlq19p3xlq4nutq0uqydj0ed7','ZGJhMmEyOTkwM2VjYjk0MTU1YjU5Zjg0ZDIwNWVjM2UwODRkYzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzc4Yjk2Nzg4MWUzMmM2NGFhYmM1MGZmMDliOGVmYTU4NzIzMGU5YiJ9','2020-04-16 12:41:39.139281'),('o3ulp3krdaiwyzippuu3zgkby2wl32d9','YzM4OTJmODIwYmM3NjU5MzNiOTdiOWNiMjcwZGJkMDY4NDI3NWIzZDp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzMyZGQ0ZGNiZmIwMmFkZDJlMzRkMDMzYmM2ZGE3OTg5Nzc1OGIyMiJ9','2020-05-28 16:59:42.615867'),('oxu8f7tdbk607fw74pvnvbi1thgjxgij','NDgxNjMwNDUxMWU0ZmRlYTc0NzEyMTcwMjBlZDIxNWEyYzA3YmJmMDp7Il9hdXRoX3VzZXJfaWQiOiIzMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGIyZTE2ZDRlY2E3YTBjNTk2NjYzNjVhMjQ2ODYyNTMyODAwNWVkNiJ9','2020-04-16 18:10:24.202148'),('py04ujj7ap444fg9mwq3oy7k6ynxyszo','YzM4OTJmODIwYmM3NjU5MzNiOTdiOWNiMjcwZGJkMDY4NDI3NWIzZDp7Il9hdXRoX3VzZXJfaWQiOiI0MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzMyZGQ0ZGNiZmIwMmFkZDJlMzRkMDMzYmM2ZGE3OTg5Nzc1OGIyMiJ9','2020-05-28 16:02:57.058902'),('ti76sbsj14vnvyxzzecgdq7p2bwiwqmx','ZGJhMmEyOTkwM2VjYjk0MTU1YjU5Zjg0ZDIwNWVjM2UwODRkYzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzc4Yjk2Nzg4MWUzMmM2NGFhYmM1MGZmMDliOGVmYTU4NzIzMGU5YiJ9','2020-04-16 12:44:45.000579'),('vht1i9be88r6vn1dm3370eljgj6ueg0v','ZGJhMmEyOTkwM2VjYjk0MTU1YjU5Zjg0ZDIwNWVjM2UwODRkYzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzc4Yjk2Nzg4MWUzMmM2NGFhYmM1MGZmMDliOGVmYTU4NzIzMGU5YiJ9','2020-04-16 12:53:12.016769'),('wkagb10d5hmfy9ycdgqu11bi6gmbjn5e','NjVhYjdjMDRmMmQwODE5MzI1NTdlNDhlYmQxNTlhMzI1MGE4YzBhNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYTYwNjE4YzZlNTYwOGVlYzZkNDllNWVmZWY4Mzk0MWUyNTViZDkzIn0=','2020-04-12 12:21:21.193167'),('wxzc356muir24yqpm13ut7o4l16n9ohz','ZGJhMmEyOTkwM2VjYjk0MTU1YjU5Zjg0ZDIwNWVjM2UwODRkYzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzc4Yjk2Nzg4MWUzMmM2NGFhYmM1MGZmMDliOGVmYTU4NzIzMGU5YiJ9','2020-04-16 15:35:41.908358'),('xmfbhd73byj90xqxsfpidw3s2w7puf4e','ZGJhMmEyOTkwM2VjYjk0MTU1YjU5Zjg0ZDIwNWVjM2UwODRkYzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzc4Yjk2Nzg4MWUzMmM2NGFhYmM1MGZmMDliOGVmYTU4NzIzMGU5YiJ9','2020-04-16 12:42:11.309492'),('xoig7y1evdp4zh0xp0harvex0b7h8k7p','ZGJhMmEyOTkwM2VjYjk0MTU1YjU5Zjg0ZDIwNWVjM2UwODRkYzI0YTp7Il9hdXRoX3VzZXJfaWQiOiIyOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzc4Yjk2Nzg4MWUzMmM2NGFhYmM1MGZmMDliOGVmYTU4NzIzMGU5YiJ9','2020-04-16 12:42:34.963361');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_additionalskill`
--

DROP TABLE IF EXISTS `gocasting_additionalskill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_additionalskill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_additionalskill`
--

LOCK TABLES `gocasting_additionalskill` WRITE;
/*!40000 ALTER TABLE `gocasting_additionalskill` DISABLE KEYS */;
INSERT INTO `gocasting_additionalskill` VALUES (1,'swimming'),(2,'martial arts'),(3,'singing');
/*!40000 ALTER TABLE `gocasting_additionalskill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_agentinfo`
--

DROP TABLE IF EXISTS `gocasting_agentinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_agentinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(15) NOT NULL,
  `user_id` int(11) NOT NULL,
  `balance` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `gocasting_agentinfo_user_id_3fbd2468_fk_gocasting_user_id` FOREIGN KEY (`user_id`) REFERENCES `gocasting_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_agentinfo`
--

LOCK TABLES `gocasting_agentinfo` WRITE;
/*!40000 ALTER TABLE `gocasting_agentinfo` DISABLE KEYS */;
INSERT INTO `gocasting_agentinfo` VALUES (2,'0923427836',32,800),(7,'0923427837',40,0);
/*!40000 ALTER TABLE `gocasting_agentinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_agentmodel`
--

DROP TABLE IF EXISTS `gocasting_agentmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_agentmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revealed_at` datetime(6) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `cast_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gocasting_agentmodel_agent_id_a6f21f15_fk_gocasting_user_id` (`agent_id`),
  KEY `gocasting_agentmodel_cast_id_32de0cce_fk_gocasting_user_id` (`cast_id`),
  CONSTRAINT `gocasting_agentmodel_agent_id_a6f21f15_fk_gocasting_user_id` FOREIGN KEY (`agent_id`) REFERENCES `gocasting_user` (`id`),
  CONSTRAINT `gocasting_agentmodel_cast_id_32de0cce_fk_gocasting_user_id` FOREIGN KEY (`cast_id`) REFERENCES `gocasting_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_agentmodel`
--

LOCK TABLES `gocasting_agentmodel` WRITE;
/*!40000 ALTER TABLE `gocasting_agentmodel` DISABLE KEYS */;
INSERT INTO `gocasting_agentmodel` VALUES (5,'2020-04-02 19:55:39.750830',32,24),(6,'2020-04-02 19:56:36.549642',32,21);
/*!40000 ALTER TABLE `gocasting_agentmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_castinfo`
--

DROP TABLE IF EXISTS `gocasting_castinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_castinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `height` double NOT NULL,
  `weight` double NOT NULL,
  `gender` varchar(10) NOT NULL,
  `profile_picture` varchar(150) NOT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `instagram` varchar(200) DEFAULT NULL,
  `twitter` varchar(200) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `gocasting_castinfo_city_id_c1dfd3f3_fk_gocasting_city_id` (`city_id`),
  KEY `gocasting_castinfo_region_id_74e6b51f_fk_gocasting_region_id` (`region_id`),
  CONSTRAINT `gocasting_castinfo_city_id_c1dfd3f3_fk_gocasting_city_id` FOREIGN KEY (`city_id`) REFERENCES `gocasting_city` (`id`),
  CONSTRAINT `gocasting_castinfo_region_id_74e6b51f_fk_gocasting_region_id` FOREIGN KEY (`region_id`) REFERENCES `gocasting_region` (`id`),
  CONSTRAINT `gocasting_castinfo_user_id_15df9982_fk_gocasting_user_id` FOREIGN KEY (`user_id`) REFERENCES `gocasting_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_castinfo`
--

LOCK TABLES `gocasting_castinfo` WRITE;
/*!40000 ALTER TABLE `gocasting_castinfo` DISABLE KEYS */;
INSERT INTO `gocasting_castinfo` VALUES (2,1.75,50,'female','profiles/2020-03-29_18.07.37.jpg',NULL,NULL,NULL,'+251923427836',1,1,3,'2020-04-02'),(3,1.75,65,'female','profiles/2020-03-29_18.09.39.jpg',NULL,NULL,NULL,'+251923427836',1,1,4,'2020-04-02'),(4,1.75,60,'female','profiles/2020-03-29_18.30.27.jpg',NULL,NULL,NULL,'+251923427836',2,2,5,'2020-04-02'),(5,1.68,60,'female','profiles/hibo.jpg',NULL,NULL,NULL,'+251923427836',1,1,6,'2020-04-02'),(6,1.65,60,'female','profiles/2020-03-29_18.17.42.jpg',NULL,NULL,NULL,'+251923427836',2,2,7,'2020-04-02'),(7,1.6,55,'female','profiles/2020-03-29_18.20.17.jpg',NULL,NULL,NULL,'+251923427836',1,1,8,'2020-04-02'),(8,1.69,65,'female','profiles/2020-03-29_18.24.50.jpg',NULL,NULL,NULL,'+251923427836',1,1,9,'2020-04-02'),(9,1.64,52,'female','profiles/55807400_130584818068077_6957275011480551424_n.jpg','https://facebook.com/gochereta/','https://instagram.com/injera_','https://twitter.com/hiwiguta/','+25192541873',1,1,10,'2020-04-02'),(10,1.8,65,'female','profiles/2020-03-29_18.34.18.jpg',NULL,NULL,NULL,'+251923427836',1,1,11,'2020-04-02'),(13,1.64,52,'female','profiles/2020-03-30_21.12.39.jpg',NULL,NULL,NULL,'+251923427836',1,1,14,'2020-04-02'),(14,1.67,64,'female','profiles/2020-03-30_21.17.09.jpg',NULL,NULL,NULL,'+251923427836',1,1,15,'2020-04-02'),(15,1.7,59,'male','profiles/2020-03-30_21.24.04.jpg',NULL,NULL,NULL,'+251923427836',1,1,16,'2020-04-02'),(16,1.87,79,'male','profiles/2020-03-30_21.26.29.jpg',NULL,NULL,NULL,'+251923427836',1,1,17,'2020-04-02'),(17,1.67,56,'female','profiles/2020-03-31_13.19.50.jpg',NULL,NULL,NULL,'+25192541873',1,1,18,'2020-04-02'),(18,1.91,80,'male','profiles/83264694_501479564083125_5684574113157637722_n.jpg',NULL,NULL,NULL,'+251923427836',1,1,19,'2020-04-02'),(19,1.73,55,'female','profiles/91569297_612553482924653_1955795761024631047_n.jpg',NULL,NULL,NULL,'+251923427836',1,1,20,'2020-04-02'),(20,1.7,82,'female','profiles/90091354_109097343887758_5496984271250141897_n.jpg',NULL,NULL,NULL,'+251923427836',1,1,21,'2020-04-02'),(21,1.7,60,'female','profiles/2020-03-31_13.32.09.jpg',NULL,NULL,NULL,'+251923427836',1,1,22,'2020-04-02'),(22,1.67,57,'female','profiles/2020-03-31_13.34.56.jpg',NULL,NULL,NULL,'+251923427836',1,1,23,'2020-04-02'),(23,1.87,87,'male','profiles/2020-03-31_13.39.38.jpg',NULL,NULL,NULL,'+251923427836',1,1,24,'2020-04-02');
/*!40000 ALTER TABLE `gocasting_castinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_castinfo_additional_skills`
--

DROP TABLE IF EXISTS `gocasting_castinfo_additional_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_castinfo_additional_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `castinfo_id` int(11) NOT NULL,
  `additionalskill_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gocasting_castinfo_addit_castinfo_id_additionalsk_4cd9f123_uniq` (`castinfo_id`,`additionalskill_id`),
  KEY `gocasting_castinfo_a_additionalskill_id_ead4ebdd_fk_gocasting` (`additionalskill_id`),
  CONSTRAINT `gocasting_castinfo_a_additionalskill_id_ead4ebdd_fk_gocasting` FOREIGN KEY (`additionalskill_id`) REFERENCES `gocasting_additionalskill` (`id`),
  CONSTRAINT `gocasting_castinfo_a_castinfo_id_3340d74c_fk_gocasting` FOREIGN KEY (`castinfo_id`) REFERENCES `gocasting_castinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_castinfo_additional_skills`
--

LOCK TABLES `gocasting_castinfo_additional_skills` WRITE;
/*!40000 ALTER TABLE `gocasting_castinfo_additional_skills` DISABLE KEYS */;
INSERT INTO `gocasting_castinfo_additional_skills` VALUES (4,2,3),(5,3,3),(6,4,3),(7,5,2),(8,6,3),(9,7,3),(10,8,3),(11,9,3),(12,10,1),(17,13,1),(18,13,2),(19,13,3),(20,14,1),(21,14,2),(22,14,3),(23,15,1),(24,15,2),(25,15,3),(26,16,2),(27,16,3),(28,17,1),(29,17,2),(30,17,3),(31,18,1),(32,18,2),(33,18,3),(34,19,1),(35,19,2),(36,19,3),(37,20,3),(38,21,1),(39,21,2),(40,21,3),(41,22,2),(42,22,3),(43,23,1),(44,23,2),(45,23,3);
/*!40000 ALTER TABLE `gocasting_castinfo_additional_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_castinfo_intersted_in`
--

DROP TABLE IF EXISTS `gocasting_castinfo_intersted_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_castinfo_intersted_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `castinfo_id` int(11) NOT NULL,
  `interesttag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gocasting_castinfo_inter_castinfo_id_interesttag__b49e354d_uniq` (`castinfo_id`,`interesttag_id`),
  KEY `gocasting_castinfo_i_interesttag_id_e27c0c20_fk_gocasting` (`interesttag_id`),
  CONSTRAINT `gocasting_castinfo_i_castinfo_id_e4e31ec0_fk_gocasting` FOREIGN KEY (`castinfo_id`) REFERENCES `gocasting_castinfo` (`id`),
  CONSTRAINT `gocasting_castinfo_i_interesttag_id_e27c0c20_fk_gocasting` FOREIGN KEY (`interesttag_id`) REFERENCES `gocasting_interesttag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_castinfo_intersted_in`
--

LOCK TABLES `gocasting_castinfo_intersted_in` WRITE;
/*!40000 ALTER TABLE `gocasting_castinfo_intersted_in` DISABLE KEYS */;
INSERT INTO `gocasting_castinfo_intersted_in` VALUES (2,2,1),(3,2,2),(4,3,2),(5,4,2),(6,5,2),(7,6,1),(8,6,2),(9,7,2),(10,8,2),(22,9,1),(11,9,2),(23,9,3),(24,9,4),(25,9,5),(26,9,6),(27,9,7),(28,9,8),(12,10,2),(29,13,1),(30,13,2),(31,13,3),(32,13,4),(33,13,7),(34,14,2),(35,14,3),(36,14,4),(37,14,5),(38,14,7),(39,14,8),(40,15,2),(41,15,3),(42,15,4),(43,16,1),(44,16,2),(45,16,3),(46,16,4),(47,16,5),(48,16,6),(49,16,7),(50,16,8),(52,17,3),(53,17,4),(54,17,6),(51,17,8),(55,18,1),(56,18,2),(57,18,3),(58,18,4),(59,18,5),(60,18,6),(61,18,7),(62,18,8),(63,19,1),(64,19,2),(65,19,4),(66,19,6),(67,19,7),(68,20,1),(69,20,3),(70,20,5),(71,20,7),(73,21,2),(74,21,5),(75,21,6),(72,21,8),(77,22,2),(78,22,4),(79,22,6),(76,22,8),(80,23,1),(81,23,2),(82,23,4),(83,23,6),(84,23,7);
/*!40000 ALTER TABLE `gocasting_castinfo_intersted_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_castinfo_languages`
--

DROP TABLE IF EXISTS `gocasting_castinfo_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_castinfo_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `castinfo_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gocasting_castinfo_langu_castinfo_id_language_id_e3d7ddc9_uniq` (`castinfo_id`,`language_id`),
  KEY `gocasting_castinfo_l_language_id_550ae821_fk_gocasting` (`language_id`),
  CONSTRAINT `gocasting_castinfo_l_castinfo_id_8e8f0270_fk_gocasting` FOREIGN KEY (`castinfo_id`) REFERENCES `gocasting_castinfo` (`id`),
  CONSTRAINT `gocasting_castinfo_l_language_id_550ae821_fk_gocasting` FOREIGN KEY (`language_id`) REFERENCES `gocasting_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_castinfo_languages`
--

LOCK TABLES `gocasting_castinfo_languages` WRITE;
/*!40000 ALTER TABLE `gocasting_castinfo_languages` DISABLE KEYS */;
INSERT INTO `gocasting_castinfo_languages` VALUES (3,2,1),(4,2,2),(5,3,1),(6,4,1),(7,4,2),(8,5,1),(9,5,2),(10,5,3),(11,6,1),(12,6,2),(13,7,1),(14,7,2),(15,8,1),(16,9,1),(17,9,2),(18,10,2),(21,13,1),(22,13,2),(23,14,1),(24,14,2),(25,15,1),(26,16,1),(27,17,1),(28,17,2),(29,18,1),(30,18,2),(31,19,1),(32,19,2),(33,20,1),(34,20,2),(35,20,4),(36,21,1),(37,21,2),(38,21,3),(39,21,4),(40,22,1),(41,23,1),(42,23,2);
/*!40000 ALTER TABLE `gocasting_castinfo_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_city`
--

DROP TABLE IF EXISTS `gocasting_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gocasting_city_region_id_5a034ee1_fk_gocasting_region_id` (`region_id`),
  CONSTRAINT `gocasting_city_region_id_5a034ee1_fk_gocasting_region_id` FOREIGN KEY (`region_id`) REFERENCES `gocasting_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_city`
--

LOCK TABLES `gocasting_city` WRITE;
/*!40000 ALTER TABLE `gocasting_city` DISABLE KEYS */;
INSERT INTO `gocasting_city` VALUES (1,'Addis Ababa',1),(2,'Bahir Dar',2);
/*!40000 ALTER TABLE `gocasting_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_educationhistory`
--

DROP TABLE IF EXISTS `gocasting_educationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_educationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(130) NOT NULL,
  `school` varchar(130) NOT NULL,
  `start_year` int(11) NOT NULL,
  `end_year` int(11) DEFAULT NULL,
  `description` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gocasting_educationhistory_user_id_c969cb0e_fk_gocasting_user_id` (`user_id`),
  CONSTRAINT `gocasting_educationhistory_user_id_c969cb0e_fk_gocasting_user_id` FOREIGN KEY (`user_id`) REFERENCES `gocasting_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_educationhistory`
--

LOCK TABLES `gocasting_educationhistory` WRITE;
/*!40000 ALTER TABLE `gocasting_educationhistory` DISABLE KEYS */;
INSERT INTO `gocasting_educationhistory` VALUES (2,'Art Director','Facebook Inc',2012,NULL,'Expenses as material breeding insisted building to in. Continual so distrusts pronounce by unwilling listening. Thing do taste on we manor.',10),(3,'Economics','40 Mench University',2020,NULL,'',10);
/*!40000 ALTER TABLE `gocasting_educationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_interesttag`
--

DROP TABLE IF EXISTS `gocasting_interesttag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_interesttag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_interesttag`
--

LOCK TABLES `gocasting_interesttag` WRITE;
/*!40000 ALTER TABLE `gocasting_interesttag` DISABLE KEYS */;
INSERT INTO `gocasting_interesttag` VALUES (1,'Acting'),(2,'Modelling'),(3,'Short Films'),(4,'Tv Commercials'),(5,'Tv Series'),(6,'Drama'),(7,'Social Media Commercials'),(8,'Runway');
/*!40000 ALTER TABLE `gocasting_interesttag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_language`
--

DROP TABLE IF EXISTS `gocasting_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_language`
--

LOCK TABLES `gocasting_language` WRITE;
/*!40000 ALTER TABLE `gocasting_language` DISABLE KEYS */;
INSERT INTO `gocasting_language` VALUES (1,'Amharic'),(2,'English'),(3,'Arabic'),(4,'Tigrai');
/*!40000 ALTER TABLE `gocasting_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_photogallery`
--

DROP TABLE IF EXISTS `gocasting_photogallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_photogallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gocasting_photogallery_user_id_4dd7354e_fk_gocasting_user_id` (`user_id`),
  CONSTRAINT `gocasting_photogallery_user_id_4dd7354e_fk_gocasting_user_id` FOREIGN KEY (`user_id`) REFERENCES `gocasting_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_photogallery`
--

LOCK TABLES `gocasting_photogallery` WRITE;
/*!40000 ALTER TABLE `gocasting_photogallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `gocasting_photogallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_picturearea`
--

DROP TABLE IF EXISTS `gocasting_picturearea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_picturearea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_picturearea`
--

LOCK TABLES `gocasting_picturearea` WRITE;
/*!40000 ALTER TABLE `gocasting_picturearea` DISABLE KEYS */;
INSERT INTO `gocasting_picturearea` VALUES (1,'profiles/2020-03-29_18.24.50_WMtg8Y7.jpg'),(2,'profiles/2020-03-29_15.36.57_CgdgNr4.jpg'),(3,'profiles/2020-03-29_15.36.57_C7u0VNk.jpg'),(4,'profiles/2020-03-29_18.11.10_dpW1r09.jpg'),(5,'profiles/2020-03-29_18.27.54_z53TS85.jpg'),(6,'profiles/2020-03-29_18.07.37_XLaoGUV.jpg'),(7,'profiles/2020-03-29_18.27.54_XhwroIB.jpg'),(8,'profiles/2020-03-29_18.30.27_FfWqJaW.jpg'),(9,'profiles/2020-03-29_18.20.17_CAUdveM.jpg'),(10,'profiles/2020-03-29_18.24.50_bbn6tHQ.jpg'),(11,'profiles/2020-03-29_18.27.54_M4lx0oe.jpg'),(12,'profiles/2020-03-29_18.07.37_5caxxbg.jpg'),(13,'profiles/2020-04-02_11.03.17.jpg'),(14,'profiles/2020-04-02_11.03.26.jpg'),(15,'profiles/2020-04-02_11.03.09.jpg'),(16,'profiles/2020-04-02_11.03.15.jpg'),(17,'profiles/2020-04-02_11.03.27.jpg'),(18,'profiles/2020-03-29_18.17.42_DB54wnb.jpg'),(19,'profiles/2020-03-26_15.14.09.jpg'),(20,'profiles/2020-03-29_15.36.57_7dnyy6A.jpg'),(21,'profiles/2020-03-29_18.27.54_yo1Rb3w.jpg'),(22,'profiles/2020-03-29_18.09.39_MGTXnZ9.jpg'),(23,'profiles/2020-03-29_15.36.57_Cu1IrMR.jpg'),(24,'profiles/2020-03-29_18.09.39_ukkHGxA.jpg'),(25,'profiles/2020-03-29_18.09.39_MbPIozs.jpg'),(26,'profiles/2020-03-29_15.47.21.mp4'),(27,'profiles/2020-03-29_18.24.50_qVtNhjf.jpg'),(28,'profiles/2020-03-29_18.07.37_OxLo4Q8.jpg'),(29,'profiles/2020-03-26_15.13.56.jpg'),(30,'profiles/2020-03-26_15.14.09_0lyrtEO.jpg'),(31,'profiles/2020-03-29_17.23.43_S0cXnW3.jpg'),(32,'profiles/2020-03-29_18.09.39_m0DuFCG.jpg'),(33,'profiles/2020-03-29_18.09.39_5waR5zA.jpg'),(34,'profiles/2020-03-29_18.07.37_PHeW7wo.jpg'),(35,'profiles/2020-03-29_18.09.39_grOKcvt.jpg'),(36,'profiles/2020-04-02_14.10.42.jpg'),(37,'profiles/2020-04-02_14.10.42_AI9R0DU.jpg'),(38,'profiles/2020-05-11_19.05.31.jpg'),(39,'profiles/2020-04-09_19.40.54.jpg'),(40,'profiles/2020-05-11_19.05.31_mcZ1Zjv.jpg'),(41,'profiles/2020-05-11_19.05.31_wolbCpE.jpg'),(42,'profiles/2020-05-11_19.05.31_l6PCo9y.jpg'),(43,'profiles/2020-05-11_19.05.31_eSi3zGC.jpg'),(44,'profiles/2020-05-11_19.05.31_Nmr9QQH.jpg'),(45,'profiles/2020-05-11_19.05.31_98rqzn6.jpg'),(46,'profiles/2020-05-11_19.05.31_y78rqti.jpg'),(47,'profiles/2020-05-11_19.05.31_w79vlAE.jpg'),(48,'profiles/2020-05-11_19.05.31_O3th6Ji.jpg'),(49,'profiles/2020-05-11_19.05.31_gObMpQo.jpg'),(50,'profiles/2020-05-11_19.05.31_bzWYo4W.jpg'),(51,'profiles/2020-05-11_19.05.31_7R9Tp1p.jpg'),(52,'profiles/2020-05-11_19.05.31_Jjw7qmy.jpg'),(53,'profiles/2020-05-11_19.05.31_TRFrcsr.jpg'),(54,'profiles/2020-05-13_19.40.16.jpg'),(55,'profiles/2020-05-13_22.01.06.jpg'),(56,'profiles/2020-05-13_22.01.06_acG5QcQ.jpg'),(57,'profiles/2020-05-11_19.05.31_PwG97LZ.jpg'),(58,'profiles/_09A7990.JPG'),(59,'profiles/_09A7982.JPG'),(60,'profiles/_DSC3292.JPG'),(61,'profiles/_DSC3292_nYVPGHr.JPG'),(62,'profiles/_09A7982_6ykIGMv.JPG'),(63,'profiles/_09A7974.JPG'),(64,'profiles/_09A7995.JPG'),(65,'profiles/_09A7976.JPG');
/*!40000 ALTER TABLE `gocasting_picturearea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_region`
--

DROP TABLE IF EXISTS `gocasting_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_region`
--

LOCK TABLES `gocasting_region` WRITE;
/*!40000 ALTER TABLE `gocasting_region` DISABLE KEYS */;
INSERT INTO `gocasting_region` VALUES (1,'Addis Ababa'),(2,'Amhara');
/*!40000 ALTER TABLE `gocasting_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_user`
--

DROP TABLE IF EXISTS `gocasting_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_user`
--

LOCK TABLES `gocasting_user` WRITE;
/*!40000 ALTER TABLE `gocasting_user` DISABLE KEYS */;
INSERT INTO `gocasting_user` VALUES (1,'pbkdf2_sha256$150000$aftNXk3pDDfl$c5PYeDUQZK/CCETph6ynRYRbMgKZvtovuQ89pt2oqNk=','2020-05-14 11:40:26.636771',1,'admin','','',1,1,'2020-03-29 12:20:36.690676','admin@gmail.com'),(3,'pbkdf2_sha256$150000$UwqCIVneK0aP$s5VJFC3wMdYocUHt0ugn/vARlF3Jqe1JGrBj/buItcQ=',NULL,0,'amen','Amen','Daniel',0,1,'2020-03-29 15:08:34.000000','amen@gmail.com'),(4,'pbkdf2_sha256$150000$2zDXIoH6FRaF$1w5gMVAtD+Xw30uxvziyiBsELEe51eYQPH82bFZqWqc=',NULL,0,'feven','Feven','Kebede',0,1,'2020-03-29 15:10:36.000000','feven@gmail.com'),(5,'pbkdf2_sha256$150000$qvtWLHymOS7T$NgMHJU9j/n9HZu5M9kB5LWCCO/7ILFmdFEXCFapIQ3Q=',NULL,0,'mieraf','Mieraf','Amdemichael',0,1,'2020-03-29 15:11:48.000000','mieraf@gmail.com'),(6,'pbkdf2_sha256$150000$qZMY20ikBAjm$321nX+EKEib+AGG4+OOq+KHxtMZgRZ48KiKyGYttENA=',NULL,0,'hibaq','Hibaq','ibrahim',0,1,'2020-03-29 15:16:50.000000',''),(7,'pbkdf2_sha256$150000$GschLwGi3B4l$zOOF8hpSShYgVlQY0BlScm/fq9HEHrOcO1eIWGpQmWY=',NULL,0,'betty','Betelhem','Admasu',0,1,'2020-03-29 15:18:20.000000',''),(8,'pbkdf2_sha256$150000$bE03JYAdgDat$aXLoVrKyOTazBUIcLfvIUTSaHWJswEf2tsBQoq8ae/g=',NULL,0,'bestelot','Bestelot','Endeshaw',0,1,'2020-03-29 15:20:59.000000',''),(9,'pbkdf2_sha256$150000$X5mbyPcw1Zkr$Odzp99ZE/Xxte251y93AFhSSnxjdu8ayS3LsY9rgYD8=',NULL,0,'jerry','Jerusalem','Eshetu',0,1,'2020-03-29 15:25:22.000000',''),(10,'pbkdf2_sha256$150000$86XnqAkwv2Vj$HfFHwIO2l4KssY9YNQDxyAdXbjP6fuDkCOf/lXE6WT4=',NULL,0,'johan','Johan','seyoum',0,1,'2020-03-29 15:28:58.000000',''),(11,'pbkdf2_sha256$150000$ZsUOA3gyZKBP$auoc/fonaVIVo0gzH6IvB4adjRYhz5VuKNYiZgeMFjg=',NULL,0,'mahder','Mahder','Fisseha',0,1,'2020-03-29 15:35:03.000000',''),(14,'pbkdf2_sha256$150000$mHmepobjueNR$UQGmhBKRXlS+8+99DKd3VzSJz1lgsSbaHHsQ8QbkcMY=',NULL,0,'yeab','Fatally','Attractive',0,1,'2020-03-30 18:13:48.000000',''),(15,'pbkdf2_sha256$150000$BJiu6NehkoJU$e5MmaMq88ySGyoAc+erfsJ5pw96/DzxVQtOtBTH9YeQ=',NULL,0,'danayit','Danawit','Mekbeb',0,1,'2020-03-30 18:17:54.000000',''),(16,'pbkdf2_sha256$150000$X4mnEHypG2PQ$V3dSwJ5tMWRNd53/mWAIFmKY1Ei9nWRiDLrGx8EKTmg=',NULL,0,'abel','Amanuel','Agegnehu',0,1,'2020-03-30 18:24:49.000000',''),(17,'pbkdf2_sha256$150000$AJm8yejBpL9y$c0sP0rvg4rF5IN7jQsfLkdFNgFtDyWPkTUmR+TSNwbQ=',NULL,0,'ledetu','Ledetu','Berhanu',0,1,'2020-03-30 18:27:11.000000',''),(18,'pbkdf2_sha256$150000$WY8toNZsbks8$8wRMpg8F4JZuVDiGjHs/drz9Hj0sa5Zrsd2G/G3jynw=',NULL,0,'bamlak','Bamlak','Alemayehu',0,1,'2020-03-31 10:20:30.000000',''),(19,'pbkdf2_sha256$150000$13iTYKPnmzNP$J51V/KixAZP9VoVA3sbMdqEhrgqomWP0g8eBihc8n9Y=',NULL,0,'joeethio','Yohannes','Asfaw',0,1,'2020-03-31 10:22:06.000000',''),(20,'pbkdf2_sha256$150000$rtS1qUKR5zc3$6bgGDMyWJtseivfSQlAl1e/a5j4Sv+MDlySqMXetBjE=',NULL,0,'kidst','Kidst','Girum',0,1,'2020-03-31 10:25:06.000000',''),(21,'pbkdf2_sha256$150000$gabw7hYk89mq$5ExcOV/9DbjfvqDp9U/TaZxR9snhp1IfLLt4ZfaGN1w=',NULL,0,'rahel','Rahel','Haile',0,1,'2020-03-31 10:27:11.000000',''),(22,'pbkdf2_sha256$150000$UAwSpVxISaRO$+rJX/Bi8iuB4FEnZRT6Zh9ynGPIBf0dJgf/Nxb+vDWA=',NULL,0,'bettys','Betelhem','Sisay',0,1,'2020-03-31 10:32:53.000000',''),(23,'pbkdf2_sha256$150000$EkNkcjljK5St$/ep0hTs73ryrBJXqtHOweW+WOedqCD3+kJ+swPWUZGk=',NULL,0,'nishan','Nishan','',0,1,'2020-03-31 10:35:41.000000',''),(24,'pbkdf2_sha256$150000$nXqN2XqJpm3Q$ROXa9Lk77LKKRP3CgH8pN/z4jxkkRwL1g/xUwj8Bv9A=',NULL,0,'messay','Messay','Girma',0,1,'2020-03-31 10:40:29.000000',''),(32,'pbkdf2_sha256$150000$taSXPBquaBGN$8V03OTyW5BpnGSOlx6j4cP7824vhU5C/aLZU1l1ce/I=','2020-04-02 18:10:24.195503',0,'mktaborns','Tabor','Shfieraw',0,1,'2020-04-02 16:45:32.075373','shiferawtabor@gmail.com'),(40,'pbkdf2_sha256$150000$iEPAtvf8BJtC$/s5dO9aLUhkzpFpmSMgloq84sdjankY5SVlItTTHj3w=','2020-05-14 16:59:42.608673',0,'booker','Model','Booker',0,1,'2020-05-14 15:52:06.891340','bookermodel@gmail.com');
/*!40000 ALTER TABLE `gocasting_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_user_groups`
--

DROP TABLE IF EXISTS `gocasting_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gocasting_user_groups_user_id_group_id_54bbbadd_uniq` (`user_id`,`group_id`),
  KEY `gocasting_user_groups_group_id_24ac8ede_fk_auth_group_id` (`group_id`),
  CONSTRAINT `gocasting_user_groups_group_id_24ac8ede_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `gocasting_user_groups_user_id_18ede1ed_fk_gocasting_user_id` FOREIGN KEY (`user_id`) REFERENCES `gocasting_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_user_groups`
--

LOCK TABLES `gocasting_user_groups` WRITE;
/*!40000 ALTER TABLE `gocasting_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `gocasting_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_user_user_permissions`
--

DROP TABLE IF EXISTS `gocasting_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gocasting_user_user_perm_user_id_permission_id_75d93c14_uniq` (`user_id`,`permission_id`),
  KEY `gocasting_user_user__permission_id_70e7b2c4_fk_auth_perm` (`permission_id`),
  CONSTRAINT `gocasting_user_user__permission_id_70e7b2c4_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `gocasting_user_user__user_id_c12e48cf_fk_gocasting` FOREIGN KEY (`user_id`) REFERENCES `gocasting_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_user_user_permissions`
--

LOCK TABLES `gocasting_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `gocasting_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `gocasting_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_videogallery`
--

DROP TABLE IF EXISTS `gocasting_videogallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_videogallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gocasting_videogallery_user_id_ec0a64c1_fk_gocasting_user_id` (`user_id`),
  CONSTRAINT `gocasting_videogallery_user_id_ec0a64c1_fk_gocasting_user_id` FOREIGN KEY (`user_id`) REFERENCES `gocasting_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_videogallery`
--

LOCK TABLES `gocasting_videogallery` WRITE;
/*!40000 ALTER TABLE `gocasting_videogallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `gocasting_videogallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gocasting_workhistory`
--

DROP TABLE IF EXISTS `gocasting_workhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gocasting_workhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(130) NOT NULL,
  `company` varchar(130) NOT NULL,
  `start_year` int(11) NOT NULL,
  `end_year` int(11) DEFAULT NULL,
  `description` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gocasting_workhistory_user_id_97409d5e_fk_gocasting_user_id` (`user_id`),
  CONSTRAINT `gocasting_workhistory_user_id_97409d5e_fk_gocasting_user_id` FOREIGN KEY (`user_id`) REFERENCES `gocasting_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gocasting_workhistory`
--

LOCK TABLES `gocasting_workhistory` WRITE;
/*!40000 ALTER TABLE `gocasting_workhistory` DISABLE KEYS */;
INSERT INTO `gocasting_workhistory` VALUES (4,'Senior Designer','Google',2018,NULL,'So insisted received is occasion advanced honoured. Among ready to which up. Attacks smiling and may out assured moments man nothing outward.',10);
/*!40000 ALTER TABLE `gocasting_workhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-14 20:28:39
