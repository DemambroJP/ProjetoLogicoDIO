use ecommerce;

show tables;

-- adicionando dados na tabela clients

INSERT INTO Clients (Fname, Minit, Lname, CPF, Address) 
VALUES ('Carlos', 'A.', 'Silva', '12345678901', 'Rua das Flores, 123'),
	('Mariana', 'B.', 'Souza', '23456789012', 'Av. Paulista, 456'),
	('Roberto', 'C.', 'Lima', '34567890123', 'Rua do Sol, 789'),
	('Fernanda', 'D.', 'Oliveira', '45678901234', 'Av. Central, 101'),
	('Lucas', 'E.', 'Martins', '56789012345', 'Rua Azul, 202'),
	('Juliana', 'F.', 'Rodrigues', '67890123456', 'Travessa Verde, 303'),
	('André', 'G.', 'Almeida', '78901234567', 'Rua das Acácias, 404'),
	('Patrícia', 'H.', 'Ferreira', '89012345678', 'Av. das Palmeiras, 505'),
	('Rafael', 'I.', 'Gomes', '90123456789', 'Rua do Campo, 606'),
	('Camila', 'J.', 'Barbosa', '01234567890', 'Rua da Praia, 707');

select * from clients;

-- adicionando dados na tabela product   
INSERT INTO Product (idProduct, CategoryProduct, DescProduct, PriceProduct, Review, Size) 
VALUES    (1, 'Electronic', 'Fone de ouvido Bluetooth', '2500.00', 4.7, 'M'),
	(2, 'Clothing', 'Camiseta de algodão', '399.99', 4.5, 'L'),
	(3, 'Toys', 'Lego Star Wars', '189.90', 4.2, 'S'),
	(4, 'Food', 'Biscoito artesanal', '29.90', 4.8, 'S'),
	(5, 'Furniture', 'Cadeira ergonômica', '2599.99', 4.6, 'L'),
	(6, 'Electronic', 'Tablet 10 polegadas', '5299.00', 4.9, 'S'),
	(7, 'Clothing', 'Calça jeans masculina', '299.90', 4.3, 'L'),
	(8, 'Toys', 'Quebra-cabeça 1000 peças', '349.99', 4.1, 'M'),
	(9, 'Food', 'Vinho tinto reserva', '85.90', 4.7, 'S'),
	(10, 'Furniture', 'Armário de escritório', '1599.00', 4.5, 'L');
    
select * from product;    

-- adicionando dados na tabela orders 
INSERT INTO Orders (idOrder, idOrderClient, OrderStatus, OrderDescription, sendValue, paymentCash) 
VALUES (1, 1, 'Confirmed', 'Compra de smartphone e acessórios', 2150.75, TRUE),
	(2, 2, 'Processing', 'Pedido de roupas esportivas', 350.50, FALSE),
	(3, 3, 'Cancelled', 'Carrinho de brinquedo cancelado pelo cliente', 299.99, FALSE),
	(4, 4, 'Confirmed', 'Compra de chocolates e café', 85.90, TRUE),
	(5, 5, 'Processing', 'Mesa de jantar em madeira nobre', 1599.00, FALSE),
	(6, 6, 'Cancelled', 'Jaqueta de couro devolvida', 399.99, TRUE),
	(7, 7, 'Confirmed', 'Sofá retrátil de três lugares', 2599.99, FALSE),
	(8, 8, 'Processing', 'Notebook UltraSlim com garantia estendida', 5299.00, FALSE),
	(9, 9, 'Confirmed', 'Boneca articulada e kit de acessórios', 189.90, TRUE),
	(10, 10, 'Processing', 'Pedido de café gourmet e vinho importado', 129.75, TRUE);

select * from orders;

-- adicionando dados na tabela productorder
INSERT INTO productorder (idPOproduct, poStatus, poQuantity, idPOorder) 
VALUES (1, IF(10 = 0, 'Out of Stock', 'Available'), 10, 1),
	(2, IF(0 = 0, 'Out of Stock', 'Available'), 0, 2),
	(3, IF(5 = 0, 'Out of Stock', 'Available'), 5, 3),
	(4, IF(20 = 0, 'Out of Stock', 'Available'), 20, 4),
	(5, IF(0 = 0, 'Out of Stock', 'Available'), 0, 5),
	(6, IF(30 = 0, 'Out of Stock', 'Available'), 30, 6),
	(7, IF(0 = 0, 'Out of Stock', 'Available'), 0, 7),
	(8, IF(15 = 0, 'Out of Stock', 'Available'), 15, 8),
	(9, IF(50 = 0, 'Out of Stock', 'Available'), 50, 9),
	(10, IF(0 = 0, 'Out of Stock', 'Available'), 0, 10);

select * from productorder;

-- adicionando dados na tabela productstorage
INSERT INTO productstorage (idProdStorage, storageLocation, Quantity) 
VALUES (1, 'Warehouse 1', 100),
	(2, 'Warehouse 2', 150),
	(3, 'Warehouse 3', 200),
	(4, 'Warehouse 4', 250),
	(5, 'Warehouse 5', 300),
	(6, 'Warehouse 6', 350),
	(7, 'Warehouse 7', 400),
	(8, 'Warehouse 8', 450),
	(9, 'Warehouse 9', 500),
	(10, 'Warehouse 10', 550);

select * from productstorage;

-- adicionando dados na tabela storagelocation
INSERT INTO storagelocation (idLproduct, idLstorage, location) 
VALUES (1, 1, 'Aisle 1 - Shelf 1'),
	(2, 2, 'Aisle 1 - Shelf 2'),
	(3, 3, 'Aisle 2 - Shelf 1'),
	(4, 4, 'Aisle 2 - Shelf 2'),
	(5, 5, 'Aisle 3 - Shelf 1'),
	(6, 6, 'Aisle 3 - Shelf 2'),
	(7, 7, 'Aisle 4 - Shelf 1'),
	(8, 8, 'Aisle 4 - Shelf 2'),
	(9, 9, 'Aisle 5 - Shelf 1'),
	(10, 10, 'Aisle 5 - Shelf 2');
    
    select * from storagelocation;
    
-- adicionando dados na tabela delivery
INSERT INTO delivery (idDelivery, idDproduct, StatusDelivery, CodeDelivery, DateDelivery) 
VALUES (1, 1, 'In transit', 'D0011', '2025-03-01'),
	(2, 2, 'Delivered', 'D0012', '2025-03-02'),
	(3, 3, 'Overdue', 'D0013', '2025-03-03'),
	(4, 4, 'Cancelled', 'D0014', '2025-03-04'),
	(5, 5, default, 'D0015', '2025-03-05'),
	(6, 6, 'Delivered', 'D0016', '2025-03-06'),
	(7, 7, default, 'D0017', '2025-03-07'),
	(8, 8, 'Overdue', 'D0018', '2025-03-08'),
	(9, 9, 'Cancelled', 'D0019', '2025-03-09'),
	(10, 10, default, 'D0020', '2025-03-18');
    
    select * from delivery;
    
-- adicionando dados na tabela payments
INSERT INTO payments (idClient, idPayment, NamePayment, TypePayment, ExpDate, SecCode) 
VALUES (1, 1, 'John Doe', 'CC', '2026-12-31', '123'),
	(2, 2, 'Jane Smith', 'PSlip', '2027-06-30', '456'),
	(3, 3, 'Alice Johnson', 'CC', '2025-11-30', '789'),
	(4, 4, 'Bob Brown', 'PSlip', '2027-05-15', '321'),
	(5, 5, 'Charlie Davis', 'CC', '2026-03-10', '654'),
	(6, 6, 'David Wilson', 'PSlip', '2027-08-20', '987'),
	(7, 7, 'Eva Harris', 'CC', '2026-07-25', '321'),
	(8, 8, 'Frank Clark', 'PSlip', '2027-02-28', '432'),
	(9, 9, 'Grace Miller', 'CC', '2025-09-15', '876'),
	(10, 10, 'Henry Garcia', 'PSlip', '2026-10-05', '543');

select * from payments;

-- adicionando dados na tabela seller
INSERT INTO seller (idSeller, SocialName, AbstName, CNPJ, CPF, Location) 
VALUES (1, 'Tech Solutions LTDA', 'TechSol', '12345678000199', NULL, 'São Paulo - SP'),
	(2, 'Moda e Estilo Comércio', 'ModaEst', '98765432000188', NULL, 'Rio de Janeiro - RJ'),
	(3, 'Brinquedos e Diversão SA', 'ToyFun', '11223344000177', NULL, 'Belo Horizonte - MG'),
	(4, 'Sabores do Brasil LTDA', 'SaborBR', '55667788000166', NULL, 'Salvador - BA'),
	(5, 'Móveis Premium Ltda', 'MoveisTop', '66778899000155', NULL, 'Curitiba - PR'),
	(6, 'Eletrônicos Avançados SA', 'EletronicA', '77889900000144', NULL, 'Porto Alegre - RS'),
	(7, 'Couro & Estilo LTDA', 'CouroEst', '88990011000133', NULL, 'Brasília - DF'),
	(8, 'Café Gourmet Brasil', 'CafeGBR', '99001122000122', NULL, 'Fortaleza - CE'),
	(9, 'Maria Souza', 'Maria Souza - Loja de Moda', NULL, '12345678901', 'Recife - PE'),
	(10, 'José Almeida', 'José Almeida - Ferramentas', NULL, '98765432100', 'Florianópolis - SC');
    
select * from seller;

-- adicionando dados na tabela productseller
INSERT INTO productseller (idPseller, idPproduct, prodQuantity) 
VALUES (1, 1, 50),
	(1, 2, 30),
	(2, 3, 100),
	(2, 4, 70),
	(3, 5, 200),
	(3, 6, 40),
	(4, 7, 15),
	(4, 8, 60),
	(5, 9, 80),
	(6, 10, 120);
    
select * from productseller;
    
 -- adicionando dados na tabela supplier
INSERT INTO supplier (idSupplier, SocialName, CNPJ, Contact) 
VALUES (1, 'Tech Supplies', '12345678000199', '11987654321'),
	(2, 'Fashion Materials', '98765432000188', '11876543210'),
	(3, 'Toy Distributors', '11223344000177', '11765432109'),
	(4, 'Gourmet Goods', '55667788000166', '11654321098'),
	(5, 'Furniture Factory', '66778899000155', '11543210987'),
	(6, 'Electronic Components', '77889900000144', '11432109876'),
	(7, 'Leather Goods', '88990011000133', '11321098765'),
	(8, 'Gourmet Coffee', '99001122000122', '11210987654');

select * from supplier;

-- adicionando dados na tabela productsupplier
INSERT INTO productsupplier (idPsSupplier, idPsProduct, quantity) 
VALUES (1, 1, 500),  
	(1, 2, 300),  
	(2, 3, 800),  
	(2, 4, 600),  
	(3, 5, 1000), 
	(4, 6, 400),  
	(5, 7, 700),  
	(6, 8, 1500), 
	(7, 9, 1200),
	(8, 10, 900);

select * from productsupplier;









