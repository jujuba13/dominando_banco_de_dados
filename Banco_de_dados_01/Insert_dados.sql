/*Inserção de dados no BD*/
use company;
show tables;

select * from employee;
insert into employee values("Juliana", "J", "França", "098874463", "1987-04-13", "Rua Jurubatuba-36", "F", "3000.00", null, "675");
insert into employee values("Rosa Maria", "S", "Souza", "889874463", "1959-06-23", "Rua Alexandre Martins-1966", "F", "2000.00", null, "67");
insert into employee values("Mario", "M", "Francisco", "998875463", "1960-04-14", "Rua Alexandre Martins-196", "M", "3600.00", null, "75");
insert into employee values("Rodrigo", "R", "França", "898899969", "1977-02-23", "Rua Jurubatuba-36", "M", "7000.00", null, "0657");
insert into employee values("Conceição", "C", "Delcia", "778894553", "1957-07-29", "avenida Afonso Pena-514", "F", "2500.00", null, "65");
insert into employee values("Luna", "L", "França", "202574463", "2023-12-05", "Rua Jurubatuba-36", "F", "3000.00", null, "675");
insert into employee values("Ayla", "A", "França", "202574477", "2023-12-05", "Rua Jurubatuba-36", "F", "3000.00", null, "675");

select * from dependent;
insert into dependent values("098874463", "Luna", "F", "2023-12-05", "daughter", "1");
insert into dependent values("898899969", "Ayla", "F", "2023-12-05", "daughter", "1");

select * from departament;
insert into departament values();
insert into departament values();
insert into departament values();
insert into departament values();

select * from project;
insert into project values();
insert into project values();
insert into project values();
insert into project values();

select * from work_on;
insert into work_on values();
insert into work_on values();
insert into work_on values();
insert into work_on values();



select * from employee;
select Ssn, First_name, Department_number from employee e, departament d where (e.Ssn = d.Employee_table_migration_ssn);
select First_name, dependent_name, relationship from employee e, dependent dep where (e.Ssn = dep.Essn_dependent);
select Date_of_birth, Address from employee where First_name = "Juliana" and minit = "J" and Last_name= "França";

/* Recuperando o departamento especifico */
select * from departament where Departament_name = "";
select First_name, Last_name, Address where Departament_name = "" and Departament_number = Departament_name;

desc work_on;

select Project_name, Essn_work_on, First_name, How_hours_working from project, work_on, employee 
      where Project_number = Project_number and Essn_work_on = Ssn ;



