/*Função de agrupamento*/
use company;

select * from employee;

select count(*) from employee;

select count(*) from employee as e , departament as d 
where d.Department_number = e.Department_number and Department_name = " nome do departamento";

/* A media dos salarios */
select Department_number, count(*), round(avg (Salary), 2) from employee 
group by Department_number;

select Department_number, count(*) as Number_of_Employees, round(avg(Salary),2) average_salary from employee 
group by Department_number;

select Project_number, Project_name , count(*) from project as p , work_on as w
where p.Project_number = w.Project_number
group by  Project_number,Project_name;

/* Base dos salarios dos empregados */
select count(distinct Salary) from employee;

select sum(Salary) as salary_value_added, max(Salary) as salary_value_maximum, min(Salary) as salary_value_Minimum, 
avg(Salary) as salary_value_average 
from employee;

/* group by e having*/

select Project_number, Project_name , count(*) 
from project as p , work_on as w
where p.Project_number = w.Project_number
group by  Project_number, Project_name
having count(*) > 2;

select Department_number, count(*)
 from employee
 where Salary < 40000
 group by Department_number
 having count(*) > 1;
 
 select Department_number, count(*)
 from employee
 where Salary < 40000
 group by Department_number
 having count(*) = 1;

select Department_number, count(*)
 from employee
 where Salary < 40000
 group by Department_number
 having count(*) < 5;
