
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
Salary decimal(10,2),
Super_ssn char(9),
Department_number int not null,
primary key (Ssn)
);


create table departament(
Department_name varchar(15) not null,
Department_number int not null,
Employee_table_migration_ssn char(9) not null,
Migration_start_date date,
primary key(Department_number),
unique (Department_name),
foreign key (Employee_table_migration_ssn) references employee(Ssn)
);

create table departament_locations(
Department_number_location int not null,
Department_location varchar(15) not null,
primary key(Department_number_location, Department_location),
foreign key (Department_number_location) references departament(Department_number)
);

CREATE TABLE project(
Project_name VARCHAR(15) NOT NULL,
Project_number INT NOT NULL,
Project_location VARCHAR(15),
Department_number INT NOT NULL,
PRIMARY KEY(Project_name),
UNIQUE (Project_name),
FOREIGN KEY(Department_number) REFERENCES departament(Department_number),
INDEX idx_project_number (Project_number)  
);

create table work_on(
Essn_work_on char(9) not null,
Project_number int not null,
How_hours_working decimal(4, 1) not null,
primary key(Essn_work_on, Project_number),
foreign key (Essn_work_on) references employee(Ssn),
foreign key (Project_number) references project(Project_number)
);

create table dependent(
Essn_dependent char(9) not null,
dependent_name varchar(15) not null,
sex char,
Date_of_birth date,
relationship varchar(8),
primary key (Essn_dependent),
foreign key (Essn_dependent) references employee(Ssn)
);

show tables;
/*desc departament;*/

/*select * from information_schema.table_constraints
 where constraint_schema = "company";*/
 
 select * from information_schema.referential_constraints
 where constraint_schema = "company";
