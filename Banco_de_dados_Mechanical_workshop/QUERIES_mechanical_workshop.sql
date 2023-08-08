use mechanical_workshop;

select * from customer_registration;
select count(*) from customer_registration;

select * from vehicle;
select count(*) from vehicle;

select * from requested_quote;
select count(*) from requested_quote;

select * from mechanical_workshop;
select count(*) mechanical_workshop;

select * from payment;
select count(*) payment;


/* group by e having*/

SELECT CONCAT(first_name, ' ', last_name) AS full_name, COUNT(*) 
FROM customer_registration AS c, person AS p , vehicle
WHERE p.id_Person = c.id_person_customer_registration 
GROUP BY p.CPF_CNPJ, type_person, first_name, last_name
HAVING COUNT(*) > 1
LIMIT 0, 1000;

SELECT vehicle_type, vehicle_model AS Veiculo_name, CONCAT(First_name, ' ', Last_name) AS CLIENTE, customer_registration.CPF_CNPJ
FROM vehicle
INNER JOIN customer_registration ON vehicle.id_customer_registration_vehicle = customer_registration.id_customer_registration
INNER JOIN person ON customer_registration.id_person_customer_registration = person.id_Person
GROUP BY vehicle_type, Veiculo_name, CONCAT(First_name, ' ', Last_name), customer_registration.CPF_CNPJ
LIMIT 0, 1000;









 


