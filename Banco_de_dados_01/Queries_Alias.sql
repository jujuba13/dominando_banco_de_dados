use company;
show tables;

desc departament;
desc departament_locations;

/*Recuperar as informações*/
select * from departament;
select * from departament_locations;

/* para pegar informações*/ 
/*Retirar ambiguidade  através do alias ou AS STATEMENT*/
select * from project, work_on where Project_number = Project_number;
select  P_name as Project_name from project as p, work_on as wk where p.Project_number = wk.Project_number;

select * from employee;
select concat(First_name, ' ' , Last_name) as Employee from employee;

desc employee;

/*Expressão e Alias*/
/*recolhendo o valor do INSS*/

select First_name, Last_name, Salary, Salary * 0.011   from employee;
select First_name, Last_name, Salary, Salary * 0.011 as INSS  from employee;
select First_name, Last_name, Salary, round(Salary * 0.011,2) as INSS  from employee;

/*defenir um aumento de salario para o gerente que trabalha no projeto associado ao Product_Sistem */
desc project;
desc work_on;
desc employee;

select * from employee e, work_on as w, project as p  
where (e.Ssn = w.Essn_work_on and w.Project_number = p.Project_number and p.Project_name = "Nome do projeto" );

select concat(First_name, ' ' , Last_name) as Full_name, Salary, round(1.1 * Salary, 2)  as  Salary_increase
 from employee e, work_on as w, project as p  
where (e.Ssn = w.Essn_work_on and w.Project_number = p.Project_number and p.Project_name = "Product_Sistem" );

/* Recuperando informações dos departamentos presentes*/
desc departament;
desc departament_locations;

select Departament_name, Employee_table_migration_ssn as Manager, Address from departament d, departament_locations l, employee e
 where d.Department_number = l.Department_number_location and Department_location = "";
 
select Departament_name, Employee_table_migration_ssn as Manager, Address from departament d, departament_locations l, employee e
 where d.Department_number = l.Department_number_location and Department_location = "" and Employee_table_migration_ssn = Ssn;
 
 /* Recuperando todos os gerentes com o local determinado localidade*/
 select Departament_name, concat(First_name, ' ' , Last_name) as Manager from departament d, departament_locations l, employee e
 where d.Department_number = l.Department_number_location and Department_location = "" and Employee_table_migration_ssn = Ssn;
 
 /* Like e Between*/
 desc employee;
 select * from project;
 
 select concat(First_name, ' ' , Last_name) as Full_name , Departament_name from employee e, departament d
 where ( e.Department_number = d.Department_number and Address like "%----%"  );
 
 select concat(First_name, ' ' , Last_name) as Full_name  from employee e, departament d
 where (Address like "%----%"  );
 
 select First_name, Last_name from employee where ( Salary > 2000 and Salary < 40000 );
 select First_name, Last_name from employee where ( Salary Between 2000 and  40000 );

/* Operadores lógicos*/
select Date_of_birth, Address from employee where First_name = "Juliana" and Last_name= "França";
select * from depaartament where Departament_name = "" or Departament_name = "";
select First_name, Last_name from employee e, depaartament d where e.Department_number = d.Department_number;
