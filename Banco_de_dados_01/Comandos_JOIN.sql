/*Join Statement, join, JOIN ON que esta sendo interpretado como INNER JOIN ON, CROSS JOIN que é um produto cartesiano*/

show databases;
use company;

/*Join Statement*/
desc employee;
desc work_on;

select * from employee join work_on on Ssn = Essn_work_on;
select * from employee join departament on Ssn = Employee_table_migration_ssnn;

select First_name, Last_name, Address 
from (employee join departament on Departament_number)
where Department_name = " ";

select * from departament_locations;

select Department_name, Migration_start_date, Department_location
from departament join departament_locations using  (Departament_number)
group by departament_locations
order by Migration_start_date;

select * from employee cross join dependent on dependent_name;

/* JOIN utilizando 3 tabelas*/
select concat(First_name,' ',Last_name) as Nome_completo, Department_number as Numero_do_departamento, 
Project_name as Nome_do_projeto, Project_number as Numero_do_projeto, Project_location as Local_do_projeto from employee 
inner join work_on on Ssn = Essn_work_on
inner join project on Project_number  = Project_number
inner join departament using (Department_number)
where Project_location like ' S%'
order by Project_number;

select concat(First_name,' ',Last_name) as Nome_completo, Department_number as Numero_do_departamento, 
Project_name as Nome_do_projeto, Project_number as Numero_do_projeto, Project_location as Local_do_projeto from employee 
inner join work_on on Ssn = Essn_work_on
inner join project using (Project_number)
inner join departament using (Department_number)
where Project_name like ' nome do projeto %'
order by Project_number;

select * from departament
inner join departament_locations on Department_number_location = Departament_number
inner join employee using (Department_number);

select * from departament
inner join departament_locations on Department_number_location = Departament_number
inner join employee on Ssn = Employee_table_migration_ssn;

select Department_number D_number, Department_name as D_name, concat(First_name, ' ', Last_name) as Gerente, round(Salary, Salary * 1.05 ) as Bonus from departament
inner join departament_locations on Department_number_location = Departament_number
inner join employee on Ssn = Employee_table_migration_ssn
group by Departament_name;

/* OUTER JOIN ou LEFT JOIN*/
/* inner join ,left join, right join =  Intersicção */
select * from employee;

select * from employee inner join dependent on Ssn = Essn_dependent;
select * from employee left join dependent on Ssn = Essn_dependent;
select * from employee right join dependent on Ssn = Essn_dependent;

