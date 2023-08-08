create schema if not exists company;
use company;
--drop database company;


create table employee(
First_name varchar(15) not null,
minit char,
Last_name varchar(15) not null,
Ssn char(9) not null,
Date_of_birth date,
Address varchar(40),
Sex char,
Salary decimal(10,3),
Super_ssn char(9),
Department_number int not null,
constraint chk_employee check(Salary > 2000.00),
constraint pk_employee primary key (Ssn)
);
desc employee;
 select * from information_schema.table_constraints
 where constraint_schema = "company";
 
 alter table employee
 add constraint fk_employee foreign key(Super_ssn) references employee(Ssn) 
 on delete set null on update cascade;
 
 alter table employee modify Department_number int not null default 1 ;

create table departament(
Departament_name varchar(15) not null,
Departament_number int not null,
Employee_table_migration_ssn char(9) not null,
Migration_start_date date,
Departament_create_date date,
constraint chk_departament_date check(Departament_create_date < Migration_start_date),
constraint pk_departament  primary key(Departament_number),
constraint unique_name_Departament unique (Departament_name),
foreign key (Employee_table_migration_ssn) references employee(Ssn)
);
desc departament;
 select * from information_schema.table_constraints
 where constraint_schema = "company";

/* Para modificar uma constraint utilizamos: drop e add*/
alter table departament drop constraint departament_ibfk_1;
alter table departament add constraint fk_departament foreign key(Employee_table_migration_ssn) 
references employee(Ssn) on update cascade;
desc departament;

create table departament_locations(
Departament_number_location int not null,
Departament_location varchar(15) not null,
constraint pk_departament_location primary key (Departament_number_location, Departament_location),
constraint fk_departament_locations  foreign key (Departament_number_location) references departament(Departament_number)
);
desc departament_locations;
select * from information_schema.table_constraints
where constraint_schema = "company";

/* Para modificar uma constraint utilizamos: drop e add*/
alter table departament_locations drop constraint fk_departament_locations;
alter table departament_locations
add constraint fk_departament_locations foreign key(Departament_number_location) references departament(Departament_number)
 on delete cascade on update cascade;

CREATE TABLE project(
Project_name VARCHAR(15) NOT NULL,
Project_number INT NOT NULL,
Project_location VARCHAR(15),
Departament_number INT NOT NULL,
PRIMARY KEY(Project_name),
constraint unique_project  UNIQUE (Project_name),
constraint fk_project FOREIGN KEY(Departament_number) REFERENCES departament(Departament_number),
INDEX idx_project_number (Project_number)  
);
desc project;
select * from information_schema.table_constraints
where constraint_schema = "company";



create table work_on(
Essn_work_on char(9) not null,
Project_number int not null,
How_hours_working decimal(4, 1) not null,
primary key(Essn_work_on, Project_number),
constraint fk_work_on foreign key (Essn_work_on) references employee(Ssn),
constraint fk_works_on foreign key (Project_number) references project(Project_number)
);
desc work_on;
select * from information_schema.table_constraints
where constraint_schema = "company";


drop table dependent;
create table dependent(
Essn_dependent char(9) not null,
dependent_name varchar(15) not null,
sex char,
Date_of_birth date,
relationship varchar(8),
Age int not null,
constraint chk_dependent_Age check(Age <22),
primary key (Essn_dependent),
constraint fk_dependent  foreign key (Essn_dependent) references employee(Ssn)
);
desc dependent;


select * from information_schema.table_constraints
where constraint_schema = "company";

show tables;
desc departament;