-- Inserts no projeto base

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`IDCliente`, `FName`, `NInit`, `LName`, `cpf`, `address`, `birthdate`) VALUES
(11, 'Jim', 'E.', 'Carrey', '12345678901', 'Rua das Piadas, 123, Comédia', '1970-01-05'),
(12, 'Arnold', 'C.', 'Schwarzenegger', '98765432101', 'Avenida dos Musculos, 567, Fortaleza', '1960-01-05'),
(13, 'Sylvester', 'G.', 'Stallone', '45678901233', 'Rua do Combate, 876, Luta Livre', '1970-01-05'),
(14, 'Meryl', 'L.', 'Streep', '56789012345', 'Rua das Telas, 789, Estrela do Cinema', '1980-01-08'),
(15, 'Johnny', 'D.', 'Depp', '23456789012', 'Alameda dos Piratas, 345, Terra do Nunca', '1970-11-12'),
(16, 'Jackie', 'C.', 'Chan', '34567890123', 'Avenida dos Chutes, 456, Kung Fu Town', '1975-12-05'),
(17, 'Brad', 'P.', 'Pitt', '45678901234', 'Rua dos Looks, 567, Fashion City', '1979-05-07'),
(18, 'Tom', 'H.', 'Hanks', '56789012346', 'Praça dos Filmes, 678, Sonho Real', '1977-07-09'),
(19, 'Angelina', 'J.', 'Jolie', '67890123456', 'Avenida da Beleza, 789, Estrela Brilhante', '1970-01-02'),
(20, 'Jennifer', 'A.', 'Aniston', '78901234567', 'Rua dos ...', '1970-01-02');


--
-- Despejando dados para a tabela `fornecedor`
--

INSERT INTO `fornecedor` (`IDfornecedor`, `razao_social`, `nome_fantasia`, `cnpj`, `endereco`, `contato`) VALUES
(1, 'Fornecedora Alegria Ltda.', 'Alegria Total', '12345678901234', 'Rua da Felicidade, 123 - São Paulo/SP', '98765432101'),
(2, 'Companhia Sorridente', 'Sorriso Fácil', '98765432109876', 'Avenida das Risadas, 567 Bauru/SP', '87654321098'),
(3, 'Distribuidora de Piadas', 'Risada Garantida', '56789012345678', 'Alameda das Gargalhadas, 890 - Rio de Janeiro/RJ', '76543210987'),
(4, 'Fornecedora Engraçada S/A', 'Engraçado & Cia.', '34567890123456', 'Praça das Anedotas, 432 - Salvador/BA', '65432109876'),
(5, 'Riso Ilimitado', 'Riso Livre', '23456789012345', 'Estrada das Brincadeiras, 678 - Belo Horizonte/MG', NULL);

    
--
-- Despejando dados para a tabela `terceiro_vendedor`
--

INSERT INTO `terceiro_vendedor` (`IDTerceiro_Vendedor`, `nome_razao_social`, `cnpj`, `cpf`, `local`, `nome_fantasia`, `endereco`, `contato`) VALUES
(1, 'Venda Engraçada Ltda.', '12345678901234', NULL, 'Brasília', 'Sorriso Incrível', 'Rua das Piadas, 123 - Brasília/DF', '11223344556'),
(2, 'Brinquedos Divertidos Eireli', '23456789012345', NULL, 'Porto Alegre', 'Diversão & Alegria', 'Avenida dos Brinquedos, 456 - Porto Alegre/RS', '99887766554'),
(3, 'Eletrônicos Incríveis Ltda.', '34567890123456', NULL, 'Recife', 'Tecnologia Futurista', 'Alameda das Inovações, 789 - Recife/PE', '88776655443'),
(4, 'Alimentos Saborosos ME', NULL, '12345678901', 'Gramado', 'Sabor Único', 'Rua dos Sabores, 321 - Gramado/RS', '77665544332'),
(5, 'Produtos Divertidos Eireli', '45678901234567', NULL, 'Fortaleza', 'Sorriso & Diversão', 'Avenida das Risadas, 987 - Fortaleza/CE', '66554433221');

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`IDProduto`, `NomeProduto`, `preco`, `classification_kids`, `category`, `avaliacao`, `size`) VALUES
(1, 'Camiseta Engraçada', 29.9, '0', 'Vestimentas', 4.5, 2),
(2, 'Carrinho de Controle Remoto', 149.99, '1', 'Brinquedos', 3.8, NULL),
(3, 'Fones de Ouvido Estilizados', 89.5, '0', 'Eletrônicos', 4.2, NULL),
(4, 'Biscoitos de Chocolate', 7.99, '1', 'Alimentos', 4, NULL),
(5, 'Casaco de Pelúcia', 59.9, '1', 'Vestimentas', 3.5, 3),
(6, 'Boneco de Pelúcia Engraçado', 39.99, '1', 'Brinquedos', 4.7, NULL),
(7, 'Smartphone Multifuncional', 899, '0', 'Eletrônicos', 4.6, NULL),
(8, 'Salgadinhos Crocantes', 4.5, '1', 'Alimentos', 4.2, NULL);

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

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`IDPedido`, `cliente_IDCliente`, `statusPedido`, `descricaoPedido`, `sendValue`, `cash_payment`) VALUES
(1, 11, 'Em Processamento', 'Pedido de roupas engraçadas', 100, 1),
(2, 12, 'Enviado', 'Pedido de brinquedos divertidos', 50, 0),
(3, 13, 'Em Processamento', 'Pedido de eletrônicos', 200, 0),
(4, 14, 'Cancelado', 'Pedido de alimentos saborosos', 30, 1),
(5, 15, 'Em Processamento', 'Pedido de produtos engraçados', 80, 0),
(6, 16, 'Enviado', 'Pedido de roupas engraçadas', 60, 1),
(7, 17, 'Enviado', 'Pedido de brinquedos engraçados', 70, 0),
(8, 18, 'Em Processamento', 'Pedido de eletrônicos', 150, 0),
(9, 19, 'Enviado', 'Pedido de produtos diversos', 90, 1),
(10, 20, 'Cancelado', 'Pedido de produtos engraçados', 40, 1);


--
-- Despejando dados para a tabela `produto_has_pedido`
--

INSERT INTO `produto_has_pedido` (`pedido_IDPedido`, `produto_IDProduto`, `quantidade`, `status`) VALUES
(1, 1, 2, 'DISPONÍVEL'),
(1, 3, 1, 'DISPONÍVEL'),
(2, 2, 3, 'DISPONÍVEL'),
(2, 5, 2, 'FORA DE ESTOQUE'),
(3, 4, 1, 'DISPONÍVEL'),
(3, 6, 2, 'DISPONÍVEL'),
(4, 7, 1, 'DISPONÍVEL'),
(4, 8, 3, 'DISPONÍVEL');


--
-- Despejando dados para a tabela `estoque`
--

INSERT INTO `estoque` (`IDestoque`, `local`, `quantidade`) VALUES
(1, 'Depósito Central', 500),
(2, 'Loja A', 150),
(3, 'Loja B', 200),
(4, 'Armazém 1', 300),
(5, 'Armazém 2', 250);

--
-- Despejando dados para a tabela `produto_has_estoque`
--

INSERT INTO `produto_has_estoque` (`produto_IDProduto`, `estoque_IDestoque`, `quantidade`) VALUES
(1, 1, 100),
(2, 2, 50),
(3, 3, 75),
(4, 4, 200),
(5, 1, 30),
(6, 2, 20),
(7, 3, 10),
(8, 4, 5);


--
-- Despejando dados para a tabela `fornecedor_has_produto`
--

INSERT INTO `fornecedor_has_produto` (`produto_IDProduto`, `fornecedor_IDfornecedor`) VALUES
(1, 1),
(3, 1),
(2, 2),
(5, 2),
(4, 3);


--
-- Despejando dados para a tabela `terceiro_vendedor_has_produto`
--

INSERT INTO `terceiro_vendedor_has_produto` (`produto_IDProduto`, `terceiro_vendedor_IDterceiro_vendedor`, `quantidade`) VALUES
(1, 1, 50),
(2, 3, 20),
(3, 2, 100),
(4, 5, 30),
(5, 4, 10);











