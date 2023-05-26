-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 26-Maio-2023 às 22:09
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `contratos_bd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `Tb_banco`
--

CREATE TABLE `Tb_banco` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `Tb_banco`
--

INSERT INTO `Tb_banco` (`codigo`, `nome`) VALUES
(1, 'Banco A'),
(2, 'Banco B'),
(3, 'Banco C'),
(4, 'Banco D'),
(5, 'Banco E');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Tb_contrato`
--

CREATE TABLE `Tb_contrato` (
  `codigo` int(11) NOT NULL,
  `prazo` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `data_inclusao` date DEFAULT NULL,
  `convenio_servico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `Tb_contrato`
--

INSERT INTO `Tb_contrato` (`codigo`, `prazo`, `valor`, `data_inclusao`, `convenio_servico`) VALUES
(1, 30, '1000.00', '2023-01-01', 1),
(2, 60, '2000.00', '2023-02-01', 2),
(3, 90, '3000.00', '2023-03-01', 3),
(4, 120, '4000.00', '2023-04-01', 4),
(5, 150, '5000.00', '2023-05-01', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Tb_convenio`
--

CREATE TABLE `Tb_convenio` (
  `codigo` int(11) NOT NULL,
  `convenio` varchar(100) DEFAULT NULL,
  `verba` varchar(100) DEFAULT NULL,
  `banco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `Tb_convenio`
--

INSERT INTO `Tb_convenio` (`codigo`, `convenio`, `verba`, `banco`) VALUES
(1, 'Convenio 1', 'Verba 1', 1),
(2, 'Convenio 2', 'Verba 2', 2),
(3, 'Convenio 3', 'Verba 3', 3),
(4, 'Convenio 4', 'Verba 4', 4),
(5, 'Convenio 5', 'Verba 5', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Tb_convenio_servico`
--

CREATE TABLE `Tb_convenio_servico` (
  `codigo` int(11) NOT NULL,
  `convenio` int(11) DEFAULT NULL,
  `servico` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `Tb_convenio_servico`
--

INSERT INTO `Tb_convenio_servico` (`codigo`, `convenio`, `servico`) VALUES
(1, 1, 'Servico A'),
(2, 2, 'Servico B'),
(3, 3, 'Servico C'),
(4, 4, 'Servico D'),
(5, 5, 'Servico E');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `Tb_banco`
--
ALTER TABLE `Tb_banco`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `Tb_contrato`
--
ALTER TABLE `Tb_contrato`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `convenio_servico` (`convenio_servico`);

--
-- Índices para tabela `Tb_convenio`
--
ALTER TABLE `Tb_convenio`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `banco` (`banco`);

--
-- Índices para tabela `Tb_convenio_servico`
--
ALTER TABLE `Tb_convenio_servico`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `convenio` (`convenio`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `Tb_contrato`
--
ALTER TABLE `Tb_contrato`
  ADD CONSTRAINT `tb_contrato_ibfk_1` FOREIGN KEY (`convenio_servico`) REFERENCES `Tb_convenio_servico` (`codigo`);

--
-- Limitadores para a tabela `Tb_convenio`
--
ALTER TABLE `Tb_convenio`
  ADD CONSTRAINT `tb_convenio_ibfk_1` FOREIGN KEY (`banco`) REFERENCES `Tb_banco` (`codigo`);

--
-- Limitadores para a tabela `Tb_convenio_servico`
--
ALTER TABLE `Tb_convenio_servico`
  ADD CONSTRAINT `tb_convenio_servico_ibfk_1` FOREIGN KEY (`convenio`) REFERENCES `Tb_convenio` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
