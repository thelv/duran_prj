-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: duran_prod_4
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specialist_id` int(11) DEFAULT NULL,
  `title` text,
  `service_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `specialist_id` (`specialist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Москва'),(2,'Санкт-Петербург');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost`
--

DROP TABLE IF EXISTS `cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost` (
  `id` int(11) NOT NULL,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost`
--

LOCK TABLES `cost` WRITE;
/*!40000 ALTER TABLE `cost` DISABLE KEYS */;
INSERT INTO `cost` VALUES (1,'для бомжей'),(2,'для норм'),(3,'для вип');
/*!40000 ALTER TABLE `cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dialog`
--

DROP TABLE IF EXISTS `dialog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dialog` (
  `user_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `last_message_id` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  UNIQUE KEY `user_id_2` (`user_id`,`partner_id`),
  KEY `user_id` (`user_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dialog`
--

LOCK TABLES `dialog` WRITE;
/*!40000 ALTER TABLE `dialog` DISABLE KEYS */;
INSERT INTO `dialog` VALUES (1,3,49,1396660195),(3,1,50,1396660195);
/*!40000 ALTER TABLE `dialog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experience` (
  `id` int(11) NOT NULL,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (1,'менее 1 года'),(2,'от 1 до 3 лет'),(3,'от 3 до 6 лет'),(4,'более 6 лет');
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_specialist`
--

DROP TABLE IF EXISTS `favorite_specialist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite_specialist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `specialist_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `specialist_id` (`specialist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_specialist`
--

LOCK TABLES `favorite_specialist` WRITE;
/*!40000 ALTER TABLE `favorite_specialist` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_specialist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portfolio_id` int(11) DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `random` text,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolio_id` (`portfolio_id`,`id`),
  KEY `album_id` (`album_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_insert_id` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `text` text,
  `user_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `direction` tinyint(1) DEFAULT NULL,
  `readed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`partner_id`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,1,1396655164,'Привет, это тест',1,3,1,1),(2,1,1396655164,'Привет, это тест',3,1,0,1),(3,2,1396655290,'еще',1,3,1,1),(4,2,1396655290,'еще',3,1,0,1),(5,3,1396655295,'запахало',1,3,1,1),(6,3,1396655295,'запахало',3,1,0,1),(7,4,1396655297,'кль',1,3,1,1),(8,4,1396655297,'кль',3,1,0,1),(9,5,1396655299,'куль',1,3,1,1),(10,5,1396655299,'куль',3,1,0,1),(11,6,1396655415,'jr',3,1,1,1),(12,6,1396655415,'jr',1,3,0,1),(13,7,1396655433,'ыва',3,1,1,1),(14,7,1396655433,'ыва',1,3,0,1),(15,8,1396655438,'работает',3,1,1,1),(16,8,1396655438,'работает',1,3,0,1),(17,9,1396655441,'заебок',3,1,1,1),(18,9,1396655441,'заебок',1,3,0,1),(19,10,1396655585,'круто Васька))',1,3,1,1),(20,10,1396655585,'круто Васька))',3,1,0,1),(21,11,1396655587,')',1,3,1,1),(22,11,1396655587,')',3,1,0,1),(23,12,1396655599,'Ну ок)',3,1,1,1),(24,12,1396655599,'Ну ок)',1,3,0,1),(25,13,1396655602,'тогда',3,1,1,1),(26,13,1396655602,'тогда',1,3,0,1),(27,14,1396655608,'а',3,1,1,1),(28,14,1396655608,'а',1,3,0,1),(29,15,1396655920,'kkkk',1,3,1,1),(30,15,1396655920,'kkkk',3,1,0,1),(31,16,1396656117,'sd',1,3,1,1),(32,16,1396656117,'sd',3,1,0,1),(33,17,1396656119,'dfg',1,3,1,1),(34,17,1396656119,'dfg',3,1,0,1),(35,18,1396656139,'sdf',1,3,1,1),(36,18,1396656139,'sdf',3,1,0,1),(37,19,1396656141,'rtrty',1,3,1,1),(38,19,1396656141,'rtrty',3,1,0,1),(39,20,1396656143,'ry45y45y',1,3,1,1),(40,20,1396656143,'ry45y45y',3,1,0,1),(41,21,1396656146,'kkk',1,3,1,1),(42,21,1396656146,'kkk',3,1,0,1),(43,22,1396656182,'4o5 45t45t45t45t',1,3,1,1),(44,22,1396656182,'4o5 45t45t45t45t',3,1,0,1),(45,23,1396656187,'tre teri tjeroitjeoir tert',1,3,1,1),(46,23,1396656187,'tre teri tjeroitjeoir tert',3,1,0,1),(47,24,1396657249,'kjj ij oi',1,3,1,1),(48,24,1396657249,'kjj ij oi',3,1,0,1),(49,25,1396660195,'оышв оыщшв оыщвш аоышв аыв',1,3,1,1),(50,25,1396660195,'оышв оыщшв оыщвш аоышв аыв',3,1,0,1);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`duran_prod`@`localhost`*/ /*!50003 trigger 
			`dialog_update_trigger`
		after insert on
			`message`
		for each row
			insert into dialog (user_id, partner_id, `time`, last_message_id) values (new.user_id, new.partner_id, new.`time`, new.id) on duplicate key update `time`=new.`time`, last_message_id=new.id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `message_insert`
--

DROP TABLE IF EXISTS `message_insert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_insert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) DEFAULT NULL,
  `text` text,
  `user_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `direction` tinyint(1) DEFAULT NULL,
  `readed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_insert`
--

LOCK TABLES `message_insert` WRITE;
/*!40000 ALTER TABLE `message_insert` DISABLE KEYS */;
INSERT INTO `message_insert` VALUES (1,1396655164,'Привет, это тест',1,3,1,1),(2,1396655290,'еще',1,3,1,1),(3,1396655295,'запахало',1,3,1,1),(4,1396655297,'кль',1,3,1,1),(5,1396655299,'куль',1,3,1,1),(6,1396655415,'jr',3,1,1,1),(7,1396655433,'ыва',3,1,1,1),(8,1396655438,'работает',3,1,1,1),(9,1396655441,'заебок',3,1,1,1),(10,1396655585,'круто Васька))',1,3,1,1),(11,1396655587,')',1,3,1,1),(12,1396655599,'Ну ок)',3,1,1,1),(13,1396655602,'тогда',3,1,1,1),(14,1396655608,'а',3,1,1,1),(15,1396655920,'kkkk',1,3,1,1),(16,1396656117,'sd',1,3,1,1),(17,1396656119,'dfg',1,3,1,1),(18,1396656139,'sdf',1,3,1,1),(19,1396656141,'rtrty',1,3,1,1),(20,1396656143,'ry45y45y',1,3,1,1),(21,1396656146,'kkk',1,3,1,1),(22,1396656182,'4o5 45t45t45t45t',1,3,1,1),(23,1396656187,'tre teri tjeroitjeoir tert',1,3,1,1),(24,1396657249,'kjj ij oi',1,3,1,1),(25,1396660195,'оышв оыщшв оыщвш аоышв аыв',1,3,1,1);
/*!40000 ALTER TABLE `message_insert` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`duran_prod`@`localhost`*/ /*!50003 trigger 
			`message_dublicate_trigger`
		after insert on
			`message_insert`
		for each row begin
			insert into message (id, message_insert_id, user_id, partner_id, `time`, direction, `text`, readed) values (null, new.id, new.user_id, new.partner_id, new.`time`, new.direction, new.`text`, new.readed);
			insert into message (id, message_insert_id, user_id, partner_id, `time`, direction, `text`, readed) values (null, new.id, new.partner_id, new.user_id, new.`time`, not new.direction, new.`text`, new.readed);
		end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`duran_prod`@`localhost`*/ /*!50003 trigger 
			`message_dublicate_update_trigger`
		after update on
			`message_insert`
		for each row 
			update message set readed=true where message_insert_id=old.id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `metro`
--

DROP TABLE IF EXISTS `metro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metro`
--

LOCK TABLES `metro` WRITE;
/*!40000 ALTER TABLE `metro` DISABLE KEYS */;
INSERT INTO `metro` VALUES (1,1,'Авиамоторная'),(2,1,'Автозаводская'),(3,1,'Академическая'),(4,1,'Александровский сад'),(5,1,'Алексеевская'),(6,1,'Алма-Атинская'),(7,1,'Алтуфьево'),(8,1,'Аннино'),(9,1,'Арбатская (Арбатско-Покровская линия)'),(10,1,'Арбатская (Филевская линия'),(11,1,'Аэропорт'),(12,1,'Бабушкинская'),(13,1,'Багратионовская'),(14,1,'Баррикадная'),(15,1,'Бауманская'),(16,1,'Беговая'),(17,1,'Белорусская'),(18,1,'Беляево'),(19,1,'Бибирево'),(20,1,'Библиотека имени Ленина'),(21,1,'Битцевский парк'),(22,1,'Борисовская'),(23,1,'Боровицкая'),(24,1,'Ботанический сад'),(25,1,'Братиславская'),(26,1,'Бульвар адмирала Ушакова'),(27,1,'Бульвар Дмитрия Донского'),(28,1,'Бунинская аллея'),(29,1,'Варшавская'),(30,1,'ВДНХ'),(31,1,'Владыкино'),(32,1,'Водный стадион'),(33,1,'Войковская'),(34,1,'Волгоградский проспект'),(35,1,'Волжская'),(36,1,'Волоколамская'),(37,1,'Воробьевы горы'),(38,1,'Выставочная'),(39,1,'Выхино'),(40,1,'Деловой центр'),(41,1,'Динамо'),(42,1,'Дмитровская'),(43,1,'Добрынинская'),(44,1,'Домодедовская'),(45,1,'Достоевская'),(46,1,'Дубровка'),(47,1,'Жулебино'),(48,1,'Зябликово'),(49,1,'Измайловская'),(50,1,'Калужская'),(51,1,'Кантемировская'),(52,1,'Каховская'),(53,1,'Каширская'),(54,1,'Киевская'),(55,1,'Китай-город'),(56,1,'Кожуховская'),(57,1,'Коломенская'),(58,1,'Комсомольская'),(59,1,'Коньково'),(60,1,'Красногвардейская'),(61,1,'Краснопресненская'),(62,1,'Красносельская'),(63,1,'Красные ворота'),(64,1,'Крестьянская застава'),(65,1,'Кропоткинская'),(66,1,'Крылатское'),(67,1,'Кузнецкий мост'),(68,1,'Кузьминки'),(69,1,'Кунцевская'),(70,1,'Курская'),(71,1,'Кутузовская'),(72,1,'Ленинский проспект'),(73,1,'Лубянка'),(74,1,'Люблино'),(75,1,'Марксистская'),(76,1,'Марьина роща'),(77,1,'Марьино'),(78,1,'Маяковская'),(79,1,'Медведково'),(80,1,'Международная'),(81,1,'Менделеевская'),(82,1,'Митино'),(83,1,'Молодежная'),(84,1,'Мякинино'),(85,1,'Нагатинская'),(86,1,'Нагорная'),(87,1,'Нахимовский проспект'),(88,1,'Новогиреево'),(89,1,'Новокосино'),(90,1,'Новокузнецкая'),(91,1,'Новослободская'),(92,1,'Новоясеневская'),(93,1,'Новые Черемушки'),(94,1,'Октябрьская'),(95,1,'Октябрьское поле'),(96,1,'Орехово'),(97,1,'Отрадное'),(98,1,'Охотныйряд'),(99,1,'Павелецкая'),(100,1,'Парк культуры'),(101,1,'Парк Победы'),(102,1,'Партизанская'),(103,1,'Первомайская'),(104,1,'Перово'),(105,1,'Петровско-Разумовская'),(106,1,'Печатники'),(107,1,'Пионерская'),(108,1,'Планерная'),(109,1,'Площадь Ильича'),(110,1,'Площадь Революции'),(111,1,'Полежаевская'),(112,1,'Полянка'),(113,1,'Пражская'),(114,1,'Преображенская площадь'),(115,1,'Пролетарская'),(116,1,'Проспект Вернадского'),(117,1,'Проспект Мира'),(118,1,'Профсоюзная'),(119,1,'Пушкинская'),(120,1,'Пятницкое шоссе'),(121,1,'Речной вокзал'),(122,1,'Рижская'),(123,1,'Римская'),(124,1,'Рязанский проспект'),(125,1,'Савеловская'),(126,1,'Свиблово'),(127,1,'Севастопольская'),(128,1,'Семеновская'),(129,1,'Серпуховская'),(130,1,'Славянский бульвар'),(131,1,'Смоленская (Арбатско-Покровская линия)'),(132,1,'Смоленская (Филевская линия)'),(133,1,'Сокол'),(134,1,'Сокольники'),(135,1,'Спортивная'),(136,1,'Сретенский бульвар'),(137,1,'Строгино'),(138,1,'Студенческая'),(139,1,'Сухаревская'),(140,1,'Сходненская'),(141,1,'Таганская'),(142,1,'Тверская'),(143,1,'Театральная'),(144,1,'Текстильщики'),(145,1,'ТеплыйСтан'),(146,1,'Тимирязевская'),(147,1,'Третьяковская'),(148,1,'Трубная'),(149,1,'Тульская'),(150,1,'Тургеневская'),(151,1,'Тушинская'),(152,1,'Улица 1905года'),(153,1,'Улица Академика Янгеля'),(154,1,'Улица Горчакова'),(155,1,'Улица Подбельского'),(156,1,'Улица Скобелевская'),(157,1,'Улица Старокачаловская'),(158,1,'Университет'),(159,1,'Филевский парк'),(160,1,'Фили'),(161,1,'Фрунзенская'),(162,1,'Царицыно'),(163,1,'Цветной бульвар'),(164,1,'Черкизовская'),(165,1,'Чертановская'),(166,1,'Чеховская'),(167,1,'Чистые пруды'),(168,1,'Чкаловская'),(169,1,'Шаболовская'),(170,1,'Шипиловская'),(171,1,'Шоссе Энтузиастов'),(172,1,'Щелковская'),(173,1,'Щукинская'),(174,1,'Электрозаводская'),(175,1,'Юго-Западная'),(176,1,'Южная'),(177,1,'Ясенево');
/*!40000 ALTER TABLE `metro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `specialist_id` int(11) DEFAULT NULL,
  `title` text,
  `description` text,
  `price` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `review` text,
  `mark` tinyint(4) DEFAULT NULL,
  `mark_type` tinyint(4) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `state` text,
  `notify` text,
  `notify_for` tinyint(4) DEFAULT NULL,
  `pay` text,
  `review_time` int(11) DEFAULT NULL,
  `part_paid` tinyint(1) DEFAULT NULL,
  `rating_counted` tinyint(1) DEFAULT NULL,
  `rating_payment_counted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`,`id`),
  KEY `specialist_id` (`specialist_id`,`id`),
  KEY `client_id_2` (`client_id`,`specialist_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_orders`
--

DROP TABLE IF EXISTS `rating_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_orders` (
  `OrderId` int(11) NOT NULL AUTO_INCREMENT,
  `OrderUserId` int(11) NOT NULL,
  `OrderSpecId` int(11) NOT NULL,
  `OrderStatus` text NOT NULL,
  `OrderPrice` double NOT NULL DEFAULT '0',
  `OrderOriginalMark` double NOT NULL DEFAULT '0',
  `OrderMark` double NOT NULL DEFAULT '0',
  `OrderMarkFirstDate` datetime NOT NULL DEFAULT '2014-01-01 00:00:00',
  `OrderWeight` double NOT NULL DEFAULT '0',
  `OrderWeightUserObjectivity` double NOT NULL DEFAULT '0',
  `OrderWeightPrice` double NOT NULL DEFAULT '0',
  `OrderWeightExperience` double NOT NULL DEFAULT '0',
  `OrderWeightThisSpecNuO` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_orders`
--

LOCK TABLES `rating_orders` WRITE;
/*!40000 ALTER TABLE `rating_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_pss`
--

DROP TABLE IF EXISTS `rating_pss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_pss` (
  `Mark0` double DEFAULT '0',
  `Mark1` double DEFAULT '0',
  `Mark2` double DEFAULT '0',
  `Mark3` double DEFAULT '0',
  `Mark4` double DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_pss`
--

LOCK TABLES `rating_pss` WRITE;
/*!40000 ALTER TABLE `rating_pss` DISABLE KEYS */;
INSERT INTO `rating_pss` VALUES (1,0,0,0,0),(0.99781296296296,0.0011277777777778,0.00052592592592593,0.00031296296296296,0.00022037037037037),(0.99567986230637,0.0021893287435456,0.0010361445783133,0.00064027538726334,0.00045438898450947),(0.99355431515672,0.0032408759124088,0.0015457277801632,0.00096865607556891,0.00069042507513954),(0.99144430379747,0.0042746835443038,0.0020506329113924,0.0012974683544304,0.00093291139240506),(0.98932820855615,0.0053152852049911,0.0025579322638146,0.0016254456327986,0.001173128342246),(0.98721878025169,0.0063475314617619,0.0030629235237173,0.0019564375605034,0.0014143272023233),(0.98511164322059,0.0073771325950313,0.003568093385214,0.0022858425621071,0.0016572882370548),(0.98300770975057,0.0084027210884354,0.0040725623582766,0.002615873015873,0.0019011337868481),(0.98090766002099,0.0094233997901366,0.0045755508919203,0.0029480587618049,0.0021453305351522),(0.97879050242687,0.010470943198216,0.0050697450697451,0.0032856705583978,0.0023831387467751),(0.97669967793881,0.01147423510467,0.0055845410628019,0.003609500805153,0.0026320450885668),(0.97458714232627,0.012516536603493,0.0060772946859903,0.0039472315124489,0.0028717948717949),(0.97250063111393,0.013514831177027,0.006590932996739,0.0042711160197747,0.0031224886925422),(0.97039493262989,0.014542246513024,0.0070963084650986,0.0046009130111994,0.0033655993807951),(0.96828599971458,0.015580134151563,0.0075881261595547,0.0049393463679178,0.0036063936063936),(0.96620295566502,0.016574055829228,0.0081011494252874,0.005263711001642,0.0038581280788177),(0.96410144548613,0.017596235012887,0.0086050872147319,0.0055953385873832,0.004101893698876),(0.96200286064568,0.018615447486718,0.0091078872088268,0.0059264405394359,0.0043473641193297),(0.95989633035334,0.019649995742871,0.0095994891443174,0.0062657130693917,0.0045884716900812),(0.95779712858926,0.020669787765293,0.010102996254682,0.0065961298377029,0.0048339575530587),(0.95569952863304,0.021687493731824,0.010605756694415,0.0069278908835628,0.0050793300571661),(0.95360251950243,0.022704459203034,0.011108422939067,0.0072596985030564,0.0053248998524135),(0.95150522673466,0.023721847872273,0.011611558307532,0.0075904328294778,0.0055709342560548),(0.94940933899332,0.024737427820344,0.012113997285778,0.0079223659940862,0.0058168699064582),(0.94733258678611,0.025723404255319,0.012625979843225,0.0082474804031355,0.006070548712206),(0.94521823162709,0.026767790504538,0.013119178584524,0.0085853448089898,0.0063094544748586),(0.9431237939068,0.027781548398713,0.013621349224603,0.0089174807275069,0.0065558277423946),(0.94102975958415,0.028794801819363,0.014123456790123,0.0092496426250812,0.0068023391812866),(0.93893535609806,0.029808579491025,0.014626004262992,0.0095808286086574,0.0070492315392504),(0.93684210526311,0.030820868413468,0.015127948583155,0.0099130765406628,0.0072960011995602),(0.9347492201342,0.031832680325755,0.015629840366682,0.010245397752323,0.0075428614209776),(0.93265592299332,0.032845086166744,0.01613215339233,0.01057674274181,0.007790094705791),(0.93057035537562,0.033841700404851,0.016645973909128,0.010901529464685,0.0080404408457023),(0.92847846930193,0.034852621250357,0.017147743201573,0.011232772638073,0.0082883936080757),(0.92638603925073,0.035863659022936,0.017649682531356,0.011565500865825,0.008535118329224),(0.92429540594346,0.036872944473118,0.018150873829362,0.011897795147849,0.0087829806061493),(0.92218496654854,0.037912508982785,0.018643177754715,0.012236251347789,0.0090230953661012),(0.92009419341359,0.038921691892664,0.019144663827594,0.012568823012496,0.0092706278536727),(0.9180104035234,0.039916390905837,0.019658302583022,0.012892608022852,0.0095222949648833),(0.91591932615188,0.04092575813506,0.020159960625077,0.013225499737128,0.0097694553508507),(0.91382925084176,0.04193440656564,0.020661342592585,0.013557091750837,0.010017908249154),(0.91172068511204,0.042971596654116,0.021152924594791,0.013896620400163,0.010258173238965),(0.90963044199778,0.043980182494218,0.0216546078106,0.014228468905276,0.010506298792191),(0.90754841118704,0.04497262984952,0.022167581494343,0.014553302714611,0.01075807475449),(0.90545781843183,0.045981475152276,0.02266941423094,0.014885472354007,0.011005819830972),(0.90335072463767,0.047017069243161,0.023160493827163,0.015224906065487,0.011246806226518),(0.9012613015269,0.048024639444278,0.023662003244125,0.01555686907155,0.011495186713215),(0.89917936067427,0.04901675403433,0.024175146469319,0.015882002261281,0.011746736560798),(0.89709087301587,0.050023412698424,0.024676190476196,0.016213888888893,0.011995634920638),(0.89498384554768,0.051058707643814,0.025167454688731,0.016553585500394,0.012236406619385),(0.89290187589078,0.052050889668777,0.025680945301829,0.016877936826608,0.012488352311906),(0.89081448909401,0.053056119117056,0.026181490995102,0.017210704282579,0.012737196511236),(0.88870731034487,0.054091683362176,0.026673006293019,0.017549695948189,0.01297830405182),(0.88662586225277,0.055083194566863,0.027186432247772,0.017874102793022,0.013230408139646),(0.88453892993886,0.056087862562012,0.027686879247268,0.018206934064234,0.013479394187712),(0.88243218723107,0.057122891068648,0.028178282567537,0.018546012734464,0.013720626398207),(0.88035177476122,0.058113061840151,0.028691241830081,0.018871231774771,0.013972689793874),(0.87826468566194,0.059117969088203,0.029191989407494,0.019203371272893,0.014221984569558),(0.87615892346172,0.060151735781344,0.029682922741736,0.019543253325381,0.014463164689739),(0.87407835759942,0.061142155469138,0.0301961661999,0.01986777079465,0.014715549936792),(0.87199220098009,0.062145846274212,0.030696470885973,0.020200715485319,0.014964766374497),(0.86988629393698,0.06317984247263,0.031187697041386,0.020539902750282,0.015206263798425),(0.8678061019298,0.064169802353869,0.031700845551619,0.020864494114993,0.015458756049509),(0.86572028725314,0.065173070017953,0.032201077199282,0.021197486535009,0.015708078994614),(0.86361478085567,0.066206551863909,0.032692250813373,0.021536719357633,0.015949697109119),(0.86153544973548,0.067195414462053,0.033204938271591,0.021862081128739,0.01620211640211),(0.85943065605809,0.068228233384527,0.033695730572795,0.022201214468181,0.016444165516296),(0.8573516514864,0.069216883672619,0.034208529453727,0.022525684129029,0.016697251258232),(0.85526525942481,0.070220506218359,0.03470917217253,0.022859099300407,0.016945962883778),(0,0,0,0,70);
/*!40000 ALTER TABLE `rating_pss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_specs`
--

DROP TABLE IF EXISTS `rating_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_specs` (
  `SpecId` int(11) NOT NULL AUTO_INCREMENT,
  `SpecRating` double NOT NULL DEFAULT '0',
  `SpecMarkAverage` double NOT NULL DEFAULT '0',
  `SpecMarkAveragePreOrder` double NOT NULL DEFAULT '0',
  `SpecNuOOrdersUserConcludedAbout` double NOT NULL DEFAULT '0',
  `SpecNuOOrdersPaid` double NOT NULL DEFAULT '0',
  `SpecSlivPercent` double NOT NULL DEFAULT '0',
  `SpecOrdersWeightSliv` double NOT NULL DEFAULT '0',
  `SpecMarkBasic` double NOT NULL DEFAULT '0',
  `SpecMarkNuO` double NOT NULL DEFAULT '0',
  `SpecMarkNuOsWeight` double NOT NULL DEFAULT '0',
  `SpecMarkNuOPreOrder` double NOT NULL DEFAULT '0',
  `SpecMarkNuOsWeightPreOrder` double NOT NULL DEFAULT '0',
  `SpecMarkAverageWithMarkBasic` double NOT NULL DEFAULT '0',
  `SpecIsInTheMainTableUpdated` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`SpecId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_specs`
--

LOCK TABLES `rating_specs` WRITE;
/*!40000 ALTER TABLE `rating_specs` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_users`
--

DROP TABLE IF EXISTS `rating_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_users` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `UserNuOOrdersDone` double NOT NULL DEFAULT '0',
  `UserMarkNuOBoth` double NOT NULL DEFAULT '0',
  `UserMarkNuO` double NOT NULL DEFAULT '0',
  `UserMarkNuOPreOrder` double NOT NULL DEFAULT '0',
  `UserSlivPercent` double NOT NULL DEFAULT '0',
  `UserOrdersWeightSliv` double NOT NULL DEFAULT '0',
  `UserUnpaidKo` double NOT NULL DEFAULT '0',
  `UserOrdersUnpaidPercent` double NOT NULL DEFAULT '0',
  `UserOrdersPartpaidPercent` double NOT NULL DEFAULT '0',
  `UserConstantMistake` double NOT NULL DEFAULT '0',
  `UserConstantMistakePreOrder` double NOT NULL DEFAULT '0',
  `UserContrastDispersial` double NOT NULL DEFAULT '0',
  `UserContrastDispersialPreOrder` double NOT NULL DEFAULT '0',
  `UserWeightExperience` double NOT NULL DEFAULT '0',
  `UserWeightExperiencePreOrder` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_users`
--

LOCK TABLES `rating_users` WRITE;
/*!40000 ALTER TABLE `rating_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `name2` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'свадебная','свадебная съемка'),(2,'детская','десткая съемка'),(3,'love-story','love-story съемка'),(4,'семейная','семейная съемка'),(5,'портрет','портретная съемка'),(6,'fashion','fashion съемка'),(7,'гламур','гламурная съемка'),(8,'ню','ню съемка'),(9,'корпоратив','корпоративная съемка'),(10,'концертная','концертная съемка'),(11,'студийная','студийная съемка'),(12,'рекламная','рекламная съемка'),(13,'клубная','клубная съемка'),(14,'выставка','съемка выставки'),(15,'конференции','съемка конференции'),(16,'жанр','жанровая съемка');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialist`
--

DROP TABLE IF EXISTS `specialist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialist` (
  `user_id` int(11) NOT NULL,
  `description` text,
  `cost_id` int(11) DEFAULT NULL,
  `experience_id` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `cost_per_hour` int(11) DEFAULT NULL,
  `certificates` text,
  `phone` text,
  `moderated` tinyint(1) DEFAULT NULL,
  `links` text,
  `mark` float DEFAULT NULL,
  `start_rating` float DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `rating` (`rating`),
  KEY `experience_id` (`experience_id`,`rating`),
  KEY `cost_id` (`cost_id`,`rating`),
  KEY `experience_id_2` (`experience_id`,`cost_id`,`rating`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialist`
--

LOCK TABLES `specialist` WRITE;
/*!40000 ALTER TABLE `specialist` DISABLE KEYS */;
/*!40000 ALTER TABLE `specialist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialist_service`
--

DROP TABLE IF EXISTS `specialist_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialist_service` (
  `specialist_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  KEY `specialist_id` (`specialist_id`,`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialist_service`
--

LOCK TABLES `specialist_service` WRITE;
/*!40000 ALTER TABLE `specialist_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `specialist_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tender`
--

DROP TABLE IF EXISTS `tender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` text,
  `text` text,
  `time` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tender`
--

LOCK TABLES `tender` WRITE;
/*!40000 ALTER TABLE `tender` DISABLE KEYS */;
/*!40000 ALTER TABLE `tender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tender_answer`
--

DROP TABLE IF EXISTS `tender_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tender_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tender_id` int(11) DEFAULT NULL,
  `specialist_id` int(11) DEFAULT NULL,
  `text` text,
  `time` int(11) DEFAULT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tender_answer`
--

LOCK TABLES `tender_answer` WRITE;
/*!40000 ALTER TABLE `tender_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tender_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `second_name` text,
  `email` varchar(100) NOT NULL,
  `pass` text,
  `is_specialist` tinyint(1) DEFAULT NULL,
  `avatar_image_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `metro_id` int(11) DEFAULT NULL,
  `reg_time` int(11) DEFAULT NULL,
  `visit_time` int(11) NOT NULL DEFAULT '0',
  `unread_notify` int(11) NOT NULL DEFAULT '0',
  `notify_id` int(11) NOT NULL DEFAULT '0',
  `email_notify` tinyint(1) NOT NULL DEFAULT '0',
  `auth_key` char(32) DEFAULT NULL,
  `new_pass_key` int(11) DEFAULT NULL,
  `notify_sound_settings` int(11) NOT NULL DEFAULT '1',
  `notify_email_settings` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `email_2` (`email`),
  KEY `auth_key` (`auth_key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'anya',NULL,'anya','3b50e9eab68d7a06e15f85c8e5416890',0,NULL,NULL,NULL,1396654317,1396713024,0,30,0,'e11c99191173d2a0e6849ceceb817526',NULL,1,1),(2,'natasha',NULL,'natasha','17ecd3851b1e2aa687d0d8680b724f0d',0,NULL,NULL,NULL,1396654331,1396654331,0,0,0,'23309e4e4af8df07c5f3918a9b5d58e6',NULL,1,1),(3,'Василий',NULL,'thelv@yandex.ru','ea201f694b546bf131d8e72b5f5671a6',0,NULL,NULL,NULL,1396654354,1396722252,0,30,0,'0494f06f5d30c15ddffc7eb22faea991',NULL,1,1),(4,'yura',NULL,'yura','3055cf3f1c6b7edde0e3dc1c8d7447dc',0,NULL,NULL,NULL,1396654382,1396654383,0,0,0,'370f2c10c105523753059dda03eda4f2',NULL,1,1),(5,'nastya',NULL,'nastya','92ab131c1c5ba230db25bd7a1de1625f',0,NULL,NULL,NULL,1396654395,1396654396,0,0,0,'a8b08463cea5d76f5eba4fa57b86d6a1',NULL,1,1),(6,'oleg',NULL,'oleg','e602be5c1fa13abecfe26fcf08766606',0,NULL,NULL,NULL,1396654409,1396654409,0,0,0,'a6b596dd76043d8381400c1fb2b7f0e1',NULL,1,1);
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

-- Dump completed on 2014-04-21 22:00:01
