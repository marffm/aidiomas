-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.9-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para aliancaidiomas
CREATE DATABASE IF NOT EXISTS `aliancaidiomas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `aliancaidiomas`;


-- Copiando estrutura para tabela aliancaidiomas.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `nome` varchar(10) NOT NULL,
  `usuario` varchar(10) NOT NULL,
  `senha` varchar(8) NOT NULL,
  `nivel` int(11) unsigned NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.admin: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`nome`, `usuario`, `senha`, `nivel`) VALUES
	('Marcelo', 'Marcelo', '123', 1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.alemao
CREATE TABLE IF NOT EXISTS `alemao` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `quiz_1` varchar(50) DEFAULT NULL,
  `test_1` varchar(50) DEFAULT NULL,
  `quiz_2` varchar(50) DEFAULT NULL,
  `test_2` varchar(50) DEFAULT NULL,
  `sprechen` varchar(50) DEFAULT NULL,
  `hausau` varchar(50) DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `alemao_ibfk_1` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela aliancaidiomas.alemao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `alemao` DISABLE KEYS */;
INSERT INTO `alemao` (`b_level`, `codigo_aluno`, `semestre`, `quiz_1`, `test_1`, `quiz_2`, `test_2`, `sprechen`, `hausau`) VALUES
	('alemao', 1012250, '01/2016', '13', '42', '0', '0', '0', '0');
/*!40000 ALTER TABLE `alemao` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.aluno
CREATE TABLE IF NOT EXISTS `aluno` (
  `codigo` int(11) unsigned NOT NULL,
  `nome` varchar(25) COLLATE utf8_bin NOT NULL,
  `sobrenome` varchar(50) COLLATE utf8_bin NOT NULL,
  `nascimento` date NOT NULL,
  `telefone` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `usuario` varchar(10) COLLATE utf8_bin NOT NULL,
  `senha` varchar(9) COLLATE utf8_bin NOT NULL,
  `nivel` int(11) unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `acesso` (`nivel`),
  CONSTRAINT `acesso` FOREIGN KEY (`nivel`) REFERENCES `nivel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aliancaidiomas.aluno: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` (`codigo`, `nome`, `sobrenome`, `nascimento`, `telefone`, `email`, `usuario`, `senha`, `nivel`) VALUES
	(1012250, 'Ana Julia', 'Martins', '2004-12-20', '', '', 'anajuia', '12345678', 3),
	(1012260, 'Bibi', 'Martins', '2000-08-30', '123545345', '', 'bibi', '654', 3),
	(1122334, 'Mocinha', 'Martins', '2004-04-15', '333444555', '', 'mocinha', '123321', 3);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.aluno_boletins
CREATE TABLE IF NOT EXISTS `aluno_boletins` (
  `boletins_AB` varchar(10) NOT NULL,
  `codigo_aluno_AB` int(11) unsigned NOT NULL,
  KEY `aluno_AB` (`codigo_aluno_AB`),
  KEY `FK_aluno_boletins_boletins` (`boletins_AB`),
  CONSTRAINT `FK_aluno_boletins_boletins` FOREIGN KEY (`boletins_AB`) REFERENCES `boletins` (`boletins`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aluno_AB` FOREIGN KEY (`codigo_aluno_AB`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.aluno_boletins: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno_boletins` DISABLE KEYS */;
INSERT INTO `aluno_boletins` (`boletins_AB`, `codigo_aluno_AB`) VALUES
	('b1-e', 1122334),
	('b1-e', 1012250),
	('b2-e', 1012260),
	('a2-e', 1012250),
	('alemao', 1012250),
	('ingles', 1012250);
/*!40000 ALTER TABLE `aluno_boletins` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.aluno_grupo
CREATE TABLE IF NOT EXISTS `aluno_grupo` (
  `cod_grupo` int(11) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  KEY `cod_aluno` (`codigo_aluno`),
  KEY `cod_grupo` (`cod_grupo`),
  CONSTRAINT `cod_aluno` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cod_grupo` FOREIGN KEY (`cod_grupo`) REFERENCES `grupo` (`cod_grupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.aluno_grupo: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno_grupo` DISABLE KEYS */;
INSERT INTO `aluno_grupo` (`cod_grupo`, `codigo_aluno`) VALUES
	(1109, 1122334),
	(511, 1012250),
	(1234, 1012250),
	(1122, 1012250),
	(2830, 1012250);
/*!40000 ALTER TABLE `aluno_grupo` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.boletins
CREATE TABLE IF NOT EXISTS `boletins` (
  `boletins` varchar(10) NOT NULL,
  `nome_boletim` varchar(15) NOT NULL,
  `idioma_boletins` int(11) NOT NULL,
  PRIMARY KEY (`boletins`),
  KEY `idiomas_boletins` (`idioma_boletins`),
  CONSTRAINT `idiomas_boletins` FOREIGN KEY (`idioma_boletins`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.boletins: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `boletins` DISABLE KEYS */;
INSERT INTO `boletins` (`boletins`, `nome_boletim`, `idioma_boletins`) VALUES
	('a1-e', 'espanhol_a1', 2),
	('a2-e', 'espanhol_a2', 2),
	('alemao', 'alemao', 4),
	('b1-e', 'espanhol_b1', 2),
	('b2-e', 'espanhol_b2', 2),
	('frances', 'frances', 3),
	('ingles', 'ingles', 1);
/*!40000 ALTER TABLE `boletins` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.espanhol_a1
CREATE TABLE IF NOT EXISTS `espanhol_a1` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `unidade123` varchar(50) DEFAULT NULL,
  `unidade456` varchar(50) DEFAULT NULL,
  `unidade789` varchar(50) DEFAULT NULL,
  `mediafinal` varchar(50) DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `espanhol_a1_ibfk_1` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela aliancaidiomas.espanhol_a1: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `espanhol_a1` DISABLE KEYS */;
/*!40000 ALTER TABLE `espanhol_a1` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.espanhol_a2
CREATE TABLE IF NOT EXISTS `espanhol_a2` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `unidade123` varchar(50) DEFAULT NULL,
  `unidade456` varchar(50) DEFAULT NULL,
  `unidade78910` varchar(50) DEFAULT NULL,
  `proyectolectura` varchar(50) DEFAULT NULL,
  `mediafinal` varchar(50) DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `espanhol_a2_ibfk_1` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela aliancaidiomas.espanhol_a2: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `espanhol_a2` DISABLE KEYS */;
INSERT INTO `espanhol_a2` (`b_level`, `codigo_aluno`, `semestre`, `unidade123`, `unidade456`, `unidade78910`, `proyectolectura`, `mediafinal`) VALUES
	('a2-e', 1012250, '01/2016', 'teste 32', '0', '0', '0', '0');
/*!40000 ALTER TABLE `espanhol_a2` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.espanhol_b1
CREATE TABLE IF NOT EXISTS `espanhol_b1` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `unidade123` varchar(50) DEFAULT NULL,
  `unidade456` varchar(50) DEFAULT NULL,
  `unidade789` varchar(50) DEFAULT NULL,
  `unidade101112` varchar(50) DEFAULT NULL,
  `proyectolectura` varchar(50) DEFAULT NULL,
  `mediafinal` varchar(50) DEFAULT NULL,
  KEY `aluno` (`codigo_aluno`),
  CONSTRAINT `aluno` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.espanhol_b1: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `espanhol_b1` DISABLE KEYS */;
INSERT INTO `espanhol_b1` (`b_level`, `codigo_aluno`, `semestre`, `unidade123`, `unidade456`, `unidade789`, `unidade101112`, `proyectolectura`, `mediafinal`) VALUES
	('b1-e', 1122334, '01/2016', '56', '87', '45', '0', '0', '0'),
	('b1-e', 1012250, '01/2016', '100', '45', '0', '0', '0', '0');
/*!40000 ALTER TABLE `espanhol_b1` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.espanhol_b2
CREATE TABLE IF NOT EXISTS `espanhol_b2` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `unidade12345` varchar(50) DEFAULT NULL,
  `unidade678910` varchar(50) DEFAULT NULL,
  `proyectolectura` varchar(50) DEFAULT NULL,
  `mediafinal` varchar(50) DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `FK_espanhol_b2_aluno` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.espanhol_b2: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `espanhol_b2` DISABLE KEYS */;
INSERT INTO `espanhol_b2` (`b_level`, `codigo_aluno`, `semestre`, `unidade12345`, `unidade678910`, `proyectolectura`, `mediafinal`) VALUES
	('b2-e', 1012260, '02/2016', '83', '12', '0', '0');
/*!40000 ALTER TABLE `espanhol_b2` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.frances
CREATE TABLE IF NOT EXISTS `frances` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `eleve` varchar(20) NOT NULL,
  `methode` varchar(50) DEFAULT NULL,
  `niveau` varchar(50) DEFAULT NULL,
  `moyenne` varchar(50) DEFAULT NULL,
  `travailles_unite1` varchar(50) DEFAULT NULL,
  `travailles_unite2` varchar(50) DEFAULT NULL,
  `travailles_unite3` varchar(50) DEFAULT NULL,
  `travailles_unite4` varchar(50) DEFAULT NULL,
  `devoirs_unite1` varchar(50) DEFAULT NULL,
  `devoirs_unite2` varchar(50) DEFAULT NULL,
  `devoirs_unite3` varchar(50) DEFAULT NULL,
  `devoirs_unite4` varchar(50) DEFAULT NULL,
  `participation` varchar(50) DEFAULT NULL,
  `davoirs_1` varchar(50) DEFAULT NULL,
  `performance` varchar(50) DEFAULT NULL,
  `test_ecrit1` varchar(50) DEFAULT NULL,
  `total_1` varchar(50) DEFAULT NULL,
  `lecture` varchar(50) DEFAULT NULL,
  `devoirs_2` varchar(50) DEFAULT NULL,
  `test_oral` varchar(50) DEFAULT NULL,
  `test_ecrit2` varchar(50) DEFAULT NULL,
  `total_2` varchar(50) DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `frances_ibfk_1` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela aliancaidiomas.frances: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `frances` DISABLE KEYS */;
/*!40000 ALTER TABLE `frances` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.grupo
CREATE TABLE IF NOT EXISTS `grupo` (
  `cod_grupo` int(11) NOT NULL,
  `idioma` int(11) NOT NULL,
  `level_grupo` varchar(10) COLLATE utf8_bin NOT NULL,
  `codigo_professor` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cod_grupo`),
  KEY `idioma_grupo` (`idioma`),
  CONSTRAINT `idioma_grupo` FOREIGN KEY (`idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aliancaidiomas.grupo: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` (`cod_grupo`, `idioma`, `level_grupo`, `codigo_professor`) VALUES
	(511, 1, 'a2-e', 2),
	(1109, 2, 'b1-e', 1),
	(1122, 1, 'ingles', 1),
	(1234, 4, 'alemao', 4),
	(2830, 1, 'b2-e', 1);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.idiomas
CREATE TABLE IF NOT EXISTS `idiomas` (
  `nome_idioma` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aliancaidiomas.idiomas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `idiomas` DISABLE KEYS */;
INSERT INTO `idiomas` (`nome_idioma`, `id`) VALUES
	('Inglês', 1),
	('Espanhol', 2),
	('Francês', 3),
	('Alemão', 4),
	('Português', 5);
/*!40000 ALTER TABLE `idiomas` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.ingles
CREATE TABLE IF NOT EXISTS `ingles` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `quiz_1` varchar(20) DEFAULT NULL,
  `test_1` varchar(20) DEFAULT NULL,
  `participacao_1` varchar(20) DEFAULT NULL,
  `media_1` varchar(20) DEFAULT NULL,
  `quiz_2` varchar(20) DEFAULT NULL,
  `test_2` varchar(20) DEFAULT NULL,
  `oral_test` varchar(20) DEFAULT NULL,
  `mocks` varchar(20) DEFAULT NULL,
  `reading` varchar(20) DEFAULT NULL,
  `participacao_2` varchar(20) DEFAULT NULL,
  `multroom` varchar(20) DEFAULT NULL,
  `media_2` varchar(20) DEFAULT NULL,
  `media_final` varchar(20) DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `ingles_ibfk_1` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela aliancaidiomas.ingles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ingles` DISABLE KEYS */;
INSERT INTO `ingles` (`b_level`, `codigo_aluno`, `semestre`, `quiz_1`, `test_1`, `participacao_1`, `media_1`, `quiz_2`, `test_2`, `oral_test`, `mocks`, `reading`, `participacao_2`, `multroom`, `media_2`, `media_final`) VALUES
	('ingles', 1012250, '01/2016', '10', '10', '10', '10', '10', '22', '10', '66', '10', '22', '78', '66', 'teste 32');
/*!40000 ALTER TABLE `ingles` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.mural
CREATE TABLE IF NOT EXISTS `mural` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `summary` tinytext NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.mural: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `mural` DISABLE KEYS */;
INSERT INTO `mural` (`id`, `title`, `summary`, `content`, `date`) VALUES
	(1, 'TOEFL - Test of English as a Foreign Language', 'O Centro Linguistico de Franca prepara os candidatos para exame de TOEFL.', 'INGLÊS TOEFL – (Test of English as a Foreign Language) Ou Teste de Inglês como uma Língua Estrangeira é um exame que tem o objetivo de avaliar o potencial individual de falar e entender o inglês em nível acadêmico. O Centro Linguístico de Franca prepara os candidatos para exame de TOEFL. É requerido para a maior parte dos estudantes estrangeiros que tentam ingressar em uma universidade de um país em que inglesa é a primeira língua. Além disso, instituições com agências governamentais, empresas e programas de estudo podem exigir o teste. A nota no TOEFL é válida por apenas dois anos - após esse prazo, ela é eliminada do banco de dados. O TOEFL é uma marca registrada da Educational Testing Service (Serviço de Testes Educacionais; ETS). O primeiro teste foi realizado em 1964 e, desde então, aproximadamente mais 20 milhões de estudantes já o fizeram. Mais de 2.400 faculdades e universidades nos Estados Unidos e no Canadá exigem o TOEFL como requisito de admissão em seus cursos. Órgãos governamentais e programas de bolsa de estudos também o utilizam para avaliar a proficiência em inglês. O TOEFL pode ser complementado pelo TWE (Test of Written English – Teste de Inglês Escrito) TSE (Test of Spoken English – Teste de Inglês Oral).', '2016-01-20'),
	(2, 'TOEIC - Test of English for International Communication', 'O Centro Linguistico de Franca prepara os candidatos e tambem um centro aplicador do TOEIC', 'INGLÊS TOEIC (Test of English for International Communication) O que é: Teste de Inglês para comunicação Internacional. Quem o presta e Por quê: falantes não nativos o prestam para demonstrar suas habilidades linguísticas Inglesas quando se candidatam a novas posições ou para obterem credenciais. Onde prestá-lo e como se preparar: em escolas de Idiomas. O Centro Linguístico de Franca prepara os candidatos e é também um centro aplicador do TOEIC Quem aceita: o teste é altamente aceito por corporações, programas de Língua Inglesa e agências governamentais no mundo inteiro. •As corporações usam o TOEIC para documentar o progresso nos treinamentos recrutar e promover funcionários. Programas de Inglês usam-no para colocar alunos no nível correto de aprendizagem e mostrar aos alunos seu progresso e efetividade do programa. •Agências governamentais usam-no para documentar o progresso nos programas de treinamento e recrutar, promover e contratar funcionários. • Formato do teste: é um teste de múltipla escolha que utiliza áudio, figuras e material escrito para avaliar as habilidades na língua inglesa.', '2016-01-20');
/*!40000 ALTER TABLE `mural` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.nivel
CREATE TABLE IF NOT EXISTS `nivel` (
  `nivel` varchar(10) COLLATE utf8_bin NOT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aliancaidiomas.nivel: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT INTO `nivel` (`nivel`, `id`) VALUES
	('admin', 1),
	('professor', 2),
	('aluno', 3);
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.professor
CREATE TABLE IF NOT EXISTS `professor` (
  `nome_prof` varchar(25) COLLATE utf8_bin NOT NULL,
  `sobrenome_prof` varchar(50) COLLATE utf8_bin NOT NULL,
  `telefone_prof` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `email_prof` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `idioma` int(2) NOT NULL,
  `usuario_prof` varchar(15) COLLATE utf8_bin NOT NULL,
  `senha_prof` varchar(8) COLLATE utf8_bin NOT NULL,
  `nivel` int(11) unsigned NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `idiomas` (`idioma`),
  KEY `access` (`nivel`),
  CONSTRAINT `idiomas` FOREIGN KEY (`idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aliancaidiomas.professor: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` (`nome_prof`, `sobrenome_prof`, `telefone_prof`, `email_prof`, `idioma`, `usuario_prof`, `senha_prof`, `nivel`, `id`) VALUES
	('Fabiana', 'Fernandes', '(16) 3701 0550', 'teste@teste.com.br', 1, 'fabiana', '456', 2, 1),
	('Leticia', 'Fernandes', '(16) 3721 0550', '', 2, 'leticia', '789', 2, 2),
	('Ana', 'Juia Martins', '16 - 3701 0550', '', 4, 'anajuia', '123456', 2, 4);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.recado_grupo
CREATE TABLE IF NOT EXISTS `recado_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_grupo` int(11) NOT NULL DEFAULT '0',
  `titulo_recado` varchar(50) NOT NULL,
  `conteudo_recado` varchar(200) NOT NULL,
  `data_recado` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `grupo` (`cod_grupo`),
  CONSTRAINT `grupo` FOREIGN KEY (`cod_grupo`) REFERENCES `grupo` (`cod_grupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.recado_grupo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `recado_grupo` DISABLE KEYS */;
INSERT INTO `recado_grupo` (`id`, `cod_grupo`, `titulo_recado`, `conteudo_recado`, `data_recado`) VALUES
	(4, 511, 'test', 'tes25', '2016-04-24'),
	(5, 511, 't2', 't55', '2016-04-24'),
	(7, 1234, 'This is a test for Deutsch', 'This is a test for this group', '2016-04-24');
/*!40000 ALTER TABLE `recado_grupo` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
