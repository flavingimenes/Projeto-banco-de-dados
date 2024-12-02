-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Ficção'),(2,'Tecnologia'),(3,'História'),(4,'Biografia'),(5,'Literatura Clássica'),(6,'Ciência');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimos`
--

DROP TABLE IF EXISTS `emprestimos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `livro_id` int(11) DEFAULT NULL,
  `membro_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `data_emprestimo` date NOT NULL,
  `data_devolucao` date DEFAULT NULL,
  `status` enum('emprestado','devolvido','atrasado') DEFAULT 'emprestado',
  PRIMARY KEY (`id`),
  KEY `fk_livro` (`livro_id`),
  KEY `fk_membro` (`membro_id`),
  KEY `fk_funcionario` (`funcionario_id`),
  CONSTRAINT `fk_funcionario` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`),
  CONSTRAINT `fk_livro` FOREIGN KEY (`livro_id`) REFERENCES `livros` (`id`),
  CONSTRAINT `fk_membro` FOREIGN KEY (`membro_id`) REFERENCES `membros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimos`
--

LOCK TABLES `emprestimos` WRITE;
/*!40000 ALTER TABLE `emprestimos` DISABLE KEYS */;
/*!40000 ALTER TABLE `emprestimos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `ano_publicacao` int(11) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT 0,
  `disponivel` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `fk_categoria` (`categoria_id`),
  CONSTRAINT `fk_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (1,'Dom Casmurro','Machado de Assis','978-8535908342',1899,1,5,5),(2,'O Primo Basílio','José de Alencar','978-8520931967',1882,1,3,3),(3,'O Alienista','Machado de Assis','978-8520932049',1882,1,4,4),(4,'1984','George Orwell','978-0451524935',1949,1,6,6),(5,'O Senhor dos Anéis','J.R.R. Tolkien','978-0261102385',1954,1,10,10),(6,'A Revolução dos Bichos','George Orwell','978-0451526342',1945,1,7,7),(7,'Java: Como Programar','Paul Deitel','978-0132354881',2011,2,8,8),(8,'Python para Desenvolvedores','Luiz Eduardo Borges','978-8550802282',2015,2,5,5),(9,'Estruturas de Dados e Algoritmos','Nell Dale','978-0123745153',2005,2,3,3),(10,'Clean Code','Robert C. Martin','978-0132350883',2008,2,6,6),(11,'O Código Da Vinci','Dan Brown','978-0307474278',2003,3,12,12),(12,'Sapiens: Uma Breve História da Humanidade','Yuval Noah Harari','978-0062316110',2014,3,9,9),(13,'O Gene: Uma História Íntima','Siddhartha Mukherjee','978-1442397861',2016,3,4,4),(14,'O Homem que Calculava','Malba Tahan','978-8532514602',1939,4,5,5),(15,'Steve Jobs','Walter Isaacson','978-1451648539',2011,4,7,7),(16,'Mahatma Gandhi: A Autobiografia','Mahatma Gandhi','978-8562533664',1998,4,5,5),(17,'O Pequeno Príncipe','Antoine de Saint-Exupéry','978-8535911454',1943,5,8,8),(18,'Orgulho e Preconceito','Jane Austen','978-0199535569',1813,5,6,6),(19,'A Odisséia','Homero','978-0192833723',800,5,7,7),(20,'O Homem Invisível','H.G. Wells','978-0486293152',1897,5,4,4),(21,'O Universo na Casca de Noz','Stephen Hawking','978-8522125946',2001,6,5,5);
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membros`
--

DROP TABLE IF EXISTS `membros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membros`
--

LOCK TABLES `membros` WRITE;
/*!40000 ALTER TABLE `membros` DISABLE KEYS */;
/*!40000 ALTER TABLE `membros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multas`
--

DROP TABLE IF EXISTS `multas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membro_id` int(11) DEFAULT NULL,
  `emprestimo_id` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `data_multa` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_membro_multa` (`membro_id`),
  KEY `fk_emprestimo_multa` (`emprestimo_id`),
  CONSTRAINT `fk_emprestimo_multa` FOREIGN KEY (`emprestimo_id`) REFERENCES `emprestimos` (`id`),
  CONSTRAINT `fk_membro_multa` FOREIGN KEY (`membro_id`) REFERENCES `membros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multas`
--

LOCK TABLES `multas` WRITE;
/*!40000 ALTER TABLE `multas` DISABLE KEYS */;
/*!40000 ALTER TABLE `multas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `livro_id` int(11) DEFAULT NULL,
  `membro_id` int(11) DEFAULT NULL,
  `data_reserva` date NOT NULL,
  `status` enum('reservado','cancelado','retirado') DEFAULT 'reservado',
  PRIMARY KEY (`id`),
  KEY `fk_livro_reserva` (`livro_id`),
  KEY `fk_membro_reserva` (`membro_id`),
  CONSTRAINT `fk_livro_reserva` FOREIGN KEY (`livro_id`) REFERENCES `livros` (`id`),
  CONSTRAINT `fk_membro_reserva` FOREIGN KEY (`membro_id`) REFERENCES `membros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'biblioteca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-08  9:53:45
