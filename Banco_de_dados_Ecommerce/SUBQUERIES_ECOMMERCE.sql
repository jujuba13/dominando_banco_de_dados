create database ecommerce;
use ecommerce;
show databases;


SELECT id_clients FROM clients;


select * from clients;
select* from cliets c, request r where c.id_clients = r.id_clients_request;

select concat(first_name,' ',last_name) as Nome_Cliente, id_request as Pedido, request_status as Status_do_Pedido 
from cliets c, request r 
where c.id_clients = r.id_clients_request;

select* from cliets c, request r 
where c.id_clients = r.id_clients_request
group by id_request;

select* from cliets c, request r 
left outer join request on c.id_clients = r.id_clients_request;

select * from chosen_product;
select* from cliets c, request r 
inner join request on c.id_clients = r.id_clients_request
inner join chosen_product on id_products_chosen_product = id_products
group by id_clients;

/*Recupera a quatidade de pedidos realizados pelos clientes*/
select c.id_clients,concat(first_name,' ',last_name) as Nome_do_Cliente, count(*)as Numero_do_Pedido  from cliets c, request r 
inner join request on c.id_clients = r.id_clients_request
group by id_clients;

/*Recupera o produto associado*/
select c.id_clients,concat(first_name,' ',last_name) as Nome_do_Cliente, count(*)as Numero_do_Pedido  from cliets c, request r 
inner join request on c.id_clients = r.id_clients_request
inner join chosen_product on id_products_chosen_product = id_products
group by id_clients;

/*Recuperações simples com SELECT Statement
Filtros com WHERE Statement
Crie expressões para gerar atributos derivados
Defina ordenações dos dados com ORDER BY
Condições de filtros aos grupos – HAVING Statement
Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

Quantos pedidos foram feitos por cada cliente?
Algum vendedor também é fornecedor?
Relação de produtos fornecedores e estoques;
Relação de nomes dos fornecedores e nomes dos produtos;*/