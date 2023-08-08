create database ecommerce;
use ecommerce;

show databases;

/*Tabela de tipo de pessoa*/
drop table person;
 create table person(
 id_person int auto_increment primary key,
 type_of_person enum('Fisica', 'Juridica') not null,
 CPF_CNPJ varchar(15) not null,
 constraint unique_CPF_CNPJ_person unique(CPF_CNPJ)
 );
  
  desc table person;

/*tabela cliente*/
drop table clients;
create table clients(
id_clients int auto_increment primary key,
id_person_clients int,
first_name varchar(10) not null,
minist char(3),
last_name varchar(20),
CPF_CNPJ_clients varchar(15) not null,
address varchar(30),
 constraint unique_CPF_CNPJ_clients unique(CPF_CNPJ_clients),
 constraint fk_id_person_clients foreign key(id_person_clients) references person(id_person) on update cascade
);

alter table clients auto_increment =1;
ALTER TABLE clients MODIFY COLUMN address varchar(50);


/*Tabela produto*/
create table products(
id_products int auto_increment primary key,
category enum('Eletroeletrônicos', 'Informatica', 'Roupas', 'Calçados', 'Brinquedos', 'Livros') not null,
description_request_products varchar(255),
product_price_value varchar(45) not null
);

/*Tabela fechamento do produto*/
drop table chosen_product ;
create table chosen_product (
id_chosen_product int auto_increment ,
id_products_chosen_product int,
id_request_chosen_product int,
product_name varchar(10) not null,
classification_kids bool default false,
category enum('Eletroeletrônicos', 'Informatica', 'Roupas', 'Calçados', 'Brinquedos', 'Livros') not null,
avaluate float default 0,
brand varchar(10),
size varchar(10),
product_price float not null,
primary key pk_id_chosen_product(id_chosen_product,id_products_chosen_product ),
constraint fk_id_products_chosen_product foreign key(id_products_chosen_product) references  products(id_products),
constraint fk_id_request_chosen_product foreign Key (id_request_chosen_product) references request(id_request)
);

/*Tabela pagamento*/
drop table payment;
create table payment(
id_payment int auto_increment,
id_clients_payment int, 
id_products_payment int,
form_of_payment enum('Cartão de crédito', 'Boleto', 'Pix'),
card_number varchar(30) not null,
limit_avalible float,
card_expiring_date date not null,
card_security_code varchar(5) not null,
card_installment int not null,
constraint pk_id_payment_clients primary key (id_payment, id_clients_payment),
constraint fk_id_clients_payment foreign key(id_clients_payment) references clients(id_clients), 
constraint fk_id_id_products_payment foreign key(id_products_payment) references products(id_products)

);

/* Tabela de pedido*/
drop table request;
CREATE TABLE request (
  id_request int auto_increment primary key,
  id_clients_request int,
  request_status enum('Cancelado', 'Pagamento confirmado', 'Em Andamento', 'pedido separado', 'Enviado para transportadora', 'entregue'),
  description_request varchar(255),
  freight float default 10,
  payment_with_boleto bool default 0,
  constraint fk_id_clients_request foreign key (id_clients_request) references clients(id_clients)
);


/*Tabela de estoque*/
create table stock (
id_stock int auto_increment primary key,
stock_location varchar(45) not null,
quantity_of_product int  default '0'
);

/*Tabela de fornecedor */
create table supplier(
id_supplier int auto_increment primary key,
corporate_name varchar(45),
CNPJ char(15) not null,
contact varchar(11) not null,
constraint unique_CNPJ_supplier unique(CNPJ)
);

/*Tabela de vendedor */
create table seller(
id_seller int auto_increment primary key,
corporate_name_seller varchar(45) not null,
location_of_seller varchar(45),
fantasy_name varchar(45),
CPF_CNPJ_seller varchar(15) not null,
constraint unique_corporate_name_seller unique(corporate_name_seller),
constraint unique_CPF_CNPJ_seller unique(CPF_CNPJ_seller)
);

create table product_stock(
  id_product_stock  int auto_increment ,
  id_Stock_product_stock int,
  location_of_product_stock varchar(45),
  primary key (id_product_stock, id_Stock_product_stock),
  constraint fk_id_product_stock foreign key(id_product_stock) references products (id_products),
  constraint fk_id_id_Stock_product_stock foreign key(id_Stock_product_stock) references stock(id_Stock)  
);

create table product_by_seller(
  id_product_by_seller int ,
  id_products_product_by_seller int,
  quantity_of_product_by_seller int default '1',
  primary key (id_product_by_seller, id_products_product_by_seller),
  constraint fk_id_product_by_seller foreign key(id_product_by_seller) references seller (id_seller),
  constraint fk_id_products_product_by_seller foreign key(id_products_product_by_seller) references products (id_products)  
);

create table product_of_supply(
  id_product_of_supply int,
  id_products_product_of_supply int,
  quantity_of_product_of_supply int not null,
  primary key (id_product_of_supply, id_products_product_of_supply),
  constraint fk_id_product_of_supplyr foreign key(id_product_of_supply) references supplier (id_supplier),
  constraint fk_id_products_product_of_supply foreign key(id_products_product_of_supply) references products (id_products)  
);


