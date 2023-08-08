create database mechanical_workshop;
use mechanical_workshop;

drop table person;
create table person(
id_Person  int auto_increment primary key,
type_person enum('Fisica', 'juridica'),
CPF_CNPJ varchar(20),
constraint unique_CPF_CNPJ_person unique(CPF_CNPJ) 
);
desc table person;

drop table customer_registration;
create table customer_registration(
id_customer_registration int auto_increment primary key,
id_person_customer_registration int,
first_name varchar(20) not null,
last_name varchar(45) not null,
CPF_CNPJ varchar(20) not null,
address varchar(50) not null,
Cel varchar(20),
contact_phone varchar(20),
constraint unique_CPF_CNPJ_customer_registration unique(CPF_CNPJ),
constraint fk_id_person_customer_registration foreign key(id_person_customer_registration) references person(id_Person)
);
alter table customer_registration auto_increment =1,
add constraint fk_id_person_customer_registration foreign key(id_person_customer_registration) references customer_registration(id_customer_registration) 
 on delete set null on update cascade;

desc table customer_registration;

drop table vehicle;
create table vehicle(
id_vehicle int auto_increment primary key,
id_customer_registration_vehicle int,
vehicle_type enum('Carro', 'Moto', 'Caminhão'),
vehicle_model varchar(45),
vehicle_license_plate_number varchar(45),
vehicle_color varchar(45),
constraint fk_id_customer_registration_vehicle foreign key(id_customer_registration_vehicle) references customer_registration(id_customer_registration) 
);

desc table vehicle;

drop table requested_quote;
create table requested_quote(
id_requested_quote int auto_increment primary key,
id_vehicle_requested_quote int,
defect_checked boolean not null,
defect_description varchar(255),
quoted_product_description varchar(100),
budget_value float,
constraint fk_id_vehicle_requested_quote foreign key(id_vehicle_requested_quote) references vehicle(id_vehicle)
);

desc table requested_quote;

drop table payment;
create table payment(
id_payment int auto_increment,
id_customer_registration_payment int,
id_requested_quote_payment int,
budgeted_amount float not null,
payment_type enum('Cartão de credito', 'dinheiro', 'Pix') not null,
agency_and_bank_account_password  varchar(45),
pix_key varchar(45),
primary key (id_payment, id_customer_registration_payment),
constraint fk_id_customer_registration_payment foreign key(id_customer_registration_payment) references customer_registration(id_customer_registration),
constraint fk_id_requested_quote_payment foreign key(id_requested_quote_payment) references requested_quote(id_requested_quote)
);

desc table payment;

drop table product_order_submission;
create table product_order_submission(
id_product_order_submission int auto_increment ,
id_requested_quote_product_order_submission int,
id_payment_product_order_submission int,
primary key (id_product_order_submission, id_requested_quote_product_order_submission),
constraint fk_id_requested_quote_product_order_submission foreign key(id_requested_quote_product_order_submission) references requested_quote(id_requested_quote),
constraint fk_id_payment_product_order_submission foreign key(id_payment_product_order_submission) references payment (id_payment)
);
 
 desc table product_order_submission;
 
drop table manufacturer;
 create table manufacturer(
 id_manufacturer int auto_increment primary key,
 id_requested_quote_manufacturer int,
 corporate_name varchar(45) not null,
 CNPJ_manufacturer varchar(20) not null,
 fantasy_name varchar(45) not null,
 location_manufacturer varchar(45) not null,
 contact_phone varchar(20) not null,
 constraint unique_CNPJ_manufacturer unique(CNPJ_manufacturer),
constraint fk_id_requested_quote_manufacturer  foreign key( id_requested_quote_manufacturer) references requested_quote(id_requested_quote)
 );
 SHOW TABLES LIKE 'manufacturer';
 desc table manufacturer;
 
drop table shipping_company;
 create table shipping_company(
 id_shipping_company int auto_increment,
 id_manufacturer_shipping_company int,
 id_mechanical_workshop_shipping_company int,
 name_shipping_company varchar(45),
 CNPJ_shipping_company varchar(20),
 location_shipping_company varchar(45),
 contact_phone varchar(20),
 primary key (id_shipping_company, id_manufacturer_shipping_company),
constraint unique_CNPJ_shipping_company unique(CNPJ_shipping_company),
constraint fk_id_manufacturer_shipping_company foreign key(id_manufacturer_shipping_company) references manufacturer( id_manufacturer),
constraint fk_id_mechanical_workshop_shipping_company  foreign key(id_mechanical_workshop_shipping_company) references mechanical_workshop(id_mechanical_workshop)
 );
ALTER TABLE shipping_company
MODIFY COLUMN id_manufacturer_shipping_company INT DEFAULT 0;
ALTER TABLE shipping_company
MODIFY COLUMN id_manufacturer_shipping_company INT AUTO_INCREMENT PRIMARY KEY;
 
 SHOW TABLES LIKE 'shipping_company';
  desc table shipping_company;
 
 drop table mechanical_workshop;
create table mechanical_workshop(
id_mechanical_workshop int auto_increment primary key,
corporate_name_mechanical_workshop varchar(45),
fantasy_name_mechanical_workshop varchar(45),
CNPJ_mechanical_workshop varchar(20),
location_mechanical_workshop varchar(45),
phone_mechanical_workshop varchar(20),
 constraint unique_CNPJ_mechanical_workshop unique(CNPJ_mechanical_workshop)
);
 
   desc table mechanical_workshop;
 
 