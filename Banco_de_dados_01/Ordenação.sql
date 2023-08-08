/*Função de ordenação */
use company;

select * from employee;

select * from employee order by Department_number;
select * from employee order by First_name;
select * from employee order by First_name, Last_name;

 /* nome do departamento, nome do gerente */
select distinct d.Department_name,concat(First_name, '  ' , e.Last_name) as Manager  
from departament as d, employee as e, work_on as w, project as p
where ( d.Department_number =  e.Department_number and e.Ssn = d.Employee_table_migration_ssn and w.Project_number = p.Project_number)
 order by (d.Department_name,First_name, e.Last_name); 

/*Recupero todos os empregados e seus projetos*/
select distinct d.Department_name as Departament,concat(First_name, '  ' , e.Last_name) as Employee, Project_name 
from departament as d, employee as e, project as p, work_on as w
where (d.Department_number = e.Department_number and e.Ssn = w.Essn_work_on)
order by (d.Department_name,e.First_name, e.Last_name);


select distinct d.Department_name as Departament,concat(First_name, '  ' , e.Last_name) as Employee, Project_name 
from departament as d, employee as e, project as p, work_on as w
where (d.Department_number = e.Department_number and e.Ssn = w.Essn_work_on)
order by (d.Department_name.desc, e.First_name.asc, e.Last_name.asc);

