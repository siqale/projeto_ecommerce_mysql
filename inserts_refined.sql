INSERT INTO `desafio_ecommerce_refined`.`fornecedor` (`razao_social`, `nome_fantasia`, `cnpj`, `contato`) VALUES
('Fornecedor A', 'Fantasia A', '12345678901234', '11987654321'),
('Fornecedor B', 'Fantasia B', '98765432109876', '11912345678'),
('Fornecedor C', 'Fantasia C', '45678901234567', NULL),
('Fornecedor D', 'Fantasia D', '89012345678901', '11923456789'),
('Fornecedor E', 'Fantasia E', '23456789012345', NULL);

INSERT INTO `desafio_ecommerce_refined`.`cliente` (`FName`, `NInit`, `LName`, `cpf`, `birthdate`, `salvar_dados`) VALUES
('João', 'S.', 'Silva', '12345678901', '1990-01-15', 'Sim'),
('Maria', 'A.', 'Santos', '98765432101', '1985-05-20', 'Não'),
('Pedro', 'C.', 'Oliveira', '45678901234', '1993-09-10', 'Sim'),
('Ana', 'D.', 'Pereira', '56789012345', '1980-03-25', 'Não'),
('Carlos', 'E.', 'Cruz', '23456789012', '1992-07-08', 'Sim');


INSERT INTO `desafio_ecommerce_refined`.`revendedor` (`nome_rsocial`, `local`, `apelido_nfantasia`, `cnpj`, `cpf`, `limite_credito`, `desconto`, `salvar_dados`) VALUES
('Empresa Revenda A', 'Local A', 'Fantasia A', '12345678901234', NULL, 5000.00, 0.10, 'Sim'),
('Empresa Revenda B', 'Local B', 'Fantasia B', '34567890523456', NULL, 30000.00, 0.15, 'Sim'),
('Empresa Revenda C', 'Local C', 'Fantasia C', '34567890123456', NULL, 7000.00, 0.12, 'Não'),
('Autônomo Revenda D', 'Local D', 'John Doe', NULL, '98765432101', 3000.00, 0.10, 'Não'),
('Empresa Revenda E', 'Local E', 'Fantasia E', '12345678981234', NULL, 5000.00, 0.10, 'Sim'),
('Empresa Revenda F', 'Local F', 'Fantasia F', '12345678931234', NULL, 5000.00, 0.10, 'Sim'),
('Empresa Revenda G', 'Local G', 'Fantasia G', '12345678991234', NULL, 5000.00, 0.10, 'Sim'),
('Empresa Revenda H', 'Local H', 'Fantasia H', '21345678991234', NULL, 5000.00, 0.10, 'Sim'),
('Empresa Revenda I', 'Local I', 'Fantasia I', '12349678991234', NULL, 5000.00, 0.10, 'Sim'),
('Empresa Revenda J', 'Local J', 'Fantasia J', '19345678991234', NULL, 5000.00, 0.10, 'Sim'),
('Empresa Revenda K', 'Local K', 'Fantasia K', '12945678991234', NULL, 5000.00, 0.10, 'Sim'),
('Empresa Revenda L', 'Local L', 'Fantasia L', '12395678991234', NULL, 5000.00, 0.10, 'Sim');


-- Endereço para Cliente
INSERT INTO `desafio_ecommerce_refined`.`endereco` (`cliente_ID`, `fornecedor_ID`, `revendedor_ID`, `tipo`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `país`, `obs`) VALUES
(1, NULL, NULL, 'Entrega', 'Rua do Cliente 1', 123, 'Apto 45', 'Bairro 1', 'Cidade 1', 'SP', 'Brasil', NULL),
(2, NULL, NULL, 'Entrega', 'Rua do Cliente 2', 456, 'Apto 46', 'Bairro 2', 'Cidade 2', 'SP', 'Brasil', NULL),
(3, NULL, NULL, 'Entrega', 'Rua do Cliente 3', 678, 'Apto 47', 'Bairro 3', 'Cidade 3', 'SP', 'Brasil', NULL),
(4, NULL, NULL, 'Entrega', 'Rua do Cliente 4', 901, 'Apto 48', 'Bairro 4', 'Cidade 4', 'SP', 'Brasil', NULL),
(5, NULL, NULL, 'Entrega', 'Rua do Cliente 5', 234, NULL, 'Bairro 5', 'Cidade 5', 'RJ', 'Brasil', NULL);

-- Endereço para Fornecedor
INSERT INTO `desafio_ecommerce_refined`.`endereco` (`cliente_ID`, `fornecedor_ID`, `revendedor_ID`, `tipo`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `país`, `obs`) VALUES
(NULL, 1, NULL, 'Retirada', 'Rua do Fornecedor 1', 789, NULL, 'Bairro 1', 'Cidade 1', 'RS', 'Brasil', NULL),
(NULL, 2, NULL, 'Retirada', 'Rua do Fornecedor 2', 101, NULL, 'Bairro 2', 'Cidade 2', 'RS', 'Brasil', NULL),
(NULL, 3, NULL, 'Retirada', 'Rua do Fornecedor 3', 112, NULL, 'Bairro 3', 'Cidade 3', 'RS', 'Brasil', NULL),
(NULL, 4, NULL, 'Retirada', 'Rua do Fornecedor 4', 131, NULL, 'Bairro 4', 'Cidade 4', 'RS', 'Brasil', NULL),
(NULL, 5, NULL, 'Retirada', 'Rua do Fornecedor 5', 415, NULL, 'Bairro 5', 'Cidade 5', 'MG', 'Brasil', NULL);

-- Endereço para Revendedor
INSERT INTO `desafio_ecommerce_refined`.`endereco` (`cliente_ID`, `fornecedor_ID`, `revendedor_ID`, `tipo`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `país`, `obs`) VALUES
(NULL, NULL, 1, 'Faturamento', 'Rua do Revendedor 1', 123, NULL, 'Bairro 1', 'Cidade 1', 'SC', 'Brasil', NULL),
(NULL, NULL, 2, 'Faturamento', 'Rua do Revendedor 2', 456, NULL, 'Bairro 2', 'Cidade 2', 'PR', 'Brasil', NULL),
(NULL, NULL, 2, 'Entrega', 'Rua do cliente 2', 789, NULL, 'Bairro 2', 'Cidade 2', 'PR', 'Brasil', NULL),
(NULL, NULL, 3, 'Faturamento', 'Rua do Revendedor 3', 101, NULL, 'Bairro 3', 'Cidade 3', 'RS', 'Brasil', NULL),
(NULL, NULL, 4, 'Faturamento', 'Rua do Revendedor 4', 112, NULL, 'Bairro 4', 'Cidade 4', 'PA', 'Brasil', NULL),
(NULL, NULL, 5, 'Faturamento', 'Rua do Revendedor 5', 131, NULL, 'Bairro 5', 'Cidade 5', 'AM', 'Brasil', NULL),
(NULL, NULL, 6, 'Faturamento', 'Rua do Revendedor 6', 141, NULL, 'Bairro 6', 'Cidade 6', 'MS', 'Brasil', NULL),
(NULL, NULL, 7, 'Faturamento', 'Rua do Revendedor 7', 895, NULL, 'Bairro 7', 'Cidade 7', 'CE', 'Brasil', NULL),
(NULL, NULL, 8, 'Faturamento', 'Rua do Revendedor 8', 237, NULL, 'Bairro 8', 'Cidade 8', 'AC', 'Brasil', NULL),
(NULL, NULL, 9, 'Faturamento', 'Rua do Revendedor 9', 10, NULL, 'Bairro 9', 'Cidade 9', 'SP', 'Brasil', NULL),
(NULL, NULL, 10, 'Faturamento', 'Rua do Revendedor 10', 222, 'Sala 10', 'Bairro 10', 'Cidade 10', 'BA', 'Brasil', NULL);


INSERT INTO `desafio_ecommerce_refined`.`produto` (`NomeProduto`, `preco`, `classification_kids`, `category`, `avaliacao`, `size`) VALUES
('Camiseta Estampada', 29.99, 'Não', 'Vestimentas', 4.5, 3),
('Carrinho de Controle Remoto', 99.99, 'Sim', 'Brinquedos', 4.0, NULL),
('Smartphone XYZ', 699.99, 'Não', 'Eletrônicos', 4.8, NULL),
('Biscoitos de Chocolate', 5.99, 'Sim', 'Alimentos', 4.2, NULL),
('Vestido Floral', 39.99, 'Sim', 'Vestimentas', 4.7, 2),
('Console de Jogos ABC', 299.99, 'Sim', 'Eletrônicos', 4.5, NULL),
('Boneca de Pelúcia', 19.99, 'Sim', 'Brinquedos', 4.1, NULL),
('Notebook Ultra', 899.99, 'Não', 'Eletrônicos', 4.9, NULL);

INSERT INTO `desafio_ecommerce_refined`.`estoque` (`local`) VALUES
('Estoque A'),
('Estoque B'),
('Estoque C'),
('Estoque D'),
('Estoque E');

-- Inserir registros na tabela de estoque_produtos

INSERT INTO `desafio_ecommerce_refined`.`estoque_produtos` (`estoque_ID`, `produto_ID`, `quantidade`) VALUES
(1, 1, 100), -- Produto 1 no Estoque A
(2, 1, 100), -- Produto 1 no Estoque B
(3, 1, 100), -- Produto 1 no Estoque C
(4, 1, 100), -- Produto 1 no Estoque D
(5, 1, 100), -- Produto 1 no Estoque E
(1, 2, 100), -- Produto 2 no Estoque A
(2, 2, 100), -- Produto 2 no Estoque B
(3, 2, 100), -- Produto 2 no Estoque C
(4, 2, 100), -- Produto 2 no Estoque D
(5, 2, 100), -- Produto 2 no Estoque E
(1, 3, 100), -- Produto 3 no Estoque A
(2, 3, 100), -- Produto 3 no Estoque B
(3, 3, 100), -- Produto 3 no Estoque C
(4, 3, 100), -- Produto 3 no Estoque D
(5, 3, 100), -- Produto 3 no Estoque E
(1, 4, 100), -- Produto 4 no Estoque A
(2, 4, 100), -- Produto 4 no Estoque B
(3, 4, 100), -- Produto 4 no Estoque C
(4, 4, 100), -- Produto 4 no Estoque D
(5, 4, 100), -- Produto 4 no Estoque E
(1, 5, 100), -- Produto 5 no Estoque A
(2, 5, 100), -- Produto 5 no Estoque B
(3, 5, 100), -- Produto 5 no Estoque C
(4, 5, 100), -- Produto 5 no Estoque D
(5, 5, 100), -- Produto 5 no Estoque E
(1, 6, 100), -- Produto 6 no Estoque A
(2, 6, 100), -- Produto 6 no Estoque B
(3, 6, 100), -- Produto 6 no Estoque C
(4, 6, 100), -- Produto 6 no Estoque D
(5, 6, 100), -- Produto 6 no Estoque E
(1, 7, 100), -- Produto 7 no Estoque A
(2, 7, 100), -- Produto 7 no Estoque B
(3, 7, 100), -- Produto 7 no Estoque C
(4, 7, 100), -- Produto 7 no Estoque D
(5, 7, 100), -- Produto 7 no Estoque E
(1, 8, 100), -- Produto 8 no Estoque A
(2, 8, 100), -- Produto 8 no Estoque B
(3, 8, 100), -- Produto 8 no Estoque C
(4, 8, 100), -- Produto 8 no Estoque D
(5, 8, 100); -- Produto 8 no Estoque E

-- Inserir registros na tabela de fornecedor_produtos
-- Vamos assumir que os IDs dos produtos vão de 1 a 8 e os IDs dos fornecedores vão de 1 a 5.
-- Vamos relacionar cada produto a um fornecedor.

INSERT INTO `desafio_ecommerce_refined`.`fornecedor_produtos` (`produto_ID`, `fornecedor_ID`, `observacoes`) VALUES
(1, 1, 'Produto 1 fornecido pelo Fornecedor A'),
(2, 2, 'Produto 2 fornecido pelo Fornecedor B'),
(3, 3, 'Produto 3 fornecido pelo Fornecedor C'),
(4, 4, 'Produto 4 fornecido pelo Fornecedor D'),
(5, 1, 'Produto 5 fornecido pelo Fornecedor A'),
(6, 2, 'Produto 6 fornecido pelo Fornecedor B'),
(7, 3, 'Produto 7 fornecido pelo Fornecedor C'),
(8, 4, 'Produto 8 fornecido pelo Fornecedor D');


-- Inserir registros na tabela de cartoes
-- Vamos assumir que os IDs dos clientes vão de 1 a 5 e os IDs dos revendedores vão de 6 a 10.
-- Vamos inserir alguns cartões fictícios.

INSERT INTO `desafio_ecommerce_refined`.`cartoes` (`cliente_ID`, `revendedor_ID`, `bandeira`, `numero`, `vencimento`, `cod_verificacao`) VALUES
(1, NULL, 'Mastercard', '1234567890123456', '2023-12-31', '123'),
(2, NULL, 'Visa', '9876543210987654', '2024-10-31', '456'),
(NULL, 6, 'Elo', '4567890123456789', '2023-11-30', '789'),
(NULL, 7, 'Outras', '1111222233334444', '2023-09-30', '567'),
(4, NULL, 'Mastercard', '5555666677778888', '2023-08-31', '890'),
(NULL, 9, 'Visa', '2222333344445555', '2024-03-31', '234'),
(3, NULL, 'Elo', '7777666655554444', '2023-07-31', '123'),
(NULL, 8, 'Outras', '3333444455556666', '2023-06-30', '789'),
(NULL, 10, 'Elo', '8888999911112222', '2024-05-31', '456'),
(5, NULL, 'Visa', '4444555566667777', '2023-04-30', '567');


INSERT INTO `desafio_ecommerce_refined`.`pagamentos` (`prazo_dias`, `tipo`, `descricao`) VALUES
(0, "Cartão de crédito", "Pagamento com cartão de crédito"),
(30, "Transferência bancária", "Pagamento via transferência bancária"),
(15, "PIX", "Pagamento via PIX"),
(0, "Boleto", "Pagamento via boleto bancário"),
(60, "Dinheiro", "Pagamento em dinheiro"),
(0, "Bitcoin", "Pagamento com Bitcoin");

INSERT INTO `desafio_ecommerce_refined`.`transportadora` (`nome`, `descricao`) VALUES
("Transportadora A", "Transportadora rápida e confiável"),
("Transportadora B", "Entrega expressa em todo o país"),
("Transportadora C", "Transportadora econômica com preços competitivos"),
("Transportadora D", "Entrega internacional para todo o mundo");

INSERT INTO `desafio_ecommerce_refined`.`transportadora` (`nome`, `descricao`) VALUES
('Transportadora A', 'Entrega rápida e segura.'),
('Transportadora B', 'Frete econômico.'),
('Transportadora C', 'Entrega internacional.'),
('Transportadora D', 'Entrega expressa.');


INSERT INTO `desafio_ecommerce_refined`.`frete` (`transportadora_ID`, `valor`, `rastreio`, `previsao_entrega`) VALUES
(1, 10.50, 'TR123456', '2023-08-25'),
(2, 8.75, 'TR789012', '2023-08-10'),
(3, 15.25, 'TR345678', '2023-08-02'),
(1, 9.99, 'TR234567', '2023-08-13'),
(4, 12.75, 'TR987654', '2023-09-20'),
(2, 9.25, 'TR567890', '2023-09-05'),
(3, 18.50, 'TR456789', '2023-08-15'),
(1, 11.99, 'TR345678', '2023-08-28'),
(4, 14.25, 'TR876543', '2023-08-30'),
(3, 22.00, 'TR234567', '2023-08-29'),
(2, 10.75, 'TR654321', '2023-09-20'),
(1, 13.49, 'TR765432', '2023-09-20'),
(4, 11.25, 'TR123789', '2023-09-21'),
(3, 17.75, 'TR321654', '2023-09-10');

INSERT INTO `desafio_ecommerce_refined`.`pedido` (`cliente_ID`, `revendedor_ID`, `pagamentos_ID`, `frete_ID`, `data`, `status`, `descricao`, `valor_total`, `status_pagamento`)
VALUES
(1, NULL, 1, 1, '2023-08-31', 'Em Processamento', 'Pedido 1', 759.97, 'Pendente'),
(NULL, 2, 2, 2, '2023-08-31', 'Em Processamento', 'Pedido 2', 324.96, 'Pendente'),
(3, NULL, 3, 3, '2023-08-30', 'Enviado', 'Pedido 3', 136.22, 'Aprovado'),
(NULL, 4, 4, 4, '2023-08-31', 'Em Processamento', 'Pedido 4', 397.98, 'Pendente'),
(5, NULL, 5, 5, '2023-08-31', 'Em Processamento', 'Pedido 5', 779.97, 'Pendente'),
(NULL, 1, 1, 6, '2023-08-29', 'Cancelado', 'Pedido 6', 1359.66, 'Reprovado'),
(4, NULL, 2, 7, '2023-08-31', 'Em Processamento', 'Pedido 7', 338.22, 'Pendente'),
(NULL, 3, 3, 8, '2023-08-31', 'Enviado', 'Pedido 8', 899.64, 'Aprovado'),
(2, NULL, 5, 9, '2023-08-30', 'Em Processamento', 'Pedido 9', 711.97, 'Pendente'),
(NULL, 5, 4, 1, '2023-08-31', 'Em Processamento', 'Pedido 10', 344.07, 'Pendente'),
(1, NULL, 1, 1, '2023-08-31', 'Enviado', 'Pedido 11', 738.22, 'Aprovado'),
(NULL, 2, 2, 2, '2023-08-31', 'Em Processamento', 'Pedido 12', 1229.79, 'Pendente'),
(3, NULL, 3, 3, '2023-08-31', 'Em Processamento', 'Pedido 13', 1059.78, 'Pendente'),
(NULL, 4, 4, 4, '2023-08-30', 'Em Processamento', 'Pedido 14', 3043.98, 'Pendente'),
(5, NULL, 5, 5, '2023-08-30', 'Enviado', 'Pedido 15', 759.97, 'Aprovado');



INSERT INTO `desafio_ecommerce_refined`.`pedido_produtos` (`pedido_ID`, `produto_ID`, `quantidade`, `preco`) VALUES
(1, 1, 2, 29.99),
(1, 3, 1, 699.99),
(2, 2, 30, 8.75),
(2, 4, 20, 5.99),
(3, 1, 2, 29.99),
(3, 3, 1, 49.99),
(3, 2, 3, 8.75),
(4, 2, 30, 8.75),
(4, 4, 30, 5.99),
(5, 5, 2, 39.99),
(5, 3, 1, 699.99),
(6, 1, 20, 29.99),
(6, 3, 20, 49.99),
(7, 6, 1, 299.99),
(7, 2, 3, 8.75),
(7, 4, 2, 5.99),
(8, 7, 20, 19.99),
(8, 1, 20, 29.99),
(9, 3, 1, 699.99),
(9, 4, 2, 5.99),
(10, 2, 30, 8.75),
(10, 4, 20, 5.99),
(11, 4, 2, 5.99),
(11, 3, 1, 699.99),
(11, 2, 3, 8.75),
(12, 1, 20, 29.99),
(12, 3, 1, 699.99),
(13, 1, 2, 29.99),
(13, 3, 20, 49.99),
(14, 6, 10, 299.99),
(14, 2, 30, 8.75),
(14, 4, 20, 5.99),
(15, 1, 2, 29.99),
(15, 3, 1, 699.99);


-- Inserir pedidos de reposição com base na associação de produtos e fornecedores

INSERT INTO `desafio_ecommerce_refined`.`reposicao` (`fornecedor_ID`, `pagamentos_ID`, `data`, `status`, `descricao`, `valor`) VALUES
(1, 1, '2023-08-01', 'Entregue', 'Pedido de reposição do Fornecedor 1', 850.00),
(2, 2, '2023-08-02', 'Entregue', 'Pedido de reposição do Fornecedor 2', 6050.00),
(3, 3, '2023-08-03', 'Em trânsito', 'Pedido de reposição do Fornecedor 3', 5200.00),
(4, 4, '2023-08-04', 'Em trânsito', 'Pedido de reposição do Fornecedor 4', 15150.00),
(5, 5, '2023-08-05', 'Em trânsito', 'Pedido de reposição do Fornecedor 5', 1380.00),
(5, 5, '2023-08-06', 'Entregue', 'Pedido de reposição do Fornecedor 5', 6050.00),
(4, 4, '2023-08-07', 'Em trânsito', 'Pedido de reposição do Fornecedor 4', 2500.00),
(3, 3, '2023-08-08', 'Entregue', 'Pedido de reposição do Fornecedor 3', 4000.00),
(2, 2, '2023-08-09', 'Em trânsito', 'Pedido de reposição do Fornecedor 2', 4500.00),
(1, 2, '2023-08-10', 'Em trânsito', 'Pedido de reposição do Fornecedor 1', 1400.00);


-- Inserir produtos relacionados aos pedidos de reposição
-- Vamos assumir que você tem 8 produtos (IDs de 1 a 8) e 10 pedidos de reposição (IDs de 1 a 10).
-- Relacione os produtos aos pedidos de reposição conforme necessário.


INSERT INTO `desafio_ecommerce_refined`.`reposicao_produtos` (`reposicao_ID`, `produto_ID`, `quantidade`, `valor`) VALUES
-- Pedido de reposição 1
(1, 1, 20, 15.00), -- Produto 1 - Quantidade 20
(1, 2, 10, 55.00), -- Produto 2 - Quantidade 10

-- Pedido de reposição 2
(2, 3, 15, 400.00), -- Produto 3 - Quantidade 15
(2, 4, 25, 2.00), -- Produto 4 - Quantidade 25

-- Pedido de reposição 3
(3, 5, 10, 20.00), -- Produto 5 - Quantidade 10
(3, 6, 25, 200.00), -- Produto 6 - Quantidade 25

-- Pedido de reposição 4
(4, 7, 15, 10.00), -- Produto 7 - Quantidade 15
(4, 8, 25, 600.00), -- Produto 8 - Quantidade 25

-- Pedido de reposição 5
(5, 1, 15, 12.00 ), -- Produto 1 - Quantidade 15
(5, 2, 40, 30.00 ), -- Produto 2 - Quantidade 25

-- Pedido de reposição 6
(6, 3, 15, 400.00), -- Produto 3 - Quantidade 15
(6, 4, 25, 2.00), -- Produto 4 - Quantidade 25

-- Pedido de reposição 7
(7, 3, 5, 400.00), -- Produto 3 - Quantidade 5
(7, 4, 250, 2.00), -- Produto 4 - Quantidade 25

-- Pedido de reposição 8
(8, 5, 100, 20.00), -- Produto 5 - Quantidade 100
(8, 6, 10, 200.00), -- Produto 6 - Quantidade 10

-- Pedido de reposição 9
(9, 7, 150, 10.00), -- Produto 7 - Quantidade 15
(9, 8, 5, 600.00), -- Produto 8 - Quantidade 25

-- Pedido de reposição 10
(10, 1, 20, 15.00), -- Produto 1 - Quantidade 20
(10, 2, 20, 55.00); -- Produto 2 - Quantidade 10

-- Isert on avalicao
-- Estou inserindo 34 avaliações baseadas nos pedidos realizados, sem me preocupar com o número exato na proporção entre cliente e revendedor
-- Inserir avaliações feitas por clientes (17 avaliações)
INSERT INTO avaliacao (cliente_ID) VALUES
(1),
(3),
(5),
(1),
(2),
(2),
(2),
(4),
(2),
(3),
(3),
(3),
(3),
(5),
(4),
(1),
(5),
(5);

-- Inserir avaliações feitas por revendedores (17 avaliações)
INSERT INTO avaliacao (revendedor_ID) VALUES
(1),
(2),
(4),
(1),
(2),
(5),
(2),
(3),
(2),
(3),
(4),
(5),
(3),
(4),
(5),
(4),
(2),
(5);






-- insert on avaliacao-produtos

-- Crie uma tabela temporária para gerar números aleatórios exclusivos entre 1 e 54
CREATE TEMPORARY TABLE IF NOT EXISTS temp_rand_numbers (rand_num INT);

-- Insira números aleatórios exclusivos na tabela temporária
INSERT INTO temp_rand_numbers (rand_num)
SELECT n FROM (
  SELECT 1 AS n UNION
  SELECT 2 UNION
  SELECT 3 UNION
  SELECT 4 UNION
  SELECT 5 UNION
  SELECT 6 UNION
  SELECT 7 UNION
  SELECT 8 UNION
  SELECT 9 UNION
  SELECT 10 UNION
  SELECT 11 UNION
  SELECT 12 UNION
  SELECT 13 UNION
  SELECT 14 UNION
  SELECT 15 UNION
  SELECT 16 UNION
  SELECT 17 UNION
  SELECT 18 UNION
  SELECT 19 UNION
  SELECT 20 UNION
  SELECT 21 UNION
  SELECT 22 UNION
  SELECT 23 UNION
  SELECT 24 UNION
  SELECT 25 UNION
  SELECT 26 UNION
  SELECT 27 UNION
  SELECT 28 UNION
  SELECT 29 UNION
  SELECT 30 UNION
  SELECT 31 UNION
  SELECT 32 UNION
  SELECT 33 UNION
  SELECT 34 UNION
  SELECT 35 UNION
  SELECT 36 UNION
  SELECT 37 UNION
  SELECT 38 UNION
  SELECT 39 UNION
  SELECT 40 UNION
  SELECT 41 UNION
  SELECT 42 UNION
  SELECT 43 UNION
  SELECT 44 UNION
  SELECT 45 UNION
  SELECT 46 UNION
  SELECT 47 UNION
  SELECT 48 UNION
  SELECT 49 UNION
  SELECT 50 UNION
  SELECT 51 UNION
  SELECT 52 UNION
  SELECT 53 UNION
  SELECT 54
) AS numbers;

-- Inserir avaliações para produtos com 7 pedidos (ID 1, 2, 4)
INSERT INTO avaliacao_produtos (produto_ID, avaliacao_ID, valor)
SELECT
  p.ID AS produto_ID,
  trn.rand_num AS avaliacao_ID,
  ROUND(RAND() * 2 + 3, 2) AS valor
FROM produto p
JOIN (SELECT rand_num FROM temp_rand_numbers ORDER BY RAND() LIMIT 15) AS trn
WHERE p.ID IN (1, 2, 4);

-- Inserir avaliações para o produto com 9 pedidos (ID 3)
INSERT INTO avaliacao_produtos (produto_ID, avaliacao_ID, valor)
SELECT
  p.ID AS produto_ID,
  trn.rand_num AS avaliacao_ID,
  ROUND(RAND() * 2 + 3, 2) AS valor
FROM produto p
JOIN (SELECT rand_num FROM temp_rand_numbers ORDER BY RAND() LIMIT 7) AS trn
WHERE p.ID = 3;

-- Inserir avaliações para o produto com 2 pedidos (ID 6)
INSERT INTO avaliacao_produtos (produto_ID, avaliacao_ID, valor)
SELECT
  p.ID AS produto_ID,
  trn.rand_num AS avaliacao_ID,
  ROUND(RAND() * 2 + 3, 2) AS valor
FROM produto p
JOIN (SELECT rand_num FROM temp_rand_numbers ORDER BY RAND() LIMIT 2) AS trn
WHERE p.ID = 6;

-- Inserir avaliações para produtos com 1 pedido (ID 5 e 7)
INSERT INTO avaliacao_produtos (produto_ID, avaliacao_ID, valor)
SELECT
  p.ID AS produto_ID,
  trn.rand_num AS avaliacao_ID,
  ROUND(RAND() * 2 + 3, 2) AS valor
FROM produto p
JOIN (SELECT rand_num FROM temp_rand_numbers ORDER BY RAND() LIMIT 2) AS trn
WHERE p.ID IN (5, 7);

-- Limpeza: Remova a tabela temporária de números aleatórios
DROP TEMPORARY TABLE IF EXISTS temp_rand_numbers;
