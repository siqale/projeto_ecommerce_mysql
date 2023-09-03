USE `desafio_ecommerce_base`;

-------------------------------------------------------------------------------------------------------------------------------------
-- Select from cliente
select * from cliente;

-- Total de clientes
select count(*) from cliente;

-- Clientes com mais de 60 anos
select fname, lname, birthdate,  TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) AS age from cliente 
WHERE TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) > 60;

-- Clientes com até 60 anos
select fname, lname, birthdate,  TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) AS age from cliente 
WHERE TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) <= 60;

-- Clientes com até 55 anos
select fname, lname, birthdate,  TIMESTAMPDIFF(YEAR, birthdate, CURDATE()) AS age from cliente 

-- Pedidos por cliente

-------------------------------------------------------------------------------------------------------------------------------------
-- Select from fornecedor
select * from fornecedor;

-- Fornecedores de um estado
SELECT * FROM fornecedor
WHERE SUBSTRING_INDEX(endereco, '/', -1) = 'SP';

-- Total de fornecedores do estado de SP
SELECT COUNT(*) FROM fornecedor
WHERE SUBSTRING_INDEX(endereco, '/', -1) = 'SP';

-- Fornecedor is Terceiro?

-------------------------------------------------------------------------------------------------------------------------------------
-- Select from vendedor
select * from terceiro_vendedor;

-- Fornecedores de um estado
SELECT * FROM terceiro_vendedor
WHERE SUBSTRING_INDEX(endereco, '/', -1) = 'RS';

-- Total de fornecedores do estado de SP
SELECT COUNT(*) FROM terceiro_vendedor
WHERE SUBSTRING_INDEX(endereco, '/', -1) = 'RS';

-- Terceiro Vendedor is Fornecedor?

-------------------------------------------------------------------------------------------------------------------------------------
-- Select from produtos
select * from produto;

-- Produtos de um determinado fornecedor
SELECT p.* FROM produto p JOIN fornecedor_has_produto fp ON p.IDProduto = fp.produto_IDProduto WHERE fp.fornecedor_IDfornecedor = 1;

--  Produtos de um fornecedor de um determinado estado
SELECT p.*, f.nome_fantasia
FROM produto p
JOIN fornecedor_has_produto fp ON p.IDProduto = fp.produto_IDProduto
JOIN fornecedor f ON fp.fornecedor_IDfornecedor = f.IDfornecedor
WHERE SUBSTRING_INDEX(f.endereco, '/', -1) = 'SP';

-- Mesma consulta acima, ordenada por fornecedor.nome_fantasia
SELECT p.*, f.nome_fantasia FROM produto p 
JOIN fornecedor_has_produto fp ON p.IDProduto = fp.produto_IDProduto 
JOIN fornecedor f ON fp.fornecedor_IDfornecedor = f.IDfornecedor 
WHERE SUBSTRING_INDEX(f.endereco, '/', -1) = 'SP' 
ORDER BY f.nome_fantasia;

-------------------------------------------------------------------------------------------------------------------------------------

-- Select from paymaents

-- Select from estoque


-- RELAÇÕES

-- Relação Fornecedore/Produtos/Estoque

-- Relação Fornecedores/Nome de produtos


-- HAVING

-- ORDER BY

-- ATRIBUTOS DERIVADOS



