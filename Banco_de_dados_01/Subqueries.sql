/* subqueries*/

use company;

select * from employee;
select distinct Project_number from project  
where Project_number in 
(
select distinct Project_name from work_on, employee  where (Essn_work_on = Ssn and e.Last_name = " sobrenome do empregado")
)  
or (
select Project_number from project,departament  d , employee  e 
where (d.Employee_table_migration_ssn = e.Ssn and e.Last_name = "" and d.Department_number = e.Department_number)
);
 
 select distinct Essn_work_on  from work_on  where ( Project_number, How_hours_working)
 in (
 select Project_number, How_hours_working from work_on  where Essn_work_on = ""
 );
 
 
 /*Clausula EXISTS e UNIQUE são palavras que retorna o valor boleano */
 /*Quais employees possuem dependentes*/
 select e.First_name, e.Last_name from employee as e
 where exists (
      select * from dependent as d  where e.Ssn = d.Essn_dependent and relationship = "daughter"
 ); 
 select * from dependent; 
 desc dependent;
 
 /*Que não possuem dependentes*/
 select e.First_name, e.Last_name from employee as e
 where exists (
      select * from dependent as d  where e.Ssn = d.Essn_dependent 
      );
      
      /*Pelo menos um gerente tem quer tem um dependente*/
 
 select First_name, Last_name from employee 
 where  (select count(*) from dependent as d  where (Ssn = Essn_dependent ) >= 2);
 
 select distinct Essn_work_on from work_on where Project_number in (1,2,3);
 
         