create database ecommerce;
use ecommerce;
show databases;

 -- Inserting data into the 'person' table
INSERT INTO person (type_of_person, CPF_CNPJ)
VALUES ('Fisica', '33333429810'),
       ('Fisica', '35655584412'),
       ('Fisica', '58799845510'),
       ('Fisica', '25444599823'),
       ('Fisica', '85244578915');

/*ON DUPLICATE KEY UPDATE CPF_CNPJ = VALUES(CPF_CNPJ);*/


-- Inserting data into the 'clients' table
INSERT INTO clients (first_name, minist, last_name, CPF_CNPJ_clients, address)
VALUES 
  ('Juliana', 'J', 'França', '33333429810', 'Jurubatuba-36-Aparecida-Santos'),
  ('Rodrigo', 'R', 'Venceslau', '35655584412', 'Jurubatuba-26- Aparecida-Santos'),
  ('Conceição', 'C', 'Delcia', '58799845510', 'Av Affonso Penna-65- Estuario- Santos'),
  ('Eliane', 'E', 'Soares', '25444599823', 'Av Presidente Kennedy-256-Boqueirão-PG'),
  ('Isabella', 'I', 'Souza', '85244578915', 'João Ferreira-54-Boqueirão-PG');


-- Inserting data into the 'products' table
INSERT INTO products (category, description_request_products, product_price_value)
VALUES
('Informatica', 'Notebook marca Samsung-modelo NP550XDA-KP3BR-processador Intel Celeron-memória ram 8 GB-cor Prata', '2500'),
('Eletroeletrônicos', 'Smartphone marca Samsung-modelo A34-linha Galaxy-cor Preto-Armazenamento Interno 128 GB-Sistema Operacional Android ', '1670'),
('Livros', 'Banco de Dados-autor Elaini Simoni Angelotti- editora Ao Livro Técnico- idiomas  Português-capa comum 312 páginas', '95.00'),
('Calçados', 'Tênis marca Olimpikus-modelo- Olympikus Atmos-genero Femenino-tamanho 36-cor Rosa-peso 139g', '130.00');

-- Inserting data into the 'chosen_product' table
INSERT INTO chosen_product (product_name, classification_kids, category, avaluate, brand, size, product_price) VALUES
    ('Notebook', false, 'Informatica', 6, 'Samsung', NULL, 2500),
    ('Smartphone', false, 'Eletroeletrônicos', 5, 'Samsung', NULL, 1670),
    ('Banco de Dados', false, 'Livros', 8, NULL, NULL, 95.00),
    ('TÊNIS OLYMPIKUS ATMOS FEMININO', false, 'Calçados', 9, 'Olimpikus', '36', 130.00);



-- Inserting data into the 'request' table
INSERT INTO request (id_clients_request, request_status, description_request, freight, payment_with_boleto)
VALUES
(1, 'Pagamento confirmado', 'Notebook marca Samsung-modelo NP550XDA-KP3BR-processador Intel Celeron-memória ram 8 GB-cor Prata', '15.00', false),
(2, 'Pagamento confirmado', 'Smartphone marca Samsung-modelo A34-linha Galaxy-cor Preto-Armazenamento Interno 128 GB-Sistema Operacional Android ', '12', false),
(3, 'Em Andamento', 'Banco de Dados-autor Elaini Simoni Angelotti- editora Ao Livro Técnico- idiomas  Português-capa comum 312 páginas', '10', false),
(4, 'processamento', 'Tênis marca Olimpikus-modelo- Olympikus Atmos-genero Femenino-tamanho 36-cor Rosa-peso 139g', '10.00', false);

-- Inserting data into the 'payment' table
INSERT INTO payment (id_clients_payment, id_products_payment, form_of_payment, card_number, limit_avalible, card_expiring_date, card_security_code, card_installment)
VALUES
(1, NULL, 'Cartão de crédito', '99585540001887945', '5000.00', '2029-12-07', '997', '10'),
(2, NULL, 'Cartão de crédito', '5478897000898', '2500.00', '2025-07-15', '005', '6'),
(3, NULL, 'Cartão de crédito', '9854144000654', '1500.00', '2024-11-18', '905', '2'),
(4, NULL, 'Cartão de crédito', '25455845555514', '3000.00', '2027-04-02', '100', '3');

-- Inserting data into the 'stock' table
INSERT INTO stock (stock_location, quantity_of_product)
VALUES
('SP', 0),
('SP', 0),
('SP', 0),
('SP', 0);

-- Inserting data into the 'product_stock' table
INSERT INTO product_stock (id_product_stock, id_Stock_product_stock, location_of_product_stock)
VALUES
(1, 1, 'SP'),
(2, 2, 'SP'),
(3, 3, 'SP'),
(4, 4, 'SP');

-- Inserting data into the 'seller' table
INSERT INTO seller ( corporate_name_seller, location_of_seller, fantasy_name, CPF_CNPJ_seller)
VALUES
( 'Amazon Serviços de Varejo do Brasil Ltda', 'São Paulo-SP', 'Amazon', '15436940000103'),
('Via S.A', 'São Paulo-SP', 'Extra.com', '330412');
