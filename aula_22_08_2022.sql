SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `projeto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projeto`;

DROP TABLE IF EXISTS `competencias`;
CREATE TABLE `competencias` (
  `id_comp` int(11) NOT NULL,
  `competencia` varchar(255) DEFAULT NULL,
  `id_curr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `competencias` (`id_comp`, `competencia`, `id_curr`) VALUES
(1, 'Lider de Equipe', 4),
(2, 'Lider de Equipe', 5),
(3, 'KING OF MONKEYCADA', 7);

DROP TABLE IF EXISTS `curriculo`;
CREATE TABLE `curriculo` (
  `id_curr` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `curso` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `curriculo` (`id_curr`, `nome`, `email`, `telefone`, `curso`) VALUES
(1, 'ANDERSON VANIN', 'teste@email.com', '11999998888', 'Teste de curso'),
(3, 'ALUNO DA SILVA', 'aluno@email.com', '(11)9 8765-432', 'ARQUITETURA'),
(4, 'CICLANO DA SILVA', 'ciclano@email.com', '(11)9 8765-432', 'ARQUITETURA'),
(5, 'Julia', 'julia@email.com', '(11)9 9999-999', 'dfasdfasdf'),
(6, 'Criatura', 'criatura@email.com', '(11)8 9745-642', 'ENGENHARIA DE SOFTWARE'),
(7, 'SotZzz', 'teste@teste', '(11)9 4335-234', 'TECNICO EM MOVIMENTOS RETILINEOS PARA FRENTE E PARA TRÁS');

DROP TABLE IF EXISTS `educacao`;
CREATE TABLE `educacao` (
  `id_educ` int(11) NOT NULL,
  `instituicao` varchar(255) DEFAULT NULL,
  `curso` varchar(255) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fim` date DEFAULT NULL,
  `id_curr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `educacao` (`id_educ`, `instituicao`, `curso`, `inicio`, `fim`, `id_curr`) VALUES
(1, 'Josephina Hernandez', 'Ensino Fundamental', '2018-02-01', '2019-12-31', 5),
(2, 'whall disney KK', 'TECNICO EM MOVIMENTOS RETILINEOS PARA FRENTE E PARA TRÁS', '1989-03-29', '2022-10-01', 7);

DROP TABLE IF EXISTS `experiencia`;
CREATE TABLE `experiencia` (
  `id_exp` int(11) NOT NULL,
  `empresa` varchar(255) DEFAULT NULL,
  `ocupacao` varchar(255) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fim` date DEFAULT NULL,
  `id_curr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `experiencia` (`id_exp`, `empresa`, `ocupacao`, `inicio`, `fim`, `id_curr`) VALUES
(1, 'sla', 'nsei', '2022-08-03', '2022-09-09', 7);

DROP TABLE IF EXISTS `habilidades`;
CREATE TABLE `habilidades` (
  `id_hab` int(11) NOT NULL,
  `habilidade` varchar(255) DEFAULT NULL,
  `id_curr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `habilidades` (`id_hab`, `habilidade`, `id_curr`) VALUES
(1, 'bom de papo', 3),
(2, 'COMUNICATIVO', 4),
(3, 'espontâneo', 4),
(4, 'Ser muito bom no que faz', 4),
(5, 'Torço para o palmeiras', 5),
(6, 'jhdsaljkhfjhasdjlfh', 5),
(7, 'SoU MUITO felIZ', 6),
(8, 'naosei', 1),
(9, 'BRabo .?', 7);

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `cpf`, `tipo`) VALUES
(1, 'SotZzz', 'teste@teste', '202cb962ac59075b964b07152d234b70', '123.456.789-20', 1);


ALTER TABLE `competencias`
  ADD PRIMARY KEY (`id_comp`),
  ADD KEY `id_curr` (`id_curr`);

ALTER TABLE `curriculo`
  ADD PRIMARY KEY (`id_curr`);

ALTER TABLE `educacao`
  ADD PRIMARY KEY (`id_educ`),
  ADD KEY `id_curr` (`id_curr`);

ALTER TABLE `experiencia`
  ADD PRIMARY KEY (`id_exp`),
  ADD KEY `id_curr` (`id_curr`);

ALTER TABLE `habilidades`
  ADD PRIMARY KEY (`id_hab`),
  ADD KEY `id_curr` (`id_curr`);

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `competencias`
  MODIFY `id_comp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `curriculo`
  MODIFY `id_curr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `educacao`
  MODIFY `id_educ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `experiencia`
  MODIFY `id_exp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `habilidades`
  MODIFY `id_hab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


ALTER TABLE `competencias`
  ADD CONSTRAINT `competencias_ibfk_1` FOREIGN KEY (`id_curr`) REFERENCES `curriculo` (`id_curr`);

ALTER TABLE `educacao`
  ADD CONSTRAINT `educacao_ibfk_1` FOREIGN KEY (`id_curr`) REFERENCES `curriculo` (`id_curr`);

ALTER TABLE `experiencia`
  ADD CONSTRAINT `experiencia_ibfk_1` FOREIGN KEY (`id_curr`) REFERENCES `curriculo` (`id_curr`);

ALTER TABLE `habilidades`
  ADD CONSTRAINT `habilidades_ibfk_1` FOREIGN KEY (`id_curr`) REFERENCES `curriculo` (`id_curr`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
