-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB

--
-- Estrutura da tabela CATEGORIAS
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `IdCategorias` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`IdCategorias`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
-- Tabela para categorizar os livros.

--
-- Dados da tabela CATEGORIAS
--

INSERT INTO `categorias` VALUES 
(1, 'Ficção'),
(2, 'Tecnologia'),
(3, 'História'),
(4, 'Biografia'),
(5, 'Literatura Clássica'),
(6, 'Ciência');

--
-- Estrutura da tabela EMPRESTIMO
--

DROP TABLE IF EXISTS `emprestimos`;
CREATE TABLE `emprestimos` (
  `IdEmprestimos` int(11) NOT NULL AUTO_INCREMENT,
  `livro_id` int(11) DEFAULT NULL,
  `membro_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `data_emprestimo` date NOT NULL,
  `data_devolucao` date DEFAULT NULL,
  `status` enum('emprestado','devolvido','atrasado') DEFAULT 'emprestado',
  PRIMARY KEY (`IdEmprestimos`),
  KEY `fk_livro` (`livro_id`),
  KEY `fk_membro` (`membro_id`),
  KEY `fk_funcionario` (`funcionario_id`),
  CONSTRAINT `fk_funcionario` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id_funcionarios`),
  CONSTRAINT `fk_livro` FOREIGN KEY (`livro_id`) REFERENCES `livros` (`id_livros`),
  CONSTRAINT `fk_membro` FOREIGN KEY (`membro_id`) REFERENCES `membros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
--Tabela para registrar os empréstimos de livros.


--
-- Estrutura da tabela FUNCIONARISO
--

DROP TABLE IF EXISTS `funcionarios`;
CREATE TABLE `funcionarios` (
  `IdFuncionarios` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IdFuncionarios`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
--Tabela para registrar os funcionários da biblioteca.

--
-- Estrutura da tabela LIVROS
--

DROP TABLE IF EXISTS `livros`;
CREATE TABLE `livros` (
  `IdLivros` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `ano_publicacao` int(11) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT 0,
  `disponivel` int(11) DEFAULT 0,
  PRIMARY KEY (`IdLivros`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `fk_categoria` (`categoria_id`),
  CONSTRAINT `fk_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id_categorias`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
-- Tabela para registrar os livros disponíveis na biblioteca.

--
-- Dados da tabela `livros`
--

INSERT INTO `livros` VALUES 
(1,'Dom Casmurro','Machado de Assis','978-8535908342',1899,1,5,5),
(2,'O Primo Basílio','José de Alencar','978-8520931967',1882,1,3,3),
(3,'O Alienista','Machado de Assis','978-8520932049',1882,1,4,4),
(4,'1984','George Orwell','978-0451524935',1949,1,6,6),
(5,'O Senhor dos Anéis','J.R.R. Tolkien','978-0261102385',1954,1,10,10),(6,'A Revolução dos Bichos','George Orwell','978-0451526342',1945,1,7,7),(7,'Java: Como Programar','Paul Deitel','978-0132354881',2011,2,8,8),
(8,'Python para Desenvolvedores','Luiz Eduardo Borges','978-8550802282',2015,2,5,5),
(9,'Estruturas de Dados e Algoritmos','Nell Dale','978-0123745153',2005,2,3,3),
(10,'Clean Code','Robert C. Martin','978-0132350883',2008,2,6,6),
(11,'O Código Da Vinci','Dan Brown','978-0307474278',2003,3,12,12),
(12,'Sapiens: Uma Breve História da Humanidade','Yuval Noah Harari','978-0062316110',2014,3,9,9),
(13,'O Gene: Uma História Íntima','Siddhartha Mukherjee','978-1442397861',2016,3,4,4),
(14,'O Homem que Calculava','Malba Tahan','978-8532514602',1939,4,5,5),(15,'Steve Jobs','Walter Isaacson','978-1451648539',2011,4,7,7),
(16,'Mahatma Gandhi: A Autobiografia','Mahatma Gandhi','978-8562533664',1998,4,5,5),
(17,'O Pequeno Príncipe','Antoine de Saint-Exupéry','978-8535911454',1943,5,8,8),
(18,'Orgulho e Preconceito','Jane Austen','978-0199535569',1813,5,6,6),(19,'A Odisséia','Homero','978-0192833723',800,5,7,7),
(20,'O Homem Invisível','H.G. Wells','978-0486293152',1897,5,4,4),
(21,'O Universo na Casca de Noz','Stephen Hawking','978-8522125946',2001,6,5,5);
UNLOCK TABLES;

--
-- Estrutura da tabela MEMBROS
--

DROP TABLE IF EXISTS `membros`;
CREATE TABLE `membros` (
  `IdMembros` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`IdMembros`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
--Tabela para registrar os membros cadastrados na biblioteca.

--
-- Estrutura da tabela MULTAS
--

DROP TABLE IF EXISTS `multas`;
CREATE TABLE `multas` (
  `IdMultas` int(11) NOT NULL AUTO_INCREMENT,
  `membro_id` int(11) DEFAULT NULL,
  `emprestimo_id` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `data_multa` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`IdMultas`),
  KEY `fk_membro_multa` (`membro_id`),
  KEY `fk_emprestimo_multa` (`emprestimo_id`),
  CONSTRAINT `fk_emprestimo_multa` FOREIGN KEY (`emprestimo_id`) REFERENCES `emprestimos` (`id_emprestimos`),
  CONSTRAINT `fk_membro_multa` FOREIGN KEY (`membro_id`) REFERENCES `membros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
-- Comentário: Tabela para registrar as multas aplicadas aos membros.

--
-- Estrutura da tabela RESERVAS
--

DROP TABLE IF EXISTS `reservas`;
CREATE TABLE `reservas` (
  `IdReservas` int(11) NOT NULL AUTO_INCREMENT,
  `livro_id` int(11) DEFAULT NULL,
  `membro_id` int(11) DEFAULT NULL,
  `data_reserva` date NOT NULL,
  `status` enum('reservado','cancelado','retirado') DEFAULT 'reservado',
  PRIMARY KEY (`IdReservas`),
  KEY `fk_livro_reserva` (`livro_id`),
  KEY `fk_membro_reserva` (`membro_id`),
  CONSTRAINT `fk_livro_reserva` FOREIGN KEY (`livro_id`) REFERENCES `livros` (`id_livros`),
  CONSTRAINT `fk_membro_reserva` FOREIGN KEY (`membro_id`) REFERENCES `membros` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
--Tabela para gerenciar as reservas de livros feitas pelos membros.
