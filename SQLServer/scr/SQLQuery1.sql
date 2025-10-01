-- Contexto: neste projeto, analisaremos informações específicas do banco de dados de uma empresa fictícia chamada AdventureWorks. A partir disso, o objetivo é realizar algumas sintaxes para obter algumas informações do banco de dados, as quais podem subsidiar a tomada de decisão da alta direção da organização.
-- Não necessariamente existe uma ordem ou correlação direta entre as consultas, mas diferentes possibilidades de obtenção das informações necessárias.

-- Escolher o banco de dados a ser utilizado:

USE [AdventureWorks2019];

-- Pesquisar informações gerais de uma tabela. No caso, usaremos como base a tabela de produtos:

SELECT * FROM Production.Product GO;

-- Pesquisar informações específicas dos produtos na tabela correspondente. Dessa vez, especifiquei as colunas 'nome' e 'número do produto':

SELECT Name, ProductNumber FROM Production.Product GO;

-- Pesquisar as faixas de preço dos produtos postos à venda:

SELECT ProductNumber AS "Numero do produto", Name as "Nome do Produto", ListPrice as "Preço",
"Faixa de preço" = 
CASE WHEN ListPrice = 0 THEN 'Não disponível para venda'
WHEN ListPrice < 50 THEN 'Abaixo de 50'
WHEN ListPrice >= 50 AND ListPrice = 250 THEN 'Maior de 50 e igual a 250'
ELSE 'Acima de 1000'
END
FROM Production.Product
GO;

-- Pesquisar as cidades nas quais os consumidores da loja residem, por ordem alfabética:

SELECT City, StateProvinceID FROM Person.Address ORDER BY City ASC;

-- Pesquisar os 20 maiores custos padrão dos produtos:

SELECT TOP(20) StandardCost FROM Production.ProductCostHistory ORDER BY StandardCost DESC;

-- Verificar quais são as lojas que compraram os produtos, sem que elas se repitam:

SELECT DISTINCT Name AS 'Nome' FROM Sales.Store ORDER BY Name ASC;

-- Pesquisar cargos específicos dos funcionários da empresa, utilizando-se do operador 'LIKE':

SELECT JobTitle FROM HumanResources.Employee WHERE JobTitle LIKE 'Marketing%';

-- Soma dos preços de venda dos produtos;

SELECT SUM (UnitPrice) FROM Sales.SalesOrderDetail;