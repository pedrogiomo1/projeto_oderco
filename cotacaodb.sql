-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Out-2022 às 23:16
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cotacaodb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cotacao_frete`
--

CREATE TABLE `cotacao_frete` (
  `id` int(11) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `percentual_cotacao` decimal(10,2) NOT NULL,
  `valor_extra` decimal(10,2) NOT NULL,
  `transportadora_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cotacao_frete`
--

INSERT INTO `cotacao_frete` (`id`, `uf`, `percentual_cotacao`, `valor_extra`, `transportadora_id`) VALUES
(1, 'PR', '2.95', '14.35', 1),
(2, 'PR', '3.15', '0.00', 2),
(8, 'PR', '3.65', '12.50', 3),
(9, 'PR', '4.00', '13.70', 4),
(10, 'PR', '3.55', '13.10', 5),
(11, 'SP', '3.55', '13.10', 1),
(12, 'SP', '2.55', '12.10', 2),
(13, 'SP', '3.25', '0.00', 3),
(14, 'SP', '3.95', '10.00', 4),
(15, 'SP', '4.55', '8.00', 5),
(16, 'AC', '2.00', '8.00', 1),
(17, 'AC', '4.55', '8.00', 5),
(18, 'BA', '5.00', '10.90', 4),
(19, 'PB', '3.00', '5.00', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `transportadora`
--

CREATE TABLE `transportadora` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `transportadora`
--

INSERT INTO `transportadora` (`id`, `nome`) VALUES
(1, 'Kangu'),
(2, 'Loggi'),
(3, 'Mandaê'),
(4, 'TNT'),
(5, 'TSV');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cotacao_frete`
--
ALTER TABLE `cotacao_frete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cotacao_frete_transportadora_idx` (`transportadora_id`);

--
-- Índices para tabela `transportadora`
--
ALTER TABLE `transportadora`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cotacao_frete`
--
ALTER TABLE `cotacao_frete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `transportadora`
--
ALTER TABLE `transportadora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cotacao_frete`
--
ALTER TABLE `cotacao_frete`
  ADD CONSTRAINT `fk_cotacao_frete_transportadora_idx` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadora` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
