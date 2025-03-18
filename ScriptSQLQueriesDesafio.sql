-- QUERIES DESAFIO
use ecommerce;

show tables;

-- Quantos pedidos foram feitos por cada cliente?
SELECT 
    c.idClient,
    CONCAT(c.Fname, ' ', c.Minit, ' ', c.Lname) AS Nome_Cliente,
    COUNT(o.idOrder) AS Total_Pedidos
FROM 
    clients c
LEFT JOIN 
    orders o ON c.idClient = o.idOrderClient
GROUP BY 
    c.idClient, Nome_Cliente
ORDER BY 
    Total_Pedidos DESC;

-- Algum vendedor também é fornecedor?
SELECT 
    s.idSeller,
    s.SocialName AS Vendedor,
    sup.SocialName AS Fornecedor,
    CASE 
        WHEN sup.idSupplier IS NOT NULL THEN 'Sim'
        ELSE 'Não'
    END AS Vendedor_Fornecedor
FROM 
    seller s
LEFT JOIN 
    supplier sup ON s.SocialName = sup.SocialName
WHERE 
    sup.idSupplier IS NOT NULL
ORDER BY 
    s.SocialName;
    
-- Relação de produtos, fornecedores e estoques;
SELECT 
    sup.SocialName AS Fornecedor,
    p.idProduct,
    p.DescProduct AS Produto,
    p.CategoryProduct AS Categoria,
    p.PriceProduct AS Preço,
    SUM(ps.Quantity) AS Estoque_Total
FROM 
    supplier sup
JOIN 
    productSupplier ps_sup ON sup.idSupplier = ps_sup.idPsSupplier
JOIN 
    product p ON ps_sup.idPsProduct = p.idProduct
LEFT JOIN 
    productStorage ps ON p.idProduct = ps.idProdStorage
GROUP BY 
    sup.SocialName, p.idProduct, p.DescProduct, p.CategoryProduct, p.PriceProduct
HAVING 
    Estoque_Total > 0
ORDER BY 
    sup.SocialName, p.CategoryProduct, p.PriceProduct DESC;
    
-- Relação de nomes dos fornecedores e nomes dos produtos;
SELECT 
    sup.SocialName AS Fornecedor,
    sup.CNPJ AS CNPJ_Fornecedor,
    p.DescProduct AS Produto,
    p.CategoryProduct AS Categoria,
    p.PriceProduct AS Preço
FROM 
    supplier sup
JOIN 
    productSupplier ps ON sup.idSupplier = ps.idPsSupplier
JOIN 
    product p ON ps.idPsProduct = p.idProduct
ORDER BY 
    sup.SocialName, p.CategoryProduct, p.DescProduct;
    
-- Produtos com total de vendas maior que 10 unidades
SELECT 
	p.DescProduct AS Nome_Produto, SUM(po.poQuantity) AS Total_Vendido
FROM 
	ProductOrder po
JOIN 
	Product p ON po.idPOproduct = p.idProduct
GROUP BY 
	p.idProduct, p.DescProduct
HAVING 
	Total_Vendido > 10
ORDER BY 
	Total_Vendido DESC;