-- criação do DB para um cenário de e-commerce
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) NOT NULL,
	Address varchar(30),
    constraint unique_cpf_client unique (CPF)
);

desc clients;

-- criar tabela produto
create table product(
	idProduct int auto_increment primary key,
    CategoryProduct enum('Electronic', 'Clothing', 'Toys', 'Food', 'Furniture') not null,
    DescProduct varchar(45),
    PriceProduct varchar(10),
	Review float default 0,
    Size varchar(10)
    ); 

-- criar tabela payment
create table payments(
	idClient int, 
	idPayment int,
    NamePayment varchar(45),
    TypePayment enum('CC', 'PSlip'),
    ExpDate date,
    SecCode char(3),
    primary key(idClient, idPayment)
);

-- criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    OrderStatus enum('Cancelled', 'Confirmed', 'Processing') default 'Processing',
    OrderDescription varchar(255),
    sendValue float default 15,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);

desc orders;

-- criar tabela estoque 
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(45),
    Quantity int default 0 
);

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(45) not null, 
    CNPJ char(14) not null,
    Contact char(11) not null,
    constraint unique_supplier unique (CNPJ) 
);

desc supplier;

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(45) not null, 
    AbstName varchar(45),
    CNPJ char(14),
    CPF char(11),
    Location varchar(45),
    constraint unique_cnpj_seller unique (CNPJ), 
    constraint unique_cpf_seller unique (CPF) 
);

-- criar tabela produto_vendedor
create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller (idSeller),
    constraint fk_product_product foreign key(idPproduct) references product (idProduct)
);

desc productSeller;	

-- criar tabela productOrder
create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Available', 'Out of Stock') default 'Available',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key (idPOproduct) references product (idProduct),
    constraint fk_productorder_product foreign key(idPOorder) references orders (idOrder)
);	

-- criar tabela storageLocation
create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(45) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product (idProduct),
    constraint fk_storage_location_storage foreign key(idLstorage) references productStorage (idProdStorage)
);

-- criar tabela productSupplier
create table productSupplier(	
	idPsSupplier int,
    idPsProduct int,
    quantity int not null, 
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier (idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product (idProduct)
);

-- criar tabela delivery
create table delivery(
	idDelivery int,
    idDproduct int,
    StatusDelivery enum('In transit', 'Delivered', 'Overdue', 'Cancelled') default 'In Transit',
    CodeDelivery char(5) not null, 
    DateDelivery date, 
	constraint fk_delivery_order foreign key (idDproduct) references orders (idOrder)
);
show tables;clients	

alter table clients auto_increment=1;