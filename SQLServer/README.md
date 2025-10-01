# Microsoft SQL Server: consultas práticas

📖 Neste projeto, analisei informações específicas do banco de dados de uma empresa fictícia chamada AdventureWorks. A partir disso, realizei algumas sintaxes para obter algumas informações diretamente do banco de dados, as quais podem subsidiar a tomada de decisão da alta direção da organização.

Não necessariamente existe uma ordem ou correlação direta entre as consultas, mas diferentes possibilidades de obtenção das informações necessárias.

## 📚 Da descrição do projeto

Inicialmente, faz-se necessário o download do banco de dados a ser utilizado; neste caso, será o SQL Server 2022 Developer, o qual pode ser baixado por meio deste [link](https://www.microsoft.com/pt-br/sql-server/sql-server-downloads?msockid=0ebd254409da6bd21228330908a36a31).

Segundo a própria Microsoft, é "[...] a edição gratuita e completa, licenciada para uso como banco de dados de desenvolvimento e teste em ambiente de não produção. [...]"

Aberto o assistente de instalação, o banco de dados foi instalado com as configurações padrão.

Depois disso, baixaremos o [banco de dados de exemplo](https://learn.microsoft.com/pt-br/sql/samples/adventureworks-install-configure?view=sql-server-ver17), para possibilitar a realização do nosso projeto.

Superada dessa etapa, executaremos o software. Aparecerá essa pequena tela de carregamento:

![Carregamento](imagens/1%20-%20Abertura%20SQL%20Server.png)

Carregadas as funcionalidades, será aberta a tela de conexão ao SQL Server (com dados do servidor mascarados por segurança):

![Conexão](imagens/2%20-%20Tela%20de%20login.png)

Aberto o banco de dados, teremos essas opções no canto superior esquerdo:

![Funcionalidades](imagens/3%20-%20funcionalidades%20SQL%20Server.png)

Desta forma, clicaremos na opção "Nova consulta", localizada na barra superior e digitaremos a seguinte query para escolhermos o banco de dados a ser utilizado na nossa análise:

**USE [AdventureWorks2019];**

A partir disso, podemos navegar pelas tabelas existentes nesse banco de dados. A título de exemplo, escolheremos a 'PurchaseOrderDetail' para verificaremos os seus detalhes:

![Consulta exemplo](imagens/4%20-%20consulta%20exemplo.png)

Como se vê, as informações constantes no banco de dados - relativas aos pagamentos efetuados - estão disponíveis para consulta. Ou seja: com um comando simples já conseguimos filtrar algumas informações de interesse.

Prosseguindo, também podemos pesquisar informações específicas dos produtos na tabela correspondente. Dessa vez, especifiquei as colunas 'Quantidade de pedidos' e 'Valor Unitário':

**SELECT OrderQty, UnitPrice FROM Purchasing.PurchaseOrderDetail GO;**

O resultado é esse:

![Consulta exemplo com seleções](imagens/5%20-%20consulta%20exemplo%20com%20seleção%20de%20colunas.png)

Por outro lado, podemos realizar consultas um pouco mais complexas - pesquisando as faixas de preço dos produtos postos à venda. Dessa vez, usaremos critérios para limitar a busca e utilizando-se da tabela "Production Product"; essa é a query a ser desenvolvida:

**SELECT ProductNumber AS "Numero do produto", Name as "Nome do Produto", ListPrice as "Preço",
"Faixa de preço" =
CASE WHEN ListPrice = 0 THEN 'Não disponível para venda'
WHEN ListPrice < 50 THEN 'Abaixo de 50'
WHEN ListPrice >= 50 AND ListPrice = 250 THEN 'Maior de 50 e igual a 250'
ELSE 'Acima de 1000'
END
FROM Production.Product
GO;**

O resultado será o apresentado abaixo:

![Consulta condicional](imagens/6%20-%20consulta%20condicional.png)

Em resumo, os produtos da companhia foram classificados pelo preço e, a partir disso, foi possivel estabelecer a faixa de preço para subsidiar a tomada de decisão. Exemplo prático: no caso de termos recentemente incluído novos produtos no sistema da companhia - mas que não estão devidamente cadastrados - podemos filtrá-los com essa query.

Essa medida se revela útil, por exemplo, para desconsiderá-los quando da promoção de eventual campanha de marketing ou mesmo de disponibilização à venda.

Outra possibilidade é compreender quais são as cidades em que os consumidores da companhia residem, para a realização de estudo de capilaridade das vendas. A classificação foi definida por ordem alfabética, em se tratando do nome das cidades:

**SELECT City, StateProvinceID FROM Person.Address ORDER BY City ASC;**

A consulta retornará os seguintes resultados:

![Consulta cidades](imagens/7%20-%20consulta%20ordem%20alfabética.png)

Por fim, oturo exemplo de grande utilidade pode ser a verificação das lojas parceiras que compram os produtos - de maneira a catalogá-las para futura conferência e estudo de mercado.

**SELECT DISTINCT Name AS 'Nome' FROM Sales.Store ORDER BY Name ASC;**

Teremos esse resultado:

![Consulta lojas](imagens/8%20-%20consulta%20lojas.png)

Em resumo, esse projeto teve como principais objetivos demonstrar algumas funcionalidades práticas do Microsoft SQL Server e como as queries podem ser úteis para a obtenção de insights e análises de cenários no contexto empresarial.

## 📊 Resultados e Insights  

As queries realizadas permitiram:  

- Identificar os *10 produtos mais vendidos*, auxiliando em decisões de estoque;  
- Mapear *clientes por região*, permitindo análises de mercado e estratégias de marketing;  
- Calcular indicadores de *desempenho de vendas*, úteis para definição de metas;  
- Demonstrar como consultas SQL podem gerar *insights rápidos e acionáveis* para a alta gestão.

## 🚀 Como executar

1. Clone este repositório;
2. Acesse [link](https://www.microsoft.com/pt-br/sql-server/sql-server-downloads?msockid=0ebd254409da6bd21228330908a36a31) e baixe o SQL Server 2022 Developer;
3. Baixar o [banco de dados de exemplo](https://learn.microsoft.com/pt-br/sql/samples/adventureworks-install-configure?view=sql-server-ver17) para realizarmos as consultas necessárias;
4. Compare os resultados obtidos.

## 🛠 Ferramentas utilizadas

- **Microsoft SQL Server** → Consultas e filtros no banco de dados;
- **Markdown / GitHub** → Documentação e versionamento.

## 💻 Autor / Contato

[@ricardo-otero12](https://github.com/ricardo-otero12)

Procure-me no LinkedIn: [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ricardogarcia56/)
