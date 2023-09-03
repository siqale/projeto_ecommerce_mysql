SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `desafio_ecommerce_base`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `IDCliente` int NOT NULL,
  `FName` varchar(255) NOT NULL,
  `NInit` char(3) DEFAULT NULL,
  `LName` varchar(255) NOT NULL,
  `cpf` char(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `birthdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `IDestoque` int NOT NULL,
  `local` varchar(45) NOT NULL,
  `quantidade` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `IDfornecedor` int NOT NULL,
  `razao_social` varchar(255) NOT NULL,
  `nome_fantasia` varchar(45) NOT NULL,
  `cnpj` char(14) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `contato` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor_has_produto`
--

CREATE TABLE `fornecedor_has_produto` (
  `produto_IDProduto` int NOT NULL,
  `fornecedor_IDfornecedor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Estrutura para tabela `payments`
--

CREATE TABLE `payments` (
  `IDpayments` int NOT NULL,
  `cliente_IDCliente` int NOT NULL,
  `available_limit` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `payments`
--

INSERT INTO `payments` (`IDpayments`, `cliente_IDCliente`, `available_limit`) VALUES
(9, 11, 500),
(10, 12, 1000),
(11, 13, 750),
(12, 14, 300),
(13, 15, 1200),
(14, 16, 800),
(15, 17, 600),
(16, 18, 1500);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `IDPedido` int NOT NULL,
  `cliente_IDCliente` int NOT NULL,
  `statusPedido` enum('Em Processamento','Cancelado','Enviado') DEFAULT 'Em Processamento',
  `descricaoPedido` varchar(255) NOT NULL,
  `sendValue` float NOT NULL DEFAULT '10',
  `cash_payment` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `IDProduto` int NOT NULL,
  `NomeProduto` varchar(255) DEFAULT NULL,
  `preco` float NOT NULL COMMENT 'PreÃ§o do produto nÃ£o previsto no projeto original, porÃ©m Ã© necessÃ¡rio',
  `classification_kids` enum('0','1') NOT NULL DEFAULT '0',
  `category` enum('Vestimentas','Brinquedos','EletrÃ´nicos','Alimentos') NOT NULL,
  `avaliacao` float DEFAULT '0' COMMENT 'Estrelas que os clientes darÃ£o ao produto. Pode ser que na mÃ©dia seja float',
  `size` int DEFAULT NULL COMMENT 'DimensÃ£o do produto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_has_estoque`
--

CREATE TABLE `produto_has_estoque` (
  `produto_IDProduto` int NOT NULL,
  `estoque_IDestoque` int NOT NULL,
  `quantidade` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_has_pedido`
--

CREATE TABLE `produto_has_pedido` (
  `pedido_IDPedido` int NOT NULL,
  `produto_IDProduto` int NOT NULL,
  `quantidade` int NOT NULL,
  `status` enum('DISPONÃVEL','FORA DE ESTOQUE') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Estrutura para tabela `terceiro_vendedor`
--

CREATE TABLE `terceiro_vendedor` (
  `IDTerceiro_Vendedor` int NOT NULL,
  `nome_razao_social` varchar(255) NOT NULL,
  `cnpj` char(14) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `local` varchar(45) DEFAULT NULL,
  `nome_fantasia` varchar(45) DEFAULT NULL,
  `endereco` varchar(255) NOT NULL,
  `contato` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Estrutura para tabela `terceiro_vendedor_has_produto`
--

CREATE TABLE `terceiro_vendedor_has_produto` (
  `produto_IDProduto` int NOT NULL,
  `terceiro_vendedor_IDterceiro_vendedor` int NOT NULL,
  `quantidade` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`IDCliente`),
  ADD UNIQUE KEY `unique_cpf_client` (`cpf`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`IDestoque`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`IDfornecedor`),
  ADD UNIQUE KEY `unique_cnpj_fornecedor` (`cnpj`);

--
-- Índices de tabela `fornecedor_has_produto`
--
ALTER TABLE `fornecedor_has_produto`
  ADD PRIMARY KEY (`produto_IDProduto`,`fornecedor_IDfornecedor`),
  ADD KEY `fk_fornecedor_has_produto_fornecedor1` (`fornecedor_IDfornecedor`);

--
-- Índices de tabela `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`IDpayments`,`cliente_IDCliente`),
  ADD KEY `fk_payments_cliente1` (`cliente_IDCliente`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`IDPedido`,`cliente_IDCliente`),
  ADD KEY `fk_pedido_cliente` (`cliente_IDCliente`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`IDProduto`);

--
-- Índices de tabela `produto_has_estoque`
--
ALTER TABLE `produto_has_estoque`
  ADD PRIMARY KEY (`produto_IDProduto`,`estoque_IDestoque`),
  ADD KEY `fk_produto_has_estoque_estoque1` (`estoque_IDestoque`);

--
-- Índices de tabela `produto_has_pedido`
--
ALTER TABLE `produto_has_pedido`
  ADD PRIMARY KEY (`pedido_IDPedido`,`produto_IDProduto`),
  ADD KEY `fk_produto_has_pedido_produto1` (`produto_IDProduto`);

--
-- Índices de tabela `terceiro_vendedor`
--
ALTER TABLE `terceiro_vendedor`
  ADD PRIMARY KEY (`IDTerceiro_Vendedor`);

--
-- Índices de tabela `terceiro_vendedor_has_produto`
--
ALTER TABLE `terceiro_vendedor_has_produto`
  ADD PRIMARY KEY (`produto_IDProduto`,`terceiro_vendedor_IDterceiro_vendedor`),
  ADD KEY `fk_Terceiro_Vendedor_has_produto_produto1_idx` (`produto_IDProduto`),
  ADD KEY `fk_Terceiro_Vendedor_has_produto_Terceiro_Vendedor1_idx` (`terceiro_vendedor_IDterceiro_vendedor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `IDCliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `IDestoque` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `IDfornecedor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `payments`
--
ALTER TABLE `payments`
  MODIFY `IDpayments` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `IDPedido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `IDProduto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `terceiro_vendedor`
--
ALTER TABLE `terceiro_vendedor`
  MODIFY `IDTerceiro_Vendedor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `fornecedor_has_produto`
--
ALTER TABLE `fornecedor_has_produto`
  ADD CONSTRAINT `fk_fornecedor_has_produto_fornecedor1` FOREIGN KEY (`fornecedor_IDfornecedor`) REFERENCES `fornecedor` (`IDfornecedor`),
  ADD CONSTRAINT `fk_fornercedor_has_produto_produto1` FOREIGN KEY (`produto_IDProduto`) REFERENCES `produto` (`IDProduto`);

--
-- Restrições para tabelas `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_cliente1` FOREIGN KEY (`cliente_IDCliente`) REFERENCES `cliente` (`IDCliente`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`cliente_IDCliente`) REFERENCES `cliente` (`IDCliente`);

--
-- Restrições para tabelas `produto_has_pedido`
--
ALTER TABLE `produto_has_pedido`
  ADD CONSTRAINT `fk_produto_has_pedido_pedido1` FOREIGN KEY (`pedido_IDPedido`) REFERENCES `pedido` (`IDPedido`),
  ADD CONSTRAINT `fk_produto_has_pedido_produto1` FOREIGN KEY (`produto_IDProduto`) REFERENCES `produto` (`IDProduto`);

--
-- Restrições para tabelas `terceiro_vendedor_has_produto`
--
ALTER TABLE `terceiro_vendedor_has_produto`
  ADD CONSTRAINT `fk_Terceiro_Vendedor_has_produto_produto1` FOREIGN KEY (`produto_IDProduto`) REFERENCES `produto` (`IDProduto`),
  ADD CONSTRAINT `fk_terceiro_vendedor_has_produto_terceiro_vendedor1` FOREIGN KEY (`terceiro_vendedor_IDterceiro_vendedor`) REFERENCES `terceiro_vendedor` (`IDTerceiro_Vendedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
