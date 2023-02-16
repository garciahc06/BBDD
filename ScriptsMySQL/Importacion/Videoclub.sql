-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

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
CREATE DATABASE IF NOT EXISTS `videoclub`;
USE `videoclub`;
--
-- Table structure for table `Alquileres`
--

DROP TABLE IF EXISTS `Alquileres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alquileres` (
  `CODIGOPELICULA` smallint(6) DEFAULT NULL,
  `CODIGOCLIENTE` tinyint(4) DEFAULT NULL,
  `FECHADESCARGA` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alquileres`
--

LOCK TABLES `Alquileres` WRITE;
/*!40000 ALTER TABLE `Alquileres` DISABLE KEYS */;
INSERT INTO `Alquileres` VALUES (5,16,'2018-05-01 00:00:00'),(11,2,'2017-12-26 00:00:00'),(12,6,'2018-02-01 00:00:00'),(15,1,'2017-12-26 00:00:00'),(15,6,'2018-02-01 00:00:00'),(15,9,'2018-02-01 00:00:00'),(16,11,'2017-12-26 00:00:00'),(16,15,'2018-05-01 00:00:00'),(17,12,'2017-12-26 00:00:00'),(25,14,'2017-12-26 00:00:00'),(26,15,'2018-05-01 00:00:00'),(27,6,'2018-02-01 00:00:00'),(44,1,'2017-12-26 00:00:00'),(44,4,'2017-12-26 00:00:00'),(58,2,'2017-12-26 00:00:00'),(58,9,'2018-02-01 00:00:00'),(61,10,'2018-02-01 00:00:00'),(70,11,'2017-12-26 00:00:00'),(96,10,'2018-02-01 00:00:00'),(98,6,'2018-02-01 00:00:00'),(125,2,'2017-12-26 00:00:00'),(220,13,'2017-12-26 00:00:00'),(221,2,'2017-12-26 00:00:00'),(261,1,'2017-12-26 00:00:00'),(301,1,'2017-12-26 00:00:00'),(302,1,'2017-12-26 00:00:00'),(303,1,'2017-12-26 00:00:00');
/*!40000 ALTER TABLE `Alquileres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clientes` (
  `CODIGOCLIENTE` tinyint(4) DEFAULT NULL,
  `NOMBRECLIENTE` varchar(11) DEFAULT NULL,
  `APELLIDO1CLIENTE` varchar(9) DEFAULT NULL,
  `APELLIDO2CLIENTE` varchar(8) DEFAULT NULL,
  `DNI` varchar(9) DEFAULT NULL,
  `DIRECCION` varchar(24) DEFAULT NULL,
  `CIUDAD` varchar(8) DEFAULT NULL,
  `codigopostal` mediumint(9) DEFAULT NULL,
  `PROVINCIA` varchar(8) DEFAULT NULL,
  `TELEFONO` int(11) DEFAULT NULL,
  `FECHALTA` varchar(19) DEFAULT NULL,
  `OBSERVACIONES` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,'Pedro','Perez','Gomez','11111111A','Primera, n 1 , 1º','Zaragoza',50900,'Zaragoza',111111111,'2017-12-01 00:00:00',''),(2,'Luis','Gonzalez','Martinez','22222222B','Segunda, n 2 , 2º','Zaragoza',50900,'Zaragoza',222222222,'2017-11-15 00:00:00',''),(4,'Elisa','Gil','Martinez','44444444D','Cuarta , 4 , 4º','Zaragoza',50900,'Zaragoza',444444444,'2017-08-01 00:00:00',''),(6,'Juan','Rodriguez','Gil','66666666F','Sexta , 6 , 6º','Zaragoza',50900,'Zaragoza',666666666,'2017-12-01 00:00:00',''),(7,'Jorge','García','García','77777777G','Séptima , 7 ,7º','Zaragoza',50900,'Zaragoza',777777777,'2017-05-10 00:00:00',''),(9,'Elvira','Perez','García','99999999I','Novena , 9 ,9º','Zaragoza',50900,'Zaragoza',999999999,'2017-09-04 00:00:00',''),(10,'Angel','Ruiz','Ruiz','10101010J','Décima , 10 , 10º','Zaragoza',50900,'Zaragoza',101010101,'2017-11-20 00:00:00',''),(11,'Ernesto','Gomez','Ruiz','12345678K','Undécima , 11 , 11º','Zaragoza',50900,'Zaragoza',123456789,'2017-11-29 00:00:00',''),(12,'Julio','Gil','Gomez','12121212L','Duodécima, 12 ,12º','Zaragoza',50900,'Zaragoza',121212121,'2017-06-12 00:00:00',''),(13,'Carmen','Martinez','Gil','13131313M','Decimotercera , 13 , 13º','Zaragoza',50900,'Zaragoza',131313131,'2017-09-04 00:00:00',''),(14,'Rosa','Garcia','Perez','14141414N','Decimocuarta, 14 , 14º','Zaragoza',50900,'Zaragoza',141414141,'2017-12-01 00:00:00',''),(15,'Teresa','Lopez','Gomez','15151515O','Decimoquinta, 15 , 15º','Zaragoza',50900,'Zaragoza',151515151,'2017-06-12 00:00:00',''),(16,'Carlos','Gonzalez','Garcia','16161616P','Decimosexta, 16 , 16º','Zaragoza',50900,'Zaragoza',161616161,'2017-09-04 00:00:00',''),(17,'Antonio','Gonzalez','Gil','17171717Q','Decimoseptima','Zaragoza',50900,'Zaragoza',171717171,'2017-06-12 00:00:00',''),(20,'Luis Javier','Salón','Giménez','25198788B','Mayoral nº25-31','Zaragoza',50900,'Zaragoza',626601450,'2017-12-01 00:00:00','');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Generos`
--

DROP TABLE IF EXISTS `Generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Generos` (
  `CODIGOGENERO` tinyint(4) DEFAULT NULL,
  `NOMBREGENERO` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Generos`
--

LOCK TABLES `Generos` WRITE;
/*!40000 ALTER TABLE `Generos` DISABLE KEYS */;
INSERT INTO `Generos` VALUES (1,'Acción'),(2,'Aventuras'),(3,'Bélica'),(4,'Ciencia-Ficción'),(5,'Comedia'),(6,'Drama'),(7,'Erótica'),(8,'Histórica'),(9,'Infantil'),(10,'Musical'),(11,'Oeste'),(12,'Suspense'),(13,'Terror'),(14,'Documental'),(16,'Documental');
/*!40000 ALTER TABLE `Generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Peliculas`
--

DROP TABLE IF EXISTS `Peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Peliculas` (
  `CODIGOPELICULA` smallint(6) DEFAULT NULL,
  `TITULO` varchar(40) DEFAULT NULL,
  `GENERO` tinyint(4) DEFAULT NULL,
  `FECHAPUBLICACION` datetime DEFAULT NULL,
  `TIPOPELICULA` tinyint(4) DEFAULT NULL,
  `PRECIO` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Peliculas`
--

LOCK TABLES `Peliculas` WRITE;
/*!40000 ALTER TABLE `Peliculas` DISABLE KEYS */;
INSERT INTO `Peliculas` VALUES (4,'AIR AMERICA',1,'2017-07-15 00:00:00',2,18),(5,'ALGUIEN VOLO SOBRE EL NIDO DEL CUCO',6,'2017-12-23 00:00:00',2,18),(6,'ALIENS, EL REGRESO',4,'2017-10-16 00:00:00',2,18),(8,'AMOR EN CONSERVA',5,'2017-03-15 00:00:00',3,18),(10,'ASESINATO EN EL ORIENT EXPRESS',12,'2017-12-23 00:00:00',2,18),(11,'BAILANDO CON LOBOS',11,'2017-12-23 00:00:00',2,18),(12,'Balas sobre Broadway',5,'2017-03-15 00:00:00',2,18),(13,'BARRABAS',8,'2017-05-15 00:00:00',2,15),(15,'BELLEZA MORTAL',1,'2017-07-15 00:00:00',2,18),(16,'BEN-HUR',8,'2017-05-15 00:00:00',2,18),(17,'BLADE RUNNER',1,'2017-07-15 00:00:00',2,15),(18,'BUSTER KEATON',5,'2017-03-15 00:00:00',2,18),(19,'CABALLERO SIN ESPADA',5,'2017-03-15 00:00:00',2,18),(20,'CALABUCH',5,'2017-03-15 00:00:00',2,18),(21,'Campanadas a media noche',8,'2017-05-15 00:00:00',2,15),(22,'CANDILEJAS',5,'2017-03-15 00:00:00',3,18),(23,'Cantando bajo la lluvia',10,'2017-05-15 00:00:00',3,18),(25,'CAPRICORNIO I',4,'2017-10-16 00:00:00',3,15),(26,'CARAVANA DE MUJERES',11,'2017-12-23 00:00:00',3,15),(27,'CASABLANCA',12,'2017-12-23 00:00:00',3,15),(28,'CAVERNICOLA',5,'2017-03-15 00:00:00',3,15),(29,'CHAPLIN',8,'2017-05-15 00:00:00',3,15),(30,'CIUDADANO KANE',12,'2017-12-23 00:00:00',3,18),(39,'CULPABLE SIN ROSTRO',12,'2017-12-23 00:00:00',2,18),(40,'CUNA DE HEROES',3,'2017-10-16 00:00:00',2,18),(41,'DEMETRIUS Y LOS GLADIADORES',8,'2017-05-15 00:00:00',3,18),(42,'DEMOLITION MAN',1,'2017-07-15 00:00:00',3,18),(43,'DESAFIO TOTAL',4,'2017-10-16 00:00:00',3,18),(44,'DESDE RUSIA CON AMOR',1,'2017-07-15 00:00:00',3,18),(45,'DIAMANTES PARA LA ETERNIDAD',1,'2017-07-15 00:00:00',3,18),(46,'DISPARA A MATAR',1,'2017-07-15 00:00:00',3,18),(55,'EL ACORAZADO POTEMKIN',8,'2017-05-15 00:00:00',2,15),(56,'EL ACORRALADO',1,'2017-07-15 00:00:00',2,15),(57,'EL ALAMO',11,'2017-12-23 00:00:00',2,15),(58,'EL ALBERGUE DE LA SEXTA FELICIDAD',8,'2017-05-15 00:00:00',2,15),(59,'EL APARTAMENTO',5,'2017-03-15 00:00:00',2,15),(60,'EL APRENDIZ DE MALO',5,'2017-03-15 00:00:00',3,15),(61,'El arbol del ahorcado',11,'2017-12-23 00:00:00',3,18),(63,'EL BUENO, EL FEO Y EL MALO',11,'2017-12-23 00:00:00',3,18),(70,'EL COLEGIAL',5,'2017-03-15 00:00:00',2,15),(71,'EL COLOR PURPURA',6,'2017-12-23 00:00:00',2,15),(72,'EL CONFLICTO DE LOS MARX',5,'2017-03-15 00:00:00',2,18),(74,'EL DESAFIO DE LAS AGUILAS',3,'2017-10-16 00:00:00',3,18),(77,'EL FORASTERO',11,'2017-12-23 00:00:00',3,16),(78,'EL GRAN DICTADOR',5,'2017-03-15 00:00:00',2,16),(81,'EL HEROE DEL RIO',5,'2017-03-15 00:00:00',2,18),(82,'EL HOMBRE DE LA PISTOLA DE ORO',1,'2017-07-15 00:00:00',3,18),(92,'EL MAQUINISTA DE LA GENERAL',5,'2017-03-15 00:00:00',3,18),(95,'EL PADRINO (2ª PARTE)',1,'2017-07-15 00:00:00',3,16),(96,'EL PLANETA DE LOS SIMIOS',4,'2017-10-16 00:00:00',3,16),(97,'EL PROFESIONAL',1,'2017-07-15 00:00:00',3,16),(98,'EL PUENTE DE CASANDRA',1,'2017-07-15 00:00:00',2,16),(99,'EL PUENTE SOBRE EL RIO KWAI',3,'2017-10-16 00:00:00',2,18),(111,'EL ULTIMO BOY SCOUT',1,'2017-07-15 00:00:00',2,18),(112,'EL ULTIMO EMPERADOR',8,'2017-05-15 00:00:00',2,18),(113,'EL ULTIMO GRAN HEROE',1,'2017-07-15 00:00:00',2,18),(114,'El último torpedo',3,'2017-10-16 00:00:00',2,18),(115,'EL VAQUERO Y LA DAMA',11,'2017-12-23 00:00:00',2,18),(121,'EN EL ESTANQUE DORADO',6,'2017-12-23 00:00:00',3,18),(122,'EN LA LINEA DE FUEGO',1,'2017-07-15 00:00:00',3,18),(123,'Enmanuel',7,'2017-03-15 00:00:00',3,18),(124,'Enrique V',8,'2017-05-15 00:00:00',3,18),(125,'ESPARTACO',8,'2017-05-15 00:00:00',3,18),(126,'ESPERAME EN EL CIELO',8,'2017-05-15 00:00:00',3,18),(127,'ESTA CASA ES UNA RUINA',5,'2017-03-15 00:00:00',3,16),(133,'FUERZA 10 DE NAVARONE',3,'2017-10-16 00:00:00',3,18),(134,'FURIA ORIENTAL',1,'2017-07-15 00:00:00',3,18),(135,'GANDHI',8,'2017-05-15 00:00:00',3,18),(136,'GIGANTE',6,'2017-12-23 00:00:00',3,18),(153,'Instinto Básico',7,'2017-03-15 00:00:00',3,15),(155,'JONNY GUITAR',11,'2017-12-23 00:00:00',3,18),(156,'JUEGO CON LA MUERTE',1,'2017-07-15 00:00:00',2,18),(157,'JUNGLA DE CRISTAL',1,'2017-07-15 00:00:00',3,18),(159,'KARATE A MUERTE EN BANGKOK',1,'2017-07-15 00:00:00',2,18),(160,'KARATE KID',1,'2017-07-15 00:00:00',3,18),(165,'LA BATALLA DE ARGEL',8,'2017-05-15 00:00:00',3,18),(175,'LA COSTILLA DE ADAN',5,'2017-03-15 00:00:00',3,18),(177,'LA ESCOPETA NACIONAL',5,'2017-03-15 00:00:00',2,18),(178,'LA ESPIA QUE ME AMO',1,'2017-07-15 00:00:00',3,18),(181,'LA GRAN PRUEBA',11,'2017-12-23 00:00:00',3,18),(188,'LA JUNGLA 2- ALERTA ROJA',1,'2017-07-15 00:00:00',3,15),(189,'LA JUNGLA HUMANA',1,'2017-07-15 00:00:00',3,15),(190,'LA LEY DE LA HOSPITALIDAD',5,'2017-03-15 00:00:00',3,15),(191,'LA LEY DEL TALION',11,'2017-12-23 00:00:00',3,18),(192,'LA LEYENDA DE LA CIUDAD SIN NOMBRE',11,'2017-12-23 00:00:00',3,18),(194,'LA MISION',8,'2017-05-15 00:00:00',3,18),(196,'LA NARANJA MECANICA',6,'2017-12-23 00:00:00',2,18),(201,'LA QUIMERA DEL ORO',5,'2017-03-15 00:00:00',2,18),(202,'LA REBELION DE LOS SIMIOS',4,'2017-10-16 00:00:00',2,18),(203,'La reina Margot',8,'2017-05-15 00:00:00',2,18),(208,'LA VENGANZA DE UN HOMBRE LLAMADO CABALLO',11,'2017-12-23 00:00:00',2,18),(212,'LAS SANDALIAS DEL PESCADOR',8,'2017-05-15 00:00:00',2,16),(213,'LAWRENCE DE ARABIA',8,'2017-05-15 00:00:00',2,16),(214,'LOCA ACADEMIA DE POLICIA',5,'2017-03-15 00:00:00',2,16),(215,'Los cañones de Navarone',3,'2017-10-16 00:00:00',2,18),(217,'LOS COMANCHEROS',11,'2017-12-23 00:00:00',2,18),(219,'LOS DIEZ MANDAMIENTOS',8,'2017-05-15 00:00:00',2,18),(220,'LOS HERMANOS MARX EN EL OESTE',5,'2017-03-15 00:00:00',2,18),(221,'LOS INTOCABLES',1,'2017-07-15 00:00:00',2,18),(222,'LOS NIÑOS DEL BRASIL',12,'2017-12-23 00:00:00',2,18),(223,'LOS OCIOSOS',5,'2017-03-15 00:00:00',2,18),(225,'Los pájaros',12,'2017-12-23 00:00:00',3,18),(226,'LOS PANZERS DE LA MUERTE',3,'2017-10-16 00:00:00',3,18),(227,'LOS SIETE MAGNIFICOS',11,'2017-12-23 00:00:00',3,18),(229,'LUCES DE LA CIUDAD',5,'2017-03-15 00:00:00',3,18),(230,'LUNA NUEVA',5,'2017-03-15 00:00:00',3,18),(231,'MARATHON MAN',12,'2017-12-23 00:00:00',3,18),(232,'MAXIMO RIESGO',1,'2017-07-15 00:00:00',3,18),(240,'MUERTE EN EL NILO',12,'2017-12-23 00:00:00',2,18),(241,'Mujeres al borde de un ataque de nervios',5,'2017-03-15 00:00:00',3,18),(242,'My Fair Lady',10,'2017-05-15 00:00:00',3,18),(243,'NUNCA DIGAS NUNCA JAMAS',1,'2017-07-15 00:00:00',3,18),(245,'OCTOPUSSY',1,'2017-07-15 00:00:00',2,18),(246,'OCTUBRE',8,'2017-05-15 00:00:00',3,18),(254,'PEDRO SAPUTO',5,'2017-03-15 00:00:00',2,18),(255,'PEGGY SUE SE CASO',5,'2017-03-15 00:00:00',3,18),(258,'PLUMAS DE CABALLO',5,'2017-03-15 00:00:00',3,18),(261,'POR QUIEN DOBLAN LAS CAMPANAS',3,'2017-10-16 00:00:00',2,18),(262,'PRETTY WOMAN',5,'2017-03-15 00:00:00',2,18),(264,'PURPURA Y NEGRO',3,'2017-10-16 00:00:00',2,18),(265,'QUE VERDE ERA MI VALLE!',6,'2017-12-23 00:00:00',2,15),(266,'QUE VIVA MEXICO!',8,'2017-05-15 00:00:00',2,15),(267,'QUIEN ENGAÑO A ROGER RABBIT',1,'2017-07-15 00:00:00',2,15),(268,'QUO VADIS',8,'2017-05-15 00:00:00',2,15),(269,'RAMBO',1,'2017-07-15 00:00:00',2,15),(270,'Rambo I',1,'2017-07-15 00:00:00',2,18),(271,'Rambo II',1,'2017-07-15 00:00:00',3,18),(272,'Rambo III',1,'2017-07-15 00:00:00',3,18),(273,'REBELION A BORDO',8,'2017-05-15 00:00:00',3,18),(274,'REBELION EN LAS AULAS',6,'2017-12-23 00:00:00',3,18),(275,'RED ESCORPION',3,'2017-10-16 00:00:00',3,18),(277,'REGRESO AL PLANETA DE LOS SIMIOS',4,'2017-10-16 00:00:00',3,18),(278,'REVENGE',1,'2017-07-15 00:00:00',3,18),(279,'RIO BRAVO',11,'2017-12-23 00:00:00',3,16),(280,'RIO ROJO',11,'2017-12-23 00:00:00',3,16),(281,'Robocop',1,'2017-07-15 00:00:00',3,16),(283,'ROCKY II',1,'2017-07-15 00:00:00',2,18),(284,'ROCKY IV',1,'2017-07-15 00:00:00',3,18),(286,'SALTO A LA GLORIA',8,'2017-05-15 00:00:00',2,18),(287,'SANSON Y DALILA',8,'2017-05-15 00:00:00',3,18),(292,'SINUE EL EGIPCIO',8,'2017-05-15 00:00:00',2,18),(293,'Solo ante el peligro',11,'2017-12-23 00:00:00',3,18),(295,'SOLO SE VIVE DOS VECES',1,'2017-07-15 00:00:00',2,18),(296,'STAR TREK',4,'2017-10-16 00:00:00',3,18),(297,'SU OTRA ESPOSA',5,'2017-03-15 00:00:00',3,18),(301,'Terminator',1,'2017-07-15 00:00:00',2,18),(302,'TERMINATOR 2',1,'2017-07-15 00:00:00',3,18),(303,'TESTIGO ACCIDENTAL',1,'2017-07-15 00:00:00',3,18),(310,'TOOTSIE',5,'2017-03-15 00:00:00',2,18),(312,'TRON',4,'2017-10-16 00:00:00',2,18),(313,'ULISES',8,'2017-05-15 00:00:00',2,18),(314,'UN DIA EN LAS CARRERAS',5,'2017-03-15 00:00:00',2,18),(315,'UN GANSTER PARA UN MILAGRO',5,'2017-03-15 00:00:00',2,18),(319,'UNA MUJER DE PARIS',6,'2017-12-23 00:00:00',2,18),(320,'UNA NOCHE EN CASABLANCA',5,'2017-03-15 00:00:00',2,18),(321,'UNA NOCHE EN LA OPERA',5,'2017-03-15 00:00:00',2,18),(322,'UNA TARDE EN EL CIRCO',5,'2017-03-15 00:00:00',2,18),(323,'UNO, DOS, TRES',5,'2017-03-15 00:00:00',2,18),(324,'Vestida para matar',12,'2017-12-23 00:00:00',2,18),(327,'VIVA ZAPATA',8,'2017-05-15 00:00:00',2,18),(328,'VIVE COMO QUIERAS',5,'2017-03-15 00:00:00',3,18),(329,'VIVE Y DEJA MORIR',1,'2017-07-15 00:00:00',3,18);
/*!40000 ALTER TABLE `Peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipopeliculas`
--

DROP TABLE IF EXISTS `Tipopeliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipopeliculas` (
  `CODIGOENTREGA` tinyint(4) DEFAULT NULL,
  `MODALIDAD` varchar(6) DEFAULT NULL,
  `PRECIODESCARGA` decimal(2,1) DEFAULT NULL,
  `LIMITENTREGA` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipopeliculas`
--

LOCK TABLES `Tipopeliculas` WRITE;
/*!40000 ALTER TABLE `Tipopeliculas` DISABLE KEYS */;
INSERT INTO `Tipopeliculas` VALUES (1,'Extra',3.0,1),(2,'Normal',1.8,2),(3,'Oferta',1.2,3);
/*!40000 ALTER TABLE `Tipopeliculas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;