/* Agrupamento de queries com CASE Statement*/
show databases;
use company;
show tables;

/* Antes de executar tem que desabilitar o safe mode = MySQL opção 
Edit, Preferences, SQL Editor, desabilitar o safe mode, ok*/

select First_name, Last_name, Salary from employee;
update employee set Salary = case 
when Department_number = 675 then Salary + 2000
when Department_number = 67 then Salary + 1500
when Department_number = 0657 then Salary + 3000
else Salary + 0
end ;


