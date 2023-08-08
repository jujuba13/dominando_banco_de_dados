show databases;
create database first_test;
use first_test;

create table person(
person_id smallint unsigned ,
first_name varchar(25),
last_name varchar(25),
surname varchar(10),
gender enum('Femenino', 'Masculino', 'Outro'),
date_of_birth date,
age char(2),
CPF varchar(12),
complete_address varchar(100),
postal_code varchar(25),
city varchar(50),
state char(3),
country varchar(50),
constraint pk_person primary key (person_id)
);
desc person;

create table menu(
person_id smallint unsigned,
food varchar(25),
drink varchar(25),
constraint pk_menu primary key (person_id, menu),
constraint fk_menu_person_id foreign key (person_id) references person(person_id)
);
desc menu;

show databases;

select * from information_schema.table_constraints
where constraint_schema = 'first_test';

#desc information_schema.table_constraints;
##select * from information_schema.table_constraints
##where table_name = 'menu';

insert into person values ('1','Juliana','França','Ju','Femenino','1987-04-13','36', 
'333.455.299-13','Endereço Jurubatuba','11011-101','Santos', 'SP', 'Brasil');

insert into person values ('2','Rodrigo','Venceslau','Diguinho','Masculino','1977-02-23','46', 
'353.455.299-13','Endereço Jurubatuba','11011-101','Santos', 'SP', 'Brasil');

insert into person values ('3','Rosa','Soares','Rozinha','Femenino','1957-06-23','64', 
'333.445.299-13','Endereço Alexandre Martins','11011-201','Santos', 'SP', 'Brasil');

insert into person values ('4','Mario','França','Tatu','Masculino','1960-04-23','63', 
'333.445.289-13','Endereço Alexandre Martins','11011-201','Santos', 'SP', 'Brasil');

insert into person values ('5','Roberta','Souza','Bina','Femenino','1978-10-23','45', 
'335.445.299-13','Endereço Dom Lara','11011-305','Santos', 'SP', 'Brasil');

select * from person;

delete from person where person_id=5

desc menu;
insert into menu values(1, "Salada", 'Suco de laranja'), (2, "Feijoada", 'Suco de Abacaxi'),
                       (3, "Frango assado", 'Coca cola'), (4, "Costela", 'Coca Diet');


select * from menu;









