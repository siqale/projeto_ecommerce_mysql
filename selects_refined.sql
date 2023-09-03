USE `desafio_ecommerce_refined`;

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

-- Média de idade dos clientes
SELECT AVG(YEAR(CURRENT_DATE()) - YEAR(birthdate)) AS idade_media FROM cliente;

-- Total de Pedidos por cliente
SELECT 
	c.ID AS cliente_ID, c.FName AS cliente_FName, c.LName AS cliente_LName, 
	COUNT(DISTINCT p.ID) AS total_pedidos FROM pedido p 
LEFT JOIN cliente c 
ON 
	p.cliente_ID = c.ID 
WHERE 
	p.cliente_ID IS NOT NULL 
GROUP BY 
	c.ID;

-- ATRIBUTOS DERIVADOS

-- Tíquet médio de cada cliente
SELECT
    c.ID AS cliente_ID,
    c.FName AS cliente_FName,
    c.LName AS cliente_LName,
    ROUND(AVG(p.valor_total), 2) AS ticket_medio
FROM
    pedido p
INNER JOIN
    cliente c
ON
    p.cliente_ID = c.ID
GROUP BY
    cliente_ID
ORDER BY
    ticket_medio DESC;

-- Ticket médio da loja 
SELECT ROUND(AVG(p.valor_total), 2) AS ticket_medio_geral_clientes
FROM pedido p;

-- Produtos comprados por clientes
SELECT fname, lname, p.NomeProduto
FROM cliente as c
INNER JOIN produto as p
INNER JOIN pedido as s
ON s.cliente_ID = c.ID
ORDER BY c.fname;


-- Clientes que ainda não fizeram compras
SELECT fname, lname from cliente as c
INNER JOIN pedido as p
ON p.cliente_ID != c.ID;

-- Total de compras por cliente
SELECT c.ID AS cliente_ID, CONCAT(c.FName, ' ', c.LName) AS nome_cliente, COUNT(p.ID) AS total_compras, ROUND(SUM(p.valor_total), 2) AS total_gasto
FROM cliente AS c
LEFT JOIN pedido AS p ON c.ID = p.cliente_ID
GROUP BY c.ID, nome_cliente
ORDER BY total_gasto DESC;

-------------------------------------------------------------------------------------------------------------------------------------
-- Select from fornecedor
select * from fornecedor;

-- Fornecedores de um estado
-- Listagem de fornecedores ordenada por estado
SELECT estado, razao_social, nome_fantasia
FROM endereco e
JOIN fornecedor f ON f.ID = e.fornecedor_ID
ORDER BY estado;

-- Total de fornecedores por estado
SELECT estado, COUNT(*) AS total_fornecedores
FROM endereco
WHERE fornecedor_ID IS NOT NULL
GROUP BY estado;


-- Fornecedor é também revenda?
SELECT 
	r.ID, nome_rsocial, apelido_nfantasia, 
	f.cnpj as cnpj_forncedor, r.cnpj as cnpj_revenda 
FROM revendedor AS r 
LEFT JOIN fornecedor AS f 
ON f.cnpj = r.cnpj 
WHERE f.cnpj IS NOT NULL;

-------------------------------------------------------------------------------------------------------------------------------------
-- Select from revendedor
select * from revendedor;

-- Fornecedores de um estado
SELECT estado, nome_rsocial, apelido_nfantasia
FROM endereco e
JOIN revendedor r 
ON r.ID = e.fornecedor_ID
ORDER BY estado;

-- Total de revendedores por estado
SELECT estado, nome_rsocial, apelido_nfantasia, COUNT(*) AS total_revendas -- Atributo derivado
FROM endereco
WHERE revendedor_ID IS NOT NULL
GROUP BY estado;


-- Total de vendas por revendedor
SELECT r.ID AS revendedor_ID, r.nome_rsocial AS Revendedor, 
       (SELECT COUNT(*) FROM pedido WHERE revendedor_ID = r.ID) AS total_compras, 
       COALESCE(ROUND(SUM(p.valor_total), 2), 0) AS total_gasto
FROM revendedor AS r
LEFT JOIN pedido AS p ON r.ID = p.revendedor_ID
WHERE EXISTS (SELECT 1 FROM revendedor WHERE revendedor_ID = r.ID)
GROUP BY r.ID, Revendedor
ORDER BY total_gasto DESC;

-- Revendas que ainda não efetuaram pedidos
SELECT r.ID AS revendedor_ID, r.nome_rsocial AS Revendedor, 
       (SELECT COUNT(*) FROM pedido WHERE revendedor_ID = r.ID) AS total_compras, 
       COALESCE(ROUND(SUM(p.valor_total), 2), 0) AS total_gasto
FROM revendedor AS r
LEFT JOIN pedido AS p ON r.ID = p.revendedor_ID
WHERE NOT EXISTS (SELECT 1 FROM revendedor WHERE revendedor_ID = r.ID)
GROUP BY r.ID, Revendedor
ORDER BY total_gasto DESC;




-------------------------------------------------------------------------------------------------------------------------------------
-- Select from produtos
select * from produto;

-- Produtos de um determinado fornecedor
SELECT p.* FROM produto p 
JOIN fornecedor_produtos fp 
ON p.ID = fp.produto_ID 
WHERE fp.fornecedor_ID = 3;


--  Produtos de um fornecedor de um determinado estado
SELECT p.*, f.nome_fantasia
FROM produto p
JOIN fornecedor_produtos fp ON p.ID = fp.produto_ID
JOIN fornecedor f ON f.ID = fp.fornecedor_ID
JOIN endereco e ON e.fornecedor_ID = f.ID 
WHERE e.estado = 'RS';

-- Mesma consulta acima, ordenada por fornecedor.nome_fantasia
SELECT p.*, f.nome_fantasia
FROM produto p
JOIN fornecedor_produtos fp ON p.ID = fp.produto_ID
JOIN fornecedor f ON f.ID = fp.fornecedor_ID
JOIN endereco e ON e.fornecedor_ID = f.ID 
WHERE e.estado = 'RS'
ORDER BY f.nome_fantasia;

-- Produtos mais vendidos
SELECT p.NomeProduto, COUNT(p.ID) AS total_vendido
FROM produto AS p
JOIN pedido_produtos AS pp ON p.ID = pp.produto_ID
GROUP BY p.NomeProduto
ORDER BY total_vendido DESC;

-- Numero de unidades vendidas por produto
SELECT produto_ID, SUM(quantidade) AS unidades_vendidas
FROM pedido_produtos
GROUP BY produto_ID
ORDER BY unidades_vendidas DESC;

-- Número de pedidos realizados por produto
SELECT produto_ID, COUNT(DISTINCT pedido_ID) AS numero_pedidos
FROM pedido_produtos
GROUP BY produto_ID
ORDER BY numero_pedidos DESC;



-- Produtos encalhados
SELECT p.NomeProduto
FROM produto AS p
WHERE p.ID NOT IN (
    SELECT DISTINCT produto_ID
    FROM pedido_produtos
);


-------------------------------------------------------------------------------------------------------------------------------------

-- Select from pagamentos

-- Total de pedidos por forma de pagamento
SELECT p.tipo AS Tipo_de_Pagamento, COUNT(pedido.ID) AS Total_de_Pedidos
FROM pedido
INNER JOIN pagamentos AS p ON pedido.pagamentos_ID = p.ID
GROUP BY p.tipo;


-- Total de faturamento por forma de pagamento
SELECT p.tipo AS Tipo_de_Pagamento, ROUND(SUM(pedido.valor_total),2) AS Faturamento
FROM pedido
INNER JOIN pagamentos AS p ON pedido.pagamentos_ID = p.ID
GROUP BY p.tipo
ORDER BY faturamento DESC;




-------------------------------------------------------------------------------------------------------------------------------------
-- Select from avaliacoes

-- AVALIAÇÕES GERAIS
-- Total de avaliações no site
SELECT COUNT(a.ID) FROM avaliacao a;

-- Os 3 Produtos mais bem avaliados
SELECT *
FROM `desafio_ecommerce_refined`.`produto`
ORDER BY avaliacao DESC
LIMIT 3;

-- Produtos sem avaliacao
SELECT * FROM produto
WHERE avaliacao IS NULL;


-- AVALIACAO DE CLIENTES (usando HAVING)
-- Clientes que fizeram mais de uma avaliação de um mesmo produto
SELECT a.cliente_ID, ap.produto_ID, COUNT(*) AS total_avaliacoes
FROM avaliacao AS a
JOIN avaliacao_produtos AS ap
ON a.ID = ap.avaliacao_ID
WHERE a.cliente_ID IS NOT NULL
GROUP BY a.cliente_ID, ap.produto_ID
HAVING COUNT(*) > 1;

-- Comparação entre avaliacao média por avaliacao por cliente (clientes insatisfeitos e satisfeitos)


-- Clientes com avaliação de produtos acima da média
SELECT
    c.ID AS cliente_ID,
    CONCAT(c.FName, ' ', c.LName) AS NomeCliente,
    p.ID AS produto_ID,
    p.NomeProduto AS NomeProduto,
    ROUND(AVG(ap.valor),2) AS avaliacao_media_cliente,
    p.avaliacao AS avaliacao_media_produto
FROM
    cliente AS c
JOIN
    avaliacao AS a ON c.ID = a.cliente_ID
JOIN
    avaliacao_produtos AS ap ON a.ID = ap.avaliacao_ID
JOIN
    produto AS p ON ap.produto_ID = p.ID
GROUP BY
    c.ID, p.ID
HAVING
    AVG(ap.valor) > p.avaliacao
ORDER BY avaliacao_media_cliente DESC;

-- O mesmo para clientes com avaliação abaixo da média

SELECT
    c.ID AS cliente_ID,
    CONCAT(c.FName, ' ', c.LName) AS NomeCliente,
    p.ID AS produto_ID,
    p.NomeProduto AS NomeProduto,
    ROUND(AVG(ap.valor),2) AS avaliacao_media_cliente,
    p.avaliacao AS avaliacao_media_produto
FROM
    cliente AS c
JOIN
    avaliacao AS a ON c.ID = a.cliente_ID
JOIN
    avaliacao_produtos AS ap ON a.ID = ap.avaliacao_ID
JOIN
    produto AS p ON ap.produto_ID = p.ID
GROUP BY
    c.ID, p.ID
HAVING
    AVG(ap.valor) <= p.avaliacao
ORDER BY avaliacao_media_cliente DESC;


-- AVALIACAO DE REVENDEDORES
-- As consultas acima se aplicam também para revendedor apenas alterando o campo na mesma tabela avaliacao

-- Select from estoque

-- Estoque de produtos simples
SELECT p.ID AS produto_ID, p.NomeProduto AS produto_nome, ep.quantidade AS quantidade_em_estoque
FROM produto AS p
LEFT JOIN (
  SELECT produto_ID, SUM(quantidade) AS quantidade
  FROM estoque_produtos
  GROUP BY produto_ID
) AS ep ON p.ID = ep.produto_ID;

-- Estoque de produto por unidade de estoque
SELECT p.NomeProduto AS produto, e.local AS unidade_estoque, COALESCE(ep.quantidade, 0) AS quantidade_em_estoque
FROM produto AS p
CROSS JOIN estoque AS e
LEFT JOIN (
  SELECT produto_ID, estoque_ID, SUM(quantidade) AS quantidade
  FROM estoque_produtos
  GROUP BY produto_ID, estoque_ID
) AS ep ON p.ID = ep.produto_ID AND e.ID = ep.estoque_ID
ORDER BY p.NomeProduto, e.local;

-- Unidades de estoque e o total de produtos
SELECT e.ID AS estoque_ID, e.local AS nome_do_estoque, SUM(COALESCE(ep.quantidade, 0)) AS quantidade_total_em_estoque
FROM estoque AS e
CROSS JOIN produto AS p
LEFT JOIN (
  SELECT estoque_ID, produto_ID, SUM(quantidade) AS quantidade
  FROM estoque_produtos
  GROUP BY estoque_ID, produto_ID
) AS ep ON e.ID = ep.estoque_ID AND p.ID = ep.produto_ID
GROUP BY e.ID, e.local
ORDER BY e.ID;





